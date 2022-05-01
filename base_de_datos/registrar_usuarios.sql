-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-02-2022 a las 14:41:15
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
-- Base de datos: `todo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_usuarios`
--

DROP TABLE IF EXISTS `registrar_usuarios`;
CREATE TABLE IF NOT EXISTS `registrar_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `comunidad` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `fecha` date NOT NULL DEFAULT '2022-01-01',
  `telefono` varchar(50) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_usuarios`
--

INSERT INTO `registrar_usuarios` (`id`, `nombre`, `apellido`, `usuario`, `clave`, `email`, `pais`, `comunidad`, `ciudad`, `direccion`, `fecha`, `telefono`, `fecha_registro`) VALUES
(1, 'a', 'a', 'a', 'a', 'a@a.com', '', '', '', '', '2022-01-01', '', '2022-02-02 10:30:19'),
(2, 'mohammed', 'mohammed', 'mohammed', 'mohammed', 'aaa@gg.cog.ed', '', '', '', '', '2022-01-01', '', '2022-02-02 10:30:19'),
(3, 'b', 'b', 'b', 'b', 'aaa@gg.cog.ed', 'b', 'b', 'b', '2022-02-11', '2022-02-11', 'b', '2022-02-02 10:45:19'),
(30, 'fin', 'fin', 'a', 'fin', 'aaa@gg.cog.ed', 'fin', 'fin', 'fin', 'fin', '2022-02-10', 'fin', '2022-02-02 11:29:01');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
