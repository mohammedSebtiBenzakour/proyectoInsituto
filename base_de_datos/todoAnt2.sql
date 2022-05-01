-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-03-2022 a las 15:24:02
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
-- Estructura de tabla para la tabla `aniadir_curso`
--

DROP TABLE IF EXISTS `aniadir_curso`;
CREATE TABLE IF NOT EXISTS `aniadir_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `url` varchar(200) NOT NULL,
  `duracion` varchar(50) NOT NULL,
  `seccion` varchar(50) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  `se_inserto` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_secciont` (`id_seccion`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aniadir_curso`
--

INSERT INTO `aniadir_curso` (`id`, `titulo`, `descripcion`, `url`, `duracion`, `seccion`, `id_seccion`, `se_inserto`) VALUES
(1, 'java', 'java', 'java', '25:25', 'alhamdulillah', 3, '2022-01-27 09:24:54'),
(2, 'php', 'php', 'php', '25:25', 'lailaillaallah', 4, '2022-01-27 09:27:15'),
(4, 'aaaa', 'aaa', 'aaa', '25:25', 'Introducción', 6, '2022-01-27 10:55:15'),
(5, 'bbb', 'bbb', 'bbb', '25:25', 'Preparación del entorno', 7, '2022-01-27 10:55:53'),
(6, 'cccc', 'cccc', 'ccccc', '25:25', 'Manos a la obra', 8, '2022-01-27 10:56:19'),
(7, 'eeee', 'eee', 'eee', '25:25', 'SQL', 9, '2022-01-27 11:23:52'),
(8, 'nnnn', 'nnnn', 'nnn', '25:25', 'Nueva Seccion Oracle', 10, '2022-01-27 11:27:37'),
(9, 'mohammed', 'mmmm', 'mmmmm', '44:66', 'IntroducciÃ³n', 6, '2022-01-27 15:37:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(1, 'benzakour'),
(2, 'alfa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_id` (`c_id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `c_id`, `s_id`, `name`) VALUES
(1, 1, 1, 'Sevilla'),
(2, 1, 1, 'Jaen'),
(3, 1, 1, 'Malaga'),
(4, 1, 1, 'Cadiz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasebootstrap`
--

DROP TABLE IF EXISTS `clasebootstrap`;
CREATE TABLE IF NOT EXISTS `clasebootstrap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `confirmar_contraseña` varchar(50) NOT NULL,
  `imagen` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clasebootstrap`
--

INSERT INTO `clasebootstrap` (`id`, `nombre_usuario`, `email`, `password`, `confirmar_contraseña`, `imagen`) VALUES
(2, 'm', 'a@a.com', 'm', 'm', '1111.txt'),
(3, 's', 'a@a.com', 's', 's', '1111.txt'),
(6, 'z', 'z', 'z', 'z', 'msebti2gmail.png'),
(15, 'mohammed', 'a@a.com', 'mohammed', 'mohammed', '1111.txt'),
(1, 'a', 'a', 'a', 'a', 'mohammed foto dni 21 11 2019(1).jpg'),
(11, 'l', 'l', 'l', 'l', '1111.txt'),
(12, 't', 't', 't', 't', '1111.txt'),
(16, 'o', 'o', 'o', 'o', '1111.txt'),
(14, 'moha', 'moha', 'moha', 'moha', '1111.txt');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codigo` varchar(20) NOT NULL,
  `paterno` varchar(50) NOT NULL,
  `materno` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`codigo`, `paterno`, `materno`, `nombre`, `dni`, `ciudad`, `direccion`, `telefono`, `email`) VALUES
('1', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q'),
('2', '2', '2', '2', '2', '2', '2', '2', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`nombre`, `apellido`, `email`) VALUES
('q', 'q', 'q'),
('w', 'w', 'w'),
('simon', 'sim', 'a@a.com'),
('simon33', 'qqqqqqqq', 'sebti.benzakour.mohammed@iescamas.es'),
('simo', 'qqqqqqq', 'msb.caixa@gmail.com'),
('simon33', 'qqqqqqq', 'msb.duck@gmail.com'),
('simo', 'ss', 'a@a.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `comentarios` text NOT NULL,
  `hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `usuario`, `comentarios`, `hora`) VALUES
(5, 'a', 'xxxxxx', '2022-01-22 12:29:48'),
(6, 'a', 'dddddd', '2022-01-22 12:33:17'),
(7, 'a', 'vvvvvv', '2022-01-22 12:33:28'),
(8, 'a', 'fffffff', '2022-01-22 13:04:28'),
(9, 'a', 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facere, quia in doloribus. Laborum vel ex ducimus maiores,', '2022-01-22 13:07:31'),
(10, 'moha', 'dddddd', '2022-01-22 13:42:32'),
(11, 'moha', 'vvvvvvvvvvvvvvvvvvvvvv', '2022-01-22 13:43:10'),
(12, 'a', 'vbbnnmmmm', '2022-01-22 14:07:36'),
(13, 'a', 'dddd', '2022-01-22 21:01:43'),
(14, 'a', 'sebti', '2022-01-22 21:02:02'),
(15, 'a', 'ddsd', '2022-01-27 16:55:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

DROP TABLE IF EXISTS `contactos`;
CREATE TABLE IF NOT EXISTS `contactos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`id`, `nombre`, `telefono`, `correo`, `id_categoria`) VALUES
(1, 'mohammed', '1234', 'm@m.com', 1),
(2, 'simo', '1234', 's@s.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(150) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`c_id`, `c_name`) VALUES
(1, 'España'),
(2, 'Francia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dboalumno`
--

DROP TABLE IF EXISTS `dboalumno`;
CREATE TABLE IF NOT EXISTS `dboalumno` (
  `id_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) DEFAULT NULL,
  `apellido` varchar(55) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dboalumno`
--

INSERT INTO `dboalumno` (`id_alumno`, `nombre`, `apellido`, `edad`) VALUES
(1, 'a', 'a', 15),
(2, 'b', 'b', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dboencargado`
--

DROP TABLE IF EXISTS `dboencargado`;
CREATE TABLE IF NOT EXISTS `dboencargado` (
  `id_encargado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_encargado` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_encargado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dboencargado`
--

INSERT INTO `dboencargado` (`id_encargado`, `nombre_encargado`) VALUES
(1, 'c'),
(2, 'd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dbogrupo`
--

DROP TABLE IF EXISTS `dbogrupo`;
CREATE TABLE IF NOT EXISTS `dbogrupo` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_grupo` varchar(55) DEFAULT NULL,
  `id_encargado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_grupo`),
  KEY `fk_encargado` (`id_encargado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dbogrupo`
--

INSERT INTO `dbogrupo` (`id_grupo`, `nombre_grupo`, `id_encargado`) VALUES
(1, 'java 19', 1),
(2, 'java 20', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dbomatricula`
--

DROP TABLE IF EXISTS `dbomatricula`;
CREATE TABLE IF NOT EXISTS `dbomatricula` (
  `id_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `anio_matricula` varchar(50) DEFAULT NULL,
  `fecha_matricula` varchar(50) DEFAULT NULL,
  `id_alumno` int(11) DEFAULT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `fk_alumno` (`id_alumno`),
  KEY `fk_grupo` (`id_grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dbomatricula`
--

INSERT INTO `dbomatricula` (`id_matricula`, `anio_matricula`, `fecha_matricula`, `id_alumno`, `id_grupo`) VALUES
(1, '2019-12-12', '2020-01-01', 1, 1),
(2, '2019-12-13', '2020-01-02', 1, 2),
(7, '2029', '2327', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento_instituto`
--

DROP TABLE IF EXISTS `departamento_instituto`;
CREATE TABLE IF NOT EXISTS `departamento_instituto` (
  `nombre_departamento` varchar(50) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nombre_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento_instituto`
--

INSERT INTO `departamento_instituto` (`nombre_departamento`, `creado_el`) VALUES
('Comercio', '2022-02-03 11:22:29'),
('Electricidad', '2022-02-03 11:22:08'),
('Informatica', '2022-02-03 11:20:08');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insertar_noticias`
--

DROP TABLE IF EXISTS `insertar_noticias`;
CREATE TABLE IF NOT EXISTS `insertar_noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_noticia` varchar(50) NOT NULL,
  `texto_noticia` text NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insertar_noticias`
--

INSERT INTO `insertar_noticias` (`id`, `nombre_noticia`, `texto_noticia`, `creado_el`) VALUES
(1, 'Nueva noticia', 'This is the first item\'s accordion body. It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It\'s also worth noting that just about any HTML can go within the .accordion-body, though the transition does limit overflow.', '2022-02-16 16:24:54'),
(2, 'sss', 'ssss', '2022-02-16 16:50:02');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` double(10,2) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  `categoria` enum('juguetes','libros',',') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`id`, `nombre`, `precio`, `imagen`, `categoria`) VALUES
(1, 'BATMAN', 550.00, 'juguete01.jpg', 'juguetes'),
(2, 'capitan america', 260.00, 'juguete02.jpg', 'juguetes'),
(3, 'el principito', 300.00, 'libro01.jpg', 'libros'),
(4, 'el arte de amar', 350.00, 'libro02.jpg', 'libros'),
(5, 'thanos', 260.00, 'juguete03.jpg', 'juguetes'),
(6, 'misterio', 340.00, 'juguete04.jpg', 'juguetes'),
(7, 'shazam', 340.00, 'juguete05.jpg', 'juguetes'),
(8, 'stitch', 200.00, 'juguete06.jpg', 'juguetes');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `nombreLibro`, `descripcionLibro`, `autorLibro`, `categoriaLibro`) VALUES
(1, 'sebti', 'Action|Adventure|Crime|Thriller', 'Spirit', NULL),
(2, 'Savages, The', 'Comedy|Drama', 'V8 Vantage', 'Aston Martin'),
(3, 'Almost You', 'Comedy|Drama', 'Tacoma', 'Toyota'),
(4, 'Charm School (Niñas mal)', 'Comedy', 'Tucson', 'Hyundai'),
(5, 'Madonna of the Seven Moons', 'Drama|Mystery', 'Tracer', 'Mercury'),
(6, 'Three (a.k.a. 3 Extremes II) (Saam gaang)', 'Horror|Mystery', 'V40', 'Volvo'),
(7, 'Hangover Square', 'Crime|Drama|Horror|Thriller', 'LX', 'Lexus'),
(8, 'Mutiny on the Bounty', 'Adventure|Drama', 'S-Class', 'Mercedes-Benz'),
(9, 'Soulless', 'Comedy|Drama', 'iQ', 'Scion'),
(10, 'Cosmic Psychos: Blokes You Can Trust', 'Documentary|Musical', '3500', 'GMC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nombreCompleto` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`email`, `password`, `nombreCompleto`) VALUES
('q', 'q', 'Mohammed Sebti Benzakour '),
('ñ', 'ñ', 'Mohammed Sebti Benzakour con ñ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loginpdo`
--

DROP TABLE IF EXISTS `loginpdo`;
CREATE TABLE IF NOT EXISTS `loginpdo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `confirm_password` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT '2022-01-01',
  `archivo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `loginpdo`
--

INSERT INTO `loginpdo` (`id`, `nombre`, `apellidos`, `edad`, `telefono`, `usuario`, `email`, `password`, `confirm_password`, `genero`, `fecha`, `archivo`) VALUES
(29, 'moha', 'sebti', 47, '655-173-174', '11', 'msb.duck@gmail.com', '111111', '111111', 'Hombre', '2222-01-01', 'archivos/01-22-22-20-57-50-1111.txt'),
(28, 'moha', 'sebti', 47, '655-173-174', '11', 'msb.duck@gmail.com', '111111', '111111', 'Hombre', '2222-01-01', 'archivos/01-22-22-20-57-33-1111.txt'),
(26, 'moha', 'sebti', 47, '655-173-174', '11', 'msb.duck@gmail.com', '111111', '111111', 'Hombre', '2022-01-14', 'archivos/01-22-22-19-05-11-1111.txt'),
(27, 'moha', 'sebti', 4444, '655-173-174', '11', 'msb.duck@gmail.com', '111111', '111111', 'Hombre', '2222-01-01', 'archivos/01-22-22-19-19-30-luz.css'),
(30, 'simo', 'simo', 99, '99', NULL, NULL, NULL, NULL, NULL, '2022-01-23', 'archivos/01-23-22-08-24-57-1111.txt');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
CREATE TABLE IF NOT EXISTS `mascotas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `nombre`) VALUES
(1, 'perro'),
(2, 'gato'),
(3, 'tortuga'),
(4, 'ratón'),
(5, 'serpiente'),
(6, 'hamster'),
(7, 'perico'),
(8, 'conejo'),
(9, 'pez'),
(10, 'puerco'),
(11, 'caballo'),
(12, 'gallo'),
(13, 'cocodrilo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matric_alumno`
--

DROP TABLE IF EXISTS `matric_alumno`;
CREATE TABLE IF NOT EXISTS `matric_alumno` (
  `id_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  PRIMARY KEY (`id_alumno`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matric_alumno`
--

INSERT INTO `matric_alumno` (`id_alumno`, `nombre`, `apellido`) VALUES
(1, 'jose', 'mena'),
(2, 'maria belen', 'coreas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matric_grado`
--

DROP TABLE IF EXISTS `matric_grado`;
CREATE TABLE IF NOT EXISTS `matric_grado` (
  `id_grado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_grado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_grado`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matric_grado`
--

INSERT INTO `matric_grado` (`id_grado`, `nombre_grado`) VALUES
(1, 'primer grado'),
(2, 'segundo grado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matric_matricula`
--

DROP TABLE IF EXISTS `matric_matricula`;
CREATE TABLE IF NOT EXISTS `matric_matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_grado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alumno` (`id_alumno`),
  KEY `fk_grado` (`id_grado`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `matric_matricula`
--

INSERT INTO `matric_matricula` (`id`, `fecha`, `id_alumno`, `id_grado`) VALUES
(1, '2022-01-12', 1, 1),
(2, '2022-01-13', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_instituto`
--

DROP TABLE IF EXISTS `nivel_instituto`;
CREATE TABLE IF NOT EXISTS `nivel_instituto` (
  `nombre_nivel` varchar(50) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`nombre_nivel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivel_instituto`
--

INSERT INTO `nivel_instituto` (`nombre_nivel`, `creado_el`) VALUES
('ESO', '2022-02-03 11:31:56'),
('Bachillerato', '2022-02-03 11:31:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
CREATE TABLE IF NOT EXISTS `pelicula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `imagen` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `nombre`, `imagen`) VALUES
(1, 'avenger', 'poster01'),
(2, 'jurassic', 'poster02'),
(3, 'deadpool2', 'poster03'),
(4, 'solo', 'poster04'),
(5, 'los increibles 2', 'poster05'),
(6, 'ocean8', 'poster06'),
(7, 'blak panther', 'poster07'),
(8, 'tomb raider', 'poster08'),
(9, 'ready player one', 'poster09'),
(10, 'mision impossible', 'poster10'),
(11, 'pacific rim', 'poster11'),
(12, 'venom', 'poster12'),
(13, 'isla de perros', 'poster13'),
(14, 'ralph', 'poster14'),
(15, 'mamamia', 'poster15'),
(16, 'diario de una pasion', 'poster16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE IF NOT EXISTS `perfiles` (
  `perfil` varchar(50) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`perfil`),
  KEY `perfil` (`perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`perfil`, `creado_el`) VALUES
('', '2022-02-03 11:17:31'),
('administrador', '2022-02-02 18:14:47'),
('estudiante', '2022-02-02 18:14:55'),
('jefatura', '2022-02-02 18:14:55'),
('profesor', '2022-02-02 18:14:47'),
('prueba', '2022-02-02 18:15:22'),
('prueba1', '2022-02-02 18:20:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `id` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`) VALUES
('1', 'mohamed', 'sebti benzakour'),
('4', 'simon33', 'benzakour'),
('ddd', 'simon', 'dddd'),
('6', 'mohammed', 'benzakour'),
('2', 'mohammed', 'benzakour'),
('333', 'simon', 'fry');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personaconedad`
--

DROP TABLE IF EXISTS `personaconedad`;
CREATE TABLE IF NOT EXISTS `personaconedad` (
  `id` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `edad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personaconedad`
--

INSERT INTO `personaconedad` (`id`, `nombre`, `edad`) VALUES
('2', 'mohammed', 12),
('3', 'aa', 21),
('4', 'eee', 1),
('5', 'eeee', 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_no_docente`
--

DROP TABLE IF EXISTS `personal_no_docente`;
CREATE TABLE IF NOT EXISTS `personal_no_docente` (
  `dni` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `fecha` date NOT NULL DEFAULT '2022-01-01',
  `telefono` varchar(50) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal_no_docente`
--

INSERT INTO `personal_no_docente` (`dni`, `nombre`, `apellidos`, `usuario`, `clave`, `email`, `departamento`, `ciudad`, `pais`, `direccion`, `fecha`, `telefono`, `fecha_registro`) VALUES
('mohammed', 'simo', 'zzddddd', 'a', 'a', 'a@a.com', 'Electricidad', 'vv', 'zz', 'a', '2022-02-18', 'zzzdddd', '2022-02-06 18:20:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(90) NOT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produit`
--

INSERT INTO `produit` (`id`, `designation`, `prix`, `quantite`) VALUES
(1, 'moha', 33, 33),
(2, 'mohamed', 333333, 44),
(3, 'lev', 2900, 245),
(4, 'hp', 900, 45),
(5, 'eps', 1900, 145),
(6, 'lev', 2900, 245),
(7, 'hp', 900, 45),
(8, 'eps', 1900, 145),
(9, 'lev', 2900, 245),
(10, 'moha', 234, 234),
(25, 'moha', 0, 0);

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
  `telefono_alumno` varchar(50) NOT NULL,
  `nivel_alumno` varchar(50) NOT NULL,
  `calle_alumno` varchar(50) NOT NULL,
  `ciudad_alumno` varchar(50) NOT NULL,
  `cp_alumno` varchar(50) NOT NULL,
  `pais_alumno` varchar(50) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dni_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_alumnos`
--

INSERT INTO `registrar_alumnos` (`imagen_alumno`, `dni_alumno`, `nombre_alumno`, `primer_apellido_alumno`, `segundo_apellido_alumno`, `genero`, `fecha_nacimiento_alumno`, `email_alumno`, `telefono_alumno`, `nivel_alumno`, `calle_alumno`, `ciudad_alumno`, `cp_alumno`, `pais_alumno`, `creado_el`) VALUES
(0x6d6f68616d6d656420666f746f20646e6920323120313120323031392831292e6a7067, 'a', 'a', 'a', 'a', 'hombre', '2022-02-22', 'a@a.com', 'a', 'highschool', 'electrical', 'a', '4', 'a', '2022-02-02 21:00:30'),
(0x6d736562746932676d61696c2e706e67, 'b', 'sebti', 'b', 'b', 'otros', '2022-02-12', 'ac@a.com', '11111111', 'highschool', 'electrical', 'b', '2', 'b', '2022-02-02 21:21:46'),
(0x6d6f68616d6d656420666f746f20646e6920323120313120323031392831292e6a7067, 'm', 'mohammed', 'sebti', 'm', 'hombre', '2022-02-16', 'm@m.com', '999999', 'highschool', 'electrical', 'm', '1235', 'm', '2022-02-03 08:01:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrar_usuarios`
--

DROP TABLE IF EXISTS `registrar_usuarios`;
CREATE TABLE IF NOT EXISTS `registrar_usuarios` (
  `dni` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `perfil` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `fecha` date NOT NULL DEFAULT '2022-01-01',
  `telefono` varchar(50) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dni`),
  KEY `fk_perfil` (`perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registrar_usuarios`
--

INSERT INTO `registrar_usuarios` (`dni`, `nombre`, `apellidos`, `perfil`, `usuario`, `clave`, `email`, `departamento`, `ciudad`, `pais`, `direccion`, `fecha`, `telefono`, `fecha_registro`) VALUES
('1', 'a', 'a', 'administrador', 'a', 'a', 'a@a.com', 'Electricidad', '', '', '', '2022-01-01', '', '2022-02-02 10:30:19'),
('2', 'mohammed', 'mohammed', 'estudiante', 'mohammed', 'mohammed', 'aaa@gg.cog.ed', 'Electricidad', '', '', '', '2022-01-01', '1231231235', '2022-02-02 10:30:19'),
('3', 'b', 'b', 'jefatura', 'b', 'b', 'aaa@gg.cog.ed', 'Comercio', 'b', 'b', 'ssssssssssssssssssssssssssssssssssssssssssssss', '2022-02-11', 'b', '2022-02-02 10:45:19'),
('sebti', 'sebti', 'sebti', 'profesor', 'sebti', 'sebti', 'a@a.com', 'Comercio', 'sebti', 'sebti', 'sebti', '2022-03-05', '1231231235', '2022-02-03 19:50:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'admin'),
(2, 'colab');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_clase`
--

DROP TABLE IF EXISTS `seccion_clase`;
CREATE TABLE IF NOT EXISTS `seccion_clase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seccion` varchar(50) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion_clase`
--

INSERT INTO `seccion_clase` (`id`, `seccion`, `creado_el`) VALUES
(3, 'alhamdulillah', '2022-01-26 17:08:53'),
(4, 'lailaillaallah', '2022-01-26 17:36:20'),
(6, 'IntroducciÃ³n', '2022-01-27 09:50:21'),
(7, 'PreparaciÃ³n del entorno', '2022-01-27 09:50:51'),
(8, 'Manos a la obra', '2022-01-27 09:51:07'),
(9, 'SQL', '2022-01-27 16:36:13'),
(10, 'Nueva Seccion Oracle', '2022-01-27 17:05:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE IF NOT EXISTS `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_id_idx` (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `c_id`, `name`) VALUES
(1, 1, 'Andalucia'),
(2, 1, 'Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablacreada`
--

DROP TABLE IF EXISTS `tablacreada`;
CREATE TABLE IF NOT EXISTS `tablacreada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(100) NOT NULL,
  `completado` tinyint(1) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tablacreada`
--

INSERT INTO `tablacreada` (`id`, `texto`, `completado`, `timestamp`) VALUES
(42, 'subir video', 0, '2022-01-07 20:30:10'),
(41, 'mohammed', 0, '2022-01-06 19:11:31'),
(29, 'yyyy', 1, '2022-01-06 18:14:05'),
(40, 'hola', 0, '2022-01-06 19:11:28'),
(30, 'mohammed', 1, '2022-01-06 18:14:07'),
(33, 'yyyyfqfgfasaf', 1, '2022-01-06 18:47:32'),
(39, 'hola', 1, '2022-01-06 19:06:27'),
(32, 'mohammed', 1, '2022-01-06 18:16:35'),
(19, 'hola', 1, '2022-01-06 17:24:31'),
(45, 'llevar algo', 0, '2022-01-07 20:31:36'),
(44, 'llevar algo', 0, '2022-01-07 20:31:35'),
(20, 'beta', 1, '2022-01-06 17:24:39'),
(43, 'llevar algo', 0, '2022-01-07 20:31:34'),
(38, 'hola', 1, '2022-01-06 19:03:34'),
(27, 'mohammed', 1, '2022-01-06 18:10:02'),
(46, 'llevar algo', 0, '2022-01-07 20:31:47'),
(47, 'llevar algo', 0, '2022-01-07 20:31:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `nombre_usuario`, `password`) VALUES
(1, 'q', 'q', 'q'),
(2, 'a', 'a', 'a');

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
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
(8, 'mo', 'msb.tesla@gmail.com', 'msb'),
(9, 'h', 'msebti2@gmail.com', 'h'),
(10, 'j', 'sebti.benzakour.mohammed@iescamas.es', 'j'),
(11, 'u', 'sebti74@gmail.com', 'u'),
(12, 'a', 'a', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioslogin`
--

DROP TABLE IF EXISTS `usuarioslogin`;
CREATE TABLE IF NOT EXISTS `usuarioslogin` (
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarioslogin`
--

INSERT INTO `usuarioslogin` (`usuario`, `clave`) VALUES
('q', 'q'),
('s', 's'),
('z', 'z');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosroles`
--

DROP TABLE IF EXISTS `usuariosroles`;
CREATE TABLE IF NOT EXISTS `usuariosroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Ordenes_Tickets` (`rol_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuariosroles`
--

INSERT INTO `usuariosroles` (`id`, `username`, `password`, `rol_id`) VALUES
(1, 'a', 'a', 1),
(2, 'q', 'q', 2);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dbogrupo`
--
ALTER TABLE `dbogrupo`
  ADD CONSTRAINT `fk_encargado` FOREIGN KEY (`id_encargado`) REFERENCES `dboencargado` (`id_encargado`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
