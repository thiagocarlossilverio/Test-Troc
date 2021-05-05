-- --------------------------------------------------------
-- Servidor:                     test_troc.mysql.dbaas.com.br
-- Versão do servidor:           5.7.32-35-log - Percona Server (GPL), Release 35, Revision 5688520
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              9.4.0.5144
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para test_troc
CREATE DATABASE IF NOT EXISTS `test_troc` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `test_troc`;

-- Copiando estrutura para tabela test_troc.acessos
CREATE TABLE IF NOT EXISTS `acessos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `sistema_operacional` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `navegador` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `data_acesso` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela test_troc.acessos: 3 rows
/*!40000 ALTER TABLE `acessos` DISABLE KEYS */;
INSERT INTO `acessos` (`id`, `ip`, `sistema_operacional`, `navegador`, `latitude`, `longitude`, `data_acesso`) VALUES
	(1, '127.0.0.1', 'Linux', 'Google Chrome 90.0.4430.72', '', '', '2021-05-04 21:10:42'),
	(2, '186.226.246.45', 'Linux', 'Google Chrome 90.0.4430.93', '', '', '2021-05-05 08:28:00'),
	(3, '186.226.246.45', 'Linux', 'Google Chrome 90.0.4430.91', '', '', '2021-05-05 09:20:17');
/*!40000 ALTER TABLE `acessos` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.categorias_produto
CREATE TABLE IF NOT EXISTS `categorias_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(90) COLLATE latin1_general_ci NOT NULL,
  `ativo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela test_troc.categorias_produto: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias_produto` DISABLE KEYS */;
INSERT INTO `categorias_produto` (`id`, `nome`, `ativo`) VALUES
	(1, 'Calçados', 1),
	(2, 'Vestuário', 1),
	(3, 'Eletrônicos', 1),
	(4, 'Utensílios Domesticos', 1);
/*!40000 ALTER TABLE `categorias_produto` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pessoa` int(11) NOT NULL,
  `nome1` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `nome2` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `doc1` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `doc2` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `cidade` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `estado` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `cep` varchar(12) COLLATE latin1_general_ci NOT NULL,
  `endereco` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `bairro` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `telefone` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(40) COLLATE latin1_general_ci NOT NULL,
  `senha` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `ultimo_acesso` datetime NOT NULL,
  `chave` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `ativo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela test_troc.clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.conf_sistema
CREATE TABLE IF NOT EXISTS `conf_sistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(150) NOT NULL,
  `titulo` varchar(90) NOT NULL,
  `cor_layout` varchar(20) NOT NULL,
  `cor_menu` varchar(20) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela test_troc.conf_sistema: 1 rows
/*!40000 ALTER TABLE `conf_sistema` DISABLE KEYS */;
INSERT INTO `conf_sistema` (`id`, `logo`, `titulo`, `cor_layout`, `cor_menu`, `user`) VALUES
	(1, '', 'meu tema', '005da8', '9e9488', 1);
/*!40000 ALTER TABLE `conf_sistema` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.cupons
CREATE TABLE IF NOT EXISTS `cupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `codigo_cupom` varchar(70) COLLATE latin1_general_ci NOT NULL,
  `tipo_desconto` int(11) NOT NULL,
  `desconto` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `categoria` int(11) DEFAULT NULL,
  `data_validade` datetime NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Copiando dados para a tabela test_troc.cupons: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cupons` DISABLE KEYS */;
INSERT INTO `cupons` (`id`, `nome`, `codigo_cupom`, `tipo_desconto`, `desconto`, `categoria`, `data_validade`, `data_cadastro`, `ativo`) VALUES
	(2, 'Teste', 'bcd325', 2, '10', 1, '2021-05-15 10:41:00', '2021-05-04 10:35:30', 1),
	(3, 'Teste 01', 'bcd326', 1, '5', 2, '2021-05-29 10:48:00', '2021-05-04 10:36:01', 1);
