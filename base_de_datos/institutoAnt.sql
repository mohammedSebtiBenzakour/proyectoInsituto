-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-03-2022 a las 19:41:59
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
-- Estructura de tabla para la tabla `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `curso` varchar(255) NOT NULL,
  `descripcion_curso` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`curso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_materia`
--

DROP TABLE IF EXISTS `curso_materia`;
CREATE TABLE IF NOT EXISTS `curso_materia` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL,
  PRIMARY KEY (`Curso_curso`,`listaMaterias_materia`),
  KEY `FK_CURSO_MATERIA_listaMaterias_materia` (`listaMaterias_materia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_personal_no_docente`
--

DROP TABLE IF EXISTS `curso_personal_no_docente`;
CREATE TABLE IF NOT EXISTS `curso_personal_no_docente` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaPersonalNoDocente_dni` varchar(255) NOT NULL,
  PRIMARY KEY (`Curso_curso`,`listaPersonalNoDocente_dni`),
  KEY `CURSOPERSONAL_NO_DOCENTElistaPersonalNoDocente_dni` (`listaPersonalNoDocente_dni`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `nombre_departamento` varchar(255) NOT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nombre_departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE IF NOT EXISTS `evaluacion` (
  `ID` bigint(20) NOT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EVALUACION_dni_alumno` (`dni_alumno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_matricula`
--

DROP TABLE IF EXISTS `materia_matricula`;
CREATE TABLE IF NOT EXISTS `materia_matricula` (
  `Materia_materia` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Materia_materia`,`listaMatriculaciones_ID`),
  KEY `FK_MATERIA_MATRICULA_listaMatriculaciones_ID` (`listaMatriculaciones_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `ID` bigint(20) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre_matricula` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  `nombre_materia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MATRICULA_nombre_materia` (`nombre_materia`),
  KEY `FK_MATRICULA_dni_alumno` (`dni_alumno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula_evaluacion`
--

DROP TABLE IF EXISTS `matricula_evaluacion`;
CREATE TABLE IF NOT EXISTS `matricula_evaluacion` (
  `Matricula_ID` bigint(20) NOT NULL,
  `listaEvaluaciones_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Matricula_ID`,`listaEvaluaciones_ID`),
  KEY `FK_MATRICULA_EVALUACION_listaEvaluaciones_ID` (`listaEvaluaciones_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

DROP TABLE IF EXISTS `nivel`;
CREATE TABLE IF NOT EXISTS `nivel` (
  `nombre_nivel` varchar(255) NOT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nombre_nivel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`nombre_nivel`, `fecha_creacion`, `ID`) VALUES
('Bachillerato', '2022-03-18 14:27:32', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `tipo_perfil` varchar(255) NOT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tipo_perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_no_docente`
--

DROP TABLE IF EXISTS `personal_no_docente`;
CREATE TABLE IF NOT EXISTS `personal_no_docente` (
  `dni` varchar(255) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK_PERSONAL_NO_DOCENTE_perfil` (`perfil`),
  KEY `FK_PERSONAL_NO_DOCENTE_departamento` (`departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `nombre_alumno` varchar(255) DEFAULT NULL,
  `pais_alumno` varchar(255) DEFAULT NULL,
  `primer_apellido_alumno` varchar(255) DEFAULT NULL,
  `segundo_apellido_alumno` varchar(255) DEFAULT NULL,
  `telefono_alumno` varchar(255) DEFAULT NULL,
  `nivel_alumno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni_alumno`),
  KEY `FK_REGISTRAR_ALUMNOS_nivel_alumno` (`nivel_alumno`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_alumnos_matricula`
--

DROP TABLE IF EXISTS `registrar_alumnos_matricula`;
CREATE TABLE IF NOT EXISTS `registrar_alumnos_matricula` (
  `Registrar_alumnos_dni_alumno` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`Registrar_alumnos_dni_alumno`,`listaMatriculaciones_ID`),
  KEY `REGISTRAR_ALUMNOS_MATRICULAlistaMatriculaciones_ID` (`listaMatriculaciones_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_usuarios`
--

DROP TABLE IF EXISTS `registrar_usuarios`;
CREATE TABLE IF NOT EXISTS `registrar_usuarios` (
  `dni` varchar(255) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK_REGISTRAR_USUARIOS_perfil` (`perfil`),
  KEY `FK_REGISTRAR_USUARIOS_departamento` (`departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_usuarios_materia`
--

DROP TABLE IF EXISTS `registrar_usuarios_materia`;
CREATE TABLE IF NOT EXISTS `registrar_usuarios_materia` (
  `Registrar_usuarios_dni` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL,
  PRIMARY KEY (`Registrar_usuarios_dni`,`listaMaterias_materia`),
  KEY `REGISTRAR_USUARIOS_MATERIA_listaMaterias_materia` (`listaMaterias_materia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sequence`
--

DROP TABLE IF EXISTS `sequence`;
CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '50');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
