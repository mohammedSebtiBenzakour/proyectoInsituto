-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-03-2022 a las 18:59:52
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
  `dni_alumno` varchar(255) NOT NULL,
  `calle_alumno` varchar(255) DEFAULT NULL,
  `ciudad_alumno` varchar(255) DEFAULT NULL,
  `cp_alumno` varchar(255) DEFAULT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `email_alumno` varchar(255) DEFAULT NULL,
  `fecha_nacimiento_alumno` date DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  `imagen_alumno` longtext,
  `nivel_alumno` varchar(255) DEFAULT NULL,
  `nombre_alumno` varchar(255) DEFAULT NULL,
  `pais_alumno` varchar(255) DEFAULT NULL,
  `primer_apellido_alumno` varchar(255) DEFAULT NULL,
  `segundo_apellido_alumno` varchar(255) DEFAULT NULL,
  `telefono_alumno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni_alumno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_alumnos`
--

INSERT INTO `registrar_alumnos` (`dni_alumno`, `calle_alumno`, `ciudad_alumno`, `cp_alumno`, `creado_el`, `email_alumno`, `fecha_nacimiento_alumno`, `genero`, `ID`, `imagen_alumno`, `nivel_alumno`, `nombre_alumno`, `pais_alumno`, `primer_apellido_alumno`, `segundo_apellido_alumno`, `telefono_alumno`) VALUES
('a', 'electrical', 'Sevilla', '41222', '2022-03-14 16:34:31', 'a@a.com', '2022-01-22', 'hombre', 701, 'logoInstituto.jpg', 'highschool', 'a', 'España', 'a', 'a', '123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
