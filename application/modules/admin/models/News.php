<?php
class Admin_Model_News extends Zend_Db_Table {
    protected $_name = 'newsletters';
    protected $_primary = 'idnewsletter';
    public $_view;
    public function init() {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->_view = $viewRenderer->view; // Atribuo os Helper de Visão para  $this->view
    }
    public function GetDados($id) {
        $sql = $this->select()->where("idnewsletter = ?", $id);
        if ($result = $this->fetchRow($sql)->toArray()) {
            return $result;
        }
    }
    public function insert(array $data) {
        // Verificações INICIAIS Se o $DATA não for um Array saio da função.
        if (!is_array($data)) {
            return false;
        }
        unset($data['idnewsletter']);
        $info = $this->info();
        $data_insert = array_intersect_key($data, $info['metadata']);
        parent::insert($data_insert);
    }
    public function Lista() {
        $sql = $this->select()
                ->setIntegrityCheck(false)
                ->from(array("n" => $this->_name))
                ->order('n.idnewsletter');
        if ($result = $this->fetchAll($sql)->toArray()) {
            return $result;
        } else {
            return FALSE;
        }
    }
    public function delete($where) {
        return parent::delete($where);
    }
}
