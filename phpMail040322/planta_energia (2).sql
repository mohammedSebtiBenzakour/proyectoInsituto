-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-02-2022 a las 21:59:05
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
('2022-02-21 21:50:34', '45.0000', 'símon', 2);

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
('2022-02-17 21:00:00', '0.0000', 'admin', 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `plantas`
--

INSERT INTO `plantas` (`id`, `nombre_planta`, `ubicacion_planta`) VALUES
(2, 'Maírenaddd', 'Maírenaddddddddddd');

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
('oper', 'oper', 'Operario', 'de las Plantas', 'msb.duck@gmail.com', 0),
('símon', 'símon', 'símon símonfffff', 'símon símon', 'msb.tesla@gmail.com', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
