<?php
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    protected function _initConfig() {
        // Busca a configurao
        $this->_config = new Zend_Config($this->getOptions());
        // Registra o config na sesso
        Zend_Registry::set("config", $this->_config);
    }

    protected function _initConnection() {
        //
        $debug = getenv("APPLICATION_DEBUG");
        if ($debug == 1) {
            $log = "[" . date("H:i:s") . "] Initializing database connection";
            Zend_Registry::get("debug")->Log($log);
        }
        // Busca as opes de configurao
        $options = $this->getOption("resources");
        $enabled = $options['db']['enabled'];
        // Verifica se est habilitado
        if ($enabled) {
            $db_adapter = $options['db']['adapter'];
            $params = $options['db']['params'];
            try {
                // Carrega a classe adaptadoda
                $db = Zend_Db::factory($db_adapter, $params);
                // Busca a conexo
                $db->getConnection();
                // Registra a conexo
                $registry = Zend_Registry::getInstance();
                $registry->set("db", $db);
            } catch (Exception $e) {
                // Verifica se deve fazer o debug
                if (APPLICATION_ENV == "production") {
                    // Mostra o problema com a conexo de dados
                    die("Estamos com problemas no momento, retorne em alguns instantes. Obrigado.");
                } else {
                    // Debuga a conexo
                    var_dump($e);
                    die();
                }
            }
        }
        //
        if ($debug == 1) {
            $log = "[" . date("H:i:s") . "] Database connection initialized";
            Zend_Registry::get("debug")->Log($log);
        }
    }

    /**
     * Inicializa as rotas
     *
     * @name _initRouter
     */
    protected function _initRouter() {
        try {
            $this->bootstrap("frontController");
            $config = new Zend_Config_Ini(APPLICATION_PATH . "/configs/routes.ini", "routes");
            $router = $this->getResource("frontController")->getRouter()->addConfig($config, "routes");
            return $router;
        } catch (Exception $e) {
            return FALSE;
        }
    }

    protected function _initDoctype() {
        $this->bootstrap('view');
        $view = $this->getResource('view');
        $view->doctype('XHTML1_STRICT');
    }

    protected function _initSession() {
        //instanciando o zend_acl
        $acl = new Zend_Acl();
        //craindouma regra para o perfil usuario no zend acl
        $acl->addRole(new Zend_Acl_Role('usuario'));
        Zend_Registry::set('ACL', $acl);
    }

    /*
      protected function _initZFDebug() {
      // register namespace
      $autoloader = Zend_Loader_Autoloader::getInstance()
      ->registerNamespace('ZFDebug');

      // Create ZFDebug instance
      $zfdebug = new ZFDebug_Controller_Plugin_Debug(array(
      'plugins' => array(
      'Variables',
      'Html',
      #'Database' => array('adapter' => array('standard' => Zend_Db_Table_Abstract::getDefaultAdapter())),
      #'File' => array('basePath' => 'path/to/application/root'),
      #'Memory',
      #'Time',
      #'Registry',
      #'Cache' => array('backend' => Zend_Registry::get('cache')->getBackend()),
      'Exception'
      )
      ));

      // Register ZFDebug with the front controller
      $front = $this->getResource('FrontController');
      $front->registerPlugin($zfdebug);
      } */
    
    /* Adiciona os Helpers */
    protected function _initHelpers() {
        Zend_Controller_Action_HelperBroker::addPath('TCS/Controller/Action/Helper');
        Zend_Controller_Action_HelperBroker::addPrefix('TCS_Controller_Action_Helper');
        $view = new Zend_View();
        $view->addHelperPath('TCS/View/Helpers/', 'TCS_View_Helpers');
        $viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer();
        $viewRenderer->setView($view);
        Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
    }

    protected function _initAutoLoader() {
        $autoloader = Zend_Loader_Autoloader::getInstance();
        $autoloader->registerNamespace('TCS');
    }

    protected function _initPlugins() {
        $bootstrap = $this->getApplication();
        if ($bootstrap instanceof Zend_Application) {
            $bootstrap = $this;
        }
        $bootstrap->bootstrap('FrontController');
        // Registra o plugin de layout
        $this->frontController->registerPlugin(new TCS_Controller_Plugin_Layout);
        // Registra o plugin de ACL
        $this->frontController->registerPlugin(new TCS_Controller_Plugin_Acl);
        // Registra o plugin de verificao do usuario
        $this->frontController->registerPlugin(new TCS_Controller_Plugin_Userverify);
        // Registra o plugin de adio das meta tags
        $this->frontController->registerPlugin(new TCS_Controller_Plugin_Metas);
        // Registra o plugin para carregar informaes para todo o site
        $this->frontController->registerPlugin(new TCS_Controller_Plugin_Geral);
    }

    protected function _initTranslate() {
        $translator = new Zend_Translate(array('adapter' => 'array', 'content' => dirname(dirname(__FILE__)) . '/library/TCS/languages/pt_BR/', 'locale' => 'pt_BR', 'scan' => Zend_Translate::LOCALE_DIRECTORY));
        Zend_Validate_Abstract::setDefaultTranslator($translator);
    }

}

?>