/*!40000 ALTER TABLE `cupons` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.erros
CREATE TABLE IF NOT EXISTS `erros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace` text COLLATE utf8_unicode_ci,
  `parametros` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8_unicode_ci,
  `ip` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `parametros_acesso` text COLLATE utf8_unicode_ci,
  `data_execucao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela test_troc.erros: 0 rows
/*!40000 ALTER TABLE `erros` DISABLE KEYS */;
/*!40000 ALTER TABLE `erros` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(40) DEFAULT NULL,
  `controller` varchar(40) DEFAULT NULL,
  `action` varchar(40) DEFAULT NULL,
  `parametros` text,
  `ip` varchar(50) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `FK_logs_usuarios` FOREIGN KEY (`user`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela test_troc.logs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `module`, `controller`, `action`, `parametros`, `ip`, `data`, `user`) VALUES
	(1, 'admin', 'usuarios', 'adicionar', '{"module":"admin","controller":"usuarios","action":"adicionar","id":"","nome":"Homologa\\u00e7\\u00e3o","login":"teste","senha":"#Teste@2021!","email":"contato@thiagocarlos.com.br","celular":"","perfil":"3","MAX_FILE_SIZE":"52428800","status":"1","Salvar":"Salvar"}', '186.226.246.135', '2021-05-05 06:37:29', 1),
	(2, 'admin', 'usuarios', 'editar', '{"module":"admin","controller":"usuarios","action":"editar","id":"1","nome":"Thiago Carlos ","login":"thiago","senha":"","email":"thiagocarlos@outlook.com.br","celular":"4384257131","perfil":"3","MAX_FILE_SIZE":"52428800","status":"1","Salvar":"Salvar"}', '186.226.246.135', '2021-05-05 06:39:12', 1);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pai` int(11) DEFAULT NULL,
  `nome` varchar(90) DEFAULT NULL,
  `descricao` mediumtext,
  `icone` varchar(180) DEFAULT NULL,
  `controller` varchar(80) NOT NULL,
  `action` varchar(80) NOT NULL,
  `ordem` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela test_troc.menus: ~25 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `pai`, `nome`, `descricao`, `icone`, `controller`, `action`, `ordem`, `status`) VALUES
	(4, NULL, 'Usuario', 'Gerenciamento de Usuarios', 'fa fa-user', 'usuarios', '', 5, 1),
	(14, NULL, 'Itens de Menu', 'Gerenciamento de Menu', 'fa fa-external-link', 'menus', '', 7, 1),
	(15, 14, 'adicionar', 'Cadastro de Item de menu', 'fa fa-plus', 'menus', 'adicionar', NULL, 1),
	(18, 14, 'Listar', 'Listar Itens de Menu', 'fa fa-bars', 'menus', 'index', NULL, 1),
	(19, 4, 'adicionar', 'Cadastro de usuario', 'fa fa-plus', 'usuarios', 'adicionar', NULL, 1),
	(20, 4, 'Listar', 'Listar usuarios', 'fa fa-bars', 'usuarios', 'index', NULL, 1),
	(72, NULL, 'Configurações', 'Gerenciamento de Configurações', 'fa fa-gear', 'configuracoes', 'index', 6, 1),
	(73, 72, 'Email', 'Configuração de email', 'fa fa-envelope-o', 'configuracoes', 'email', NULL, 1),
	(89, 72, 'SEO', 'Otimização para Buscadores', 'fa fa-lightbulb-o', 'seo', 'index', NULL, 1),
	(104, NULL, 'Permissões', 'Gerenciamento de Permissões', 'fa fa-eye-slash', 'permissoes', 'index', 8, 1),
	(105, 104, 'Definir Permissão', 'Definição de permissão de Menu', 'fa fa-exclamation-circle', 'permissoes', 'index', NULL, 1),
	(106, 104, 'Atualizar Módulos', 'Atualização de Novos Módulos', 'fa fa-spinner', 'permissoes', 'atualizar', NULL, 1),
	(107, 104, 'Perfis', 'Gerenciamento de Perfis', 'fa fa-key', 'perfis', 'index', NULL, 1),
	(108, 104, 'Adicionar Perfil', 'Cadastro de Perfil', 'fa fa-plus-circle', 'perfis', 'adicionar', NULL, 1),
	(117, NULL, 'Logs', 'Listagens de logs', 'fa fa-exclamation-circle', 'logs', '', 10, 1),
	(123, 72, 'Sistema', 'Configurações do Sistema', 'fa fa-cog', 'configuracoes', 'sistema', NULL, 1),
	(127, NULL, 'Produtos', 'Gerenciamento de Produtos', 'fa fa-legal', 'produtos', '', 3, 1),
	(128, 127, 'Adicionar', 'Cadastro de Produtos', 'fa fa-plus-square-o', 'produtos', 'Adicionar', NULL, 1),
	(129, 127, 'Listar', 'Listagem de Produtos', 'fa fa-bars', 'produtos', '', NULL, 1),
	(135, NULL, 'Categorias', 'Gerenciamento de Categorias', 'fa fa-retweet', 'categorias', '', 2, 1),
	(136, 135, 'Adicionar', 'Cadastro de Categorias', 'fa fa-plus-circle', 'categorias', 'adicionar', NULL, 1),
	(138, 135, 'Listar', 'Lista de Categorias', 'fa fa-bars', 'categorias', '', NULL, 1),
	(139, NULL, 'Clientes', 'Gerenciamento de Clientes', 'fa fa-users', 'clientes', '', 1, 1),
	(141, NULL, 'Cupons', 'Gerenciamento de Cupons de Desconto', 'fa fa-tags', 'cupons', '', 4, 1),
	(142, 141, 'Adicionar', 'Cadastro de Cupom', 'fa fa-plus-circle', 'cupons', 'adicionar', NULL, 1),
	(143, 141, 'Listar Cupons', 'Listagem de Cupons', 'fa fa-bars', 'cupons', '', NULL, 1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.menus_perfil
CREATE TABLE IF NOT EXISTS `menus_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controlador` varchar(80) DEFAULT NULL,
  `acao` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela test_troc.menus_perfil: ~64 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_perfil` DISABLE KEYS */;
