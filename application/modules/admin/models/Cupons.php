<?php

class Admin_Model_Cupons extends Zend_Db_Table {

    protected $_name = 'cupons';
    protected $_primary = 'id';
    public $_view;

    public function init() {

        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
    }

    public function insert(array $data) {
        if (!is_array($data))
            return false;
   
        if (is_numeric($data['id'])) {
            $this->update($data, "id = " . $data['id']);
            return $data['id'];
        }

        unset($data['id']);
        $info = $this->info();
        $data_insert = array_intersect_key($data, $info['metadata']);
        parent::insert($data_insert);
    }


    public function ListCupons() {
        $sql = $this->select()
                    ->where("ativo = 1");

        if ($cupons = $this->fetchAll($sql)) {
            return $cupons->toArray();
        } else {
            return FALSE;
        }
    }

    public function GetCupom($id) {
        $sql = $this->select()->where("id = ?", $id);
        if ($result = $this->fetchRow($sql)) {
            return $result->toArray();
        }
    }
    

    public function update(array $data, $where) {
        $info = $this->info();
        $data_insert = array_intersect_key($data, $info['metadata']);
        parent::update($data_insert, $where);
    }

    public function Lista() {
        $sql = $this->select()->order("id");
        $result = $this->fetchAll($sql)->toArray();
        return $result;
    }

 

}
