<?
//ini_set('display_errors',1);
//ini_set('display_startup_erros',1);
error_reporting(E_ALL);
date_default_timezone_set('America/Sao_Paulo');

//die($_SERVER['HTTP_USER_AGENT']);
$rootDir = dirname(dirname(__FILE__));

define('ROOT_DIR', $rootDir);

// Define path to application directory
defined('APPLICATION_PATH') || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/application'));

// Define application environment
defined('APPLICATION_ENV') || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'production'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    get_include_path(),
)));

/** Zend_Application */
require_once ("Zend/Application.php");

// Create application, bootstrap, and run
$application = new Zend_Application(
        APPLICATION_ENV, APPLICATION_PATH . '/configs/application.ini'
);

//error_reporting(E_ALL);
//ini_set("display_errors", 1);

Zend_Session::start();

$application->bootstrap()->run();

