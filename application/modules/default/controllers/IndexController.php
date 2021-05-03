<?phpclass IndexController extends Zend_Controller_Action {    public function init() {        $acesso = new Zend_Session_Namespace("acesso");        $ModelAcessos = new Admin_Model_Acessos();        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {            $IP = $_SERVER['HTTP_X_FORWARDED_FOR'];        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {            $IP = $_SERVER['HTTP_CLIENT_IP'];        } elseif (isset($_SERVER['HTTP_FROM '])) {            $IP = $_SERVER['HTTP_FROM'];        } elseif (isset($_SERVER['REMOTE_ADDR'])) {            $IP = $_SERVER['REMOTE_ADDR'];        }        if ($acesso->ip == '') {            $data = $this->_request->getPost();            $data['sistema_operacional'] = $ModelAcessos->getOs($_SERVER['HTTP_USER_AGENT']);            $data['navegador'] = $ModelAcessos->getBrowser($_SERVER['HTTP_USER_AGENT']);            $data['ip'] = $IP;            $data['data_acesso'] = date("Y-m-d H:i:s");            $acesso->ip = $data['ip'];            $ModelAcessos->insert($data);        }        parent::init();    }    public function indexAction() {        $ModelProdutos = new Admin_Model_Produtos();        $ModelCategorias = new Admin_Model_Categorias();        $this->view->categorias = $ModelCategorias->ListCategory();        $this->view->produtos = $ModelProdutos->Lista(FALSE, FALSE, TRUE);    }    public function ajaxVendasAction() {        $this->_helper->layout->disableLayout();        $param = $this->_request->getParam('param');        $ModelVendas = new Admin_Model_Produtos();        $this->view->produtos = $ModelVendas->Lista(FALSE, FALSE, TRUE, $param);    }    public function ajaxVendaAction() {        $this->_helper->layout->disableLayout();        $item = new Zend_Session_Namespace("item");        $sessao_visualizacao = new Zend_Session_Namespace("visualizacao");        $param = (int)$this->_request->getParam('id');               if ($param) {            unset($item->param);            $item->param = $param;        }        $ModelVendas = new Admin_Model_Produtos();        $venda = $ModelVendas->GetVenda($param);                $total = ($venda['visualizacoes'] + 1);                if (isset($sessao_visualizacao->param) && $sessao_visualizacao->param !== $param) {            $sessao_visualizacao->param = $param;            $ModelVendas->update(array("visualizacoes" => $total), "id = '$param'");        } elseif (!isset($sessao_visualizacao->param)) {            $sessao_visualizacao->param = $param;            $ModelVendas->update(array("visualizacoes" => $total), "id = '$param'");        }              $this->view->dados = $venda;    }}