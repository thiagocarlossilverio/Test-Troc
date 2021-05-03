<?php

class MinhaContaController extends Zend_Controller_Action {

    public function init() {

        // $this->_helper->layout()->setLayout('layout-painel');

        $login = new Zend_Session_Namespace("login");
        $action = $this->_request->getActionName();

        if ($action != 'login' && $action != 'logout' && $action != 'redefinir-senha' && $action != 'recuperar-senha') {
            if (!$login->id) {
                // Armazena o erro
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Por favor, fa&ccedil;a login'));

                $this->_redirect('/minha-conta/login');
            }
        }

        parent::init();
    }

    public function indexAction() {
        $login = new Zend_Session_Namespace("login");
    }

    public function loginAction() {

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
                $this->_redirect("/minha-conta/login");
            }
            $row = $ModelCliente->BuscarLogin($post['email']);

            if (!$row) {

                // Armazena o erro
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'E-mail inexistente!'));

                // Redireciona o usuário para a pagina de login
                $this->_redirect("/minha-conta/login");
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
                        $this->_redirect("/");
                    }
                } else {

                    $this->_helper->FlashMessenger->addMessage(array('erro' => 'Senha inv&aacute;lida!'));

                    // Redireciona o usuário para a pagina de login
                    $this->_redirect("/minha-conta/login");
                }
            }
        }
    }

    public function redefinirSenhaAction() {

        /* Adiciono a sessão */
        $recover = new Zend_Session_Namespace("senha");

        /* Adiciono a Model */
        $ModelClientes = new Admin_Model_Clientes();

        $chave = $this->_request->getParam('chave');
        $id = $this->_request->getParam('id');

        if (!empty($id)) {
            /* Faço uma consulta */
            $row = $ModelClientes->GetUser($id);

            if ($row['chave'] != $chave) {
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Sua chave de redefinição de senha não mais válida, Solicite uma nova'));
                $this->_redirect("/minha-conta/login");
            }
        }


        if (!empty($chave) && !empty($id)) {

            $recover->chave = $chave;
            $recover->id = $id;

            $this->redirect('/minha-conta/redefinir-senha');
        }

        if (!empty($recover->id)) {
            /* Faço uma consulta */
            $row = $ModelClientes->GetUser($recover->id);
        } else {
            $this->_helper->FlashMessenger->addMessage(array('erro' => ' Ação não permitida, Solicite uma chave de redefinição de senha'));
            $this->_redirect("/minha-conta/login");
        }


        if ($row['chave'] != $recover->chave) {
            $this->_helper->FlashMessenger->addMessage(array('erro' => 'Sua chave de redefinição de senha não é mais válida!, Solicite uma nova'));
            $this->_redirect("/minha-conta/login");
        }

        /* Se for Post */
        if ($this->_request->isPost()) {

            /* armazeno em uma variavel o post */
            $post = $this->_request->getPost();

            if ($row['chave'] == $recover->chave) {
                if ($post['senha'] == $post['confirma_senha']) {

                    /* Limpo a chave de Redefinição de senha */
                    $ModelClientes->update(array('chave' => ''), "id =" . $recover->id);

                    /* Atualizo a senha */
                    $ModelClientes->update(array('senha' => $post['senha']), "id =" . $recover->id);

                    $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Senha redefenida com sucesso!'));

                    $result = $ModelClientes->GetUser($recover->id);

                    $conteudo = array('nome' => $result['nome1'], 'senha' => $post['senha']);
                    $assunto = "Redefinição de senha";

                    Zend_Controller_Action_HelperBroker::getStaticHelper('Emails')->Emails('', $result['email'], $assunto, $conteudo, false, 'emails/novasenha.phtml');

                    /* Limpo a Sessão */
                    Zend_Session::namespaceUnset("senha");

                    $this->_redirect("/minha-conta/login");
                } else {
                    $this->_helper->FlashMessenger->addMessage(array('erro' => 'As senhas não se coincidem!'));

                    $this->_redirect("/minha-conta/redefinir-senha/");
                }
            } else {

                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Sua chave de redefinição de senha não é mais válida!, Solicite uma nova'));

                /* Limpo a Sessão */
                Zend_Session::namespaceUnset("senha");

                $this->_redirect("/minha-conta/login");
            }

            /* Limpo a Sessão */
            Zend_Session::namespaceUnset("senha");
            $this->_redirect($_SERVER['HTTP_REFERER']);
        }
    }

    public function recuperarSenhaAction() {

        // Verifica se existe dados do post
        if ($this->_request->isPost()) {

            //Adiciona a Model de empresas
            $ModelClientes = new Admin_Model_Clientes();

            //Recupera o email digitado
            $email = $this->_request->getParam("email");

            if ($email == NULL) {

                // Armazena o erro
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Digite o e-mail!'));

                // Redireciona o usuário para a pagina de recuperação de senha
                $this->_redirect("/minha-conta/login");
            } else {

                //Verifica se existe o E-mail
                $row = $ModelClientes->BuscarLogin($email);
            }
            //Se existir
            if ($row != false) {

                // Gera a chave unica
                $chave = Zend_Controller_Action_HelperBroker::getStaticHelper('Hash')->randomString(32);

                if ($chave) {
                    $ModelClientes->update(array('chave' => $chave), "id =" . $row['id']);
                }

                $assunto = "Requisição de nova senha";

                // Cria a mensagem
                $url = "http://" . $_SERVER['HTTP_HOST'] . "/minha-conta/redefinir-senha/chave/" . $chave . "/id/" . $row['id'];


                $array = array('nome' => $row['nome1'], 'url' => $url);

                Zend_Controller_Action_HelperBroker::getStaticHelper('Emails')->Emails('', $email, $assunto, $array, false, 'emails/requerersenha.phtml');

                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Um email foi lhe enviado com as proxímas instruções! Obrigado'));

                //Redireciona o usuário para a pagina de login
                $this->_redirect("/minha-conta/login");
            } else {
                // Armazena o erro
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'E-mail inválido!'));

                // Redireciona o usuário para a pagina de login
                $this->_redirect("/minha-conta/login");
            }
        }
    }

    public function logoutAction() {
        // Desabilita o layout
        $this->_helper->layout->disableLayout();
        $this->_helper->viewRenderer->setNoRender(TRUE);

        // Cria a sessão da empresa
        $login = new Zend_Session_Namespace("login");

        $login->logado = FALSE;
        Zend_Session::namespaceUnset("login");

        // Redireciona o usuário para a pagina anterior
        $this->_redirect('/');
    }

    public function meusDadosAction() {
        $login = new Zend_Session_Namespace("login");
        $ModelClientes = new Admin_Model_Clientes();

        if ($this->_request->isPost()) {
            $data = $this->_request->getPost();
            if ($data) {
                $ModelClientes->insert($data);
                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Editado com sucesso'));
                $this->redirect('/minha-conta/meus-dados/');
            }
        }
        $result = $ModelClientes->GetDados($login->id);
        $this->view->dados = $result;
    }

    public function propostasAction() {
        $login = new Zend_Session_Namespace("login");
        $ModelPropostas = new Admin_Model_ClientePropostas();

        $result = $ModelPropostas->GetpropostasCliente($login->id);
        $this->view->propostas = $result;
    }

}
