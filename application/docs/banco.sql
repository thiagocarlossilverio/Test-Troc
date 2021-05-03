-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.17 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela pig_log.acessos
CREATE TABLE IF NOT EXISTS `acessos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `sistema_operacional` varchar(220) COLLATE utf8_unicode_ci NOT NULL,
  `navegador` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `data_acesso` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela pig_log.acessos: 246 rows
/*!40000 ALTER TABLE `acessos` DISABLE KEYS */;
INSERT INTO `acessos` (`id`, `ip`, `sistema_operacional`, `navegador`, `latitude`, `longitude`, `data_acesso`) VALUES
	(7, '10.1.1.125', 'Windows 10', 'Google Chrome 51.0.2704.84', '0', '0', '2016-06-16 09:57:15'),
	(4, '10.1.1.6', 'Windows 7', 'Google Chrome 51.0.2704.84', '0', '0', '2016-06-15 19:37:16'),
	(5, '10.1.1.141', 'Windows 10', 'Google Chrome 51.0.2704.84', '0', '0', '2016-06-15 19:49:18'),
	(6, '189.75.171.213', 'Windows 10', 'Google Chrome 51.0.2704.84', '0', '0', '2016-06-15 20:56:35'),
	(8, '200.150.110.155', 'Windows 10', 'Gecko based', '-24.0338331', '-50.4531169', '2016-06-18 00:30:11'),
	(9, '187.95.127.199', 'Windows 10', 'Google Chrome 51.0.2704.103', '0', '0', '2016-06-18 17:57:51'),
	(10, '187.95.127.199', 'Windows 10', 'Google Chrome 51.0.2704.103', '0', '0', '2016-06-18 20:24:51'),
	(11, '10.1.1.125', 'Windows 10', 'Google Chrome 51.0.2704.84', '0', '0', '2016-06-20 09:51:00'),
	(12, '10.1.1.163', 'Windows 10', 'Google Chrome 51.0.2704.103', '0', '0', '2016-06-20 10:14:23'),
	(13, '10.1.1.12', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-07-26 09:11:53'),
	(14, '10.1.1.6', 'Windows 7', 'Google Chrome 51.0.2704.103', '0', '0', '2016-07-26 09:13:35'),
	(15, '187.94.128.173', 'Windows 7', 'Google Chrome 51.0.2704.103', '0', '0', '0000-00-00 00:00:00'),
	(16, '10.1.1.204', 'Windows 10', 'Google Chrome 52.0.2743.82', '0', '0', '0000-00-00 00:00:00'),
	(17, '10.1.1.12', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(18, '189.75.171.213', 'Windows 10', 'Google Chrome 52.0.2743.82', '0', '0', '0000-00-00 00:00:00'),
	(19, '10.1.1.12', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(20, '10.1.1.205', 'Windows 10', 'Google Chrome 52.0.2743.82', '0', '0', '0000-00-00 00:00:00'),
	(21, '10.1.1.12', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(22, '127.0.0.1', 'Windows 7', 'Google Chrome 52.0.2743.82', '0', '0', '0000-00-00 00:00:00'),
	(23, '10.1.1.10', 'Windows 7', 'Google Chrome 52.0.2743.82', '0', '0', '0000-00-00 00:00:00'),
	(24, '10.1.1.12', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(25, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501781', '-49.9209365', '0000-00-00 00:00:00'),
	(26, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(27, '10.1.1.8', 'Windows 10', 'Gecko based', '-24.550185199999998', '-49.9209611', '0000-00-00 00:00:00'),
	(28, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.79', '-24.55029', '-49.92044', '0000-00-00 00:00:00'),
	(29, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(30, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(31, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(32, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(33, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(34, '10.1.1.69', 'Mac OS X', 'Google Chrome 49.0.2623.112', '-24.5501866', '-49.920949699999994', '0000-00-00 00:00:00'),
	(35, '10.1.1.69', 'Mac OS X', 'Google Chrome 49.0.2623.112', '-24.5501956', '-49.9209573', '0000-00-00 00:00:00'),
	(36, '10.1.1.69', 'Mac OS X', 'Google Chrome 49.0.2623.112', '-24.5501853', '-49.920949799999995', '0000-00-00 00:00:00'),
	(37, '10.1.1.69', 'Mac OS X', 'Google Chrome 49.0.2623.112', '-24.5501829', '-49.9209452', '0000-00-00 00:00:00'),
	(38, '10.1.1.69', 'Mac OS X', 'Google Chrome 49.0.2623.112', '-24.5501851', '-49.9209537', '0000-00-00 00:00:00'),
	(39, '10.1.1.69', 'Mac OS X', 'Google Chrome 49.0.2623.112', '-24.550180599999997', '-49.920943199999996', '0000-00-00 00:00:00'),
	(40, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(41, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(42, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(43, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(44, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(45, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(46, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(47, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(48, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(49, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(50, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(51, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(52, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(53, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(54, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(55, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(56, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(57, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(58, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(59, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(60, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(61, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(62, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(63, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(64, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(65, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(66, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(67, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(68, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(69, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(70, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(71, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(72, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(73, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(74, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(75, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(76, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(77, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(78, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(79, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501746', '-49.920940699999996', '0000-00-00 00:00:00'),
	(80, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550169999999998', '-49.9209426', '0000-00-00 00:00:00'),
	(81, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550175100000004', '-49.9209398', '0000-00-00 00:00:00'),
	(82, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501804', '-49.920944399999996', '0000-00-00 00:00:00'),
	(83, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501698', '-49.9209439', '0000-00-00 00:00:00'),
	(84, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550194899999997', '-49.920961899999995', '0000-00-00 00:00:00'),
	(85, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501778', '-49.9209355', '0000-00-00 00:00:00'),
	(86, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501829', '-49.9209381', '0000-00-00 00:00:00'),
	(87, '10.1.1.9', 'Linux', 'Google Chrome 52.0.2743.98', '0', '0', '0000-00-00 00:00:00'),
	(88, '10.1.1.9', 'Linux', 'Google Chrome 52.0.2743.98', '0', '0', '0000-00-00 00:00:00'),
	(89, '10.1.1.9', 'Linux', 'Google Chrome 52.0.2743.98', '0', '0', '0000-00-00 00:00:00'),
	(90, '10.1.1.9', 'Linux', 'Google Chrome 52.0.2743.98', '0', '0', '0000-00-00 00:00:00'),
	(91, '10.1.1.9', 'Linux', 'Google Chrome 52.0.2743.98', '0', '0', '0000-00-00 00:00:00'),
	(92, '10.1.1.9', 'Linux', 'Google Chrome 52.0.2743.98', '0', '0', '0000-00-00 00:00:00'),
	(93, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(94, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5503383', '-49.928810899999995', '0000-00-00 00:00:00'),
	(95, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5503383', '-49.928810899999995', '0000-00-00 00:00:00'),
	(96, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550167599999998', '-49.920941199999994', '0000-00-00 00:00:00'),
	(97, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501737', '-49.9209451', '0000-00-00 00:00:00'),
	(98, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501737', '-49.9209451', '0000-00-00 00:00:00'),
	(99, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501699', '-49.9209422', '0000-00-00 00:00:00'),
	(100, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501699', '-49.9209422', '0000-00-00 00:00:00'),
	(101, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501699', '-49.9209422', '0000-00-00 00:00:00'),
	(102, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501774', '-49.9209496', '0000-00-00 00:00:00'),
	(103, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501798', '-49.9209549', '0000-00-00 00:00:00'),
	(104, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501798', '-49.9209549', '0000-00-00 00:00:00'),
	(105, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501798', '-49.9209549', '0000-00-00 00:00:00'),
	(106, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550181199999997', '-49.9209385', '0000-00-00 00:00:00'),
	(107, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501914', '-49.920944399999996', '0000-00-00 00:00:00'),
	(108, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501914', '-49.920944399999996', '0000-00-00 00:00:00'),
	(109, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501914', '-49.920944399999996', '0000-00-00 00:00:00'),
	(110, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501914', '-49.920944399999996', '0000-00-00 00:00:00'),
	(111, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501838', '-49.9209422', '0000-00-00 00:00:00'),
	(112, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550189', '-49.9209453', '0000-00-00 00:00:00'),
	(113, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501795', '-49.9209363', '0000-00-00 00:00:00'),
	(114, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501795', '-49.9209363', '0000-00-00 00:00:00'),
	(115, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501795', '-49.9209363', '0000-00-00 00:00:00'),
	(116, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501795', '-49.9209363', '0000-00-00 00:00:00'),
	(117, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501823', '-49.920939399999995', '0000-00-00 00:00:00'),
	(118, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501823', '-49.920939399999995', '0000-00-00 00:00:00'),
	(119, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501823', '-49.920939399999995', '0000-00-00 00:00:00'),
	(120, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501823', '-49.920939399999995', '0000-00-00 00:00:00'),
	(121, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550175900000003', '-49.920937699999996', '0000-00-00 00:00:00'),
	(122, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550175900000003', '-49.920937699999996', '0000-00-00 00:00:00'),
	(123, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501784', '-49.9209408', '0000-00-00 00:00:00'),
	(124, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501784', '-49.9209408', '0000-00-00 00:00:00'),
	(125, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501784', '-49.9209408', '0000-00-00 00:00:00'),
	(126, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501784', '-49.9209408', '0000-00-00 00:00:00'),
	(127, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501838', '-49.920929799999996', '0000-00-00 00:00:00'),
	(128, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501886', '-49.920925999999994', '0000-00-00 00:00:00'),
	(129, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501701', '-49.9209447', '0000-00-00 00:00:00'),
	(130, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550170599999998', '-49.920942', '0000-00-00 00:00:00'),
	(131, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550185499999998', '-49.920946799999996', '0000-00-00 00:00:00'),
	(132, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550193099999998', '-49.920938899999996', '0000-00-00 00:00:00'),
	(133, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501819', '-49.9209405', '0000-00-00 00:00:00'),
	(134, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501819', '-49.9209405', '0000-00-00 00:00:00'),
	(135, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550182099999997', '-49.920941', '0000-00-00 00:00:00'),
	(136, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501833', '-49.920939999999995', '0000-00-00 00:00:00'),
	(137, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501813', '-49.920937699999996', '0000-00-00 00:00:00'),
	(138, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501813', '-49.920937699999996', '0000-00-00 00:00:00'),
	(139, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501735', '-49.920944999999996', '0000-00-00 00:00:00'),
	(140, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501735', '-49.920944999999996', '0000-00-00 00:00:00'),
	(141, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550179999999997', '-49.9209355', '0000-00-00 00:00:00'),
	(142, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550179999999997', '-49.9209355', '0000-00-00 00:00:00'),
	(143, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501905', '-49.920958399999996', '0000-00-00 00:00:00'),
	(144, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501905', '-49.920958399999996', '0000-00-00 00:00:00'),
	(145, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501905', '-49.920958399999996', '0000-00-00 00:00:00'),
	(146, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501784', '-49.9209374', '0000-00-00 00:00:00'),
	(147, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501784', '-49.9209374', '0000-00-00 00:00:00'),
	(148, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550193399999998', '-49.920959499999995', '0000-00-00 00:00:00'),
	(149, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550193399999998', '-49.920959499999995', '0000-00-00 00:00:00'),
	(150, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501789', '-49.920941', '0000-00-00 00:00:00'),
	(151, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501789', '-49.920941', '0000-00-00 00:00:00'),
	(152, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550187599999997', '-49.9209463', '0000-00-00 00:00:00'),
	(153, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550176', '-49.9209378', '0000-00-00 00:00:00'),
	(154, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550174499999997', '-49.9208928', '0000-00-00 00:00:00'),
	(155, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550176200000003', '-49.920943', '0000-00-00 00:00:00'),
	(156, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501673', '-49.920941199999994', '0000-00-00 00:00:00'),
	(157, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501841', '-49.9209368', '0000-00-00 00:00:00'),
	(158, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501783', '-49.9209373', '0000-00-00 00:00:00'),
	(159, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550174', '-49.9209379', '0000-00-00 00:00:00'),
	(160, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501781', '-49.920939499999996', '0000-00-00 00:00:00'),
	(161, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501781', '-49.920939499999996', '0000-00-00 00:00:00'),
	(162, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501793', '-49.9209366', '0000-00-00 00:00:00'),
	(163, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501793', '-49.9209366', '0000-00-00 00:00:00'),
	(164, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501793', '-49.9209366', '0000-00-00 00:00:00'),
	(165, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550176200000003', '-49.9209399', '0000-00-00 00:00:00'),
	(166, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550176200000003', '-49.9209399', '0000-00-00 00:00:00'),
	(167, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501804', '-49.9209398', '0000-00-00 00:00:00'),
	(168, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501804', '-49.9209398', '0000-00-00 00:00:00'),
	(169, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550179399999998', '-49.9209429', '0000-00-00 00:00:00'),
	(170, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501804', '-49.9209393', '0000-00-00 00:00:00'),
	(171, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501804', '-49.9209393', '0000-00-00 00:00:00'),
	(172, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501804', '-49.9209393', '0000-00-00 00:00:00'),
	(173, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501804', '-49.9209393', '0000-00-00 00:00:00'),
	(174, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501804', '-49.9209393', '0000-00-00 00:00:00'),
	(175, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(176, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550166899999997', '-49.920939399999995', '0000-00-00 00:00:00'),
	(177, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550173299999997', '-49.920938899999996', '0000-00-00 00:00:00'),
	(178, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501734', '-49.920936399999995', '0000-00-00 00:00:00'),
	(179, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501734', '-49.920936399999995', '0000-00-00 00:00:00'),
	(180, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501734', '-49.920936399999995', '0000-00-00 00:00:00'),
	(181, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501734', '-49.920936399999995', '0000-00-00 00:00:00'),
	(182, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550176200000003', '-49.9209397', '0000-00-00 00:00:00'),
	(183, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550176200000003', '-49.9209397', '0000-00-00 00:00:00'),
	(184, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550176200000003', '-49.9209397', '0000-00-00 00:00:00'),
	(185, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501865', '-49.9209542', '0000-00-00 00:00:00'),
	(186, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501865', '-49.9209542', '0000-00-00 00:00:00'),
	(187, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501865', '-49.9209542', '0000-00-00 00:00:00'),
	(188, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550193', '-49.9209588', '0000-00-00 00:00:00'),
	(189, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550193', '-49.9209588', '0000-00-00 00:00:00'),
	(190, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501726', '-49.920945599999996', '0000-00-00 00:00:00'),
	(191, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501726', '-49.920945599999996', '0000-00-00 00:00:00'),
	(192, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501726', '-49.920945599999996', '0000-00-00 00:00:00'),
	(193, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501726', '-49.920945599999996', '0000-00-00 00:00:00'),
	(194, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550173599999997', '-49.920935300000004', '0000-00-00 00:00:00'),
	(195, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550173599999997', '-49.920935300000004', '0000-00-00 00:00:00'),
	(196, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(197, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(198, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(199, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(200, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(201, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(202, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501814', '-49.920941', '0000-00-00 00:00:00'),
	(203, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550165999999997', '-49.9209397', '0000-00-00 00:00:00'),
	(204, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550165999999997', '-49.9209397', '0000-00-00 00:00:00'),
	(205, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501773', '-49.920938299999996', '0000-00-00 00:00:00'),
	(206, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501773', '-49.920938299999996', '0000-00-00 00:00:00'),
	(207, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501773', '-49.920938299999996', '0000-00-00 00:00:00'),
	(208, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550179', '-49.9209384', '0000-00-00 00:00:00'),
	(209, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550179', '-49.9209384', '0000-00-00 00:00:00'),
	(210, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(211, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(212, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(213, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(214, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(215, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(216, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(217, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(218, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(219, '10.1.1.73', 'Windows 10', 'Google Chrome 46.0.2486.0', '-22.8527', '-51.0293', '0000-00-00 00:00:00'),
	(220, '10.1.1.73', 'Windows 10', 'Google Chrome 46.0.2486.0', '-22.8527', '-51.0293', '0000-00-00 00:00:00'),
	(221, '10.1.1.73', 'Windows 10', 'Google Chrome 46.0.2486.0', '-22.8527', '-51.0293', '0000-00-00 00:00:00'),
	(222, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(223, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '0000-00-00 00:00:00'),
	(224, '10.1.1.8', 'Windows 10', 'Gecko based', '-24.550169399999998', '-49.9209436', '0000-00-00 00:00:00'),
	(225, '10.1.1.8', 'Windows 10', 'Gecko based', '-24.550169399999998', '-49.9209436', '0000-00-00 00:00:00'),
	(226, '10.1.1.8', 'Windows 10', 'Gecko based', '', '', '0000-00-00 00:00:00'),
	(227, '10.1.1.8', 'Windows 10', 'Gecko based', '', '', '0000-00-00 00:00:00'),
	(228, '10.1.1.8', 'Windows 10', 'Gecko based', '', '', '0000-00-00 00:00:00'),
	(229, '10.1.1.8', 'Windows 10', 'Gecko based', '', '', '0000-00-00 00:00:00'),
	(230, '10.1.1.8', 'Windows 10', 'Gecko based', '', '', '0000-00-00 00:00:00'),
	(231, '10.1.1.8', 'Windows 10', 'Gecko based', '', '', '2016-08-30 16:06:36'),
	(232, '10.1.1.8', 'Windows 10', 'Gecko based', '-24.5501774', '-49.920938199999995', '2016-08-30 16:08:17'),
	(233, '10.1.1.51', 'Windows 8.1', 'Google Chrome 52.0.2743.116', '0', '0', '2016-08-30 16:13:30'),
	(234, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-08-31 07:36:15'),
	(235, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.550185199999998', '-49.9209611', '2016-09-01 07:48:42'),
	(236, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-09-01 08:10:40'),
	(237, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-09-02 07:41:49'),
	(238, '10.1.1.59', 'Windows 8.1', 'Google Chrome 52.0.2743.116', '0', '0', '2016-09-02 11:00:47'),
	(239, '10.1.1.29', 'iPhone', 'Safari 601.1', '0', '0', '2016-09-02 11:07:49'),
	(240, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501802', '-49.9209381', '2016-09-05 07:47:45'),
	(241, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-09-05 10:40:46'),
	(242, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-09-06 07:38:53'),
	(243, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-09-06 10:20:57'),
	(244, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501875', '-49.9209926', '2016-09-08 07:36:11'),
	(245, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-09-09 16:17:51'),
	(246, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-09-12 08:19:35'),
	(247, '10.1.1.63', 'Mac OS X', 'Google Chrome 49.0.2623.112', '-24.5501805', '-49.9209661', '2016-09-12 09:42:46'),
	(248, '::1', 'Windows 10', 'Google Chrome 51.0.2704.106', '-24.5501848', '-49.9209933', '2016-09-13 07:42:32'),
	(249, '10.1.1.8', 'Windows 10', 'Google Chrome 51.0.2704.106', '0', '0', '2016-09-13 11:09:32');
/*!40000 ALTER TABLE `acessos` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.banners
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(70) DEFAULT NULL,
  `link` varchar(120) DEFAULT NULL,
  `imagem` varchar(150) DEFAULT NULL,
  `ordem` int(11) DEFAULT '1',
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.banners: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` (`id`, `titulo`, `link`, `imagem`, `ordem`, `ativo`) VALUES
	(2, 'teste 02', '', 'c16cd2d33d.png', 17, 1),
	(3, 'Banner01', 'http://schoeler.com.br', 'aa4861zzcw.jpg', 15, 1),
	(4, 'Banner02', '', '9bb5bbbw9x.jpg', 16, 1),
	(5, 'Banner03', '', '39zc9z9b12.jpg', 18, 1),
	(7, 'Banner 04', '', 'xz06wb7awz.jpg', 1, 1);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.conf_sistema
