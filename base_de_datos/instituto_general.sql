-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 13-05-2022 a las 19:05:03
-- Versión del servidor: 5.7.38
-- Versión de PHP: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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

CREATE TABLE `categoria_libro` (
  `categoria` varchar(200) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
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

CREATE TABLE `curso` (
  `curso` varchar(255) NOT NULL,
  `descripcion_curso` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL
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
('2030-2031', 'ddddddddddddd', '2022-04-02 14:09:06', 1952);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CURSO`
--

CREATE TABLE `CURSO` (
  `curso` varchar(255) NOT NULL,
  `descripcion_curso` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_materia`
--

CREATE TABLE `curso_materia` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CURSO_MATERIA`
--

CREATE TABLE `CURSO_MATERIA` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso_personal_no_docente`
--

CREATE TABLE `curso_personal_no_docente` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaPersonalNoDocente_dni` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CURSO_PERSONAL_NO_DOCENTE`
--

CREATE TABLE `CURSO_PERSONAL_NO_DOCENTE` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaPersonalNoDocente_dni` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DEPARTAMENTO_INSTITUTO`
--

CREATE TABLE `DEPARTAMENTO_INSTITUTO` (
  `nombre_departamento` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `DEPARTAMENTO_INSTITUTO`
--

INSERT INTO `DEPARTAMENTO_INSTITUTO` (`nombre_departamento`, `creado_el`, `ID`) VALUES
('Comercio', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_instituto`
--

CREATE TABLE `departamento_instituto` (
  `nombre_departamento` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL
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
('Nuevo', '2022-04-08 10:42:58', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS`
--

CREATE TABLE `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS` (
  `Departamento_instituto_nombre_departamento` varchar(255) NOT NULL,
  `listaProfesores_dni` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_instituto_registrar_usuarios`
--

CREATE TABLE `departamento_instituto_registrar_usuarios` (
  `Departamento_instituto_nombre_departamento` varchar(255) NOT NULL,
  `listaProfesores_dni` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EVALUACION`
--

CREATE TABLE `EVALUACION` (
  `ID` bigint(20) NOT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `ID` bigint(20) NOT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`ID`, `fecha_registro`, `nota`, `observacion`, `dni_alumno`) VALUES
(2, '2022-03-20 15:39:52', '2', 'Observacion-1', 'a9'),
(3, '2022-03-20 15:39:52', '3', 'Observacion-2', 'a9'),
(6, '2022-03-20 15:39:52', '6', 'Observacion-5', 'a5'),
(8, '2022-03-20 15:39:52', '8', 'Observacion-7', 'a7'),
(9, '2022-04-02 17:12:25', '9', 'Observacion-8', 'a7'),
(11, '2022-03-20 15:53:09', '1', 'Observacion-0', 'a5'),
(12, '2022-03-20 15:53:09', '2', 'Observacion-1', 'a6'),
(21, '2022-04-02 17:33:46', '234', 'fffffffffffffffffffffffffffff', 'a3'),
(17, '2022-04-02 17:11:37', '7', 'Observacion-64dd', 'a7'),
(19, '2022-04-02 17:12:36', '9', 'Observacion-8', 'a3'),
(20, '2022-03-20 15:53:09', '10', 'Observacion-9', 'a7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INSERTAR_NOTICIAS`
--

CREATE TABLE `INSERTAR_NOTICIAS` (
  `id` bigint(20) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `nombre_noticia` varchar(255) DEFAULT NULL,
  `texto_noticia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insertar_noticias`
--

CREATE TABLE `insertar_noticias` (
  `id` bigint(20) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `nombre_noticia` varchar(255) DEFAULT NULL,
  `texto_noticia` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insertar_noticias`
--

INSERT INTO `insertar_noticias` (`id`, `creado_el`, `nombre_noticia`, `texto_noticia`) VALUES
(1, '2022-03-19 16:27:47', 'Nueva noticia-1', 'Lorem lorem 1'),
(2, '2022-03-19 16:27:47', 'Nueva noticia-2', 'Lorem lorem 2'),
(3, '2022-03-19 16:27:47', 'Nueva noticia-3', 'Lorem lorem 3'),
(4, '2022-03-19 16:27:47', 'Nueva noticia-4', 'Lorem lorem 4'),
(5, '2022-03-19 16:27:47', 'Nueva noticia-5', 'Lorem lorem 5'),
(6, '2022-03-19 16:27:47', 'Nueva noticia-6', 'Lorem lorem 6'),
(7, '2022-03-19 16:27:47', 'Nueva noticia-7', 'Lorem lorem 7'),
(8, '2022-03-19 16:27:47', 'Nueva noticia-8', 'Lorem lorem 8'),
(9, '2022-03-19 16:27:47', 'Nueva noticia-9', 'Lorem lorem 9'),
(10, '2022-03-19 16:28:23', 'Alhamdulillah ', 'Alhamdulillah');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insertar_oferta`
--

CREATE TABLE `insertar_oferta` (
  `id` bigint(20) NOT NULL,
  `ciudad_oferta` varchar(255) DEFAULT NULL,
  `descripcion_oferta` varchar(255) DEFAULT NULL,
  `empresa_oferta` varchar(255) DEFAULT NULL,
  `fecha_actual` varchar(255) DEFAULT NULL,
  `fecha_oferta` date DEFAULT NULL,
  `nombre_oferta` varchar(255) DEFAULT NULL,
  `referencia_oferta` varchar(255) DEFAULT NULL,
  `tipo_oferta` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(8, 'Ciudad-8', 'Descripcion-1238', 'Empresa-8', '2022-03-19 15:57:00', '2022-03-07', 'Oferta-8', 'Ref-8', 'Tipo-8'),
(9, 'Ciudad-9', 'Descripcion-1239', 'Empresa-9', '2022-03-19 15:57:00', '2022-03-08', 'Oferta-9', 'Ref-9', 'Tipo-9'),
(10, 'mohammed', 'mohammed', 'mohammed', '2022-03-19 15:59:24', '2022-03-23', 'mohammed', 'mohammed', 'mohammed'),
(11, 'sebti', 'sebti', 'sebti', '2022-03-19 16:05:53', '2024-03-23', 'sebti', 'sebti', 'sebti'),
(12, 'sebti', 'sebti', 'sebti', '2022-03-19 16:06:26', '2024-03-23', 'sebti', 'sebti', 'sebti'),
(14, 'Ciudad-1', 'Descripcion-1231', 'Empresa-1', '2022-03-19 16:08:16', '2022-02-28', 'Oferta-1', 'Ref-4', 'Tipo-1'),
(15, 'Ciudad-2', 'Descripcion-1232', 'Empresa-2', '2022-03-19 16:08:16', '2022-03-01', 'Oferta-2', 'Ref-5', 'Tipo-2'),
(16, 'Ciudad-3', 'Descripcion-1233', 'Empresa-3', '2022-03-19 16:08:16', '2022-03-02', 'Oferta-3', 'Ref-6', 'Tipo-3'),
(17, 'Ciudad-4', 'Descripcion-1234', 'Empresa-4', '2022-03-19 16:08:16', '2022-03-03', 'Oferta-4', 'Ref-7', 'Tipo-4'),
(18, 'Ciudad-5', 'Descripcion-1235', 'Empresa-5', '2022-03-19 16:08:16', '2022-03-04', 'Oferta-5', 'Ref-8', 'Tipo-5'),
(19, 'Ciudad-6', 'Descripcion-1236', 'Empresa-6', '2022-03-19 16:08:16', '2022-03-05', 'Oferta-6', 'Ref-9', 'Tipo-6'),
(20, 'Ciudad-7', 'Descripcion-1237', 'Empresa-7', '2022-03-19 16:08:16', '2022-03-06', 'Oferta-7', 'Ref-10', 'Tipo-7'),
(21, 'Ciudad-8', 'Descripcion-1238', 'Empresa-8', '2022-03-19 16:08:16', '2022-03-07', 'Oferta-8', 'Ref-11', 'Tipo-8'),
(22, 'Ciudad-9', 'Descripcion-1239', 'Empresa-9', '2022-03-19 16:08:16', '2022-03-08', 'Oferta-9', 'Ref-12', 'Tipo-9'),
(23, 'Alhamdulillah ', 'Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah ', 'Alhamdulillah ', '2022-03-19 16:29:10', '2047-03-20', 'Alhamdulillah ', 'Alhamdulillah ', 'Alhamdulillah ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `INSERTAR_OFERTA`
--

CREATE TABLE `INSERTAR_OFERTA` (
  `id` bigint(20) NOT NULL,
  `ciudad_oferta` varchar(255) DEFAULT NULL,
  `descripcion_oferta` varchar(255) DEFAULT NULL,
  `empresa_oferta` varchar(255) DEFAULT NULL,
  `fecha_actual` varchar(255) DEFAULT NULL,
  `fecha_oferta` date DEFAULT NULL,
  `nombre_oferta` varchar(255) DEFAULT NULL,
  `referencia_oferta` varchar(255) DEFAULT NULL,
  `tipo_oferta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `nombreLibro` varchar(50) DEFAULT NULL,
  `descripcionLibro` varchar(50) DEFAULT NULL,
  `autorLibro` varchar(50) DEFAULT NULL,
  `categoriaLibro` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `nombreLibro`, `descripcionLibro`, `autorLibro`, `categoriaLibro`) VALUES
(91, 'a', 'a', 'a', 'Drama'),
(2, 'Savages, The', 'Comedy|Drama', 'V8 Vantage', 'Ciencia Ficción'),
(3, 'Almost You', 'Comedy|Drama', 'Tacoma', 'Drama'),
(4, 'Charm School (Niñas mal)', 'Comedy', 'Tucson', 'Coches'),
(5, 'Madonna of the Seven Moons', 'Drama|Mystery', 'Tracer', 'Novela'),
(6, 'Three (a.k.a. 3 Extremes II) (Saam gaang)', 'Horror|Mystery', 'V40', 'df'),
(7, 'Hangover Square', 'Crime|Drama|Horror|Thriller', 'LX', 'Drama'),
(10, 'Cosmic Psychos: Blokes You Can Trust', 'Documentary|Musical', '3500', 'Drama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `materia` varchar(255) NOT NULL,
  `descripcion_materia` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  `dni_profesor` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`materia`, `descripcion_materia`, `fecha_creacion`, `ID`, `dni_profesor`) VALUES
('Diseño', 'Mejor materia del mundo0', '2022-03-20 15:02:45', 1401, '1'),
('HLC', 'Mejor materia del mundo07889', NULL, NULL, '11'),
('Despliegue', 'Mejor materia del mundo3', '2022-03-20 15:02:45', 1401, 'b'),
('Empresa', 'Mejor materia del mundo0', NULL, NULL, '11'),
('Programacion', 'ssaSDSSAMejor materia del mundo0', NULL, NULL, '111'),
('java2', 'Mejor materia del mundo0', '2022-04-02 12:25:51', NULL, '1'),
('Entorno cliente', 'Mejor materia del mundo055555', NULL, NULL, 'b'),
('Quimica', 'Quimica Organica', '2022-03-27 21:18:32', 1601, '111'),
('Fisica', 'Mejor materia del mundo0444444', NULL, NULL, 'b'),
('Electronica', 'Electronica detallada 234', NULL, NULL, '11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATERIA`
--

CREATE TABLE `MATERIA` (
  `materia` varchar(255) NOT NULL,
  `descripcion_materia` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL,
  `dni_profesor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_matricula`
--

CREATE TABLE `materia_matricula` (
  `Materia_materia` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia_matricula`
--

INSERT INTO `materia_matricula` (`Materia_materia`, `listaMatriculaciones_ID`) VALUES
('Despliegue', 2),
('Despliegue', 3),
('Despliegue', 4),
('Despliegue', 5),
('Despliegue', 11),
('Despliegue', 12),
('Despliegue', 15),
('Diseño', 1),
('Diseño', 4),
('Diseño', 6),
('Diseño', 9),
('Diseño', 13),
('Empresa', 18),
('Entorno cliente', 10),
('HLC', 14),
('HLC', 16),
('Programacion', 17),
('Programacion', 1451),
('Quimica', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATERIA_MATRICULA`
--

CREATE TABLE `MATERIA_MATRICULA` (
  `Materia_materia` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATRICULA`
--

CREATE TABLE `MATRICULA` (
  `ID` bigint(20) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre_matricula` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  `nombre_materia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `ID` bigint(20) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre_matricula` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  `nombre_materia` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matricula`
--

INSERT INTO `matricula` (`ID`, `creado_el`, `descripcion`, `nombre_matricula`, `dni_alumno`, `nombre_materia`) VALUES
(1, '2022-03-20 15:56:13', 'Descripcion matricula-1', 'Matricula-1', 'a4', 'Diseño'),
(2, '2022-03-20 15:56:13', 'Descripcion matricula-2', 'Matricula-2', 'a9', 'Despliegue'),
(3, '2022-04-02 21:07:05', 'Descripcion matricula-3', 'Matricula-3', 'a3', 'Fisica'),
(4, '2022-03-20 15:56:13', 'Descripcion matricula-4', 'Matricula-4', 'a1', 'Despliegue'),
(5, '2022-03-20 15:56:13', 'Descripcion matricula-5', 'Matricula-5', 'a7', 'Empresa'),
(6, '2022-03-20 15:56:13', 'Descripcion matricula-6', 'Matricula-6', 'a8', 'HLC'),
(10, '2022-04-02 21:23:41', 'matricula 19 matricula 19 matricula 19', 'matricula 19', 'a8', 'Quimica'),
(8, '2022-03-20 15:56:36', 'Descripcion matricula-1', 'Matricula-1', 'a1', 'Programacion'),
(9, '2022-04-02 21:07:25', 'Descripcion matricula-2', 'Matricula-2', 'a7', 'Programacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATRICULA_EVALUACION`
--

CREATE TABLE `MATRICULA_EVALUACION` (
  `Matricula_ID` bigint(20) NOT NULL,
  `listaEvaluaciones_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula_evaluacion`
--

CREATE TABLE `matricula_evaluacion` (
  `Matricula_ID` bigint(20) NOT NULL,
  `listaEvaluaciones_ID` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `NIVEL_INSTITUTO`
--

CREATE TABLE `NIVEL_INSTITUTO` (
  `nombre_nivel` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_instituto`
--

CREATE TABLE `nivel_instituto` (
  `nombre_nivel` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivel_instituto`
--

INSERT INTO `nivel_instituto` (`nombre_nivel`, `creado_el`, `ID`) VALUES
('Bachillerato', '2022-03-19 16:42:09', 1251),
('ESO', '2022-03-19 16:42:09', 1252),
('FPGS', '2022-03-19 16:42:09', 1253),
('Otros', '2022-04-02 12:24:21', 34588),
('Eso 2', '2022-04-02 12:19:42', 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PERFILES`
--

CREATE TABLE `PERFILES` (
  `perfil` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `PERFILES`
--

INSERT INTO `PERFILES` (`perfil`, `creado_el`, `ID`) VALUES
('administrador', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `perfil` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint(20) DEFAULT NULL
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
-- Estructura de tabla para la tabla `PERSONAL_NO_DOCENTE`
--

CREATE TABLE `PERSONAL_NO_DOCENTE` (
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
  `perfil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_no_docente`
--

CREATE TABLE `personal_no_docente` (
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
  `perfil` varchar(255) DEFAULT NULL
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
('1236', 'Sebti6', 'Sevilla', 'x6', 'Gines', 'a6@b.fr', '2022-02-05', '2022-03-19 14:48:19', 1101, 'mohamed6', 'España', '654321986', 'x6', 'Eletricidad', 'personal_no_docente'),
('1237', 'Sebti7', 'Sevilla', 'x7', 'Gines', 'a7@b.fr', '2022-02-06', '2022-03-19 14:48:19', 1101, 'mohamed7', 'España', '654321987', 'x7', 'Informatica', 'personal_no_docente'),
('1238', 'Sebti8', 'Sevilla', 'x8', 'Gines', 'a8@b.fr', '2022-02-07', '2022-03-19 14:48:19', 1101, 'mohamed8', 'España', '654321988', 'x8', 'Comercio', 'personal_no_docente'),
('1239', 'Sebti9', 'Sevilla', 'x9', 'Gines', 'a9@b.fr', '2022-02-08', '2022-03-19 14:48:19', 1101, 'mohamed9', 'España', '654321989', 'x9', 'Comercio', 'personal_no_docente'),
('mo', 'mo', 'mo', 'mo', 'momomomomomomo', 'msb.tesla@gmail.com', '2022-03-25', '2022-03-19 16:43:29', NULL, 'mo', 'mo', 'momo', 'mo', 'Quimica', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_alumnos`
--

CREATE TABLE `registrar_alumnos` (
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
  `nivel_alumno` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_alumnos`
--

INSERT INTO `registrar_alumnos` (`dni_alumno`, `calle_alumno`, `ciudad_alumno`, `cp_alumno`, `creado_el`, `email_alumno`, `fecha_nacimiento_alumno`, `genero`, `ID`, `imagen_alumno`, `nombre_alumno`, `pais_alumno`, `primer_apellido_alumno`, `segundo_apellido_alumno`, `telefono_alumno`, `nivel_alumno`) VALUES
('a1', 'Calle camas 1', 'Camas', '41222', '2022-03-19 14:11:22', 'a1@a.com', '2022-01-31', 'hombre', 751, 'logoInstituto.jpg', 'a1', 'España', 'a1', 'b1', '123456781', 'FPGS'),
('a2', 'Calle camas 2', 'Camas', '41222', '2022-03-19 14:11:22', 'a2@a.com', '2022-02-01', 'mujer', 751, 'logoInstituto.jpg', 'a2', 'España', 'a2', 'b2', '123456782', 'Bachillerato'),
('a3', 'Calle camas 3', 'Camas', '41222', '2022-03-19 14:11:22', 'a3@a.com', '2022-02-02', 'hombre', 751, 'logoInstituto.jpg', 'a3', 'España', 'a3', 'b3', '123456783', 'FPGS'),
('a4', 'Calle camas 4', 'Camas', '41222', '2022-03-19 14:11:22', 'a4@a.com', '2022-02-03', 'hombre', 751, 'logoInstituto.jpg', 'a4', 'España', 'a4', 'b4', '123456784', 'Bachillerato'),
('a5', 'Calle camas 5', 'Camas', '41222', '2022-03-19 14:11:22', 'a5@a.com', '2022-02-04', 'mujer', 751, 'logoInstituto.jpg', 'a5', 'España', 'a5', 'b5', '123456785', 'FPGS'),
('a6', 'Calle camas 6', 'Camas', '41222', '2022-03-19 14:11:22', 'a6@a.com', '2022-02-05', 'hombre', 751, 'logoInstituto.jpg', 'a6', 'España', 'a6', 'b6', '123456786', 'ESO'),
('a7', 'Calle camas 7', 'Camas', '41222', '2022-03-19 14:11:22', 'msb.tesla@gmail.com', '2022-02-06', 'hombre', 751, 'logoInstituto.jpg', 'a7', 'España', 'a7', 'b7', '123456787', 'FPGS'),
('a8', 'Calle camas 8', 'Camas', '41222', '2022-03-19 14:11:22', 'a8@a.com', '2022-02-07', 'hombre', 751, 'logoInstituto.jpg', 'a8', 'España', 'a8', 'b8', '123456788', 'FPGS'),
('a9', 'Calle camas 9', 'Camas', '41222', '2022-03-19 14:11:22', 'a9@a.com', '2022-02-08', 'hombre', 751, 'logoInstituto.jpg', 'a9', 'España', 'a9', 'b9', '123456789', 'ESO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REGISTRAR_ALUMNOS`
--

CREATE TABLE `REGISTRAR_ALUMNOS` (
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
  `nivel_alumno` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_alumnos_matricula`
--

CREATE TABLE `registrar_alumnos_matricula` (
  `Registrar_alumnos_dni_alumno` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_alumnos_matricula`
--

INSERT INTO `registrar_alumnos_matricula` (`Registrar_alumnos_dni_alumno`, `listaMatriculaciones_ID`) VALUES
('a1', 4),
('a1', 6),
('a1', 8),
('a1', 1451),
('a2', 3),
('a2', 9),
('a2', 18),
('a3', 2),
('a3', 3),
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
-- Estructura de tabla para la tabla `REGISTRAR_ALUMNOS_MATRICULA`
--

CREATE TABLE `REGISTRAR_ALUMNOS_MATRICULA` (
  `Registrar_alumnos_dni_alumno` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_usuarios`
--

CREATE TABLE `registrar_usuarios` (
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
  `perfil` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_usuarios`
--

INSERT INTO `registrar_usuarios` (`dni`, `apellidos`, `ciudad`, `clave`, `direccion`, `email`, `fecha`, `fecha_registro`, `ID`, `nombre`, `pais`, `telefono`, `usuario`, `departamento`, `perfil`) VALUES
('1', 'a', 'Sevilla', 'a', 'Camas', 'msb.caixa@gmail.com', '2022-01-22', '2022-03-19 13:10:12', 251, 'a', 'España', '123123123', 'a', 'Comercio', 'administrador'),
('11', 'aa', 'Sevilla', 'aa', 'Camas', 'a@a.com', '2022-02-22', '2022-03-19 13:14:04', 351, 'aa', 'Espaï¿½a', '123123123', 'aa', 'Nuevo', 'jefatura'),
('111', 'aaa', 'Sevilla', 'aaa', 'Camas', 'a@a.com', '2022-02-22', '2022-03-19 13:16:39', 452, 'aaabbb', 'Espaï¿½a', '123123123', 'aaa', 'Informatica', 'profesor'),
('b', 'b', 'b', 'b', 'bbbbb', 'msb.duck@gmail.com', '2022-03-16', '2022-03-19 16:09:52', NULL, 'b', 'b', '456789432', 'b', 'Quimica', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REGISTRAR_USUARIOS`
--

CREATE TABLE `REGISTRAR_USUARIOS` (
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
  `perfil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `REGISTRAR_USUARIOS`
--

INSERT INTO `REGISTRAR_USUARIOS` (`dni`, `apellidos`, `ciudad`, `clave`, `direccion`, `email`, `fecha`, `fecha_registro`, `ID`, `nombre`, `pais`, `telefono`, `usuario`, `departamento`, `perfil`) VALUES
('1', 'a', 'a', 'a', 'a', 'a', '2022-05-24', '2022-05-24', NULL, 'a', 'a', 'a', 'a', 'Comercio', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_usuarios_materia`
--

CREATE TABLE `registrar_usuarios_materia` (
  `Registrar_usuarios_dni` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_usuarios_materia`
--

INSERT INTO `registrar_usuarios_materia` (`Registrar_usuarios_dni`, `listaMaterias_materia`) VALUES
('1', 'Diseño'),
('1', 'java2'),
('11', 'Electronica'),
('11', 'Empresa'),
('11', 'Programacion'),
('111', 'Fisica'),
('111', 'Programacion'),
('111', 'Quimica'),
('b', 'Despliegue'),
('b', 'Entorno cliente'),
('b', 'Fisica'),
('b', 'HLC'),
('b', 'Programacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REGISTRAR_USUARIOS_MATERIA`
--

CREATE TABLE `REGISTRAR_USUARIOS_MATERIA` (
  `Registrar_usuarios_dni` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SEQUENCE`
--

CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `SEQUENCE`
--

INSERT INTO `SEQUENCE` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '2600');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SUBIDADOCUMENTO`
--

CREATE TABLE `SUBIDADOCUMENTO` (
  `ID` bigint(20) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `subida_documento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subidadocumento`
--

CREATE TABLE `subidadocumento` (
  `ID` bigint(20) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `subida_documento` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `subidadocumento`
--

INSERT INTO `subidadocumento` (`ID`, `creado_el`, `subida_documento`) VALUES
(2560, '2022-04-10 17:46:46', 'imagenes/Ã­ndicee.png'),
(2561, '2022-04-10 17:47:15', 'imagenes/Ã­ndice.png'),
(2562, '2022-04-13 14:19:32', 'imagenes/Ã­ndice.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(11, 'u', 'sebti74@gmail.com', 'u'),
(12, 'a', 'a', 'a'),
(13, 'v', 'v', 'vv');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria_libro`
--
ALTER TABLE `categoria_libro`
  ADD PRIMARY KEY (`categoria`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`curso`);

--
-- Indices de la tabla `CURSO`
--
ALTER TABLE `CURSO`
  ADD PRIMARY KEY (`curso`);

--
-- Indices de la tabla `curso_materia`
--
ALTER TABLE `curso_materia`
  ADD PRIMARY KEY (`Curso_curso`,`listaMaterias_materia`),
  ADD KEY `FK_CURSO_MATERIA_listaMaterias_materia` (`listaMaterias_materia`);

--
-- Indices de la tabla `CURSO_MATERIA`
--
ALTER TABLE `CURSO_MATERIA`
  ADD PRIMARY KEY (`Curso_curso`,`listaMaterias_materia`),
  ADD KEY `FK_CURSO_MATERIA_listaMaterias_materia` (`listaMaterias_materia`);

--
-- Indices de la tabla `curso_personal_no_docente`
--
ALTER TABLE `curso_personal_no_docente`
  ADD PRIMARY KEY (`Curso_curso`,`listaPersonalNoDocente_dni`),
  ADD KEY `CURSOPERSONAL_NO_DOCENTElistaPersonalNoDocente_dni` (`listaPersonalNoDocente_dni`);

--
-- Indices de la tabla `CURSO_PERSONAL_NO_DOCENTE`
--
ALTER TABLE `CURSO_PERSONAL_NO_DOCENTE`
  ADD PRIMARY KEY (`Curso_curso`,`listaPersonalNoDocente_dni`),
  ADD KEY `CURSOPERSONAL_NO_DOCENTElistaPersonalNoDocente_dni` (`listaPersonalNoDocente_dni`);

--
-- Indices de la tabla `DEPARTAMENTO_INSTITUTO`
--
ALTER TABLE `DEPARTAMENTO_INSTITUTO`
  ADD PRIMARY KEY (`nombre_departamento`);

--
-- Indices de la tabla `departamento_instituto`
--
ALTER TABLE `departamento_instituto`
  ADD PRIMARY KEY (`nombre_departamento`);

--
-- Indices de la tabla `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS`
--
ALTER TABLE `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS`
  ADD PRIMARY KEY (`Departamento_instituto_nombre_departamento`,`listaProfesores_dni`),
  ADD KEY `DPRTMENTOINSTITUTOREGISTRARUSUARIOSlstPrfesoresdni` (`listaProfesores_dni`);

--
-- Indices de la tabla `departamento_instituto_registrar_usuarios`
--
ALTER TABLE `departamento_instituto_registrar_usuarios`
  ADD PRIMARY KEY (`Departamento_instituto_nombre_departamento`,`listaProfesores_dni`),
  ADD KEY `DPRTMENTOINSTITUTOREGISTRARUSUARIOSlstPrfesoresdni` (`listaProfesores_dni`);

--
-- Indices de la tabla `EVALUACION`
--
ALTER TABLE `EVALUACION`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_EVALUACION_dni_alumno` (`dni_alumno`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_EVALUACION_dni_alumno` (`dni_alumno`);

--
-- Indices de la tabla `INSERTAR_NOTICIAS`
--
ALTER TABLE `INSERTAR_NOTICIAS`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insertar_noticias`
--
ALTER TABLE `insertar_noticias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `insertar_oferta`
--
ALTER TABLE `insertar_oferta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `INSERTAR_OFERTA`
--
ALTER TABLE `INSERTAR_OFERTA`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_libros_categoria` (`categoriaLibro`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`materia`),
  ADD KEY `FK_MATERIA_dni_profesor` (`dni_profesor`);

--
-- Indices de la tabla `MATERIA`
--
ALTER TABLE `MATERIA`
  ADD PRIMARY KEY (`materia`),
  ADD KEY `FK_MATERIA_dni_profesor` (`dni_profesor`);

--
-- Indices de la tabla `materia_matricula`
--
ALTER TABLE `materia_matricula`
  ADD PRIMARY KEY (`Materia_materia`,`listaMatriculaciones_ID`),
  ADD KEY `FK_MATERIA_MATRICULA_listaMatriculaciones_ID` (`listaMatriculaciones_ID`);

--
-- Indices de la tabla `MATERIA_MATRICULA`
--
ALTER TABLE `MATERIA_MATRICULA`
  ADD PRIMARY KEY (`Materia_materia`,`listaMatriculaciones_ID`),
  ADD KEY `FK_MATERIA_MATRICULA_listaMatriculaciones_ID` (`listaMatriculaciones_ID`);

--
-- Indices de la tabla `MATRICULA`
--
ALTER TABLE `MATRICULA`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MATRICULA_nombre_materia` (`nombre_materia`),
  ADD KEY `FK_MATRICULA_dni_alumno` (`dni_alumno`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_MATRICULA_nombre_materia` (`nombre_materia`),
  ADD KEY `FK_MATRICULA_dni_alumno` (`dni_alumno`);

--
-- Indices de la tabla `MATRICULA_EVALUACION`
--
ALTER TABLE `MATRICULA_EVALUACION`
  ADD PRIMARY KEY (`Matricula_ID`,`listaEvaluaciones_ID`),
  ADD KEY `FK_MATRICULA_EVALUACION_listaEvaluaciones_ID` (`listaEvaluaciones_ID`);

--
-- Indices de la tabla `matricula_evaluacion`
--
ALTER TABLE `matricula_evaluacion`
  ADD PRIMARY KEY (`Matricula_ID`,`listaEvaluaciones_ID`),
  ADD KEY `FK_MATRICULA_EVALUACION_listaEvaluaciones_ID` (`listaEvaluaciones_ID`);

--
-- Indices de la tabla `NIVEL_INSTITUTO`
--
ALTER TABLE `NIVEL_INSTITUTO`
  ADD PRIMARY KEY (`nombre_nivel`);

--
-- Indices de la tabla `nivel_instituto`
--
ALTER TABLE `nivel_instituto`
  ADD PRIMARY KEY (`nombre_nivel`);

--
-- Indices de la tabla `PERFILES`
--
ALTER TABLE `PERFILES`
  ADD PRIMARY KEY (`perfil`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`perfil`);

--
-- Indices de la tabla `PERSONAL_NO_DOCENTE`
--
ALTER TABLE `PERSONAL_NO_DOCENTE`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `FK_PERSONAL_NO_DOCENTE_perfil` (`perfil`),
  ADD KEY `FK_PERSONAL_NO_DOCENTE_departamento` (`departamento`);

--
-- Indices de la tabla `personal_no_docente`
--
ALTER TABLE `personal_no_docente`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `FK_PERSONAL_NO_DOCENTE_perfil` (`perfil`),
  ADD KEY `FK_PERSONAL_NO_DOCENTE_departamento` (`departamento`);

--
-- Indices de la tabla `registrar_alumnos`
--
ALTER TABLE `registrar_alumnos`
  ADD PRIMARY KEY (`dni_alumno`),
  ADD KEY `FK_REGISTRAR_ALUMNOS_nivel_alumno` (`nivel_alumno`);

--
-- Indices de la tabla `REGISTRAR_ALUMNOS`
--
ALTER TABLE `REGISTRAR_ALUMNOS`
  ADD PRIMARY KEY (`dni_alumno`),
  ADD KEY `FK_REGISTRAR_ALUMNOS_nivel_alumno` (`nivel_alumno`);

--
-- Indices de la tabla `registrar_alumnos_matricula`
--
ALTER TABLE `registrar_alumnos_matricula`
  ADD PRIMARY KEY (`Registrar_alumnos_dni_alumno`,`listaMatriculaciones_ID`),
  ADD KEY `REGISTRAR_ALUMNOS_MATRICULAlistaMatriculaciones_ID` (`listaMatriculaciones_ID`);

--
-- Indices de la tabla `REGISTRAR_ALUMNOS_MATRICULA`
--
ALTER TABLE `REGISTRAR_ALUMNOS_MATRICULA`
  ADD PRIMARY KEY (`Registrar_alumnos_dni_alumno`,`listaMatriculaciones_ID`),
  ADD KEY `REGISTRAR_ALUMNOS_MATRICULAlistaMatriculaciones_ID` (`listaMatriculaciones_ID`);

--
-- Indices de la tabla `registrar_usuarios`
--
ALTER TABLE `registrar_usuarios`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `FK_REGISTRAR_USUARIOS_perfil` (`perfil`),
  ADD KEY `FK_REGISTRAR_USUARIOS_departamento` (`departamento`);

--
-- Indices de la tabla `REGISTRAR_USUARIOS`
--
ALTER TABLE `REGISTRAR_USUARIOS`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `FK_REGISTRAR_USUARIOS_perfil` (`perfil`),
  ADD KEY `FK_REGISTRAR_USUARIOS_departamento` (`departamento`);

--
-- Indices de la tabla `registrar_usuarios_materia`
--
ALTER TABLE `registrar_usuarios_materia`
  ADD PRIMARY KEY (`Registrar_usuarios_dni`,`listaMaterias_materia`),
  ADD KEY `REGISTRAR_USUARIOS_MATERIA_listaMaterias_materia` (`listaMaterias_materia`);

--
-- Indices de la tabla `REGISTRAR_USUARIOS_MATERIA`
--
ALTER TABLE `REGISTRAR_USUARIOS_MATERIA`
  ADD PRIMARY KEY (`Registrar_usuarios_dni`,`listaMaterias_materia`),
  ADD KEY `REGISTRAR_USUARIOS_MATERIA_listaMaterias_materia` (`listaMaterias_materia`);

--
-- Indices de la tabla `SEQUENCE`
--
ALTER TABLE `SEQUENCE`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Indices de la tabla `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Indices de la tabla `SUBIDADOCUMENTO`
--
ALTER TABLE `SUBIDADOCUMENTO`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `subidadocumento`
--
ALTER TABLE `subidadocumento`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `EVALUACION`
--
ALTER TABLE `EVALUACION`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `INSERTAR_NOTICIAS`
--
ALTER TABLE `INSERTAR_NOTICIAS`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insertar_noticias`
--
ALTER TABLE `insertar_noticias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `insertar_oferta`
--
ALTER TABLE `insertar_oferta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `INSERTAR_OFERTA`
--
ALTER TABLE `INSERTAR_OFERTA`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `MATRICULA`
--
ALTER TABLE `MATRICULA`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `subidadocumento`
--
ALTER TABLE `subidadocumento`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2563;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CURSO_MATERIA`
--
ALTER TABLE `CURSO_MATERIA`
  ADD CONSTRAINT `FK_CURSO_MATERIA_Curso_curso` FOREIGN KEY (`Curso_curso`) REFERENCES `CURSO` (`curso`),
  ADD CONSTRAINT `FK_CURSO_MATERIA_listaMaterias_materia` FOREIGN KEY (`listaMaterias_materia`) REFERENCES `MATERIA` (`materia`);

--
-- Filtros para la tabla `CURSO_PERSONAL_NO_DOCENTE`
--
ALTER TABLE `CURSO_PERSONAL_NO_DOCENTE`
  ADD CONSTRAINT `CURSOPERSONAL_NO_DOCENTElistaPersonalNoDocente_dni` FOREIGN KEY (`listaPersonalNoDocente_dni`) REFERENCES `PERSONAL_NO_DOCENTE` (`dni`),
  ADD CONSTRAINT `FK_CURSO_PERSONAL_NO_DOCENTE_Curso_curso` FOREIGN KEY (`Curso_curso`) REFERENCES `CURSO` (`curso`);

--
-- Filtros para la tabla `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS`
--
ALTER TABLE `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS`
  ADD CONSTRAINT `DPRTMENTOINSTITUTOREGISTRARUSUARIOSlstPrfesoresdni` FOREIGN KEY (`listaProfesores_dni`) REFERENCES `REGISTRAR_USUARIOS` (`dni`),
  ADD CONSTRAINT `DPRTMNTNSTTTRGSTRRSARIOSDprtmntnstttnmbrdprtamento` FOREIGN KEY (`Departamento_instituto_nombre_departamento`) REFERENCES `DEPARTAMENTO_INSTITUTO` (`nombre_departamento`);

--
-- Filtros para la tabla `EVALUACION`
--
ALTER TABLE `EVALUACION`
  ADD CONSTRAINT `FK_EVALUACION_dni_alumno` FOREIGN KEY (`dni_alumno`) REFERENCES `REGISTRAR_ALUMNOS` (`dni_alumno`);

--
-- Filtros para la tabla `MATERIA`
--
ALTER TABLE `MATERIA`
  ADD CONSTRAINT `FK_MATERIA_dni_profesor` FOREIGN KEY (`dni_profesor`) REFERENCES `REGISTRAR_USUARIOS` (`dni`);

--
-- Filtros para la tabla `MATERIA_MATRICULA`
--
ALTER TABLE `MATERIA_MATRICULA`
  ADD CONSTRAINT `FK_MATERIA_MATRICULA_Materia_materia` FOREIGN KEY (`Materia_materia`) REFERENCES `MATERIA` (`materia`),
  ADD CONSTRAINT `FK_MATERIA_MATRICULA_listaMatriculaciones_ID` FOREIGN KEY (`listaMatriculaciones_ID`) REFERENCES `MATRICULA` (`ID`);

--
-- Filtros para la tabla `MATRICULA`
--
ALTER TABLE `MATRICULA`
  ADD CONSTRAINT `FK_MATRICULA_dni_alumno` FOREIGN KEY (`dni_alumno`) REFERENCES `REGISTRAR_ALUMNOS` (`dni_alumno`),
  ADD CONSTRAINT `FK_MATRICULA_nombre_materia` FOREIGN KEY (`nombre_materia`) REFERENCES `MATERIA` (`materia`);

--
-- Filtros para la tabla `MATRICULA_EVALUACION`
--
ALTER TABLE `MATRICULA_EVALUACION`
  ADD CONSTRAINT `FK_MATRICULA_EVALUACION_Matricula_ID` FOREIGN KEY (`Matricula_ID`) REFERENCES `MATRICULA` (`ID`),
  ADD CONSTRAINT `FK_MATRICULA_EVALUACION_listaEvaluaciones_ID` FOREIGN KEY (`listaEvaluaciones_ID`) REFERENCES `EVALUACION` (`ID`);

--
-- Filtros para la tabla `PERSONAL_NO_DOCENTE`
--
ALTER TABLE `PERSONAL_NO_DOCENTE`
  ADD CONSTRAINT `FK_PERSONAL_NO_DOCENTE_departamento` FOREIGN KEY (`departamento`) REFERENCES `DEPARTAMENTO_INSTITUTO` (`nombre_departamento`),
  ADD CONSTRAINT `FK_PERSONAL_NO_DOCENTE_perfil` FOREIGN KEY (`perfil`) REFERENCES `PERFILES` (`perfil`);

--
-- Filtros para la tabla `REGISTRAR_ALUMNOS`
--
ALTER TABLE `REGISTRAR_ALUMNOS`
  ADD CONSTRAINT `FK_REGISTRAR_ALUMNOS_nivel_alumno` FOREIGN KEY (`nivel_alumno`) REFERENCES `NIVEL_INSTITUTO` (`nombre_nivel`);

--
-- Filtros para la tabla `REGISTRAR_ALUMNOS_MATRICULA`
--
ALTER TABLE `REGISTRAR_ALUMNOS_MATRICULA`
  ADD CONSTRAINT `REGISTRARALUMNOSMATRICULARegistraralumnosdnialumno` FOREIGN KEY (`Registrar_alumnos_dni_alumno`) REFERENCES `REGISTRAR_ALUMNOS` (`dni_alumno`),
  ADD CONSTRAINT `REGISTRAR_ALUMNOS_MATRICULAlistaMatriculaciones_ID` FOREIGN KEY (`listaMatriculaciones_ID`) REFERENCES `MATRICULA` (`ID`);

--
-- Filtros para la tabla `REGISTRAR_USUARIOS`
--
ALTER TABLE `REGISTRAR_USUARIOS`
  ADD CONSTRAINT `FK_REGISTRAR_USUARIOS_departamento` FOREIGN KEY (`departamento`) REFERENCES `DEPARTAMENTO_INSTITUTO` (`nombre_departamento`),
  ADD CONSTRAINT `FK_REGISTRAR_USUARIOS_perfil` FOREIGN KEY (`perfil`) REFERENCES `PERFILES` (`perfil`);

--
-- Filtros para la tabla `REGISTRAR_USUARIOS_MATERIA`
--
ALTER TABLE `REGISTRAR_USUARIOS_MATERIA`
  ADD CONSTRAINT `REGISTRAR_USUARIOS_MATERIA_Registrar_usuarios_dni` FOREIGN KEY (`Registrar_usuarios_dni`) REFERENCES `REGISTRAR_USUARIOS` (`dni`),
  ADD CONSTRAINT `REGISTRAR_USUARIOS_MATERIA_listaMaterias_materia` FOREIGN KEY (`listaMaterias_materia`) REFERENCES `MATERIA` (`materia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
