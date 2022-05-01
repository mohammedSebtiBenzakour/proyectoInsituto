-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-02-2022 a las 14:31:16
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `planta_energia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectura`
--

DROP TABLE IF EXISTS `lectura`;
CREATE TABLE IF NOT EXISTS `lectura` (
  `fecha` varchar(50) NOT NULL,
  `hora` varchar(50) NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `ref_usuario` varchar(50) NOT NULL,
  `id_planta` int(11) NOT NULL,
  KEY `FK_ref_usuario` (`ref_usuario`),
  KEY `FK_id_planta` (`id_planta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lecturas`
--

DROP TABLE IF EXISTS `lecturas`;
CREATE TABLE IF NOT EXISTS `lecturas` (
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor` decimal(10,4) NOT NULL,
  `ref_usuario` varchar(50) NOT NULL,
  `id_planta` int(11) NOT NULL,
  KEY `FK_ref_usuario` (`ref_usuario`),
  KEY `FK_id_planta` (`id_planta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lecturas`
--

INSERT INTO `lecturas` (`fecha_hora`, `valor`, `ref_usuario`, `id_planta`) VALUES
('2022-02-17 22:00:00', '0.0000', 'oper', 2),
('2022-02-21 21:49:01', '12.0000', 'oper', 2),
('2022-02-21 21:50:34', '45.0000', 'símon', 2),
('2022-02-25 19:58:43', '100.0000', 'anettlep', 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectura_date`
--

DROP TABLE IF EXISTS `lectura_date`;
CREATE TABLE IF NOT EXISTS `lectura_date` (
  `fecha_con_hora` timestamp NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `ref_usuario` varchar(50) NOT NULL,
  `id_planta` int(11) NOT NULL,
  KEY `FK_ref_usuario` (`ref_usuario`),
  KEY `FK_id_planta` (`id_planta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lectura_date`
--

INSERT INTO `lectura_date` (`fecha_con_hora`, `valor`, `ref_usuario`, `id_planta`) VALUES
('2022-02-15 22:00:00', '0.0000', 'admin', 2),
('2022-02-15 23:00:00', '0.0000', 'admin', 2),
('2022-02-16 00:00:00', '0.0000', 'admin', 2),
('2022-02-16 01:00:00', '0.0000', 'admin', 2),
('2022-02-16 02:00:00', '0.0000', 'admin', 2),
('2022-02-16 03:00:00', '0.0000', 'admin', 2),
('2022-02-16 04:00:00', '0.0000', 'admin', 2),
('2022-02-16 05:00:00', '0.0450', 'admin', 2),
('2022-02-16 06:00:00', '0.2276', 'admin', 2),
('2022-02-16 07:00:00', '0.2860', 'admin', 2),
('2022-02-16 08:00:00', '0.7270', 'admin', 2),
('2022-02-16 09:00:00', '0.7066', 'admin', 2),
('2022-02-16 10:00:00', '0.5689', 'admin', 2),
('2022-02-16 11:00:00', '0.8695', 'admin', 2),
('2022-02-16 12:00:00', '0.7596', 'admin', 2),
('2022-02-16 13:00:00', '0.7109', 'admin', 2),
('2022-02-16 14:00:00', '0.6256', 'admin', 2),
('2022-02-16 15:00:00', '0.4263', 'admin', 2),
('2022-02-16 16:00:00', '0.1744', 'admin', 2),
('2022-02-16 17:00:00', '0.0610', 'admin', 2),
('2022-02-16 18:00:00', '0.0000', 'admin', 2),
('2022-02-16 19:00:00', '0.0000', 'admin', 2),
('2022-02-16 20:00:00', '0.0000', 'admin', 2),
('2022-02-16 21:00:00', '0.0000', 'admin', 2),
('2022-02-16 22:00:00', '0.0000', 'admin', 2),
('2022-02-16 23:00:00', '0.0000', 'admin', 2),
('2022-02-17 00:00:00', '0.0000', 'admin', 2),
('2022-02-17 01:00:00', '0.0000', 'admin', 2),
('2022-02-17 02:00:00', '0.0000', 'admin', 2),
('2022-02-17 03:00:00', '0.0000', 'admin', 2),
('2022-02-17 04:00:00', '0.0000', 'admin', 2),
('2022-02-17 05:00:00', '0.0512', 'admin', 2),
('2022-02-17 06:00:00', '0.2724', 'admin', 2),
('2022-02-17 07:00:00', '0.3549', 'admin', 2),
('2022-02-17 08:00:00', '0.5205', 'admin', 2),
('2022-02-17 09:00:00', '0.4484', 'admin', 2),
('2022-02-17 10:00:00', '0.9203', 'admin', 2),
('2022-02-17 11:00:00', '0.6829', 'admin', 2),
('2022-02-17 12:00:00', '0.4886', 'admin', 2),
('2022-02-17 13:00:00', '0.4664', 'admin', 2),
('2022-02-17 14:00:00', '0.4471', 'admin', 2),
('2022-02-17 15:00:00', '0.4156', 'admin', 2),
('2022-02-17 16:00:00', '0.3066', 'admin', 2),
('2022-02-17 17:00:00', '0.0648', 'admin', 2),
('2022-02-17 18:00:00', '0.0000', 'admin', 2),
('2022-02-17 19:00:00', '0.0000', 'admin', 2),
('2022-02-17 20:00:00', '0.0000', 'admin', 2),
('2022-02-17 21:00:00', '0.0000', 'admin', 2),
('2022-02-23 22:00:00', '0.0000', 'admin', 13),
('2022-02-23 23:00:00', '0.0000', 'admin', 13),
('2022-02-24 00:00:00', '0.0000', 'admin', 13),
('2022-02-24 01:00:00', '0.0000', 'admin', 13),
('2022-02-24 02:00:00', '0.0000', 'admin', 13),
('2022-02-24 03:00:00', '0.0000', 'admin', 13),
('2022-02-24 04:00:00', '0.0000', 'admin', 13),
('2022-02-24 05:00:00', '0.0688', 'admin', 13),
('2022-02-24 06:00:00', '0.1846', 'admin', 13),
('2022-02-24 07:00:00', '0.3040', 'admin', 13),
('2022-02-24 08:00:00', '0.5958', 'admin', 13),
('2022-02-24 09:00:00', '0.6362', 'admin', 13),
('2022-02-24 10:00:00', '0.7836', 'admin', 13),
('2022-02-24 11:00:00', '0.9043', 'admin', 13),
('2022-02-24 12:00:00', '0.4890', 'admin', 13),
('2022-02-24 13:00:00', '0.6024', 'admin', 13),
('2022-02-24 14:00:00', '0.6618', 'admin', 13),
('2022-02-24 15:00:00', '0.4401', 'admin', 13),
('2022-02-24 16:00:00', '0.2950', 'admin', 13),
('2022-02-24 17:00:00', '0.0641', 'admin', 13),
('2022-02-24 18:00:00', '0.0000', 'admin', 13),
('2022-02-24 19:00:00', '0.0000', 'admin', 13),
('2022-02-24 20:00:00', '0.0000', 'admin', 13),
('2022-02-24 21:00:00', '0.0000', 'admin', 13),
('2022-02-24 22:00:00', '0.0000', 'admin', 13),
('2022-02-24 23:00:00', '0.0000', 'admin', 13),
('2022-02-25 00:00:00', '0.0000', 'admin', 13),
('2022-02-25 01:00:00', '0.0000', 'admin', 13),
('2022-02-25 02:00:00', '0.0000', 'admin', 13),
('2022-02-25 03:00:00', '0.0000', 'admin', 13),
('2022-02-25 04:00:00', '0.0000', 'admin', 13),
('2022-02-25 05:00:00', '0.0512', 'admin', 13),
('2022-02-25 06:00:00', '0.2709', 'admin', 13),
('2022-02-25 07:00:00', '0.4068', 'admin', 13),
('2022-02-25 08:00:00', '0.5391', 'admin', 13),
('2022-02-25 09:00:00', '0.4925', 'admin', 13),
('2022-02-25 10:00:00', '0.5573', 'admin', 13),
('2022-02-25 11:00:00', '0.9388', 'admin', 13),
('2022-02-25 12:00:00', '0.6032', 'admin', 13),
('2022-02-25 13:00:00', '0.8621', 'admin', 13),
('2022-02-25 14:00:00', '0.6743', 'admin', 13),
('2022-02-25 15:00:00', '0.3454', 'admin', 13),
('2022-02-25 16:00:00', '0.2911', 'admin', 13),
('2022-02-25 17:00:00', '0.0446', 'admin', 13),
('2022-02-25 18:00:00', '0.0000', 'admin', 13),
('2022-02-25 19:00:00', '0.0000', 'admin', 13),
('2022-02-25 20:00:00', '0.0000', 'admin', 13),
('2022-02-25 21:00:00', '0.0000', 'admin', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantas`
--

DROP TABLE IF EXISTS `plantas`;
CREATE TABLE IF NOT EXISTS `plantas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_planta` varchar(50) NOT NULL,
  `ubicacion_planta` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plantas`
--

INSERT INTO `plantas` (`id`, `nombre_planta`, `ubicacion_planta`) VALUES
(2, 'Maírenaddd', 'Maírenaddddddddddd'),
(8, 'NARS ALL DAY LUMINOUS FOUNDATION', 'Nicolas, Kessler and Mueller'),
(10, 'LISINOPRIL', 'Murphy, Lind and Wunsch'),
(11, 'Chloroquine', 'Reichert Inc'),
(12, 'Oxycodone and Aspirin', 'Weber Group'),
(13, 'Clomipramine Hydrochloride', 'Conn-Crist'),
(14, 'Clarithromycin', 'Sauer and Sons'),
(15, 'Lemon Verbena Hand Sanitizer', 'Runolfsson, Mohr and Little'),
(16, 'Dove DermaSeries', 'Davis Group'),
(17, 'Clopidogrel Bisulfate', 'Lind-Spencer'),
(18, 'WhiskCare 375', 'Dach-Koss'),
(19, 'VENTOLINHFA', 'Zieme LLC'),
(20, 'Hydromorphone Hydrochloride', 'Sauer-Powlowski'),
(21, 'Belladonna ex herba 6', 'Hansen Group'),
(22, 'Methocarbamol', 'Cormier Group'),
(23, 'sunmark loperamide hydrochloride', 'Collins, Gorczany and Pollich'),
(24, 'AIR, COMPRESSED', 'Considine-O\'Hara'),
(25, 'Fast Mucus Relief', 'Renner-Price'),
(26, 'hydroxyzine pamoate', 'Medhurst-Wiegand'),
(27, 'Metoprolol Tartrate', 'Kohler-Barton'),
(28, 'Quazepam', 'Swaniawski, Schinner and Ernser'),
(29, 'Antibacterial Hand GB Sugar Cookie', 'Effertz, Nader and Grant'),
(30, 'Nabumetone', 'Lueilwitz, Jacobs and Gleason'),
(31, 'TRAMADOL HYDROCHLORIDE', 'Rempel Inc'),
(32, 'Spatherapy', 'Berge and Sons'),
(33, 'SALIX NIGRA POLLEN', 'Hand-Schmeler'),
(34, 'Combivent', 'Bergstrom-Hammes'),
(35, 'Bio Thalamus Phase', 'Koss-Osinski'),
(36, 'AMBI Fade', 'Cummerata, Haag and Turner'),
(37, 'Sodium Chromate 51', 'Torphy and Sons'),
(38, 'ShopRite Day Calm Severe', 'Jenkins and Sons'),
(39, 'Terocin', 'Medhurst-Howell'),
(40, 'Labetalol hydrochloride', 'Rogahn-Boyle'),
(41, 'Bodycology', 'Kuhn and Sons'),
(42, 'Baclofen', 'Schuster Group'),
(43, 'Live Better', 'Graham Inc'),
(44, 'Hawaiian Tropic Island Sport SPF 30', 'Grimes, Pollich and Grimes'),
(45, 'Instant Hand Sanitizer', 'Willms, Morissette and Nikolaus'),
(46, 'Xarelto', 'Cummings Inc'),
(47, 'Feather Mixture', 'Brakus-Grant'),
(48, 'Topiramate', 'Schowalter, Bergnaum and Howell'),
(49, 'Agaricus Equisetum Special Order', 'Schaefer Group'),
(50, 'LBEL COULEUR LUXE AMPLIFIER XP', 'Bogisich-Bergstrom'),
(51, 'Sulfamethoxazole and Trimethoprim', 'Klein, Nitzsche and Wuckert'),
(52, 'Spironolactone', 'Zboncak-Thiel'),
(53, 'Cold and Cough High Blood Pressure', 'Rutherford-Cole'),
(54, 'Hydrocodone Bitartrate And Acetaminophen', 'Corwin-Lemke'),
(55, 'Hydrogen Peroxide', 'Welch, Towne and Schinner');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `administrador` tinyint(4) NOT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `password`, `nombre`, `apellidos`, `email`, `administrador`) VALUES
('admin', 'admin', 'Administrador', 'de la Aplicación', 'msb.caixa@gmail.com', 1),
('oper', 'oper', 'Operario', 'de las Plantas', 'msb.duck@gmail.com', 1),
('símon', 'símon', 'símon símon2', 'símon símon', 'msb.tesla@gmail.com', 1),
('tcescon4', 'Tristam', 'Ronald', 'Tristam Cescon', 'tcescon4@netscape.com', 1),
('rwaterland7', 'Rudy', 'Eleanora', 'Rudy Waterland', 'msb.duck@gmail.com', 1),
('hwolstencroft8', 'Herbie', 'Tatiania', 'Herbie Wolstencroft', 'hwolstencroft8@walmart.com', 1),
('dlefeaver9', 'Dennison', 'Concettina', 'Dennison Lefeaver', 'msb.duck@gmail.com', 1),
('fgreenhalgha', 'Fidel', 'Kora', 'Fidel Greenhalgh', 'fgreenhalgha@yellowpages.com', 1),
('jgarrardb', 'Joachim', 'Evvie', 'Joachim Garrard', 'jgarrardb@homestead.com', 0),
('wwoodlandsc', 'Wash', 'Florinda', 'Wash Woodlands', 'msb.duck@gmail.com', 1),
('rwenne', 'Reggis', 'Egon', 'Reggis Wenn', 'msb.duck@gmail.com', 0),
('upengelleyf', 'Ugo', 'Lulu', 'Ugo Pengelley', 'msb.duck@gmail.com', 0),
('ghymang', 'Gradey', 'Elliott', 'Gradey Hyman', 'msb.duck@gmail.com', 0),
('asaffinh', 'Arny', 'Sheff', 'Arny Saffin', 'asaffinh@dell.com', 1),
('egiacopelloi', 'Eamon', 'Lloyd', 'Eamon Giacopello', 'egiacopelloi@nhs.uk', 0),
('wblackshawj', 'Westbrooke', 'Toma', 'Westbrooke Blackshaw', 'wblackshawj@goodreads.com', 1),
('rfancek', 'Richy', 'Kaitlynn', 'Richy Fance', 'rfancek@theglobeandmail.com', 0),
('cscullionl', 'Clayborn', 'Ax', 'Clayborn Scullion', 'cscullionl@usgs.gov', 0),
('gbabonm', 'Godfrey', 'Loralie', 'Godfrey Babon', 'gbabonm@cnbc.com', 1),
('rmcallistern', 'Rube', 'Nollie', 'Rube McAllister', 'rmcallistern@slideshare.net', 0),
('mayrtono', 'Morris', 'Bess', 'Morris Ayrton', 'mayrtono@salon.com', 0),
('anettlep', 'Alexei', 'Faber', 'Alexei Nettle', 'anettlep@walmart.com', 1),
('lbrameq', 'Lars', 'Ashlan', 'Lars Brame', 'lbrameq@naver.com', 0),
('nstangerr', 'Nevil', 'Colene', 'Nevil Stanger', 'nstangerr@fema.gov', 0),
('mmalkies', 'Mitch', 'Esma', 'Mitch Malkie', 'mmalkies@nba.com', 1),
('pchastangt', 'Percy', 'Brinna', 'Percy Chastang', 'pchastangt@theatlantic.com', 0),
('omckibbinu', 'Orion', 'Leo', 'Orion McKibbin', 'omckibbinu@e-recht24.de', 0),
('bhazlehurstv', 'Baxie', 'Freddy', 'Baxie Hazlehurst', 'bhazlehurstv@nsw.gov.au', 1),
('sspataw', 'Saw', 'Selie', 'Saw Spata', 'sspataw@paypal.com', 1),
('ffarfullx', 'Fairlie', 'Clement', 'Fairlie Farfull', 'ffarfullx@shop-pro.jp', 1),
('mrodericky', 'Moises', 'Debra', 'Moises Roderick', 'mrodericky@jalbum.net', 0),
('ealesioz', 'Enrique', 'Julianna', 'Enrique Alesio', 'ealesioz@wufoo.com', 0),
('blovie10', 'Brice', 'Tildie', 'Brice Lovie', 'blovie10@youtu.be', 1),
('ulangland11', 'Ulberto', 'Nevsa', 'Ulberto Langland', 'ulangland11@mit.edu', 0),
('srope12', 'Sheffie', 'Solly', 'Sheffie Rope', 'msb.tesla@gmail.com', 0),
('rfarran13', 'Ryan', 'Myrlene', 'Ryan Farran', 'rfarran13@dropbox.com', 1),
('cbarde14', 'Cecil', 'Tabitha', 'Cecil Barde', 'cbarde14@google.it', 1),
('ctackley15', 'Cosmo', 'Burch', 'Cosmo Tackley', 'msb.tesla@gmail.com', 0),
('esketchley16', 'Ellswerth', 'Lyn', 'Ellswerth Sketchley', 'esketchley16@aboutads.info', 1),
('mgrishukov17', 'Maison', 'Ruthi', 'Maison Grishukov', 'mgrishukov17@desdev.cn', 1),
('gludman18', 'Germayne', 'Rurik', 'Germayne Ludman', 'msb.tesla@gmail.com', 1),
('rbrian19', 'Reece', 'Anders', 'Reece Brian', 'rbrian19@linkedin.com', 0),
('rvicker1a', 'Rodge', 'Tabbie', 'Rodge Vicker', 'msb.tesla@gmail.com', 1),
('epalatini1b', 'Eziechiele', 'Sheree', 'Eziechiele Palatini', 'epalatini1b@google.com.au', 0),
('vcreber1c', 'Vin', 'Cynthie', 'Vin Creber', 'vcreber1c@networkadvertising.org', 0),
('khuncote1d', 'Kingsley', 'Arron', 'Kingsley Huncote', 'khuncote1d@nationalgeographic.com', 1),
('fpaulon1e', 'Forest', 'Flossi', 'Forest Paulon', 'msb.tesla@gmail.com', 1),
('cphelipeaux1f', 'Carlyle', 'Eimile', 'Carlyle Phelipeaux', 'cphelipeaux1f@sourceforge.net', 0),
('edukes1g', 'Ettore', 'Arthur', 'Ettore Dukes', 'edukes1g@w3.org', 0),
('spenfold1h', 'Sheridan', 'Bell', 'Sheridan Penfold', 'spenfold1h@usda.gov', 1),
('dsowood1i', 'Darryl', 'Marianne', 'Darryl Sowood', 'dsowood1i@loc.gov', 1),
('dthexton1j', 'Dorey', 'Garvey', 'Dorey Thexton', 'dthexton1j@slate.com', 1),
('ccuddon1k', 'Clay', 'Gertruda', 'Clay Cuddon', 'ccuddon1k@smh.com.au', 1),
('emaggs1l', 'Ernesto', 'Rora', 'Ernesto Maggs', 'emaggs1l@gizmodo.com', 1),
('abrumbie1m', 'Arron', 'Rik', 'Arron Brumbie', 'abrumbie1m@businessinsider.com', 1),
('mhourstan1n', 'Moses', 'Junia', 'Moses Hourstan', 'mhourstan1n@yandex.ru', 0),
('efirpo1o', 'Erick', 'Desiri', 'Erick Firpo', 'efirpo1o@phpbb.com', 0),
('ascarce1p', 'Amos', 'Ephraim', 'Amos Scarce', 'ascarce1p@chicagotribune.com', 0),
('pbabon1q', 'Pasquale', 'Konstance', 'Pasquale Babon', 'pbabon1q@skype.com', 1),
('gbamforth1r', 'Geoffry', 'Guido', 'Geoffry Bamforth', 'gbamforth1r@stanford.edu', 0),
('jarmal1s', 'Jed', 'Verene', 'Jed Armal', 'jarmal1s@chronoengine.com', 1),
('wgingles1t', 'Winthrop', 'Wrennie', 'Winthrop Gingles', 'wgingles1t@sitemeter.com', 1),
('nmacculloch1u', 'Nikolaos', 'Yetta', 'Nikolaos MacCulloch', 'nmacculloch1u@home.pl', 0),
('jcappel1v', 'Job', 'Wynn', 'Job Cappel', 'jcappel1v@unesco.org', 1),
('perrey1w', 'Patricio', 'Dulce', 'Patricio Errey', 'perrey1w@google.fr', 0),
('ksudddard1x', 'Kahlil', 'Talya', 'Kahlil Sudddard', 'ksudddard1x@youtu.be', 0),
('dlilbourne1y', 'Dallas', 'Kelcy', 'Dallas Lilbourne', 'dlilbourne1y@hexun.com', 0),
('rchitson1z', 'Robinson', 'Tarah', 'Robinson Chitson', 'rchitson1z@lulu.com', 1),
('pvedyashkin20', 'Penrod', 'Tani', 'Penrod Vedyashkin', 'pvedyashkin20@ed.gov', 1),
('dcaffin21', 'Derrek', 'Ophelia', 'Derrek Caffin', 'dcaffin21@dot.gov', 1),
('gdytham22', 'Gabriel', 'Berky', 'Gabriel Dytham', 'gdytham22@hp.com', 0),
('lseaward23', 'Lucian', 'Guendolen', 'Lucian Seaward', 'lseaward23@goo.gl', 1),
('cokuddyhy24', 'Cullie', 'Rhea', 'Cullie O\'Kuddyhy', 'cokuddyhy24@reddit.com', 0),
('jblundan25', 'Jdavie', 'Mada', 'Jdavie Blundan', 'jblundan25@seattletimes.com', 0),
('mfrancom26', 'Merle', 'Helena', 'Merle Francom', 'mfrancom26@mayoclinic.com', 1),
('iismirnioglou27', 'Inger', 'Debra', 'Inger Ismirnioglou', 'iismirnioglou27@mozilla.com', 1),
('mclayfield28', 'Merell', 'Karleen', 'Merell Clayfield', 'mclayfield28@shop-pro.jp', 0),
('eraithby29', 'Elwood', 'Shoshanna', 'Elwood Raithby', 'eraithby29@cdc.gov', 1),
('ble2a', 'Barnard', 'Hakeem', 'Barnard Le Barr', 'ble2a@paypal.com', 0),
('isadry2b', 'Iorgo', 'Dyna', 'Iorgo Sadry', 'isadry2b@businesswire.com', 0),
('dfalconertaylor2c', 'Dieter', 'Adriana', 'Dieter Falconer-Taylor', 'dfalconertaylor2c@rambler.ru', 1),
('dribbon2d', 'Darbee', 'Bobbie', 'Darbee Ribbon', 'dribbon2d@wisc.edu', 1),
('stollerton2e', 'Sargent', 'Etta', 'Sargent Tollerton', 'stollerton2e@usda.gov', 0),
('bmcwhinnie2f', 'Brendin', 'Laural', 'Brendin McWhinnie', 'bmcwhinnie2f@omniture.com', 0),
('egiamuzzo2g', 'Ezri', 'Torrin', 'Ezri Giamuzzo', 'egiamuzzo2g@sohu.com', 1),
('vreddel2h', 'Vasili', 'Dyan', 'Vasili Reddel', 'vreddel2h@clickbank.net', 1),
('ucleland2i', 'Urbanus', 'Karry', 'Urbanus Cleland', 'ucleland2i@eepurl.com', 1),
('cortsmann2j', 'Chevalier', 'Elvin', 'Chevalier Ortsmann', 'cortsmann2j@narod.ru', 0),
('ocampsall2k', 'Orin', 'Vilhelmina', 'Orin Campsall', 'ocampsall2k@purevolume.com', 0),
('fgreed2l', 'Finn', 'Sharlene', 'Finn Greed', 'fgreed2l@marketwatch.com', 0),
('fhasard2m', 'Fidelio', 'Jami', 'Fidelio Hasard', 'fhasard2m@cornell.edu', 0),
('rskuse2n', 'Raoul', 'Burg', 'Raoul Skuse', 'rskuse2n@wordpress.org', 0),
('tbeton2o', 'Terrel', 'Denis', 'Terrel Beton', 'tbeton2o@feedburner.com', 0),
('jpedlow2p', 'Jethro', 'Arch', 'Jethro Pedlow', 'jpedlow2p@tripod.com', 0),
('jnortham2q', 'Jonah', 'Cynde', 'Jonah Northam', 'jnortham2q@shareasale.com', 1),
('sdibben2r', 'Shellysheldon', 'Lorna', 'Shellysheldon Dibben', 'sdibben2r@ihg.com', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