INSERT INTO `menus_perfil` (`id`, `controlador`, `acao`) VALUES
	(102, 'acessos', 'index'),
	(103, 'categorias', 'index'),
	(104, 'categorias', 'adicionar'),
	(105, 'categorias', 'editar'),
	(106, 'categorias', 'excluir'),
	(107, 'clientes', 'index'),
	(108, 'clientes', 'excluir'),
	(109, 'clientes', 'dados'),
	(110, 'configuracoes', 'whatsapp'),
	(111, 'configuracoes', 'atualizarcode'),
	(112, 'configuracoes', 'enviamensagem'),
	(113, 'configuracoes', 'email'),
	(114, 'configuracoes', 'sistema'),
	(115, 'error', 'error'),
	(116, 'geral', 'topo'),
	(117, 'geral', 'menu'),
	(118, 'geral', 'menulateral'),
	(119, 'geral', 'rodape'),
	(120, 'index', 'index'),
	(121, 'index', 'ajaxordem'),
	(122, 'index', 'ajaxsesao'),
	(123, 'index', 'teste'),
	(124, 'institucional', 'index'),
	(125, 'login', 'index'),
	(126, 'login', 'logout'),
	(127, 'login', 'requerersenha'),
	(128, 'login', 'recuperarsenha'),
	(129, 'logs', 'index'),
	(130, 'menus', 'index'),
	(131, 'menus', 'adicionar'),
	(132, 'menus', 'editar'),
	(133, 'menus', 'excluir'),
	(134, 'notificacao', 'index'),
	(135, 'perfis', 'index'),
	(136, 'perfis', 'adicionar'),
	(137, 'perfis', 'editar'),
	(138, 'perfis', 'excluir'),
	(139, 'propostas', 'index'),
	(140, 'propostas', 'responder'),
	(141, 'seo', 'index'),
	(142, 'seo', 'ajaxacoes'),
	(143, 'seo', 'ajaxpopulate'),
	(144, 'usuarios', 'index'),
	(145, 'usuarios', 'adicionar'),
	(146, 'usuarios', 'editar'),
	(147, 'usuarios', 'excluir'),
	(148, 'usuarios', 'perfil'),
	(149, 'usuarios', 'perfileditar'),
	(150, 'vendas', 'index'),
	(151, 'vendas', 'adicionar'),
	(152, 'vendas', 'editar'),
	(153, 'vendas', 'excluir'),
	(154, 'vendas', 'ajaximagens'),
	(155, 'vendas', 'ajaxdeletaimagem'),
	(156, 'vendas', 'ajaxsetacapa'),
	(157, 'vendas', 'ajaxsetaorder'),
	(158, 'produtos', 'index'),
	(159, 'produtos', 'adicionar'),
	(160, 'produtos', 'editar'),
	(161, 'produtos', 'excluir'),
	(162, 'produtos', 'ajaximagens'),
	(163, 'produtos', 'ajaxdeletaimagem'),
	(164, 'produtos', 'ajaxsetacapa'),
	(165, 'produtos', 'ajaxsetaorder');
