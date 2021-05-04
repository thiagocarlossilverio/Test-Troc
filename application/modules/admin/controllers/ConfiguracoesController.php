<?php

class Admin_ConfiguracoesController extends Zend_Controller_Action {

    public function whatsAppAction() {
        $form = new TCS_Form_FormWhatts();
        $ModelWhatts = new Admin_Model_ConfWhatts();

        $values = $ModelWhatts->GetDados(1);
        $form->populate($values);
        $data = $this->_request->getPost();
        if ($this->_request->isPost() && $form->isValid($data)) {

            $params = array('username' => $data['ddi'] . $data['dd'] . $data['numero'], 'nike' => $data['nome'], 'debug' => true);

            try {
                //Zend_Controller_Action_HelperBroker::getStaticHelper('WhattsApp')->requisicao('solicita', $params);

                $this->_helper->WhattsApp('solicita', $params);

                //Atualizo na Base de Dados
                $ModelWhatts->insert($data);

                //Adiciona a mensagem de sucesso
                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Atualizado com sucesso'));
                $this->redirect('admin/configuracoes/atualizar-code');
            } catch (Exception $e) {

                //Adiciona a mensagem de sucesso
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Não foi possível atualizar, tente novamente mais tarde! ERRO: ' . $e));
                $this->redirect('admin/configuracoes/whats-app');
            }
        }
        $this->view->form = $form;
        $this->view->controller = $this->_request->getControllerName();
    }

    public function atualizarCodeAction() {
        $form = new TCS_Form_FormWhattsCode();
        $ModelWhatts = new Admin_Model_ConfWhatts();
        $values = $ModelWhatts->GetDados(1);
        $form->populate($values);
        $data = $this->_request->getPost();
        if ($this->_request->isPost() && $form->isValid($data)) {

            $params = array('username' => $values['ddi'] . $values['dd'] . $values['numero'], 'nike' => $values['nome'], 'debug' => true, 'code' => $data['code']);

            try {

                $password = $this->_helper->WhattsApp('register', $params);
                $data['password'] = $password->pw;
                $ModelWhatts->insert($data);

                //Adiciona a mensagem de sucesso
                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Atualizado com sucesso'));
                $this->redirect('admin/');
            } catch (Exception $e) {

                //Adiciona a mensagem de sucesso
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Não foi possível atualizar, tente novamente mais tarde! ERRO: ' . $e));
                $this->redirect('admin/configuracoes/whats-app');
            }
        }
        $this->view->form = $form;
        $this->view->controller = $this->_request->getControllerName();
    }

    public function enviaMensagemAction() {
        $ModelWhatts = new Admin_Model_ConfWhatts();
        $data = $ModelWhatts->GetDados(1);


        $params = array('username' => $data['ddi'] . $data['dd'] . $data['numero'],
            'nike' => $data['nome'],
            'debug' => true,
            'senha' => $data['password']
        );

        $destino = array('number' => '554384257131',
            'message' => 'teste de mensagem'
        );
        $teste = $this->_helper->WhattsApp('envia', $params, $destino);


        Zend_Debug::dump($teste);
        die;
    }

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
