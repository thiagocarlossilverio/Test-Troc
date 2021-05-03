<?php

class Admin_VendasController extends Zend_Controller_Action {

    public function init() {
        $this->view->controller = $this->_request->getControllerName();
        parent::init();
    }

    public function indexAction() {
        $ModelUnidades = new Admin_Model_Vendas();
        $dados = $ModelUnidades->Lista();
        $this->view->dados = $dados;
    }

    public function adicionarAction() {
        $form = new TCS_Form_FormVenda();
        $ModelUnidades = new Admin_Model_Vendas();
        $data = $this->_request->getPost();
        
        if ($this->_request->isPost() && $form->isValid($data)) {
            $ModelUnidades->insert($data);
            //Adiciona a mensagem de sucesso
            $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Adicionado com sucesso'));
            $this->redirect('admin/vendas/');
        }
        $this->view->form = $form;
    }

    public function editarAction() {
        $id = $this->_request->getParam('id');
        $form = new TCS_Form_FormVenda();
        $ModelUnidades = new Admin_Model_Vendas();
        $data = $this->_request->getPost();
        if ($id) {
            $values = $ModelUnidades->GetDados($id);

            $form->populate($values);
            if ($this->_request->isPost() && $form->isValid($data)) {
                $ModelUnidades->insert($data);
                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Editado com sucesso'));
                $this->_helper->redirector('index');
            }
            $this->view->form = $form;
            $this->render('adicionar');
        } else {
            $this->_helper->redirector('index');
        }
    }

    public function excluirAction() {
        $id = $this->_request->getParam('id');
        $ModelProdutos = new Admin_Model_Vendas();
        $ModeImagens = new Admin_Model_VendaImagens();

        $result = $ModeImagens->BuscarImagens($id);

        if ($result) {
            foreach ($result as $evn) {
                $caminho = 'imagens/vendas/' . $evn['imagem'];
                if (file_exists($caminho)) {
                    unlink($caminho);
                }
            }
        }

        $ModeImagens->delete("venda = " . $id);
        $ModelProdutos->delete("id = " . $id);


        //Adiciona a mensagem de sucesso
        $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Excluido com sucesso'));
        $this->_redirect('admin/vendas');
    }

    public function ajaxImagensAction() {
        $param = $this->_request->getParam('param');
        $ModelImagens = new Admin_Model_VendaImagens();
        $data = $ModelImagens->BuscarImagens($param);
        $this->_helper->json($data);
    }

    public function ajaxDeletaImagemAction() {
        $param = $this->_request->getParam('param');
        $ModelImagens = new Admin_Model_VendaImagens();
        $data = $ModelImagens->BuscarImagem($param);
        $caminho = 'imagens/vendas/' . $data['imagem'];
        $ModelImagens->ApagaIMG("id = '$param'", $caminho);
        $this->_helper->json('1');
    }

    public function ajaxSetaCapaAction() {
        $param = $this->_request->getParam('param');
        $ModelImagens = new Admin_Model_VendaImagens();
        $data = $ModelImagens->BuscarImagem($param);

        // print_r($data);die;
        $ModelImagens->update(array("capa" => 0), "venda = " . $data['venda']);
        $ModelImagens->update(array("capa" => 1), "imagem = '$param'");
        $this->_helper->json('1');
    }

    public function ajaxSetaOrderAction() {
        $param = $this->_request->getParam('param');
        $ModelImagens = new Admin_Model_VendaImagens();

        foreach ($param as $key => $img) {
            if ($key > 0) {
                $ModelImagens->update(array("ordem" => $key), "imagem = '$img'");
            }
        }
        $this->_helper->json('1');
    }

}
