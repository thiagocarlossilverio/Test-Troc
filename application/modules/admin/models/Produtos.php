<?phpclass Admin_Model_Produtos extends Zend_Db_Table {    protected $_name = 'produtos';    protected $_primary = 'id';    protected $imagens = '';    public function init() {        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');        $viewRenderer->init();        $this->view = $viewRenderer->view;    }    public function Dados() {        if ($retun = $this->fetchRow()) {            return $retun->toArray();        }    }    public function GetId($id) {        $sql = $this->select()                ->setIntegrityCheck(false)                ->from(array('u' => $this->_name), array("*"))                ->joinLeft(array("i" => "produto_imagens"), "i.produto = u.id", array("imagem" => "i.imagem"))                ->where("u.id = ? ", $id);        if ($data = $this->fetchRow($sql)) {            return $data->toArray();        } else {            return false;        }    }    public function VerificaCategoria($categoria) {        $sql = $this->select()                ->setIntegrityCheck(false)                ->from(array('v' => $this->_name), array("id"))                ->where("v.categoria = ? ", $categoria);         if ($data = $this->fetchRow($sql)){             return $data->id;         }    }    public function GetProduto($id) {                      $sql = $this->select()                ->setIntegrityCheck(false)                ->from(array('v' => $this->_name), array("*"))                ->joinLeft(array("vc" => "categorias_produto"), "v.categoria = vc.id", array("nome_categoria" => "vc.nome"))                ->where("v.id = ? ", $id);        if ($data = $this->fetchRow($sql)) {            $ModelImagens = new Admin_Model_ProdutoImagens();            $result = $data->toArray();            $result['imagens'] = $ModelImagens->BuscarImagens($id);            return $result;        } else {            return false;        }    }         public function GetItem($id) {                      $sql = $this->select()                ->setIntegrityCheck(false)                ->from(array('v' => $this->_name), array("*"))                ->joinLeft(array("vc" => "categorias_produto"), "v.categoria = vc.id", array("nome_categoria" => "vc.nome"))                ->where("v.id = ? ", $id);        if ($data = $this->fetchRow($sql)) {            return $data->toArray();        } else {            return false;        }    }    public function Lista($limit = '', $destaque = NULL, $ativo = false, $categoria = false) {        $sql = $this->select()                ->setIntegrityCheck(false)                ->from(array('p' => $this->_name), array("*"))               // ->joinLeft(array("i" => "produto_imagens"), "i.produto = p.id and (i.capa = 1)", array("imagem" => "i.imagem"))                ->order("p.categoria Asc")                ->group('p.id');        if ($limit) {            $sql->limit($limit);        }        if ($destaque) {           // $sql->where("p.destaque = 1");        }        if ($ativo) {            $sql->where("p.ativo = 1");        }                        if ($categoria && $categoria >= 0) {            $sql->where("p.categoria = ?", $categoria);        }        if ($arr = $this->fetchAll($sql)) {            $produtos = $arr->toArray();            $imagem = new Admin_Model_ProdutoImagens();            foreach ($produtos as $key => $row) {                if (empty($row['imagem'])) {                    $produtos[$key]['imagem'] = $imagem->GetImg($row['id']);                }            }            return $produtos;        } else {            return false;        }    }    public function GetDados($id) {        $sql = $this->select()                ->where("id = ?", $id);        if ($data = $this->fetchRow($sql)) {            if (!empty($data['valor'])) {                $data['valor'] = $this->view->LimpaNumero($data['valor']);            }            return $data->toArray();        }    }          public function insert(array $data) {        $vinculo = $data['vinculo'];        if (!is_array($data))            return false;        if (empty($data['imagem'])) {            unset($data['imagem']);        }        if (is_numeric($data['id'])) {            $this->update($data, "id = " . $data['id']);            return $data['id'];        }        if (!empty($data['valor'])) {            $data['valor'] = $this->view->LimpaNumero($data['valor']);        }        unset($data['id']);        $data['data_cadastro'] = date('Y-m-d H:i:s');        $info = $this->info();        $data_insert = array_intersect_key($data, $info['metadata']);        $lastId = parent::insert($data_insert);        if ($vinculo != $lastId) {            $imagem = new Admin_Model_ProdutoImagens();            $imagem->update(array('produto' => $lastId), "produto = '" . $vinculo . "' ");        }        return $lastId;    }    public function update(array $data, $where) {        if (!empty($data['valor'])) {            $data['valor'] = $this->view->LimpaNumero($data['valor']);        }        if (!empty($data['km_rodados'])) {            $data['km_rodados'] = $this->view->LimpaNumero($data['km_rodados']);        }        $info = $this->info();        $data_insert = array_intersect_key($data, $info['metadata']);        return parent::update($data_insert, $where);        $vinculo = $data['vinculo'];        $imagem = new Admin_Model_ProdutoImagens();        $imagem->update(array('produto' => $data['id']), "produto = '" . $vinculo . "' ");    }    public function delete($where) {        return parent::delete($where);    }}