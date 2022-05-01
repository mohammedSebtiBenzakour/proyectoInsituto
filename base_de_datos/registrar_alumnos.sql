-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 02-02-2022 a las 21:23:09
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
-- Estructura de tabla para la tabla `registrar_alumnos`
--

DROP TABLE IF EXISTS `registrar_alumnos`;
CREATE TABLE IF NOT EXISTS `registrar_alumnos` (
  `imagen_alumno` blob NOT NULL,
  `dni_alumno` varchar(50) NOT NULL,
  `nombre_alumno` varchar(50) NOT NULL,
  `primer_apellido_alumno` varchar(50) NOT NULL,
  `segundo_apellido_alumno` varchar(50) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `fecha_nacimiento_alumno` date NOT NULL DEFAULT '2022-01-01',
  `email_alumno` varchar(100) NOT NULL,
  `nivel_alumno` varchar(50) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `pais_alumno` varchar(50) NOT NULL,
  `comunidad_alumno` varchar(50) NOT NULL,
  `ciudad_alumno` varchar(50) NOT NULL,
  `cp_alumno` varchar(50) NOT NULL,
  `telefono_alumno` varchar(50) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dni_alumno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_alumnos`
--

INSERT INTO `registrar_alumnos` (`imagen_alumno`, `dni_alumno`, `nombre_alumno`, `primer_apellido_alumno`, `segundo_apellido_alumno`, `genero`, `fecha_nacimiento_alumno`, `email_alumno`, `nivel_alumno`, `departamento`, `pais_alumno`, `comunidad_alumno`, `ciudad_alumno`, `cp_alumno`, `telefono_alumno`, `creado_el`) VALUES
(0x6d6f68616d6d656420666f746f20646e6920323120313120323031392831292e6a7067, 'a', 'a', 'a', 'a', 'hombre', '2022-02-22', 'a@a.com', 'highschool', 'electrical', 'a', 'a', 'a', '4', 'a', '2022-02-02 21:00:30'),
(0x7465736c6178456e666f2e6a7067, 'b', 'b', 'b', 'b', 'otros', '2022-02-12', 'ac@a.com', 'highschool', 'electrical', 'b', 'b', 'b', '2', 'b', '2022-02-02 21:21:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
