<?php

class ContatoController extends Zend_Controller_Action {

    public function indexAction() {
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
                $data['ip'] = $IP;

                $model->insert($data);
                $this->_helper->FlashMessenger->addMessage(array('sucesso' => 'Mensagem enviada com sucesso. Entraremos em contato o mais breve poss&iacute;vel.'));

                $conteudo = array('nome' => $data['nome'], 'email' => $data['email'], 'assunto' => $data['assunto'], 'mensagem' => $data['mensagem']);

                Zend_Controller_Action_HelperBroker::getStaticHelper('Emails')->Emails('', 'gerencia@piglog.com.br', $data['assunto'], $conteudo, false, 'emails/contato.phtml');

                $this->_redirect('/contato');
            } else {
                $this->_helper->FlashMessenger->addMessage(array('erro' => 'Campos Obrigat&oacute;rio!'));
                $this->_redirect('/contato');
            }
        }
    }
}
