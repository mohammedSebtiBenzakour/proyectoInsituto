-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-06-2022 a las 20:46:52
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
-- Estructura de tabla para la tabla `categoria_libro`
--

DROP TABLE IF EXISTS `categoria_libro`;
CREATE TABLE IF NOT EXISTS `categoria_libro` (
  `categoria` varchar(200) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria_libro`
--

INSERT INTO `categoria_libro` (`categoria`, `creado_el`) VALUES
('Novela', '2022-04-12 11:07:12'),
('Ciencia Ficción', '2022-04-12 11:07:12'),
('Drama', '2022-04-12 11:08:09'),
('Programming & Development', '2022-04-12 11:08:09'),
('Coches', '2022-04-12 11:08:09'),
('oooo', '2022-04-12 12:11:11'),
('sa', '2022-04-13 07:26:47'),
('ds', '2022-04-13 07:29:02'),
('df', '2022-04-13 07:29:24'),
('cdx', '2022-04-13 07:33:38'),
('asdfgh', '2022-04-13 10:02:26'),
('xcxcxcxcx', '2022-04-13 10:27:29');

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

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`curso`, `descripcion_curso`, `fecha_creacion`, `ID`) VALUES
('2021-2022', 'Curso detallado - 1', '2022-03-20 15:46:37', 1),
('2022-2023', 'Curso detallado - 2', '2022-03-20 15:46:37', 2),
('2023-2024', 'Curso detallado - 3', '2022-03-20 15:46:37', 3),
('2024-2025', 'Curso detallado - 4', '2022-03-20 15:46:37', 4),
('2025-2026', 'Curso detallado - 5', '2022-03-20 15:46:37', 5),
('2026-2027', 'Curso detallado - 6', '2022-04-02 14:00:32', NULL),
('2027-2028', 'Curso detallado - 7wwww', '2022-04-02 13:54:26', NULL),
('2030-2031', 'ddddddddddddd', '2022-04-02 14:09:06', 1952),
('2021-2023', 'dsaddADd', '2022-04-23 20:59:43', 3101);

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
-- Estructura de tabla para la tabla `departamento_instituto`
--

DROP TABLE IF EXISTS `departamento_instituto`;
CREATE TABLE IF NOT EXISTS `departamento_instituto` (
  `nombre_departamento` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nombre_departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento_instituto`
--

INSERT INTO `departamento_instituto` (`nombre_departamento`, `creado_el`, `ID`) VALUES
('Comercio', '2022-03-19 14:27:02', 901),
('Eletricidad', '2022-03-19 14:27:02', 902),
('Informatica', '2022-03-19 14:27:02', 903),
('Quimica', '2022-03-19 14:27:02', 904),
('Fisica', '2022-03-19 16:48:14', NULL),
('Q inorganica', '2022-04-03 14:27:59', NULL),
('Nuevo', '2022-04-08 10:42:58', NULL),
('Historia', 'Geografia', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_instituto_registrar_usuarios`
--

DROP TABLE IF EXISTS `departamento_instituto_registrar_usuarios`;
CREATE TABLE IF NOT EXISTS `departamento_instituto_registrar_usuarios` (
  `Departamento_instituto_nombre_departamento` varchar(255) NOT NULL,
  `listaProfesores_dni` varchar(255) NOT NULL,
  PRIMARY KEY (`Departamento_instituto_nombre_departamento`,`listaProfesores_dni`),
  KEY `DPRTMENTOINSTITUTOREGISTRARUSUARIOSlstPrfesoresdni` (`listaProfesores_dni`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
CREATE TABLE IF NOT EXISTS `encuesta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opcion` varchar(50) NOT NULL,
  `votos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`id`, `opcion`, `votos`) VALUES
(1, 'c', 4),
(2, 'c++', 2),
(3, 'java', 7),
(4, 'php', 2),
(5, 'javascript', 2),
(6, 'html', 1),
(7, 'css', 2),
(8, 'mysql', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
CREATE TABLE IF NOT EXISTS `evaluacion` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EVALUACION_dni_alumno` (`dni_alumno`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`ID`, `fecha_registro`, `nota`, `observacion`, `dni_alumno`) VALUES
(22, '2022-04-24 11:39:11', '5', 'fddfgg', 'a1'),
(23, '2022-04-24 11:54:55', '6.7', 'saafasf', 'a2'),
(24, NULL, '5.2', 'hay que esforzarse mas', 'a8'),
(25, NULL, '7.2', 'hay que esforzarse mas', 'a6'),
(26, NULL, '8.2', 'hay que esforzarse mas', 'a2'),
(27, NULL, '9.2', 'hay que esforzarse mas', 'a4'),
(28, NULL, '4.2', 'hay que esforzarse mas', 'a5'),
(29, NULL, '7.2', 'hay que esforzarse mas', 'a7'),
(30, NULL, '8.2', 'hay que esforzarse mas', 'a9'),
(31, NULL, '9.12', 'muy bien', 'a3'),
(32, NULL, '8.12', 'muy bien', 'a6'),
(33, NULL, '9.45', 'muy bien', 'a2'),
(34, NULL, '6.12', 'muy bien', 'a7'),
(21, '2022-04-02 17:33:46', '234', 'fffffffffffffffffffffffffffff', 'a3'),
(35, NULL, '4.12', 'muy mal', 'a5'),
(19, '2022-04-02 17:12:36', '9', 'Observacion-8', 'a3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insertar_noticias`
--

DROP TABLE IF EXISTS `insertar_noticias`;
CREATE TABLE IF NOT EXISTS `insertar_noticias` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creado_el` varchar(255) DEFAULT NULL,
  `nombre_noticia` longtext,
  `texto_noticia` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insertar_noticias`
--

INSERT INTO `insertar_noticias` (`id`, `creado_el`, `nombre_noticia`, `texto_noticia`) VALUES
(17, '2022-05-28 13:32:49', 'Para quÃ© programar un app cuando puedes dibujarla: asÃ­ funciona la nueva IA &quot;No-Code&quot; de Microsoft', 'Ayer se iniciÃ³ el evento Microsoft Build 2022 orientado a desarrolladores, y entre las novedades hubo una especialmente curiosa: un nuevo sistema &quot;No-Code&quot; que permite desarrollar la interfaz de usuario de las aplicaciones no programÃ¡ndola, sino dibujÃ¡ndola.'),
(18, '2022-05-28 13:33:49', 'Uthorp resuelve parte del algoritmo de Google', 'Desde hace aÃ±os, existe un gran mundo alrededor de Google, ya que abre la puerta a la visibilidad online frente a los potenciales clientes en todo el mundo.'),
(19, '2022-05-28 13:34:06', 'Atos lanza una innovadora soluciÃ³n &quot;Edge to Cloud&quot; basada en 5G e inteligencia artificial', 'Atos anuncia el lanzamiento de Atos Business Outcomes-as-a-Service (&quot;Atos BOaaS&quot;), una oferta de 5G, Edge e IoT desarrollada en colaboraciÃ³n con Dell Technologies. Atos BOaaS aprovecha los beneficios de la arquitectura Cloud-to-Edge (edge) y Cloud-to-Far-Edge (remote edge) para extraer datos procesables comercialmente utilizando Inteligencia Artificial (AI). La implementaciÃ³n, el pilotaje y la gestiÃ³n de la soluciÃ³n estÃ¡n automatizados de principio a fin'),
(20, '2022-05-28 13:34:21', 'Grupo Avalon renueva la certificaciÃ³n ISO 20000', 'A la renovaciÃ³n de la ISO 20000 para sistemas de gestiÃ³n y soporte TI (TecnologÃ­as de la InformaciÃ³n), se suman las recientes renovaciones de las certificaciones ISO 9001 para sistemas de gestiÃ³n de la calidad y la ISO 14001 para sistemas de gestiÃ³n ambiental');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insertar_oferta`
--

DROP TABLE IF EXISTS `insertar_oferta`;
CREATE TABLE IF NOT EXISTS `insertar_oferta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ciudad_oferta` varchar(255) DEFAULT NULL,
  `descripcion_oferta` varchar(255) DEFAULT NULL,
  `empresa_oferta` varchar(255) DEFAULT NULL,
  `fecha_actual` varchar(255) DEFAULT NULL,
  `fecha_oferta` date DEFAULT NULL,
  `nombre_oferta` varchar(255) DEFAULT NULL,
  `referencia_oferta` varchar(255) DEFAULT NULL,
  `tipo_oferta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insertar_oferta`
--

INSERT INTO `insertar_oferta` (`id`, `ciudad_oferta`, `descripcion_oferta`, `empresa_oferta`, `fecha_actual`, `fecha_oferta`, `nombre_oferta`, `referencia_oferta`, `tipo_oferta`) VALUES
(1, 'Ciudad-1', 'Descripcion-1231', 'Empresa-1', '2022-03-19 15:57:00', '2022-02-28', 'Oferta-1', 'Ref-1', 'Tipo-1'),
(2, 'Ciudad-2', 'Descripcion-1232', 'Empresa-2', '2022-03-19 15:57:00', '2022-03-01', 'Oferta-2', 'Ref-2', 'Tipo-2'),
(3, 'Ciudad-3', 'Descripcion-1233', 'Empresa-3', '2022-03-19 15:57:00', '2022-03-02', 'Oferta-3', 'Ref-3', 'Tipo-3'),
(4, 'Ciudad-4', 'Descripcion-1234', 'Empresa-4', '2022-03-19 15:57:00', '2022-03-03', 'Oferta-4', 'Ref-4', 'Tipo-4'),
(5, 'Ciudad-5', 'Descripcion-1235', 'Empresa-5', '2022-03-19 15:57:00', '2022-03-04', 'Oferta-5', 'Ref-5', 'Tipo-5'),
(6, 'Ciudad-6', 'Descripcion-1236', 'Empresa-6', '2022-03-19 15:57:00', '2022-03-05', 'Oferta-6', 'Ref-6', 'Tipo-6'),
(7, 'Ciudad-7', 'Descripcion-1237', 'Empresa-7', '2022-03-19 15:57:00', '2022-03-06', 'Oferta-7', 'Ref-7', 'Tipo-7'),
(24, 'sss', 'sssss', 'ssssssss', '2022-04-23 16:54:37', '2022-04-14', 'ssss', 'ssssssss', 'ssss'),
(10, 'mohammed', 'mohammed', 'mohammed', '2022-03-19 15:59:24', '2022-03-23', 'mohammed', 'mohammed', 'mohammed'),
(23, 'Alhamdulillah ', 'Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah ', 'Alhamdulillah ', '2022-03-19 16:29:10', '2047-03-20', 'Alhamdulillah ', 'Alhamdulillah ', 'Alhamdulillah ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreLibro` varchar(50) DEFAULT NULL,
  `descripcionLibro` varchar(50) DEFAULT NULL,
  `autorLibro` varchar(50) DEFAULT NULL,
  `categoriaLibro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_libros_categoria` (`categoriaLibro`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `nombreLibro`, `descripcionLibro`, `autorLibro`, `categoriaLibro`) VALUES
(2, 'Savages, The', 'Comedy|Drama', 'V8 Vantage', 'Ciencia Ficción'),
(3, 'Almost You mohammed', 'Comedy|Drama', 'Tacoma', 'Drama'),
(4, 'Charm School (Niñas mal)', 'Comedy', 'Tucson', 'Coches'),
(5, 'Madonna of the Seven Moons', 'Drama|Mystery', 'Tracer', 'Novela'),
(6, 'Three (a.k.a. 3 Extremes II) (Saam gaang)', 'Horror|Mystery', 'V40', 'df'),
(7, 'Hangover Square', 'Crime|Drama|Horror|Thriller', 'LX', 'Drama'),
(10, 'Cosmic Psychos: Blokes You Can Trust', 'Documentary|Musical', '3500', 'Drama'),
(95, 'sfsa', 'asfasf', 'asfsf', 'Programming & Development');

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

--
-- Volcado de datos para la tabla `materia_matricula`
--

INSERT INTO `materia_matricula` (`Materia_materia`, `listaMatriculaciones_ID`) VALUES
('asedf', 12),
('Diseño', 4),
('Diseño', 6),
('Diseño', 9),
('Diseño', 13),
('Electronica', 11),
('Empresa', 18),
('HLC', 14),
('HLC', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

DROP TABLE IF EXISTS `matricula`;
CREATE TABLE IF NOT EXISTS `matricula` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `creado_el` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre_matricula` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  `nombre_materia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MATRICULA_nombre_materia` (`nombre_materia`),
  KEY `FK_MATRICULA_dni_alumno` (`dni_alumno`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`ID`, `creado_el`, `descripcion`, `nombre_matricula`, `dni_alumno`, `nombre_materia`) VALUES
(22, NULL, 'matricula 199', 'matricula 199', 'a4', 'HLC'),
(21, NULL, 'matricula 78', 'matricula 78', 'a1', 'Diseño'),
(20, NULL, 'matricula 199', 'matricula 199', 'a8', 'HLC'),
(19, NULL, 'matricula 78', 'matricula 78', 'a7', 'Diseño'),
(18, NULL, 'matricula 2199', 'matricula 2199', 'a7', 'PHP'),
(13, NULL, 'matricula 78', 'matricula 78', 'a6', 'Diseño'),
(14, NULL, 'matricula 199', 'matricula 199', 'a9', 'HLC'),
(15, NULL, 'matricula 378', 'matricula 378', 'a2', 'Empresa'),
(16, NULL, 'matricula 1199', 'matricula 1199', 'a8', 'javascript'),
(17, NULL, 'matricula 578', 'matricula 578', 'a3', 'java2'),
(11, '2022-04-24 11:59:29', 'dasdasd', 'dad23', 'a2', 'Electronica'),
(12, '2022-04-24 12:02:04', 'asfsfsa', 'aasf', 'a2', 'asedf');

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
-- Estructura de tabla para la tabla `nivel_instituto`
--

DROP TABLE IF EXISTS `nivel_instituto`;
CREATE TABLE IF NOT EXISTS `nivel_instituto` (
  `nombre_nivel` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nombre_nivel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivel_instituto`
--

INSERT INTO `nivel_instituto` (`nombre_nivel`, `creado_el`, `ID`) VALUES
('Bachillerato', '2022-03-19 16:42:09', 1251),
('ESO', '2022-03-19 16:42:09', 1252),
('FPGS', '2022-03-19 16:42:09', 1253),
('Otros', '2022-04-02 12:24:21', 34588),
('Eso 2', '2022-04-02 12:19:42', 123),
('eerfgggh', '2022-04-23 20:03:14', 3051);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE IF NOT EXISTS `perfiles` (
  `perfil` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`perfil`, `creado_el`, `ID`) VALUES
('administrador', '2022-03-19 12:27:49', 51),
('estudiante', '2022-03-19 12:27:49', 52),
('jefatura', '2022-03-19 12:27:49', 53),
('profesor', '2022-03-19 12:27:49', 54),
('personal_no_docente', '2022-03-19 14:43:20', 1005),
('otro', '2022-04-03 12:22:29', NULL),
('otro2', '2022-04-03 12:23:57', NULL);

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

--
-- Volcado de datos para la tabla `personal_no_docente`
--

INSERT INTO `personal_no_docente` (`dni`, `apellidos`, `ciudad`, `clave`, `direccion`, `email`, `fecha`, `fecha_registro`, `ID`, `nombre`, `pais`, `telefono`, `usuario`, `departamento`, `perfil`) VALUES
('1231', 'Sebti1', 'Sevilla', 'x1', 'Gines', 'a1@b.fr', '2022-01-31', '2022-03-19 14:48:19', 1101, 'mohamed1', 'España', '654321981', 'x1', 'Comercio', 'personal_no_docente'),
('1232', 'Sebti2', 'Sevilla', 'x2', 'Gines', 'a2@b.fr', '2022-02-01', '2022-03-19 14:48:19', 1101, 'mohamed2', 'España', '654321982', 'x2', 'Eletricidad', 'personal_no_docente'),
('1233', 'Sebti3', 'Sevilla', 'x3', 'Gines', 'a3@b.fr', '2022-02-02', '2022-03-19 14:48:19', 1101, 'mohamed3', 'España', '654321983', 'x3', 'Eletricidad', 'personal_no_docente'),
('1234', 'Sebti4', 'Sevilla', 'x4', 'Gines', 'a4@b.fr', '2022-02-03', '2022-03-19 14:48:19', 1101, 'mohamed4', 'España', '654321984', 'x4', 'Eletricidad', 'personal_no_docente'),
('1235', 'Sebti5', 'Sevilla', 'x5', 'Gines', 'a5@b.fr', '2022-02-04', '2022-03-19 14:48:19', 1101, 'mohamed5', 'España', '654321985', 'x5', 'Comercio', 'personal_no_docente'),
('29587784D', 'dddd fffff', 'ffff', 'ffff55', 'ddddddd 456', 'msb.tesla@gmail.com', '2022-04-07', '2022-04-23 15:55:22', NULL, 'dddd', 'ffff', '655173173', 'ffff35', 'Quimica', 'otro');

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

--
-- Volcado de datos para la tabla `registrar_alumnos`
--

INSERT INTO `registrar_alumnos` (`dni_alumno`, `calle_alumno`, `ciudad_alumno`, `cp_alumno`, `creado_el`, `email_alumno`, `fecha_nacimiento_alumno`, `genero`, `ID`, `imagen_alumno`, `nombre_alumno`, `pais_alumno`, `primer_apellido_alumno`, `segundo_apellido_alumno`, `telefono_alumno`, `nivel_alumno`) VALUES
('a1', 'Calle camas 1', 'Camas', '41222', '2022-03-19 14:11:22', 'a1@a.com', '2022-01-31', 'hombre', 751, 'logoInstituto.jpg', 'a1', 'España', 'a1', 'b1', '123456781', 'FPGS'),
('a2', 'Calle camas 2', 'Camas', '41222', '2022-03-19 14:11:22', 'a2@a.com', '2022-02-01', 'mujer', 751, 'logoInstituto.jpg', 'a2', 'España', 'a2', 'b2', '123456782', 'Bachillerato'),
('a3', 'Calle camas 3', 'Camas', '41222', '2022-03-19 14:11:22', 'a3@a.com', '2022-02-02', 'hombre', 751, 'logoInstituto.jpg', 'a3', 'España', 'a3', 'b3', '123456783', 'FPGS'),
('a8', 'Calle camas 8', 'Camas', '41222', '2022-03-19 14:11:22', 'a8@a.com', '2022-02-07', 'hombre', 751, 'logoInstituto.jpg', 'a8', 'España', 'a8', 'b8', '123456788', 'FPGS'),
('29587784d', 'sss 22', 'f', '11111', '2022-04-17 20:08:39', 'msb.tesla@gmail.com', '2022-04-06', 'hombre', NULL, 'Ã­ndice.png', 'aaa', 'dd', 'aaa', 'aaa', '0034 666666666', 'FPGS'),
('a4', 'Calle camas 4', 'Camas', '41222', '2022-03-19 14:11:22', 'a4@a.com', '2022-02-03', 'hombre', 751, 'logoInstituto.jpg', 'a4', 'España', 'a4', 'b4', '123456784', 'Bachillerato'),
('a5', 'Calle camas 5', 'Camas', '41222', '2022-03-19 14:11:22', 'a5@a.com', '2022-02-04', 'mujer', 751, 'logoInstituto.jpg', 'a5', 'España', 'a5', 'b5', '123456785', 'FPGS'),
('a6', 'Calle camas 6', 'Camas', '41222', '2022-03-19 14:11:22', 'a6@a.com', '2022-02-05', 'hombre', 751, 'logoInstituto.jpg', 'a6', 'España', 'a6', 'b6', '123456786', 'ESO'),
('a7', 'Calle camas 7', 'Camas', '41222', '2022-03-19 14:11:22', 'msb.tesla@gmail.com', '2022-02-06', 'hombre', 751, 'logoInstituto.jpg', 'a7', 'España', 'a7', 'b7', '123456787', 'FPGS'),
('a9', 'Calle camas 9', 'Camas', '41222', '2022-03-19 14:11:22', 'a9@a.com', '2022-02-08', 'hombre', 751, 'logoInstituto.jpg', 'a9', 'España', 'a9', 'b9', '123456789', 'ESO');

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

--
-- Volcado de datos para la tabla `registrar_alumnos_matricula`
--

INSERT INTO `registrar_alumnos_matricula` (`Registrar_alumnos_dni_alumno`, `listaMatriculaciones_ID`) VALUES
('a1', 6),
('a1', 1451),
('a2', 3),
('a2', 9),
('a2', 11),
('a2', 12),
('a2', 18),
('a3', 2),
('a3', 5),
('a4', 1),
('a4', 12),
('a4', 14),
('a5', 10),
('a6', 1),
('a7', 5),
('a7', 7),
('a7', 11),
('a7', 15),
('a7', 16),
('a8', 4),
('a8', 6),
('a8', 10),
('a8', 17),
('a9', 2),
('a9', 8),
('a9', 13);

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

--
-- Volcado de datos para la tabla `registrar_usuarios`
--

INSERT INTO `registrar_usuarios` (`dni`, `apellidos`, `ciudad`, `clave`, `direccion`, `email`, `fecha`, `fecha_registro`, `ID`, `nombre`, `pais`, `telefono`, `usuario`, `departamento`, `perfil`) VALUES
('1', 'a', 'Sevilla', 'a', 'Camas', 'msb.caixa@gmail.com', '2022-01-22', '2022-03-19 13:10:12', 251, 'a', 'España', '123123123', 'a', 'Comercio', 'administrador'),
('11', 'aa', 'Sevilla', 'aa', 'Camas', 'a@a.com', '2022-02-22', '2022-03-19 13:14:04', 351, 'aa', 'Espaï¿½a', '123123123', 'aa', 'Nuevo', 'jefatura'),
('29587784D', 'eee eeee', 'fff', 'dddd44', 'ddddd 34', 'msb.duck@gmail.com', '2022-04-19', '2022-04-23 15:54:14', NULL, 'eeee', 'fff', '655173173', 'aaaa34aa', 'Informatica', 'administrador'),
('22334455d', 'profesor a', 'camas', '1234', 'camas 34 sevilla', 'msb.duck@gmail.com', '2022-06-05', NULL, NULL, 'Profesor a', 'España', '123456789', 'profesor_a', 'quimica', 'administrador'),
('22334455x', 'profesor b', 'camas', '1234', 'camas 34 sevilla', 'msb.duck@gmail.com', '2022-06-05', NULL, NULL, 'Profesor b', 'España', '123456789', 'profesor_b', 'fisica', 'administrador'),
('22334455z', 'profesor c', 'camas', '1234', 'camas 34 sevilla', 'msb.duck@gmail.com', '2022-06-05', NULL, NULL, 'Profesor c', 'España', '123456789', 'profesor_c', 'historia', 'administrador');

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

--
-- Volcado de datos para la tabla `registrar_usuarios_materia`
--

INSERT INTO `registrar_usuarios_materia` (`Registrar_usuarios_dni`, `listaMaterias_materia`) VALUES
('1', 'a'),
('1', 'dfddd'),
('1', 'Diseño'),
('1', 'fsfsaff'),
('1', 'java2'),
('1', 'mjmkiolpñ'),
('1', 's23edf'),
('1', 'ssss'),
('1', 'sssssssss'),
('11', '11'),
('11', 'asedf'),
('11', 'bggrf'),
('11', 'Electronica'),
('11', 'Empresa'),
('11', 'Programacion'),
('111', 'Fisica'),
('111', 'Programacion'),
('111', 'Quimica'),
('29587784D', '123w'),
('29587784D', 'a'),
('b', 'Despliegue'),
('b', 'Entorno cliente'),
('b', 'Fisica'),
('b', 'HLC'),
('b', 'Programacion');

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
('SEQ_GEN', '3150');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subidadocumento`
--

DROP TABLE IF EXISTS `subidadocumento`;
CREATE TABLE IF NOT EXISTS `subidadocumento` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `creado_el` varchar(255) DEFAULT NULL,
  `subida_documento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2567 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subidadocumento`
--

INSERT INTO `subidadocumento` (`ID`, `creado_el`, `subida_documento`) VALUES
(2560, '2022-04-10 17:46:46', 'imagenes/Ã­ndicee.png'),
(2561, '2022-04-10 17:47:15', 'imagenes/Ã­ndice.png'),
(2562, '2022-04-13 14:19:32', 'imagenes/Ã­ndice.png'),
(2563, '2022-06-05 20:35:41', 'imagenes/profesores (1).xls'),
(2564, '2022-06-05 20:37:37', 'imagenes/a.xlsx'),
(2565, '2022-06-05 20:38:03', 'imagenes/listeClients(3).xls'),
(2566, '2022-06-05 20:38:33', 'imagenes/listeRecusElimines(1).xls');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`) VALUES
(1, 'q', 'q@q.com', 'q'),
(2, 's', 's', 's'),
(3, 'd', 'd', 'ddd'),
(4, 'n', 'n', 'n'),
(5, 'b', 'b', 'bb'),
(6, 'g', 'g', 'g'),
(7, 'w', 'msb.caixa@gmail.com', 'ww'),
(8, 'mo', 'msb.tesla@gmail.com', '12'),
(9, 'h', 'msebti2@gmail.com', 'h'),
(10, 'j', 'sebti.benzakour.mohammed@iescamas.es', 'j'),
(15, 'sssss', 'msb.duck@gmail.com', '1234'),
(18, 'dddd', 'sebti74@gmail.com', 'ffff');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