CREATE TABLE IF NOT EXISTS `conf_sistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(150) NOT NULL,
  `titulo` varchar(90) NOT NULL,
  `cor_layout` varchar(20) NOT NULL,
  `cor_menu` varchar(20) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pig_log.conf_sistema: 1 rows
/*!40000 ALTER TABLE `conf_sistema` DISABLE KEYS */;
INSERT INTO `conf_sistema` (`id`, `logo`, `titulo`, `cor_layout`, `cor_menu`, `user`) VALUES
	(1, '', 'meu tema', '005da8', '9e9488', 3);
/*!40000 ALTER TABLE `conf_sistema` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.conf_whatts
CREATE TABLE IF NOT EXISTS `conf_whatts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddi` int(11) DEFAULT NULL,
  `dd` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `nome` varchar(90) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pig_log.conf_whatts: 1 rows
/*!40000 ALTER TABLE `conf_whatts` DISABLE KEYS */;
INSERT INTO `conf_whatts` (`id`, `ddi`, `dd`, `numero`, `nome`, `password`) VALUES
	(1, 55, '43', '84015095', 'Sistema', '1prtJWQXJl5BI8mYm+WmW0PiOSM=');
/*!40000 ALTER TABLE `conf_whatts` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.contatos
CREATE TABLE IF NOT EXISTS `contatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `assunto` varchar(200) DEFAULT NULL,
  `param` int(11) DEFAULT NULL,
  `mensagem` text,
  `resposta` longtext NOT NULL,
  `visualizado` int(11) NOT NULL DEFAULT '0',
  `data_contato` datetime NOT NULL,
  `ip` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.contatos: 6 rows
