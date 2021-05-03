<?php

class Admin_ClientesController extends Zend_Controller_Action {

    public function indexAction() {
        $ModelClientes = new Admin_Model_Clientes();
        $result = $ModelClientes->Lista();
        $this->view->clientes = $result;
    }

    public function excluirAction() {
        $id = (int) $this->_request->getParam('id');

        $ModelClientes = new Admin_Model_Clientes();
        $ModelPropostas = new Admin_Model_ClientePropostas();
        $result = $ModelPropostas->GetCliente($id);

        if ($result) {
            //Adiciona a mensagem de sucesso
            $this->_helper->FlashMessenger->addMessage(array('erro' => 'Não foi possível excluir o cliente, ela se encontra em uso!'));
            $this->_redirect('admin/clientes');
        }
        $ModelClientes->delete("id = " . $id);

        //Adiciona a mensagem de sucesso
        $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Excluido com sucesso'));
        $this->_redirect('admin/clientes');
    }
    
     public function dadosAction() {
        $id = $this->_request->getParam('id');
        $ModelClientes = new Admin_Model_Clientes();

        $result = $ModelClientes->GetCliente($id);

        $this->view->dados = $result;
    }

}
