<?php

class Admin_Model_Acessos extends Zend_Db_Table {

    protected $_name = 'acessos';
    protected $_primary = 'id';
    public $_view;

    public function init() {
        $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
        $viewRenderer->init();
        $this->_view = $viewRenderer->view;
    }

    public function GetDados($id) {
        $sql = $this->select()->where("id = ?", $id);
        if ($result = $this->fetchRow($sql)->toArray()) {
            return $result;
        }
    }

    public function geraGrafico($largura, $altura) {

        //Busca a quantidade de pedidos por mes
        $db = Zend_Registry::get("db");
        $select = "Select MONTH(data_acesso) as mes, count(1) As total From acessos where  Year(data_acesso) = Year(now()) Group By mes ";
        $result = $db->query($select);
        $acessos = $result->fetchAll();
        $referencias = '';
        $total = '';
        $indices = '';
        foreach ($acessos as $key => $row) {

            if ($key == 0) {
                $referencias.= $this->_view->mes($row['mes']);
                $total.= $row['total'];
                $indices.= $row['total'];
            }

            if ($key > 0) {
                $referencias.= '|' . $this->_view->mes($row['mes']);
                $total.= ',' . $row['total'];
                $indices.= '|' . $row['total'];
            }
        }

        return "http://chart.apis.google.com/chart?cht=p3&chd=t:" . $total . "&chs=" . $largura . "x" . $altura . "&chdl=" . $referencias . "&chl=" . $indices . "&chco=67087b|e3007a|00a8eb|79c471";
    }

    public function insert(array $data) {
        $info = $this->info();
        $data_insert = array_intersect_key($data, $info['metadata']);
        parent::insert($data_insert);
    }

    public function Lista($data) {
        $sql = $this->select()
                ->setIntegrityCheck(false)
                ->from(array("a" => $this->_name))
                ->where("MONTH(a.data_acesso) = ?", $data['mes'])
                ->where("YEAR(a.data_acesso) = ?", $data['ano'])
                ->order("DAY(a.data_acesso) DESC");

        if ($result = $this->fetchAll($sql)) {
            return $result->toArray();
        } else {
            return FALSE;
        }
    }

    function getBrowser($useragent) {
        if (strpos($useragent, "MSIE") !== false && strpos($useragent, "Opera") === false && strpos($useragent, "Netscape") === false) {
            $found = preg_match("/MSIE ([0-9]{1}\.[0-9]{1,2})/", $useragent, $mathes);
            if ($found) {
                return "Internet Explorer " . $mathes[1];
            }
        } elseif (strpos($useragent, "Gecko")) {
            $found = preg_match("/Firefox\/([0-9]{1}\.[0-9]{1}(\.[0-9])?)/", $useragent, $mathes);
            if ($found) {
                return "Mozilla Firefox " . $mathes[1];
            }
            $found = preg_match("/Netscape\/([0-9]{1}\.[0-9]{1}(\.[0-9])?)/", $useragent, $mathes);
            if ($found) {
                return "Netscape " . $mathes[1];
            }
            $found = preg_match("/Chrome\/([^\s]+)/", $useragent, $mathes);
            if ($found) {
                return "Google Chrome " . $mathes[1];
            }
            $found = preg_match("/Safari\/([0-9]{2,3}(\.[0-9])?)/", $useragent, $mathes);
            if ($found) {
                return "Safari " . $mathes[1];
            }
            $found = preg_match("/Galeon\/([0-9]{1}\.[0-9]{1}(\.[0-9])?)/", $useragent, $mathes);
            if ($found) {
                return "Galeon " . $mathes[1];
            }
            $found = preg_match("/Konqueror\/([0-9]{1}\.[0-9]{1}(\.[0-9])?)/", $useragent, $mathes);
            if ($found) {
                return "Konqueror " . $mathes[1];
            }
            return "Gecko based";
        } elseif (strpos($useragent, "Opera") !== false) {
            $found = preg_match("/Opera[\/ ]([0-9]{1}\.[0-9]{1}([0-9])?)/", $useragent, $mathes);
            if ($found) {
                return "Opera " . $mathes[1];
            }
        } elseif (strpos($useragent, "Lynx") !== false) {
            $found = preg_match("/Lynx\/([0-9]{1}\.[0-9]{1}(\.[0-9])?)/", $useragent, $mathes);
            if ($found) {
                return "Lynx " . $mathes[1];
            }
        } elseif (strpos($useragent, "Netscape") !== false) {
            $found = preg_match("/Netscape\/([0-9]{1}\.[0-9]{1}(\.[0-9])?)/", $useragent, $mathes);
            if ($found) {
                return "Netscape " . $mathes[1];
            }
        } else {
            return false;
        }
    }

