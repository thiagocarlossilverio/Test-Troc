<?php

class CronController extends Zend_Controller_Action {

    public function init() {
        // require_once('library/TCS/Controller/Action/Helper/whatts/api/whatsprot.class.php');
    }

    public function indexAction() {
        $ModelClientes = new Admin_Model_Clientes();
        $ModelWhatts = new Admin_Model_ConfWhatts();
        $data = $ModelWhatts->GetDados(1);
       

        $aniversariantes = $ModelClientes->GetAniversariantes();
        if ($aniversariantes) {
            foreach ($aniversariantes as $aniversariante) {
                $conteudo = array('nome' => $aniversariante['nome'], 'email' => $aniversariante['email']);
                $assunto = "Feliz Aniversário " . $aniversariante['nome'];
                Zend_Controller_Action_HelperBroker::getStaticHelper('Emails')->Emails('', $aniversariante['email'], $assunto, $conteudo, false, 'emails/aniversario.phtml');
                
                if (!empty($aniversariante['user_whatts'])) {
                    $params = array('username' => $data['ddi'] . $data['dd'] . $data['numero'], 'nike' => $data['nome'], 'debug' => true, 'senha' => $data['password']);
                    $destino = array(
                        'number' => '55' . $aniversariante['user_whatts'],
                        'message' => 'Olá ' . $aniversariante['nome_user'] . 'no dia ' . $this->view->ConvercaoDate('-', $aniversariante['data_despesa'], 2) . ', não se esqueça de pagar á fatura da ' . $aniversariante['nome'] . ', no valor de: R$ ' . $aniversariante['valor'] . '.'
                    );

                    $this->_helper->WhattsApp('envia', $params, $destino);
                }
            }
        }
        die();
    }

}
