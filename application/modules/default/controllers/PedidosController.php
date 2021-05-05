<?php

class PedidosController extends Zend_Controller_Action {

    public function init() {

        $login = new Zend_Session_Namespace("login");
        $action = $this->_request->getActionName();

        if ($action != 'ajax-login') {
            if (!$login->id) {

                // Armazena o erro
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Por favor, fa&ccedil;a login'));

                $this->_redirect('/Pedidos/ajax-login');
            }
        }

        parent::init();
    }

    public function indexAction() {
        die('Em desenvolvimento...');
     
    }

    public function ajaxLoginAction() {

        $this->getHelper('layout')->disableLayout();
        // Cria a sessão do cliente
        $login = new Zend_Session_Namespace("login");
        $ModelCliente = new Admin_Model_Clientes();

        if (!empty($login->id)) {
            $this->redirect($_SERVER['HTTP_REFERER']);
        }

        if ($this->_request->isPost()) {
            $post = $this->_request->getPost();

            if (empty($post['email'])) {
                // Armazena o erro
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Por favor digite o login!'));

                // Redireciona o usuário para a pagina de login
                $this->_redirect("/pedidos/ajax-login");
            }
            $row = $ModelCliente->BuscarLogin($post['email']);

            if (!$row) {

                // Armazena o erro
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'E-mail inexistente!'));

                // Redireciona o usuário para a pagina de login
                $this->_redirect("/pedidos/ajax-login");
            } else {

                // Verifica se a senha é valida
                if ($row['senha'] == sha1($post['senha'])) {

                    $login->id = $row['id'];
                    $login->nome1 = $row['nome1'];
                    $login->doc1 = $row['doc1'];
                    $login->doc2 = $row['doc2'];
                    $login->logado = TRUE;
                    $login->email = $row['email'];

                    /* Atualizo o data de ultimo login */
                    $ModelCliente->update(array('ultimo_acesso' => date('Y-m-d H:i:s'), 'ip' => $_SERVER['REMOTE_ADDR']), "id =" . $row['id']);

                    if ($login->logado == TRUE) {
                        //Redireciona o usuário para a pagina anterior
                        $this->_redirect("/pedidos");
                    }
                } else {
                    $this->_helper->FlashMessenger->addMessage(array('erro' => 'Senha inv&aacute;lida!'));

                    // Redireciona o usuário para a pagina de login
                    $this->_redirect("/pedidos/ajax-login");
                }
            }
        }
    }

}
