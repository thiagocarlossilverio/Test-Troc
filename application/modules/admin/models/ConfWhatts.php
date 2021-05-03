<?php
class Admin_Model_ConfWhatts extends Zend_Db_Table {
    protected $_name = 'conf_whatts';
    protected $_primary = 'id';
    public $_view;
    public function init() {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->_view = $viewRenderer->view; // Atribuo os Helper de Visão para  $this->view
    }
    public function GetDados($id) {
        $sql = $this->select()->where("id = ?", $id);
        if ($result = $this->fetchRow($sql)->toArray()) {
            return $result;
        }
    }
    public function insert(array $data) {
         if (is_numeric($data['id'])) {
            $this->update($data, "id = " . $data['id']);
            return $data['id'];
        }
        $info = $this->info();
        $data_insert = array_intersect_key($data, $info['metadata']);
        parent::insert($data_insert);
    }
   public function update(array $data, $where) {
        $info = $this->info();
        $data_insert = array_intersect_key($data, $info['metadata']);
        parent::update($data_insert, $where);
        
    }
    public function delete($where) {
        return parent::delete($where);
    }
}
