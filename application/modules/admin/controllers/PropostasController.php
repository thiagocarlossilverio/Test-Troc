<?php

class Admin_PropostasController extends Zend_Controller_Action {

    public function init() {
        $this->view->controller = $this->_request->getControllerName();
        parent::init();
    }

    public function indexAction() {
        $ModelUnidades = new Admin_Model_ClientePropostas();
        $dados = $ModelUnidades->Getpropostas();
        $this->view->propostas = $dados;
    }

    public function responderAction() {
        $id = $this->_request->getParam('id');
        $ModelPropostas = new Admin_Model_ClientePropostas();
        $form = new TCS_Form_FormContraProposta();

        $auth = Zend_Auth::getInstance();
        $user = $auth->getIdentity();

        $dados = $ModelPropostas->Getproposta($id);

        $data = $this->_request->getPost();
        if ($this->_request->isPost() && $form->isValid($data)) {
            $data['data_contraproposta'] = date('Y-m-d H:i:s');
            $data['vendedor'] = $user->id;
         
            $ModelPropostas->insert($data);

            if (!empty($data['email_cliente'])) {
                $conteudo = array('nome' => $data['nome_cliente'], 'email' => $data['email_cliente'], 'contra_proposta' => $data['contra_proposta']);
                $assunto = "Schoeler Suínos - Contraproposta referente ao item" . $data['nome_item'];
                Zend_Controller_Action_HelperBroker::getStaticHelper('Emails')->Emails('', $data['email_cliente'], $assunto, $conteudo, false, 'emails/contraproposta.phtml');
            }

            $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Contraproposta enviada com sucesso!'));
            $this->_redirect('admin/propostas');
        }

        $form->populate($dados);
        $this->view->form = $form;
        $this->view->dados = $dados;
    }

}
