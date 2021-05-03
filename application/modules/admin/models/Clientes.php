<?php

class Admin_Model_Clientes extends Zend_Db_Table {

    protected $_name = 'clientes';
    protected $_primary = 'id';

    public function init() {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->view = $viewRenderer->view;
    }

    public function insert(array $data) {

        if (!is_array($data))
            return false;

        if (empty($data['senha'])) {
            unset($data['senha']);
        }

        if (is_numeric($data['id'])) {
            $this->update($data, "id = " . $data['id']);
            return $data['id'];
        }

        $data['cpf'] = $this->view->LimpaCpfCnpj($data['cpf']);
        $data['data_cadastro'] = date('Y-m-d H:i:s');

        if (!empty($data['senha'])) {
            $data['senha'] = sha1($data['senha']);
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

    public function Dados() {
        $sql = $this->select();
        if ($result = $this->fetchRow($sql)) {
            return $result;
        }
    }

    public function GetDados($id) {
        $sql = $this->select()
                ->where("id = ?", $id);

        if ($result = $this->fetchRow($sql)) {
            $dados = $result->toArray();
            $dados['senha'] = '';
            if (!empty($dados['doc1'])) {
                $dados['doc1'] = $this->view->LimpaNumero($dados['doc1']);
            }
            return $dados;
        }
    }

    public function GetCliente($id) {
        $sql = $this->select()
                ->where("id = ?", $id);

        if ($result = $this->fetchRow($sql)) {
            return $result->toArray();
        }
    }

    public function update(array $data, $where) {

        $info = $this->info();

        $data['cpf'] = $this->view->LimpaCpfCnpj($data['cpf']);

        if (empty($data['imagem'])) {
            unset($data['imagem']);
        }

        if (!empty($data['senha'])) {
            $data['senha'] = sha1($data['senha']);
        }


        $data_insert = array_intersect_key($data, $info['metadata']);

        parent::update($data_insert, $where);
    }

    public function BuscarLogin($login) {

        $sql = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('c' => $this->_name), array("*"))
                ->where("c.email = ?", $login);

        if ($busca = $this->fetchRow($sql)) {
            return $busca->toArray();
        } else {
            return false;
        }
    }

    public function GetUser($id) {
        $sql = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('c' => $this->_name), array("*"))
                ->where("c.id = ?", $id);


        return $this->fetchRow($sql);
    }

    public function VerificaEmail($email) {

        $sql = $this->select()
                ->setIntegrityCheck(false)
                ->from(array("c" => $this->_name))
                ->where("c.email= ?", $email);

        if ($result = $this->fetchRow($sql)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function Lista($nome = null, $limit = '') {
        $sql = $this->select()
                ->setIntegrityCheck(false)
                ->from(array("c" => $this->_name))
                ->order('c.nome1');

        if (!empty($nome)) {
            $sql->where("c.nome1 REGEXP '$nome'");
        }


        if ($limit != '') {
            $sql->limit($limit);
        }

        return $this->fetchAll($sql);
    }

    public function GetAll() {
        $sql = $this->select()
                ->setIntegrityCheck(false)
                ->from(array("c" => $this->_name))
                ->where("c.ativo = ?", 1)
                ->order("c.nome");



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
