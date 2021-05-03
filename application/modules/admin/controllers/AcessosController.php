<?php

class Admin_AcessosController extends Zend_Controller_Action {

    public function indexAction() {
        $model = new Admin_Model_Acessos();

        $mes = $this->_request->getParam('mes');

        if ($mes) {
            $post = date("Y-m", strtotime("$mes month"));
        } else {
            $post = date("Y-m");
        }

        $array = explode("-", $post);
        $data = array();
        $data['mes'] = $array[1];
        $data['ano'] = $array[0];

        $this->view->acessos = $model->Lista($data);
        $this->view->mes = $mes;
        $this->view->data = $data;
    }


}