/*!40000 ALTER TABLE `menus_perfil` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.menus_perfil_permissoes
CREATE TABLE IF NOT EXISTS `menus_perfil_permissoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) NOT NULL,
  `perfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu` (`menu`),
  KEY `perfil` (`perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela test_troc.menus_perfil_permissoes: ~125 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_perfil_permissoes` DISABLE KEYS */;
INSERT INTO `menus_perfil_permissoes` (`id`, `menu`, `perfil`) VALUES
	(265, 102, 2),
	(266, 102, 3),
	(267, 104, 2),
	(268, 105, 2),
	(269, 106, 2),
	(270, 103, 2),
	(271, 103, 3),
	(272, 106, 3),
	(273, 105, 3),
	(274, 109, 1),
	(275, 109, 2),
	(276, 108, 2),
	(277, 107, 2),
	(278, 107, 3),
	(279, 108, 3),
	(280, 109, 3),
	(281, 107, 1),
	(282, 114, 1),
	(283, 114, 2),
	(284, 114, 3),
	(285, 112, 3),
	(286, 112, 2),
	(288, 111, 2),
	(289, 111, 3),
	(290, 113, 3),
	(291, 113, 2),
	(293, 110, 2),
	(294, 110, 3),
	(296, 115, 2),
	(297, 115, 3),
	(298, 117, 1),
	(299, 118, 1),
	(300, 119, 1),
	(301, 116, 1),
	(302, 116, 2),
	(303, 116, 3),
	(304, 119, 3),
	(305, 119, 2),
	(306, 118, 2),
	(307, 118, 3),
	(308, 117, 3),
	(309, 117, 2),
	(310, 121, 1),
	(311, 122, 1),
	(312, 120, 1),
	(313, 123, 1),
	(314, 123, 2),
	(315, 120, 2),
	(316, 122, 2),
	(317, 121, 2),
	(318, 121, 3),
	(319, 122, 3),
	(320, 120, 3),
	(321, 123, 3),
	(322, 124, 1),
	(323, 124, 2),
	(324, 124, 3),
	(325, 125, 1),
	(326, 126, 1),
	(327, 128, 1),
	(328, 127, 1),
	(329, 127, 2),
	(330, 128, 2),
	(331, 126, 2),
	(332, 125, 2),
	(333, 125, 3),
	(334, 126, 3),
	(335, 128, 3),
	(336, 127, 3),
	(337, 129, 1),
	(338, 129, 2),
	(339, 129, 3),
	(342, 131, 3),
	(343, 132, 3),
	(344, 133, 3),
	(345, 130, 3),
	(346, 134, 1),
	(347, 134, 2),
	(348, 134, 3),
	(349, 136, 2),
	(350, 137, 2),
	(351, 138, 2),
	(352, 135, 2),
	(353, 135, 3),
	(354, 137, 3),
	(355, 138, 3),
	(356, 136, 3),
	(357, 139, 2),
	(358, 140, 2),
	(359, 139, 3),
	(360, 140, 3),
	(361, 142, 2),
	(362, 143, 2),
	(363, 141, 2),
	(364, 141, 3),
	(365, 143, 3),
	(366, 142, 3),
	(367, 145, 2),
	(368, 145, 3),
	(369, 146, 3),
	(370, 146, 2),
	(371, 147, 2),
	(372, 147, 3),
	(373, 144, 3),
	(374, 144, 2),
	(375, 148, 2),
	(376, 148, 3),
	(377, 149, 3),
	(378, 149, 2),
	(379, 151, 2),
	(380, 151, 3),
	(381, 155, 3),
	(382, 155, 2),
	(383, 154, 2),
	(384, 154, 3),
	(385, 156, 3),
	(386, 156, 2),
	(388, 157, 2),
	(389, 157, 3),
	(390, 152, 3),
	(391, 152, 2),
	(392, 153, 3),
	(393, 153, 2),
	(394, 150, 2),
	(395, 150, 3),
	(396, 140, 1),
	(397, 139, 1);
