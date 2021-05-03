<?php

class Admin_SeoController extends Zend_Controller_Action {

    public function indexAction() {
        $form = new TCS_Form_FormSeo();
        $controlador = strtolower(str_ireplace('Controller', '',$this->_request->getParam("controlador")));
        $acao = $this->_request->getParam("acao");

        // Path ao arquivo de configuração
        $filename = APPLICATION_PATH . "/configs/metas.ini";

        /* Carrego o arfquivo.ini */
        $ConfigMetas = new Zend_Config_Ini($filename, null, array('skipExtends' => true, 'allowModifications' => true));
        $ConfigMetas = $ConfigMetas->toArray();
        $post = $this->_request->getPost();
        unset($post['controlador']);
        unset($post['acao']);
        if ($this->_request->isPost() && $form->isValid($post)) {

            foreach ($ConfigMetas as $key => $row) {
                if ($key == $controlador) {

                    // Muda o valor
                    $ConfigMetas[$controlador][$acao]['title'] = $this->_request->getParam("title");
                    $ConfigMetas[$controlador][$acao]['description'] = $this->_request->getParam("description");
                    $ConfigMetas[$controlador][$acao]['keywords'] = $this->_request->getParam("keywords");
                }
            }

            try {
                $config = new Zend_Config_Writer_Ini();
                $config->setNestSeparator('.');
                $config->setRenderWithoutSections(true);
                $config->write($filename, new Zend_Config($ConfigMetas));
                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'As configurações foram salvas com sucesso!'));
            } catch (Exception $e) {
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'ERROR: ' . $e->getMessage()));
            }
            // Redireciona
            $this->_redirect("/admin/seo/");
        }

        $this->view->form = $form;
    }

    public function ajaxAcoesAction() {
        $front = $this->getFrontController();
        // $acl = array();
        foreach ($front->getControllerDirectory() as $module => $path) {
            if ($module == 'default') {
                foreach (scandir($path) as $file) {

                    if (strstr($file, "Controller.php") !== false) {

                        include_once $path . DIRECTORY_SEPARATOR . $file;

                        foreach (get_declared_classes() as $class) {
                            if ($class == $this->_request->getParam('controlador')) {
                                if (is_subclass_of($class, 'Zend_Controller_Action')) {

                                    //$controller = strtolower(substr($class, 0, strpos($class, "Controller")));

                                    $actions = array();
                                    foreach (get_class_methods($class) as $action) {
                                        if (strstr($action, "Action") !== false) {
                                            // $actions[] = $action;
                                            $NameAction = explode('Action', $action);
                                            $actions[$NameAction[0]] = $NameAction[0];
                                        }
                                    }
                                }
                            }
                        }

                        //$acl[$controller] = $actions;
                    }
                }
            }
        }
        $this->_helper->json($actions);
    }

    public function ajaxPopulateAction() {
        $controlador = $this->_request->getParam("controlador");
        $acao = $this->_request->getParam("acao");

        // Path ao arquivo de configuração
        $filename = APPLICATION_PATH . "/configs/metas.ini";

        /* Carrego o arquivo.ini */
        $ConfigMetas = new Zend_Config_Ini($filename, null, array('skipExtends' => true, 'allowModifications' => true));
        $List = $ConfigMetas->toArray();

        if (isset($List[$controlador][$acao])) {
            $result = $List[$controlador][$acao];
            $this->_helper->json($result);
        } else {
            $data['title'] = '';
            $data['description'] = '';
            $data['keywords'] = '';
            $this->_helper->json($data);
        }
    }

}
