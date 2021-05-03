<?php

class VendasController extends Zend_Controller_Action {

    public function indexAction() {
        $ModelVendas = new Admin_Model_Produtos();
        $lista = $ModelVendas->Lista(FALSE, FALSE, TRUE);

        if ($lista) {
            $this->view->vendas = $lista;
        } else {
            $this->_helper->FlashMessenger->addMessage(array('erro' => 'Não há registro de veículos para venda, na base de dados!'));
            $this->_redirect($_SERVER['HTTP_REFERER']);
        }
    }

    public function veiculoAction() {
        $sessao_veiculo = new Zend_Session_Namespace("sessao_veiculo");

        $param = (int) $this->_request->getParam('param');

        $ModelVendas = new Admin_Model_Produtos();
        $veiculo = $ModelVendas->GetVenda($param);
        
        $total = ($veiculo['visualizacoes'] + 1);
        if (isset($sessao_veiculo->param) && $sessao_veiculo->param !== $param) {
            $sessao_veiculo->param = $param;
            $ModelVendas->update(array("visualizacoes" => $total), "id = '$param'");
        } elseif (!isset($sessao_veiculo->param)) {
            $sessao_veiculo->param = $param;
            $ModelVendas->update(array("visualizacoes" => $total), "id = '$param'");
        } else {
            
        }

        $this->view->dados = $veiculo;
    }

    public function propostaAction() {
        $model = new Admin_Model_Contatos();

        if ($this->_request->isPost()) {
            $data = $this->_request->getPost();
            if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                $IP = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
                $IP = $_SERVER['HTTP_CLIENT_IP'];
            } elseif (isset($_SERVER['HTTP_FROM '])) {
                $IP = $_SERVER['HTTP_FROM'];
            } elseif (isset($_SERVER['REMOTE_ADDR'])) {
                $IP = $_SERVER['REMOTE_ADDR'];
            }


            if (!empty($data['nome']) && !empty($data['email']) && !empty($data['mensagem'])) {
                $data['data_contato'] = date("Y-m-d H:i:s");
                $data['assunto'] = 'Proposta de Compra de veículo';
                $data['proposta'] = TRUE;
                $data['ip'] = $IP;

                $model->insert($data);
                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Sua proposta foi enviada com sucesso. Entraremos em contato o mais breve poss&iacute;vel.'));

                $conteudo = array('nome' => $data['nome'], 'email' => $data['email'], 'telefone' => $data['telefone'], 'assunto' => $data['assunto'], 'mensagem' => $data['mensagem'], 'param' => $data['param'], 'proposta' => TRUE);

                Zend_Controller_Action_HelperBroker::getStaticHelper('Emails')->Emails('', 'gerencia@piglog.com.br', $data['assunto'], $conteudo, false, 'emails/contato.phtml');

                $this->_redirect($_SERVER['HTTP_REFERER']);
            } else {
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Campos Obrigat&oacute;rio!'));
                $this->_redirect($_SERVER['HTTP_REFERER']);
            }
        }
    }

}