/*!40000 ALTER TABLE `menus_perfil_permissoes` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.menus_visualizacao
CREATE TABLE IF NOT EXISTS `menus_visualizacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) NOT NULL,
  `perfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu` (`menu`),
  KEY `perfil` (`perfil`),
  CONSTRAINT `FK_menus_visualizacao_menus` FOREIGN KEY (`menu`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menus_visualizacao_perfil` FOREIGN KEY (`perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela test_troc.menus_visualizacao: ~51 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_visualizacao` DISABLE KEYS */;
INSERT INTO `menus_visualizacao` (`id`, `menu`, `perfil`) VALUES
	(6, 14, 3),
	(7, 18, 3),
	(8, 19, 2),
	(9, 19, 3),
	(10, 20, 2),
	(11, 20, 3),
	(24, 72, 2),
	(25, 72, 3),
	(133, 105, 2),
	(148, 14, 3),
	(167, 105, 2),
	(168, 105, 3),
	(173, 107, 2),
	(174, 107, 3),
	(175, 108, 2),
	(176, 108, 3),
	(216, 106, 3),
	(220, 15, 3),
	(252, 117, 3),
	(253, 73, 3),
	(255, 4, 2),
	(256, 4, 3),
	(272, 104, 3),
	(405, 89, 3),
	(406, 123, 2),
	(407, 123, 3),
	(429, 136, 2),
	(430, 136, 3),
	(437, 135, 2),
	(438, 135, 3),
	(439, 138, 2),
	(440, 138, 3),
	(441, 139, 1),
	(442, 139, 2),
	(443, 139, 3),
	(447, 128, 2),
	(448, 128, 3),
	(449, 129, 2),
	(450, 129, 3),
	(451, 127, 2),
	(452, 127, 3),
	(453, 141, 1),
	(454, 141, 2),
	(455, 141, 3),
	(456, 142, 1),
	(457, 142, 2),
	(458, 142, 3),
	(459, 143, 1),
	(460, 143, 2),
	(461, 143, 3);
