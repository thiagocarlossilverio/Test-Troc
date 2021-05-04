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

        if (!empty($data['desconto'])) {
            $data['desconto'] = $this->view->LimpaNumero($data['desconto']);
        }

        if (!empty($data['data_validade'])) {
            $data['data_validade'] = $this->view->ConvercaoDate('/', $data['data_validade'], 9);
        }


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
            if (!empty($result['data_validade'])) {
                $result['data_validade'] = $this->view->ConvercaoDate('-', $result['data_validade'], 7);
            }
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