    function getBuscador() {
        if (eregi('google', $_SERVER['HTTP_USER_AGENT'])) {
            $buscador = "Google";
        } elseif (eregi("slurp", $_SERVER['HTTP_USER_AGENT'])) {
            $buscador = "Yahoo";
        } elseif (eregi("msn", $_SERVER['HTTP_USER_AGENT'])) {
            $buscador = "MSN";
        } elseif (eregi("ask", $_SERVER['HTTP_USER_AGENT'])) {
            $buscador = 'ASK';
        } elseif (eregi("alexa", $_SERVER['HTTP_USER_AGENT'])) {
            $buscador = "Alexa";
        } elseif (eregi("UOL", $_SERVER['HTTP_USER_AGENT'])) {
            $buscador = "UOL";
        }
        return 'Robots - ' . $buscador;
    }

    function getOs($os) {
        $useragent = strtolower($os);
        //check for (aaargh) most popular first
        //winxp
        if (strpos("$useragent", "windows nt 5.1") !== false) {
            return "Windows XP";
        } elseif (strpos("$useragent", "windows nt 6.0") !== false) {
            return "Windows Vista";
        } elseif (strpos("$useragent", "windows nt 6.1") !== false) {
            return "Windows 7";
        } elseif (strpos("$useragent", "windows 98") !== false) {
            return "Windows 98";
        } elseif (strpos("$useragent", "windows nt 5.0") !== false) {
            return "Windows 2000";
        } elseif (strpos("$useragent", "windows nt 5.2") !== false) {
            return "Windows 2003 server";
        } elseif (strpos("$useragent", "windows nt 6.0") !== false) {
            return "Windows Vista";
        } elseif (strpos("$useragent", "windows nt 6.2") !== false) {
            return "Windows 8";
        } elseif (strpos("$useragent", "windows nt 6.3") !== false) {
            return "Windows 8.1";
        } elseif (strpos("$useragent", "windows nt 10.0") !== false) {
            return "Windows 10";
        } elseif (strpos("$useragent", "windows nt") !== false) {
            return "Windows NT";
        } elseif (strpos("$useragent", "win 9x 4.90") !== false && strpos("$useragent", "win me")) {
            return "Windows ME";
        } elseif (strpos("$useragent", "win ce") !== false) {
            return "Windows CE";
        } elseif (strpos("$useragent", "win 9x 4.90") !== false) {
            return "Windows ME";
        } elseif (strpos("$useragent", "iphone") !== false) {
            return "iPhone";
        } elseif (strpos("$useragent", "mac os x") !== false) {
            return "Mac OS X";
        } elseif (strpos("$useragent", "macintosh") !== false) {
            return "Macintosh";
        } elseif (strpos("$useragent", "linux") !== false) {
            return "Linux";
        } elseif (strpos("$useragent", "freebsd") !== false) {
            return "Free BSD";
        } elseif (strpos("$useragent", "symbian") !== false) {
            return "Symbian";
        } else {
            return false;
        }
    }

    public function Rastrear($ip, $browser, $os) {
        $query = @unserialize(file_get_contents('http://ip-api.com/php/' . $ip));
        if ($query && $query['status'] == 'success') {
            $data = array();
            $data['ip'] = $ip;
            $data['regiao'] = $query['region'];
            $data['regiao_name'] = $query['regionName'];
            $data['cidade'] = $query['city'];
            $data['pais'] = $query['country'];
            $data['codigo'] = $query['zip'];
            $data['provedor_1'] = $query['as'];
            $data['provedor_2'] = $query['org'];
            $data['navegador'] = $browser;
            $data['sistema_operacional'] = $os;
            $this->insert($data);
        } else {
            return FALSE;
        }
    }

    public function delete($where) {
        return parent::delete($where);
    }

}
