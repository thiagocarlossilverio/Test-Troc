<?php
//
/**
 * Cria o plugin para carregar informações para todo o site
 *
 * @name TCS_Controller_Plugin_Geral
 */
class TCS_Controller_Plugin_Geral extends Zend_Controller_Plugin_Abstract {

    /**
     * MÃ©todo da classe
     *
     * @name preDispatch
     */
    public function preDispatch(Zend_Controller_Request_Abstract $request) {
       
        $auth = Zend_Auth::getInstance();
        $session_user = $auth->getIdentity();

        /* Recupero os Parâmetros */
        $Module = $this->_request->getModuleName();
        $Controller = $this->_request->getControllerName();
        $Action = $this->_request->getActionName();
        //$host = $this->_request->getServer('HTTP_HOST');
        $server = $request->getServer('HTTP_X_REQUESTED_WITH');
        
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $IP = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $IP = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (isset($_SERVER['HTTP_FROM '])) {
            $IP = $_SERVER['HTTP_FROM'];
        } elseif (isset($_SERVER['REMOTE_ADDR'])) {
            $IP = $_SERVER['REMOTE_ADDR'];
        }

        $array = explode(',', $IP);
        
       /* if ($array[0] !== '186.226.246.45') {
            $this->getResponse()->setRedirect("/temp")->sendResponse();
        }*/

        if ($Module == "admin" && !empty($session_user->id)) {
            $ModelUsuario = new Admin_Model_Usuarios();

            $Dados_User = $ModelUsuario->GetDados($session_user->id);

            /* Verifico se o ID da sessão  é o mesmo do banco */
            if ($Dados_User['sessao'] != Zend_Session::getId()) {
                $auth = Zend_Auth::getInstance();
                $auth->clearIdentity();
                $IPS = explode(',', $Dados_User['ip']);
                if ($IPS) {
                    $Dados_User['ip'] = $IPS[0];
                }
                $flashMessenger = Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger');
                $flashMessenger->addMessage(array('erro' => 'Só é permitido uma sessão por usuário, alguém de IP: ' . $Dados_User['ip'] . ' fez login com seu usuário!'));
                $this->getResponse()->setRedirect("/admin/login")->sendResponse();
            }
            
            $Logs = new Admin_Model_Logs();
            $post = $this->_request->getPost();
            $hora_brasil = (date('H') - 3) . ":" . date('i') . ":" . date('s');
            
            $array = array(
                'module' => $Module,
                'controller' => $Controller,
                'action' => $Action,
                'parametros' => json_encode($this->_request->getParams()),
                'ip' => $session_user->ip,
                'data' => date("Y-m-d") . " " . $hora_brasil,
                'user' => $session_user->id
            );
            
            /* Se não for uma requisição ajax */
            if (!isset($server) && strtolower($server) != "xmlhttprequest" && $Module == 'admin' && $post || $Action == 'excluir') {
                $Logs->insert($array);
            }
        }
        
        if (substr($_SERVER['REQUEST_URI'], strrpos($_SERVER['REQUEST_URI'], ".")) == ".jpg") {
            return TRUE;
        }
        
        if ($this->_request->getParam("module") == "admin") {
            return TRUE;
        }
    }

}