/*!40000 ALTER TABLE `contatos` DISABLE KEYS */;
INSERT INTO `contatos` (`id`, `nome`, `email`, `telefone`, `assunto`, `param`, `mensagem`, `resposta`, `visualizado`, `data_contato`, `ip`) VALUES
	(1, 'teste', 'thiago@schoeler.com.br', NULL, 'teste', NULL, 'teste', '', 1, '2016-08-30 10:00:12', '10.1.1.8'),
	(2, 'Thiago', 'thiago@schoeler.com.br', NULL, 'teste', NULL, 'teste', '', 0, '2016-08-30 10:01:24', '10.1.1.8'),
	(3, 'Thiago', 'thiago@schoeler.com.br', '(43) 842-57131', 'Proposta de Compra de veículo', 1, 'teste', '<p>teste</p>\r\n', 1, '2016-08-30 15:05:15', '::1'),
	(4, 'Thiago', 'thiago@schoeler.com.br', '4384257131', 'Proposta de Compra de veículo', 3, 'teste', '', 0, '2016-08-30 15:22:58', '::1'),
	(5, 'Thiago', 'thiago@schoeler.com.br', '4384257131', 'Proposta de Compra de veículo', 3, 'teste', '', 0, '2016-08-30 16:09:02', '10.1.1.8'),
	(6, 'Thiago', 'thiago@schoeler.com.br', '4384257131', 'Proposta de Compra de veículo', 2, 'teste', '', 1, '2016-08-31 08:51:33', '10.1.1.8');
