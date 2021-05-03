<?php

class Admin_Model_ProdutoImagens extends Zend_Db_Table {

    protected $_name = 'produto_imagens';
    protected $_primary = 'id';
    public $_view;

    public function init() {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->_view = $viewRenderer->view;
    }

    public function ApagaIMG($where, $dir) {
        unlink($dir);
        return parent::delete($where);
    }

    public function BuscarImagens($vinculo) {
        $sql = $this->select()
                    ->where("produto = ?", $vinculo)
                    ->order("ordem");
        if ($result = $this->fetchAll($sql)) {
            return $result->toArray();
        }
    }

    public function BuscarImagem($img) {
        $sql = $this->select()
                    ->where("imagem = ?", $img);
        if ($result = $this->fetchRow($sql)) {
            return $result->toArray();
        }
    }
    
     public function GetImg($produto) {
        $sql = $this->select()
                    ->where("produto = ?", $produto);
        if ($result = $this->fetchRow($sql)) {
            return $result->imagem;
        }
    }


    public function delete($where) {
        return parent::delete($where);
    }

}
