<?php

class GeralController extends Zend_Controller_Action {

    public function topoAction() {
        $login = new Zend_Session_Namespace("login");
        
        $this->view->login = $login;
    }

    public function rodapeAction() {
       
    }

}
