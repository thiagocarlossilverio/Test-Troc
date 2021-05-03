<?php

class Admin_CuponsController extends Zend_Controller_Action {

    public function indexAction() {
        $cupons = new Admin_Model_Cupons();
        $result = $cupons->ListCupons();
        $this->view->dados = $result;
    }

    public function adicionarAction() {
        $form = new TCS_Form_FormCupom();
        $ModelCupons = new Admin_Model_Cupons();

        $data = $this->_request->getPost();
        if ($this->_request->isPost() && $form->isValid($data)) {
            $ModelCupons->insert($data);
            
            //Adiciona a mensagem de sucesso
            $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Adicionado com sucesso'));
            $this->redirect($_SERVER['HTTP_REFERER']);
        }
        $this->view->form = $form;
        $this->view->controller = $this->_request->getControllerName();
    }

    public function editarAction() {
        $param = (int) $this->_request->getParam('id');
        $form = new TCS_Form_FormCupom();
        $ModelCupons = new Admin_Model_Cupons();
        if ($param) {
            $values = $ModelCupons->GetCupom($param);
            $form->populate($values);
            if ($this->_request->isPost() && $form->isValid($_POST)) {
                $ModelCupons->insert($_POST);
                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Editado com sucesso'));
                $this->_helper->redirector('index');
            }
            $this->view->form = $form;
            $this->view->controller = $this->_request->getControllerName();
            $this->render('adicionar');
        } else {
            $this->_helper->redirector('index');
        }
    }

    public function excluirAction() {
        $id = (int) $this->_request->getParam('id');

        $ModelCupons = new Admin_Model_Cupons();
      /*  $ModelVendas = new Admin_Model_Produtos();

        $result = $ModelVendas->VerificaCategoria($id);

        if ($result) {
            //Adiciona a mensagem de sucesso
            $this->_helper->FlashMessenger->addMessage(array('erro' => 'Não foi possível excluir o cupom!'));
            $this->_redirect('admin/cupons');
        }*/


        $ModelCupons->delete("id = " . $id);

        //Adiciona a mensagem de sucesso
        $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Excluido com sucesso'));
        $this->_redirect('admin/cupons');
    }

}