/*!40000 ALTER TABLE `contatos` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.cotacoes
CREATE TABLE IF NOT EXISTS `cotacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(90) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `empresa` varchar(80) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `ie` varchar(30) NOT NULL,
  `origem` varchar(90) DEFAULT NULL,
  `destino` varchar(90) DEFAULT NULL,
  `tipo_carga` varchar(80) DEFAULT NULL,
  `quantidade` float DEFAULT '0',
  `adicional` text NOT NULL,
  `resposta` text,
  `data_contato` datetime DEFAULT NULL,
  `visualizado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.cotacoes: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `cotacoes` DISABLE KEYS */;
INSERT INTO `cotacoes` (`id`, `nome`, `telefone`, `email`, `empresa`, `cnpj`, `ie`, `origem`, `destino`, `tipo_carga`, `quantidade`, `adicional`, `resposta`, `data_contato`, `visualizado`) VALUES
	(1, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '11.111.111/1111-11', '1111111111111111', 'Sapopema', 'Pirai do Sul', NULL, NULL, '', NULL, '2016-08-30 11:36:53', 1),
	(2, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 11:50:16', 1),
	(3, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 11:53:35', 0),
	(4, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 11:53:45', 0),
	(5, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 11:54:05', 0),
	(6, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 11:54:38', 0),
	(7, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 11:55:32', 0),
	(8, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 11:56:25', 1),
	(9, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 11:58:22', 0),
	(10, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 12:04:21', 0),
	(11, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 12:04:45', 0),
	(12, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 12:05:05', 0),
	(13, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 12:11:23', 0),
	(14, 'Thiago', '4384257131', 'thiago@schoeler.com.br', 'Schoeler', '22.222.222/2222-22', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, '200 Porcos', NULL, '2016-08-30 12:15:37', 0),
	(15, 'Thiago', '(43) 842-57131', 'thiago@schoeler.com.br', 'Schoeler', '11.111.111/1111-11', '11111111111', 'Sapopema', 'Ibiporã - Pr', 'Suínos', NULL, 'teste', NULL, '2016-08-30 13:39:46', 0),
	(16, 'Thiago Carlos Silvério', '(43) 842-57131', 'thiagocarlos@outlook.com.br', 'Schoeler Suínos', '11.111.111/1111-11', '111111111111111', 'Piraí do Sul - Pr', 'Londrina - Pr', 'Suínos', 20000, 'teste de cotação de suínos', '<p>recebemos com sucesso sua cota&ccedil;&atilde;o</p>\r\n', '2016-08-31 08:41:00', 1);
/*!40000 ALTER TABLE `cotacoes` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.erros
CREATE TABLE IF NOT EXISTS `erros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trace` text COLLATE utf8_unicode_ci,
  `parametros` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8_unicode_ci,
  `ip` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `parametros_acesso` text COLLATE utf8_unicode_ci,
  `data_execucao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Copiando dados para a tabela pig_log.erros: 16 rows
/*!40000 ALTER TABLE `erros` DISABLE KEYS */;
INSERT INTO `erros` (`id`, `trace`, `parametros`, `mensagem`, `ip`, `parametros_acesso`, `data_execucao`) VALUES
	(1, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"css","module":"default"}', 'Invalid controller specified (assets)', '10.1.1.8', NULL, '2016-09-02 13:34:16'),
	(2, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"css","module":"default"}', 'Invalid controller specified (assets)', '10.1.1.8', NULL, '2016-09-02 13:34:29'),
	(3, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '::1', NULL, '2016-09-05 05:10:48'),
	(4, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '::1', NULL, '2016-09-05 05:13:25'),
	(5, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '10.1.1.8', NULL, '2016-09-05 09:14:17'),
	(6, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '10.1.1.8', NULL, '2016-09-05 09:14:25'),
	(7, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '::1', NULL, '2016-09-06 04:39:36'),
	(8, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '::1', NULL, '2016-09-06 04:39:42'),
	(9, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '::1', NULL, '2016-09-08 04:36:20'),
	(10, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '10.1.1.63', NULL, '2016-09-12 06:44:28'),
	(11, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '10.1.1.63', NULL, '2016-09-12 06:44:36'),
	(12, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '10.1.1.63', NULL, '2016-09-12 06:44:55'),
	(13, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '10.1.1.8', NULL, '2016-09-12 06:48:14'),
	(14, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '::1', NULL, '2016-09-13 04:43:09'),
	(15, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"assets","action":"images","module":"default"}', 'Invalid controller specified (assets)', '::1', NULL, '2016-09-13 04:43:24'),
	(16, '#0 C:\\wamp\\www\\library\\Zend\\Controller\\Front.php(954): Zend_Controller_Dispatcher_Standard->dispatch(Object(Zend_Controller_Request_Http), Object(Zend_Controller_Response_Http))\n#1 C:\\wamp\\www\\library\\Zend\\Application\\Bootstrap\\Bootstrap.php(101): Zend_Controller_Front->dispatch()\n#2 C:\\wamp\\www\\library\\Zend\\Application.php(366): Zend_Application_Bootstrap_Bootstrap->run()\n#3 C:\\wamp\\www\\index.php(35): Zend_Application->run()\n#4 {main}', '{"controller":"pig","action":"0.png","module":"default"}', 'Invalid controller specified (pig)', '::1', NULL, '2016-09-13 05:25:03');
/*!40000 ALTER TABLE `erros` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.galerias
CREATE TABLE IF NOT EXISTS `galerias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(90) DEFAULT NULL,
  `descricao` text,
  `ativo` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.galerias: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `galerias` DISABLE KEYS */;
INSERT INTO `galerias` (`id`, `nome`, `descricao`, `ativo`) VALUES
	(1, 'galeria 01', '<p>&Eacute; um fato conhecido de todos que um leitor se distrair&aacute; com o conte&uacute;do de texto leg&iacute;vel de uma p&aacute;gina quando estiver examinando sua diagrama&ccedil;&atilde;o.&nbsp;</p>\r\n', 1),
	(2, 'Galeria 02', '<p>&Eacute; um fato conhecido de todos que um leitor se distrair&aacute; com o conte&uacute;do de texto leg&iacute;vel de uma p&aacute;gina quando estiver examinando sua diagrama&ccedil;&atilde;o.&nbsp;</p>\r\n', 1),
	(3, 'Galeria 03', '<p>teste</p>\r\n', 1),
	(4, 'Galeria 04', '<p>teste</p>\r\n', 1),
	(5, 'Galeria 05', '<p>teste</p>\r\n', 1);
/*!40000 ALTER TABLE `galerias` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.galeria_imagens
CREATE TABLE IF NOT EXISTS `galeria_imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `galeria` bigint(20) DEFAULT NULL,
  `imagem` varchar(150) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  `capa` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `evento` (`galeria`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.galeria_imagens: ~92 rows (aproximadamente)
/*!40000 ALTER TABLE `galeria_imagens` DISABLE KEYS */;
INSERT INTO `galeria_imagens` (`id`, `galeria`, `imagem`, `ordem`, `capa`) VALUES
	(1, 1, '92a7d3b5yc.jpg', 1, 0),
	(2, 1, '42786523x3.jpg', 1, 0),
	(3, 1, 'd31bdy6a05.jpg', 2, 0),
	(4, 1, '56czzyz0zz.jpg', 3, 0),
	(5, 2, 'b47czcd1za.jpg', 1, 0),
	(6, 2, 'd500656zza.jpg', 2, 0),
	(9, 2, 'z8yx0ac7cc.jpg', 5, 0),
	(10, 2, '22zw3wa8a1.jpg', 6, 0),
	(11, 2, '5zyayw441c.jpg', 7, 0),
	(12, 2, 'yyc063b771.jpg', 8, 0),
	(13, 2, 'yzdbzyb36z.jpg', 9, 0),
	(14, 2, 'czdcz8bz6z.jpg', 10, 0),
	(15, 3, 'aw21d8z06b.jpg', 1, 0),
	(16, 3, '7ay3dx1z1a.jpg', 2, 0),
	(17, 3, 'c3xzdw5z5w.jpg', 3, 0),
	(18, 3, 'cwczxdadz3.jpg', 4, 0),
	(19, 3, 'dyaa675yy4.jpg', 5, 0),
	(20, 3, 'z762cyx39d.jpg', 6, 0),
	(21, 3, '1ccbaa5dbz.jpg', 7, 0),
	(22, 3, '8adz53dw70.jpg', 8, 0),
	(23, 3, 'dz1y140012.jpg', 9, 0),
	(24, 3, 'zz5101dwzd.jpg', 10, 0),
	(25, 3, 'bb85bwbay5.jpg', 11, 0),
	(26, 3, '31662zwc4w.jpg', 12, 0),
	(27, 3, '28cc7za6y2.jpg', 13, 0),
	(28, 3, '1w4cw2z1w7.jpg', 14, 0),
	(29, 3, 'x720423a5z.jpg', 15, 0),
	(30, 3, 'bbbb836wzw.jpg', 16, 0),
	(31, 3, 'y123wabybw.jpg', 17, 0),
	(32, 3, '7z8b836zbx.jpg', 18, 0),
	(33, 3, 'z9521z043b.jpg', 19, 0),
	(34, 3, 'c1xyd131zy.jpg', 20, 0),
	(35, 3, 'bycza6w6a1.jpg', 21, 0),
	(36, 3, '8ydzzcyybx.jpg', 22, 0),
	(37, 3, '4cby1xd14y.jpg', 23, 0),
	(38, 3, '87wd6bb254.jpg', 24, 0),
	(39, 3, 'c2b9xwa8bc.jpg', 25, 0),
	(40, 3, 'x7b1z31zyx.jpg', NULL, 0),
	(41, 3, 'bx296a6a1b.jpg', NULL, 0),
	(42, 3, 'c6xw3ba583.jpg', NULL, 0),
	(43, 3, 'dczdzzyawy.jpg', NULL, 0),
	(44, 3, 'z6w103d5za.jpg', NULL, 0),
	(45, 3, 'zzc87x433y.jpg', NULL, 0),
	(46, 3, '84zybxcbbz.jpg', 26, 0),
	(47, 4, 'cz077byxw4.jpg', 1, 0),
	(48, 4, 'xwz188b408.jpg', 2, 0),
	(49, 4, 'w24ywy1xab.jpg', 3, 0),
	(50, 4, 'b1584z8dzb.jpg', 4, 0),
	(51, 4, 'c5dbc4w2wz.jpg', 5, 0),
	(52, 4, 'zwda8y95a0.jpg', 6, 0),
	(53, 4, 'z80zawd8x6.jpg', 7, 0),
	(54, 4, 'y28bybw5c9.jpg', 8, 0),
	(55, 4, 'z7waay492b.jpg', 9, 0),
	(56, 4, 'bz1da8ayyw.jpg', 10, 0),
	(57, 4, 'd1a1332cd1.jpg', 11, 0),
	(58, 4, 'z44b48ab2b.jpg', 12, 0),
	(59, 5, '09azzbz74b.jpg', 1, 0),
	(60, 5, 'z1dx7dbz11.jpg', 2, 0),
	(61, 5, 'd8bbcbzzz1.jpg', 3, 0),
	(62, 5, 'bxz677xb34.jpg', 4, 0),
	(63, 5, '3z5yya1cwy.jpg', 5, 0),
	(64, 5, 'xy1bbyzzza.jpg', 6, 0),
	(65, 5, 'bd7yyyz3w0.jpg', 7, 0),
	(66, 5, 'd918024z85.jpg', 8, 0),
	(67, 5, 'yb26awzwd6.jpg', 9, 0),
	(68, 5, 'xb3ddcca5c.jpg', 10, 0),
	(69, 5, 'zcyxby8yac.jpg', 11, 0),
	(70, 5, '6bw4aza9wc.jpg', 12, 0),
	(71, 5, 'ax3b9w8a3y.jpg', 13, 0),
	(72, 5, 'add79xy53b.jpg', 14, 0),
	(73, 5, 'x7a5axa54c.jpg', 15, 0),
	(74, 5, '3c6da9yzw7.jpg', 16, 0),
	(75, 5, 'zycy0adxb5.jpg', 17, 0),
	(76, 5, 'cwba7635cz.jpg', 18, 0),
	(77, 5, '0acbc4cybb.jpg', 19, 0),
	(78, 5, '9zbzzzxd9x.jpg', 20, 0),
	(79, 5, 'zab0z7cx68.jpg', 21, 0),
	(80, 5, '2b2cbz4wy0.jpg', 22, 0),
	(81, 5, '6a53d8xw96.jpg', 23, 0),
	(82, 5, '6y6z9y58aa.jpg', 24, 0),
	(83, 5, '88zz9zy036.jpg', 25, 0),
	(84, 5, 'czba3yyx28.jpg', 26, 0),
	(85, 5, 'x2waazdcb8.jpg', 27, 0),
	(86, 5, 'ccdz36c1z5.jpg', 28, 0),
	(87, 5, '85zy99d2zx.jpg', 29, 0),
	(88, 5, '7yz5ba4b5b.jpg', 30, 0),
	(89, 5, '5b6y880673.jpg', 31, 0),
	(90, 5, 'a53bzd870y.jpg', 32, 0),
	(91, 5, 'c3c223dxww.jpg', 33, 0),
	(92, 5, 'az1000129z.jpg', 34, 0),
	(93, 5, 'bz44331w6a.jpg', 35, 0),
	(94, 5, 'w5dyaaab23.jpg', 36, 0);
/*!40000 ALTER TABLE `galeria_imagens` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.institucional
CREATE TABLE IF NOT EXISTS `institucional` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_tratada` varchar(60) NOT NULL DEFAULT '0',
  `pagina` varchar(50) DEFAULT NULL,
  `conteudo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.institucional: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `institucional` DISABLE KEYS */;
INSERT INTO `institucional` (`id`, `url_tratada`, `pagina`, `conteudo`) VALUES
	(1, 'missao', 'Missão', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id arcu neque, at convallis est felis.Aliquam lacus ligula, consectetur vel egestas quis, tincidunt et massa. Mauris et lacus elit. Praesent hendrerit.</p>\r\n'),
	(2, 'visao', 'Visão', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque id arcu neque, at convallis est felis.Aliquam lacus ligula, consectetur vel egestas quis, tincidunt et massa. Mauris et lacus elit. Praesent hendrerit.</p>\r\n'),
	(3, 'valores', 'Valores', '<ul>\r\n	<li><a href="#">Honestidade</a></li>\r\n	<li><a href="#">Responsabilidade</a></li>\r\n	<li><a href="#">Produtividade</a></li>\r\n</ul>\r\n\r\n<ul>\r\n	<li><a href="#">Compet&ecirc;ncia</a></li>\r\n	<li><a href="#">Qualidade</a></li>\r\n	<li><a href="#">Profissionalismo</a></li>\r\n	<li><a href="#">Comprometimento</a></li>\r\n</ul>\r\n'),
	(4, 'sobre', 'Sobre', '<h2>O que &eacute; Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;&eacute; simplesmente uma simula&ccedil;&atilde;o de texto da ind&uacute;stria tipogr&aacute;fica e de impressos, e vem sendo utilizado desde o s&eacute;culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu n&atilde;o s&oacute; a cinco s&eacute;culos, como tamb&eacute;m ao salto para a editora&ccedil;&atilde;o eletr&ocirc;nica, permanecendo essencialmente inalterado. Se popularizou na d&eacute;cada de 60, quando a Letraset lan&ccedil;ou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editora&ccedil;&atilde;o eletr&ocirc;nica como Aldus PageMaker.</p>\r\n\r\n<h2>Porque n&oacute;s o usamos?</h2>\r\n\r\n<p>&Eacute; um fato conhecido de todos que um leitor se distrair&aacute; com o conte&uacute;do de texto leg&iacute;vel de uma p&aacute;gina quando estiver examinando sua diagrama&ccedil;&atilde;o. A vantagem de usar Lorem Ipsum &eacute; que ele tem uma distribui&ccedil;&atilde;o normal de letras, ao contr&aacute;rio de &quot;Conte&uacute;do aqui, conte&uacute;do aqui&quot;, fazendo com que ele tenha uma apar&ecirc;ncia similar a de um texto leg&iacute;vel. Muitos softwares de publica&ccedil;&atilde;o e editores de p&aacute;ginas na internet agora usam Lorem Ipsum como texto-modelo padr&atilde;o, e uma r&aacute;pida busca por &#39;lorem ipsum&#39; mostra v&aacute;rios websites ainda em sua fase de constru&ccedil;&atilde;o. V&aacute;rias vers&otilde;es novas surgiram ao longo dos anos, eventualmente por acidente, e &agrave;s vezes de prop&oacute;sito (injetando humor, e coisas do g&ecirc;nero).</p>\r\n'),
	(5, 'bem-vindo', 'Bem Vindo', '<h2>O que &eacute; Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;&eacute; simplesmente uma simula&ccedil;&atilde;o de texto da ind&uacute;stria tipogr&aacute;fica e de impressos, e vem sendo utilizado desde o s&eacute;culo XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu n&atilde;o s&oacute; a cinco s&eacute;culos, como tamb&eacute;m ao salto para a editora&ccedil;&atilde;o eletr&ocirc;nica, permanecendo essencialmente inalterado. Se popularizou na d&eacute;cada de 60, quando a Letraset lan&ccedil;ou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editora&ccedil;&atilde;o eletr&ocirc;nica como Aldus PageMaker.</p>\r\n');
/*!40000 ALTER TABLE `institucional` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.logs
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.logs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.menus
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pig_log.menus: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `pai`, `nome`, `descricao`, `icone`, `controller`, `action`, `ordem`, `status`) VALUES
	(4, NULL, 'Usuario', 'Gerenciamento de Usuarios', 'fa fa-user', 'usuarios', '', 9, 1),
	(13, NULL, 'contatos', 'Listagem de contatos', 'fa fa-envelope-o', 'contatos', '', 8, 1),
	(14, NULL, 'Itens de Menu', 'Gerenciamento de Menu', 'fa fa-external-link', 'menus', '', 11, 1),
	(15, 14, 'adicionar', 'Cadastro de Item de menu', 'fa fa-plus', 'menus', 'adicionar', NULL, 1),
	(18, 14, 'Listar', 'Listar Itens de Menu', 'fa fa-bars', 'menus', 'index', NULL, 1),
	(19, 4, 'adicionar', 'Cadastro de usuario', 'fa fa-plus', 'usuarios', 'adicionar', NULL, 1),
	(20, 4, 'Listar', 'Listar usuarios', 'fa fa-bars', 'usuarios', 'index', NULL, 1),
	(72, NULL, 'Configurações', 'Gerenciamento de Configurações', 'fa fa-gear', 'configuracoes', 'index', 10, 1),
	(73, 72, 'Email', 'Configuração de email', 'fa fa-envelope-o', 'configuracoes', 'email', NULL, 1),
	(89, 72, 'SEO', 'Otimização para Buscadores', 'fa fa-lightbulb-o', 'seo', 'index', NULL, 1),
	(91, 72, 'Whatsapp', 'Whatsapp', 'fa fa-comments-o', 'configuracoes', 'whats-app', NULL, 1),
	(104, NULL, 'Permissões', 'Gerenciamento de Permissões', 'fa fa-eye-slash', 'permissoes', 'index', 12, 1),
	(105, 104, 'Definir Permissão', 'Definição de permissão de Menu', 'fa fa-exclamation-circle', 'permissoes', 'index', NULL, 1),
	(106, 104, 'Atualizar Módulos', 'Atualização de Novos Módulos', 'fa fa-spinner', 'permissoes', 'atualizar', NULL, 1),
	(107, 104, 'Perfis', 'Gerenciamento de Perfis', 'fa fa-key', 'perfis', 'index', NULL, 1),
	(108, 104, 'Adicionar Perfil', 'Cadastro de Perfil', 'fa fa-plus-circle', 'perfis', 'adicionar', NULL, 1),
	(109, NULL, 'Sobre a Empresa', 'Sobre a Piglog', 'fa fa-pencil-square-o', 'institucional', 'index', 4, 1),
	(110, NULL, 'Banners', 'Gerenciamento de Banners', 'fa fa-certificate', 'banners', 'index', 0, 1),
	(111, 110, 'Adicionar', 'Cadastro de Banners', 'fa fa-plus-circle', 'banners', 'adicionar', NULL, 1),
	(112, 110, 'Listar', 'Lista de Banners', 'fa fa-bars', 'banners', 'index', NULL, 1),
	(117, NULL, 'Logs', 'Listagens de logs', 'fa fa-exclamation-circle', 'logs', '', 14, 1),
	(123, 72, 'Sistema', 'Configurações do Sistema', 'fa fa-cog', 'configuracoes', 'sistema', NULL, 1),
	(124, NULL, 'Galerias', 'Cadastro de Galeria', 'fa fa-camera-retro', 'galerias', '', 2, 1),
	(125, 124, 'Adicionar', 'Cadastro de Galeria', 'fa fa-plus-square-o', 'galerias', 'adicionar', NULL, 1),
	(126, 124, 'Listar', 'Lista de Eventos /Notícia', 'fa fa-bars', 'galerias', '', NULL, 1),
	(127, NULL, 'Vendas', 'Gerenciamento de Vendas', 'fa fa-legal', 'vendas', '', 1, 1),
	(128, 127, 'Adicionar', 'Cadastro de Venda', 'fa fa-plus-square-o', 'vendas', 'Adicionar', NULL, 1),
	(129, 127, 'Listar', 'Listagem de vendas', 'fa fa-bars', 'vendas', '', NULL, 1),
	(134, NULL, 'Cotações', 'Gerenciamento de Cotações', 'fa fa-bullhorn', 'cotacao', '', 6, 1);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.menus_perfil
CREATE TABLE IF NOT EXISTS `menus_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controlador` varchar(80) DEFAULT NULL,
  `acao` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.menus_perfil: ~84 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_perfil` DISABLE KEYS */;
INSERT INTO `menus_perfil` (`id`, `controlador`, `acao`) VALUES
	(1, 'acessos', 'index'),
	(2, 'banners', 'index'),
	(3, 'banners', 'adicionar'),
	(4, 'banners', 'editar'),
	(5, 'banners', 'excluir'),
	(6, 'banners', 'ajaxordem'),
	(7, 'configuracoes', 'whatsapp'),
	(8, 'configuracoes', 'atualizarcode'),
	(9, 'configuracoes', 'enviamensagem'),
	(10, 'configuracoes', 'email'),
	(11, 'configuracoes', 'sistema'),
	(12, 'contatos', 'index'),
	(13, 'contatos', 'excluir'),
	(14, 'contatos', 'visualizar'),
	(15, 'contatos', 'whatts'),
	(16, 'contatos', 'enviawhatts'),
	(17, 'contatos', 'envia'),
	(18, 'error', 'error'),
	(19, 'eventos', 'index'),
	(20, 'eventos', 'adicionar'),
	(21, 'eventos', 'editar'),
	(22, 'eventos', 'excluir'),
	(23, 'eventos', 'ajaximagens'),
	(24, 'eventos', 'ajaxdeletaimagem'),
	(25, 'eventos', 'ajaxsetacapa'),
	(26, 'eventos', 'ajaxsetaorder'),
	(27, 'geral', 'topo'),
	(28, 'geral', 'menu'),
	(29, 'geral', 'menulateral'),
	(30, 'geral', 'rodape'),
	(31, 'index', 'index'),
	(32, 'index', 'ajaxordem'),
	(33, 'index', 'ajaxsesao'),
	(34, 'index', 'teste'),
	(35, 'institucional', 'index'),
	(36, 'login', 'index'),
	(37, 'login', 'logout'),
	(38, 'login', 'requerersenha'),
	(39, 'login', 'recuperarsenha'),
	(40, 'logs', 'index'),
	(41, 'menus', 'index'),
	(42, 'menus', 'adicionar'),
	(43, 'menus', 'editar'),
	(44, 'menus', 'excluir'),
	(45, 'notificacao', 'index'),
	(46, 'perfis', 'index'),
	(47, 'perfis', 'adicionar'),
	(48, 'perfis', 'editar'),
	(49, 'perfis', 'excluir'),
	(50, 'seo', 'index'),
	(51, 'seo', 'ajaxacoes'),
	(52, 'seo', 'ajaxpopulate'),
	(53, 'trabalheconosco', 'index'),
	(54, 'trabalheconosco', 'excluir'),
	(55, 'trabalheconosco', 'visualizar'),
	(56, 'unidades', 'index'),
	(57, 'unidades', 'adicionar'),
	(58, 'unidades', 'editar'),
	(59, 'unidades', 'excluir'),
	(60, 'unidades', 'ajaximagens'),
	(61, 'unidades', 'ajaxdeletaimagem'),
	(62, 'unidades', 'ajaxsetacapa'),
	(63, 'unidades', 'ajaxsetaorder'),
	(64, 'usuarios', 'index'),
	(65, 'usuarios', 'adicionar'),
	(66, 'usuarios', 'editar'),
	(67, 'usuarios', 'excluir'),
	(68, 'usuarios', 'perfil'),
	(69, 'usuarios', 'perfileditar'),
	(70, 'vagas', 'index'),
	(71, 'vagas', 'adicionar'),
	(72, 'vagas', 'editar'),
	(73, 'vagas', 'excluir'),
	(74, 'cotacao', 'index'),
	(75, 'cotacao', 'excluir'),
	(76, 'cotacao', 'visualizar'),
	(77, 'galerias', 'index'),
	(78, 'galerias', 'adicionar'),
	(79, 'galerias', 'editar'),
	(80, 'galerias', 'excluir'),
	(81, 'galerias', 'ajaximagens'),
	(82, 'galerias', 'ajaxdeletaimagem'),
	(83, 'galerias', 'ajaxsetacapa'),
	(84, 'galerias', 'ajaxsetaorder'),
	(85, 'vendas', 'index'),
	(86, 'vendas', 'adicionar'),
	(87, 'vendas', 'editar'),
	(88, 'vendas', 'excluir'),
	(89, 'vendas', 'ajaximagens'),
	(90, 'vendas', 'ajaxdeletaimagem'),
	(91, 'vendas', 'ajaxsetacapa'),
	(92, 'vendas', 'ajaxsetaorder');
/*!40000 ALTER TABLE `menus_perfil` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.menus_perfil_permissoes
CREATE TABLE IF NOT EXISTS `menus_perfil_permissoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) NOT NULL,
  `perfil` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu` (`menu`),
  KEY `perfil` (`perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.menus_perfil_permissoes: ~198 rows (aproximadamente)
/*!40000 ALTER TABLE `menus_perfil_permissoes` DISABLE KEYS */;
INSERT INTO `menus_perfil_permissoes` (`id`, `menu`, `perfil`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 3, 1),
	(5, 3, 2),
	(6, 3, 3),
	(7, 6, 3),
	(8, 4, 3),
	(9, 4, 2),
	(10, 6, 2),
	(11, 6, 1),
	(12, 4, 1),
	(13, 5, 2),
	(14, 5, 3),
	(15, 2, 3),
	(16, 2, 2),
	(17, 2, 1),
	(18, 5, 1),
	(19, 11, 3),
	(20, 7, 3),
	(21, 9, 3),
	(22, 10, 3),
	(23, 8, 3),
	(24, 11, 1),
	(25, 11, 2),
	(27, 15, 3),
	(28, 14, 3),
	(29, 14, 2),
	(30, 14, 1),
	(31, 12, 1),
	(32, 12, 2),
	(33, 12, 3),
	(34, 13, 3),
	(35, 13, 2),
	(36, 13, 1),
	(37, 16, 3),
	(38, 17, 3),
	(39, 18, 1),
	(40, 18, 2),
	(41, 18, 3),
	(42, 20, 3),
	(43, 20, 2),
	(44, 20, 1),
	(45, 24, 1),
	(46, 24, 2),
	(47, 24, 3),
	(48, 23, 3),
	(49, 23, 2),
	(50, 23, 1),
	(51, 25, 1),
	(52, 25, 2),
	(53, 25, 3),
	(54, 26, 3),
	(55, 26, 2),
	(56, 26, 1),
	(57, 21, 1),
	(58, 21, 2),
	(59, 21, 3),
	(60, 22, 3),
	(61, 19, 3),
	(62, 19, 2),
	(63, 22, 2),
	(64, 22, 1),
	(65, 19, 1),
	(66, 70, 1),
	(67, 70, 2),
	(68, 70, 3),
	(69, 73, 3),
	(70, 73, 2),
	(71, 73, 1),
	(72, 72, 1),
	(73, 72, 2),
	(74, 72, 3),
	(75, 71, 3),
	(76, 71, 2),
	(77, 71, 1),
	(78, 65, 1),
	(79, 65, 2),
	(80, 65, 3),
	(81, 66, 3),
	(82, 66, 2),
	(83, 66, 1),
	(84, 67, 1),
	(85, 67, 2),
	(86, 67, 3),
	(87, 64, 3),
	(88, 68, 3),
	(89, 69, 3),
	(90, 69, 2),
	(91, 68, 2),
	(92, 68, 1),
	(93, 69, 1),
	(94, 64, 1),
	(95, 57, 1),
	(96, 57, 2),
	(97, 57, 3),
	(98, 61, 3),
	(99, 61, 2),
	(100, 61, 1),
	(101, 60, 1),
	(102, 60, 2),
	(103, 60, 3),
	(104, 62, 3),
	(105, 62, 2),
	(106, 62, 1),
	(107, 63, 1),
	(108, 63, 2),
	(109, 63, 3),
	(110, 58, 3),
	(111, 59, 3),
	(112, 56, 3),
	(113, 56, 2),
	(114, 59, 2),
	(115, 58, 2),
	(116, 58, 1),
	(117, 59, 1),
	(118, 56, 1),
	(119, 54, 1),
	(120, 53, 1),
	(121, 55, 1),
	(122, 55, 2),
	(123, 53, 2),
	(124, 54, 2),
	(125, 54, 3),
	(126, 53, 3),
	(127, 55, 3),
	(128, 51, 3),
	(129, 52, 3),
	(130, 50, 3),
	(131, 47, 3),
	(132, 48, 3),
	(133, 49, 3),
	(134, 46, 3),
	(135, 46, 2),
	(136, 46, 1),
	(137, 49, 1),
	(138, 49, 2),
	(139, 48, 2),
	(140, 48, 1),
	(141, 47, 1),
	(142, 47, 2),
	(143, 45, 1),
	(144, 45, 2),
	(145, 45, 3),
	(146, 42, 1),
	(147, 42, 2),
	(148, 42, 3),
	(149, 43, 3),
	(150, 44, 3),
	(151, 41, 3),
	(152, 41, 2),
	(153, 44, 2),
	(154, 43, 2),
	(155, 43, 1),
	(156, 44, 1),
	(157, 41, 1),
	(158, 40, 1),
	(159, 40, 2),
	(160, 40, 3),
	(161, 36, 1),
	(162, 36, 2),
	(163, 36, 3),
	(164, 37, 3),
	(165, 39, 3),
	(166, 38, 3),
	(167, 38, 2),
	(168, 39, 2),
	(169, 39, 1),
	(170, 38, 1),
	(171, 37, 2),
	(172, 37, 1),
	(173, 35, 1),
	(174, 35, 2),
	(175, 35, 3),
	(176, 32, 1),
	(177, 32, 2),
	(178, 32, 3),
	(179, 33, 3),
	(180, 33, 2),
	(181, 33, 1),
	(182, 31, 1),
	(183, 31, 2),
	(184, 31, 3),
	(185, 34, 3),
	(186, 34, 2),
	(187, 34, 1),
	(188, 28, 1),
	(189, 28, 2),
	(190, 29, 2),
	(191, 29, 1),
	(192, 30, 1),
	(193, 30, 2),
	(194, 27, 2),
	(195, 27, 1),
	(196, 30, 3),
	(197, 27, 3),
	(198, 29, 3),
	(199, 28, 3);
/*!40000 ALTER TABLE `menus_perfil_permissoes` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.menus_visualizacao
CREATE TABLE IF NOT EXISTS `menus_visualizacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` int(11) NOT NULL,
  `perfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu` (`menu`),
  KEY `perfil` (`perfil`),
  CONSTRAINT `FK_menus_visualizacao_menus` FOREIGN KEY (`menu`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_menus_visualizacao_perfil` FOREIGN KEY (`perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.menus_visualizacao: ~55 rows (aproximadamente)
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
	(181, 111, 2),
	(182, 111, 3),
	(185, 111, 2),
	(186, 111, 3),
	(191, 111, 2),
	(192, 111, 3),
	(193, 111, 2),
	(194, 111, 3),
	(205, 13, 2),
	(206, 13, 3),
	(216, 106, 3),
	(220, 15, 3),
	(221, 91, 3),
	(252, 117, 3),
	(253, 73, 3),
	(255, 4, 2),
	(256, 4, 3),
	(272, 104, 3),
	(373, 110, 2),
	(374, 110, 3),
	(375, 112, 2),
	(376, 112, 3),
	(405, 89, 3),
	(406, 123, 2),
	(407, 123, 3),
	(410, 124, 2),
	(411, 124, 3),
	(412, 125, 2),
	(413, 125, 3),
	(414, 126, 2),
	(415, 126, 3),
	(416, 127, 2),
	(417, 127, 3),
	(418, 128, 2),
	(419, 128, 3),
	(420, 129, 2),
	(421, 129, 3),
	(422, 109, 2),
	(423, 109, 3),
	(424, 134, 1),
	(425, 134, 2),
	(426, 134, 3);
/*!40000 ALTER TABLE `menus_visualizacao` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.perfil
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.perfil: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` (`id`, `nome`) VALUES
	(1, 'Usuario'),
	(2, 'Administrador'),
	(3, 'Master');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.usuarios
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `login`, `nome`, `senha`, `chave`, `perfil`, `email`, `celular`, `imagem`, `ultimo_acesso`, `sessao`, `ip`, `status`) VALUES
	(3, 'thiago', 'Thiago Carlos ', '202cb962ac59075b964b07152d234b70', '', 3, 'thiago@schoeler.com.br', '4384257131', '3a355z4d79.jpg', '2016-09-13 09:08:05', '5k7b927heusonbq26u8fl9p040', '10.1.1.8', 1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(90) NOT NULL,
  `marca` varchar(90) NOT NULL,
  `cambio` varchar(10) NOT NULL,
  `ano` varchar(90) NOT NULL,
  `cor` varchar(90) NOT NULL,
  `tipo` int(11) NOT NULL,
  `km_rodados` float NOT NULL DEFAULT '0',
  `destaque` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `valor` float NOT NULL DEFAULT '0',
  `data_cadastro` datetime NOT NULL,
  `ativo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.vendas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` (`id`, `modelo`, `marca`, `cambio`, `ano`, `cor`, `tipo`, `km_rodados`, `destaque`, `descricao`, `valor`, `data_cadastro`, `ativo`) VALUES
	(1, '2420', 'mercedes', 'Manual', '2010', 'Branco', 0, 100000, 1, '<p>Existem muitas varia&ccedil;&otilde;es dispon&iacute;veis de passagens de Lorem Ipsum, mas a maioria sofreu algum tipo de altera&ccedil;&atilde;o, seja por inser&ccedil;&atilde;o de passagens com humor, ou palavras aleat&oacute;rias que n&atilde;o parecem nem um pouco convincentes.</p>\r\n', 100, '2016-08-29 09:48:02', 1),
	(2, 'Atego', 'Mercedes', 'Manual', '2012', 'Preto', 1, 250000, 1, '<p>&Eacute; um fato conhecido de todos que um leitor se distrair&aacute; com o conte&uacute;do de texto leg&iacute;vel de uma p&aacute;gina quando estiver examinando sua diagrama&ccedil;&atilde;o.&nbsp;</p>\r\n', 200000, '2016-08-29 16:31:33', 1),
	(3, 'atego', 'Mercedes', 'Manual', '2009', 'Branco', 1, 300000, 1, '<p>Existem muitas varia&ccedil;&otilde;es dispon&iacute;veis de passagens de Lorem Ipsum, mas a maioria sofreu algum tipo de altera&ccedil;&atilde;o, seja por inser&ccedil;&atilde;o de passagens com humor, ou palavras aleat&oacute;rias que n&atilde;o parecem nem um pouco convincentes.</p>\r\n', 150000, '2016-08-29 16:42:05', 1),
	(4, 'Micro Onibus', 'Mercedes', 'Manual', '2013', 'Branco', 1, 300000, 1, '<p>teste</p>\r\n', 60000, '2016-09-02 16:28:55', 1);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;


-- Copiando estrutura para tabela pig_log.venda_imagens
CREATE TABLE IF NOT EXISTS `venda_imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venda` bigint(20) DEFAULT NULL,
  `imagem` varchar(150) DEFAULT NULL,
  `capa` int(11) DEFAULT '0',
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade` (`venda`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela pig_log.venda_imagens: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `venda_imagens` DISABLE KEYS */;
INSERT INTO `venda_imagens` (`id`, `venda`, `imagem`, `capa`, `ordem`) VALUES
	(3, 1, 'xw31dz3225.jpg', 1, 2),
	(4, 1, '2b4469346w.jpg', 0, 3),
	(5, 2, 'w7a06zywdb.jpg', 1, 1),
	(8, 3, '24yb9yca9y.jpg', 0, 2),
	(9, 3, '02061wzwyb.jpg', 0, 3),
	(11, 2, 'ycd07wc62c.jpg', 0, 4),
	(12, 2, 'wb4dcy0az3.jpg', 0, 5),
	(13, 2, '4534w412wz.jpg', 0, 6),
	(14, 2, '51za3d1452.jpg', 0, 7),
	(15, 4, '3w07aw9yz9.jpg', 0, 1),
	(16, 4, '6wzxd5a7y1.jpg', 0, 2),
	(17, 4, 'a8a9a61d47.jpg', 0, 3),
	(18, 4, '3bxc5ccz6d.jpg', 1, 4),
	(19, 4, 'cway1xz4db.jpg', 0, 5);
/*!40000 ALTER TABLE `venda_imagens` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
