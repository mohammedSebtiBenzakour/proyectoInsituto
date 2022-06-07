-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-06-2022 a las 18:53:32
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
-- Base de datos: `instituto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

DROP TABLE IF EXISTS `materia`;
CREATE TABLE IF NOT EXISTS `materia` (
  `materia` varchar(255) NOT NULL,
  `descripcion_materia` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  `dni_profesor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`materia`),
  KEY `FK_MATERIA_dni_profesor` (`dni_profesor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`materia`, `descripcion_materia`, `fecha_creacion`, `ID`, `dni_profesor`) VALUES
('Diseño', 'Mejor materia del mundo0', '2022-03-20 15:02:45', 1401, '1'),
('HLC', 'Mejor materia del mundo07889', NULL, NULL, '11'),
('Empresa', 'Mejor materia del mundo0', NULL, NULL, '11'),
('javascript', 'parecido a java mas o menos', NULL, NULL, '22334455d'),
('java2', 'Mejor materia del mundo0', '2022-04-02 12:25:51', NULL, '1'),
('bggrf', 'fffggg', '2022-04-23 19:54:29', 2951, '11'),
('PHP', 'parecido a java mas o menos', NULL, NULL, '29587784D'),
('Electronica', 'Electronica detallada 234', NULL, NULL, '22334455z'),
('asedf', 'ddddddd', '2022-04-23 19:40:06', 2801, '11');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
