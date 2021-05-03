<?php

class Admin_CategoriasController extends Zend_Controller_Action {

    public function indexAction() {
        $categorias = new Admin_Model_Categorias();
        $result = $categorias->ListarAll();
        $this->view->dados = $result;
    }

    public function adicionarAction() {
        $form = new TCS_Form_FormCategorias();
        $ModelCategorias = new Admin_Model_Categorias();

        $data = $this->_request->getPost();
        if ($this->_request->isPost() && $form->isValid($data)) {
            $ModelCategorias->insert($data);
            //Adiciona a mensagem de sucesso
            $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Adicionado com sucesso'));
            $this->redirect($_SERVER['HTTP_REFERER']);
        }
        $this->view->form = $form;
        $this->view->controller = $this->_request->getControllerName();
    }

    public function editarAction() {
        $id = (int) $this->_request->getParam('id');
        $form = new TCS_Form_FormCategorias();
        $ModelCategorias = new Admin_Model_Categorias();
        if ($id) {
            $values = $ModelCategorias->GetDados($id);
            $form->populate($values);
            if ($this->_request->isPost() && $form->isValid($_POST)) {
                $ModelCategorias->insert($_POST);
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

        $ModelCategorias = new Admin_Model_Categorias();
        $ModelVendas = new Admin_Model_Vendas();

        $result = $ModelVendas->VerificaCategoria($id);

        if ($result) {
            //Adiciona a mensagem de sucesso
            $this->_helper->FlashMessenger->addMessage(array('erro' => 'Não foi possível excluir a categoria, ela se encontra em uso!'));
            $this->_redirect('admin/categorias');
        }


        $ModelCategorias->delete("id = " . $id);

        //Adiciona a mensagem de sucesso
        $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Excluido com sucesso'));
        $this->_redirect('admin/categorias');
    }

}
