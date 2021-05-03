<?php

class Admin_ConfiguracoesController extends Zend_Controller_Action {

        
    public function emailAction() {
        $form = new TCS_Form_FormEmail();

        // Path ao arquivo de configuração
        $filename = APPLICATION_PATH . '/configs/mail.ini';

        // Carrega o arquivo de configuração
        $ConfEmail = new Zend_Config_Ini($filename, "producao", TRUE);

        $configuracao = $ConfEmail->toArray();

        $data = $this->_request->getPost();
        if ($this->_request->isPost() && $form->isValid($data)) {

            // Muda o valor
            $ConfEmail->smtp = $this->_request->getParam("smtp");
            $ConfEmail->conta = $this->_request->getParam("conta");
            $ConfEmail->senha = $this->_request->getParam("senha");
            $ConfEmail->remetente = $this->_request->getParam("remetente");
            $ConfEmail->conexao = $this->_request->getParam("conexao");
            $ConfEmail->porta = $this->_request->getParam("porta");

            // Prepara o arquivo para gravação
            $writer = new Zend_Config_Writer_Ini(array('config' => $ConfEmail, 'filename' => $filename));

            // Faz a alteração no arquivo
            $writer->write();

            $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'As configurações foram salvas com sucesso!'));

            // Redireciona
            $this->_redirect("/admin/configuracoes/email/");
        }

        $this->view->form = $form->populate($configuracao);
    }

    public function sistemaAction() {
        $form = new TCS_Form_FormSistema();
        $ModelSistema = new Admin_Model_ConfSistema();
        $auth = Zend_Auth::getInstance();
        $user = $auth->getIdentity();
        
        $values = $ModelSistema->GetDados($user->id);
        
        if(!empty($values)){
            $form->populate($values);
        }
        
        $data = $this->_request->getPost();
        $data['user'] = $user->id;
        if ($this->_request->isPost() && $form->isValid($data)) {
            //Atualizo na Base de Dados
            $ModelSistema->insert($data);

            //Adiciona a mensagem de sucesso
            $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Atualizado com sucesso'));
            $this->redirect('admin/configuracoes/sistema');
        }
        $this->view->form = $form;
        $this->view->controller = $this->_request->getControllerName();
    }

}