/*!40000 ALTER TABLE `menus_visualizacao` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.perfil
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela test_troc.perfil: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`id`, `nome`) VALUES
	(1, 'Usuario'),
	(2, 'Administrador'),
	(3, 'Desenvolvedor');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(90) NOT NULL,
  `categoria` int(11) NOT NULL,
  `destaque` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `valor` float NOT NULL DEFAULT '0',
  `data_cadastro` datetime NOT NULL,
  `visualizacoes` int(11) NOT NULL,
  `ativo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela test_troc.produtos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`id`, `nome`, `categoria`, `destaque`, `descricao`, `valor`, `data_cadastro`, `visualizacoes`, `ativo`) VALUES
	(1, 'Camiseta Polo', 2, 0, '<p>Nossas camisetas Polo foram desenvolvidas para que o tecido chegue a maior maciez, mantendo a resist&ecirc;ncia. A camiseta conta com um design arrojado e urbana .Todas os mat&eacute;rias s&atilde;o brasileiras trazendo ao produto alta qualidade. Aposte no simples!</p>\r\n', 45, '2021-05-03 18:47:35', 12, 1),
	(2, 'Tênis Feminino', 1, 0, '<p>T&ecirc;nis Academia Feminino- Run</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ESPECIFICA&Ccedil;&Otilde;ES<br />\r\n- Cabedal: Nylon<br />\r\n- Palmilha: EVA<br />\r\n- Peso: 210 gramas (ref. 35) variando de acordo com a numera&ccedil;&atilde;o.<br />\r\n- Fotos reais do produto.<br />\r\n- Forma normal. Caso esteja em d&uacute;vida, me&ccedil;a a palmilha de um t&ecirc;nis que voc&ecirc; j&aacute; possui em compare com a tabela abaixo para definir sua numera&ccedil;&atilde;o.<br />\r\n<br />\r\nTABELA DE TAMANHOS<br />\r\nNo 34 - Palmilha 23 cm<br />\r\nNo 35 - Palmilha 23,7 cm<br />\r\nNo 36 - Palmilha 24,3cm<br />\r\nNo 37 - Palmilha 25,0 cm<br />\r\nNo 38 - Palmilha 25,7 cm<br />\r\nNo 39 - Palmilha 26,3 cm</p>\r\n', 150, '2021-05-03 19:54:15', 13, 1);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.produto_imagens
CREATE TABLE IF NOT EXISTS `produto_imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto` bigint(20) DEFAULT NULL,
  `imagem` varchar(150) DEFAULT NULL,
  `capa` int(11) DEFAULT '0',
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade` (`produto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela test_troc.produto_imagens: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `produto_imagens` DISABLE KEYS */;
INSERT INTO `produto_imagens` (`id`, `produto`, `imagem`, `capa`, `ordem`) VALUES
	(3, 1, '7a84901c48.jpeg', 0, 1),
	(4, 1, '41z8wzbw5a.jpg', 0, 2),
	(5, 1, 'y4zx01w00y.jpg', 0, 3),
	(6, 1, '1cd6w1804d.jpg', 0, 4),
	(7, 1, 'y7zyyax72a.jpg', 0, 5),
	(8, 2, '2y3y28dd5z.jpg', 0, 1),
	(9, 2, 'zw913dzywz.jpg', 1, 2),
	(10, 2, 'bd9ay4wb21.jpg', 0, 3),
	(11, 2, '7c68w03dwz.jpg', 0, 4);
/*!40000 ALTER TABLE `produto_imagens` ENABLE KEYS */;

-- Copiando estrutura para tabela test_troc.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '0',
  `nome` varchar(90) NOT NULL DEFAULT '0',
  `senha` varchar(100) NOT NULL DEFAULT '0',
  `chave` varchar(150) NOT NULL DEFAULT '0',
  `perfil` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '0',
  `celular` varchar(50) NOT NULL DEFAULT '0',
  `imagem` varchar(100) DEFAULT '0',
  `ultimo_acesso` datetime DEFAULT NULL,
  `sessao` varchar(90) DEFAULT NULL,
  `ip` varchar(80) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_permisoes` (`perfil`),
  CONSTRAINT `FK_usuarios_perfil` FOREIGN KEY (`perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela test_troc.usuarios: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `login`, `nome`, `senha`, `chave`, `perfil`, `email`, `celular`, `imagem`, `ultimo_acesso`, `sessao`, `ip`, `status`) VALUES
	(1, 'thiago', 'Thiago Carlos ', '87927616bfab8d7a63927d941418cdd7', '', 3, 'thiagocarlos@outlook.com.br', '4384257131', '3a355z4d79.jpg', '2021-05-05 05:27:22', '7ae8a2d5bb93f0f5b22b682e4d43c103', '186.226.246.45', 1),
	(2, 'teste', 'Homologação', '435971a381d8263201b4d5e3ed38152a', '0', 3, 'contato@thiagocarlos.com.br', '', NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
