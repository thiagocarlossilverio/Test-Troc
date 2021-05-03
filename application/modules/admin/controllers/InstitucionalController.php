<?php

class Admin_InstitucionalController extends Zend_Controller_Action {

    public function indexAction() {
        $ModelConteudos = new Admin_Model_Institucional();
        $form = new TCS_Form_FormInstitucional();
        $data = $this->_request->getPost();
        if ($this->_request->isPost()) {
            $url = $data['pagina'];
            unset($data['pagina']);
            unset($data['id']);
            $ModelConteudos->update((array) $data, "url_tratada = '" . $url . "'");
            $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'O conteudo foi atualizado com sucesso'));
            $this->redirect('/admin/institucional');
        }
        if ($this->_request->getParam('item')) {

            $item = $this->_request->getParam('item');
            $dados = $ModelConteudos->DadosCompletos($item);
            $dados['pagina'] = $dados['url_tratada'];
            $this->view->form = $form->populate($dados);
        } else {
            $this->view->form = $form;
        }
        $this->view->legend = 'Cadastro de Conteúdo';
    }

}
