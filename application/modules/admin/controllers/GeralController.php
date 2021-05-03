<?php

class Admin_GeralController extends Zend_Controller_Action {

    public function topoAction() {
        $auth = Zend_Auth::getInstance();
        $user = $auth->getIdentity();
        $ModelSistema = new Admin_Model_ConfSistema();

        $this->view->conf = $ModelSistema->GetDados($user->id);
        $this->view->user = $user;
    }

    public function menuAction() {
        $menus = new Admin_Model_Menus();

        $auth = Zend_Auth::getInstance();
        $user = $auth->getIdentity();

        $result = $menus->GeraMenu($user->perfil);
        $this->view->menus = $result;
    }

    public function menuLateralAction() {
        $ModelVisualizacao = new Admin_Model_MenusVisualizacao();
        $auth = Zend_Auth::getInstance();
        $user = $auth->getIdentity();

        if ($user) {
            $this->view->menus = $ModelVisualizacao->GetMenu($user->perfil);
            $this->view->user = $user;
        }
    }

    public function rodapeAction() {
        $auth = Zend_Auth::getInstance();
        $user = $auth->getIdentity();
        $ModelSistema = new Admin_Model_ConfSistema();
        $this->view->conf = $ModelSistema->GetDados($user->id);
    }

}
