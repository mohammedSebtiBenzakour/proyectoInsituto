-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-01-2022 a las 21:09:18
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
-- Estructura de tabla para la tabla `insertar_oferta`
--

DROP TABLE IF EXISTS `insertar_oferta`;
CREATE TABLE IF NOT EXISTS `insertar_oferta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia_oferta` varchar(50) NOT NULL,
  `nombre_oferta` varchar(50) NOT NULL,
  `empresa_oferta` varchar(50) NOT NULL,
  `ciudad_oferta` varchar(50) NOT NULL,
  `tipo_oferta` varchar(50) NOT NULL,
  `fecha_oferta` date NOT NULL DEFAULT '2022-01-01',
  `fecha_actual` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `descripcion_oferta` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insertar_oferta`
--

INSERT INTO `insertar_oferta` (`id`, `referencia_oferta`, `nombre_oferta`, `empresa_oferta`, `ciudad_oferta`, `tipo_oferta`, `fecha_oferta`, `fecha_actual`, `descripcion_oferta`) VALUES
(1, '12', 'a', 'a', 'a', 'a tiempo parcial', '2020-01-01', '2022-01-17 19:40:09', 'dsdafadsfasfa'),
(2, 'v', 'v', 'v', 'v', 'a tiempo parcial', '2020-01-01', '2022-01-17 19:40:40', 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv'),
(3, 'v', 'v', 'v', 'v', 'a tiempo completo', '2020-01-15', '2022-01-17 19:59:03', 'vvvvv'),
(4, '12', 'v', 'a', 'a', 'a tiempo parcial', '2022-01-29', '2022-01-17 20:30:30', 'ssssss'),
(5, '12', 'v', 'a', 'ss', 'ss', '2022-01-01', '2022-01-17 20:43:52', 'sss'),
(6, '1111111112', 'v', 'a', 'ss', 'ss', '2022-01-01', '2022-01-17 20:45:17', 'sss'),
(7, 'ss', 'simo', 'ss', 'ss', 'ssssss', '2022-01-17', '2022-01-17 20:48:02', 'ssssssssssssssssss'),
(8, 'fffff', 'fffffff', 'ffff', 'ffff', 'ffff', '2022-01-21', '2022-01-17 20:49:27', 'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff'),
(9, 'mohammed', 'mohammed', 'mohammedmohammed', 'mohammed', 'mohammed', '2022-01-30', '2022-01-17 21:05:39', 'mohammedmohammedmohammedmohammedmohammedmohammedvmohammed');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
