<?php

class CarrinhoController extends Zend_Controller_Action {

    public function indexAction() {
        // Busca o carrinho da sessão
        $session = new Zend_Session_Namespace("carrinho");
        //unset($session->carrinho['produtos']);

        if (count($session->carrinho['produtos']) <= 0) {
            //Adiciona a mensagem de erro
            $this->_helper->FlashMessenger->addMessage(array('erro' => 'Seu carrinho está vazio adicione produtos nele!'));
            // Redireciona o usu�rio para a pagina anterior
            $this->_redirect("/");
        }
        $carrinho = $session->carrinho['produtos'];
        $this->view->carrinho = $carrinho;
        //  $this->view->total = $this->view->SomaCarrinho($session->carrinho['produtos']);
    }

    public function adicionarAction() {
        $this->getHelper('layout')->disableLayout();

        // Cria a sessão do cliente
        $session = new Zend_Session_Namespace("carrinho");

        $id_produto = (int) $this->_request->getParam('produto');
        $quantidade = (int) $this->_request->getParam('quantidade');

        $ModelProdutos = new Admin_Model_Produtos();
        $produto = $ModelProdutos->GetItem($id_produto);

        //if para verificar o item antes de inserir no carrinho
        if ($produto) {
            $id = $produto['id'];

            //Verifica se já foi adicionado o produto no carrinho, aviso o usuario e redireciono ele pro carrinho.
            if (isset($session->carrinho['produtos'][$id])) {
                die('<div  id="alerta" class="alert alert-warning">Produto já inserido no carrinho, escolha a quantidade.</div>');
            } else {
                $session->carrinho['produtos'][$id] = $produto;
                if (isset($quantidade)) {
                    $session->carrinho['produtos'][$id]['quantidade'] = $quantidade;
                }

                die('<div id="alerta" class="alert alert-success" role="alert">O produto foi adicionado com sucesso no carrinho!</div>');
            }
        } else {
            die('<div id="alerta"  class="alert alert-danger">Erro ao adicionar produto ao carrinho!</div>');
        }
    }

    public function listaAction() {
        // Cria a sessão do cliente
        $carrinho = new Zend_Session_Namespace("carrinho");

        Zend_Debug::dump($carrinho->dados_produto->nome);
        die;
    }

    public function removerAction() {
        //N�o renderiza a phtml
        $this->_helper->viewRenderer->setNoRender(true);
        //Desabilita o layout
        $this->_helper->layout->disableLayout();

        // Cria a sess�o para adicionar o produto no carrinho
        $session = new Zend_Session_Namespace("carrinho");

        if ($id = $this->_request->getParam("id")) {
            unset($session->carrinho['produtos'][$id]);

            $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'O Produto foi removido com sucesso do carrinho!'));

            $this->redirect('carrinho');
        }
    }

    public function ajaxAplicarDescontoAction() {
        $this->_helper->layout->disableLayout();

        // Busca o carrinho da sessão
        $session = new Zend_Session_Namespace("carrinho");

        $cupom_desconto = $this->_request->getParam('cupom_desconto');

        $ModelCupom = new Admin_Model_Cupons();

        $dados_Cupom = $ModelCupom->GetDesconto($cupom_desconto);

        $total = false;

        if (count($session->carrinho['produtos']) > 0) {
            $carrinho = $session->carrinho['produtos'];

            foreach ($carrinho as $produto) {
                $valor = $this->view->LimpaNumero($produto['valor']);
                $quantidade = $this->view->LimpaNumero($produto['quantidade']);

                if (!empty($dados_Cupom['categoria'])) {

                    if ($produto['categoria'] == $dados_Cupom['categoria']) {
                        $valor_subtotal = ($quantidade * $valor);
                        
                        /* Se desconto for do tipo Percentual */
                        if ($dados_Cupom['tipo_desconto'] == '1' && $produto['categoria'] == $dados_Cupom['categoria']) {
                            $porcentagem = $this->view->LimpaNumero($dados_Cupom['desconto']);
                            $valor = $valor_subtotal - ($valor_subtotal * $porcentagem / 100);

                            
                        }
                        
                        /* Se  desconto for valor fixo */
                        if ($dados_Cupom['tipo_desconto'] == '2' && $produto['categoria'] == $dados_Cupom['categoria']) {
                            $valor_subtotal = ($quantidade * $valor);
                            $valor_desconto = $this->view->LimpaNumero($dados_Cupom['desconto']);
                            $valor = ($valor_subtotal - $valor_desconto);
                        }
                    }
                }

                $total += $valor;
            }
        }


        echo 'R$ ' . $this->view->Real($total);
        die;
    }

}
