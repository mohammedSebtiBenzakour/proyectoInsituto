-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-03-2022 a las 06:12:36
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
-- Base de datos: `usuarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE IF NOT EXISTS `reservas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `numero_comensales` int(11) NOT NULL,
  `numero_mesa` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `libre` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `fecha`, `hora`, `numero_comensales`, `numero_mesa`, `usuario`, `libre`) VALUES
(1, '2022-02-16', '21:30:00', 3, 2, 'aaaaaa', 1),
(2, '2022-02-16', '21:30:00', 3, 2, 'Francklyn', 1),
(3, '2022-02-16', '21:30:00', 3, 2, 'simone', 1),
(4, '2022-02-16', '21:30:00', 3, 2, '', 0),
(5, '2022-03-29', '17:09:46', 6, 5, 'sebtim', 1),
(6, '2022-03-13', '17:09:46', 6, 5, 'filipe', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `direccion` text,
  `movil` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `password`, `nombre`, `apellidos`, `fecha_nacimiento`, `sexo`, `direccion`, `movil`, `email`) VALUES
('Camey', 'Camey', 'Camey', 'Wanklyn', '2021-11-09', 'Male', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', '(351) 1233219', 'cwanklyn0@taobao.com'),
('Town', 'Town', 'Town', 'Laurencot', '2021-03-28', 'Female', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.', '(308) 8755579', 'tlaurencot1@upenn.edu'),
('Francklyn', 'Francklyn', 'Francklyn', 'Havesides', '2021-04-16', 'Female', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', '(858) 1102578', 'fhavesides2@cdc.gov'),
('Lydie', 'Lydie', 'Lydie', 'Jordin', '2022-02-04', 'Female', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', '(545) 5017058', 'ljordin3@noaa.gov'),
('Dasya', 'Dasya', 'Dasya', 'Ughini', '2021-09-30', 'Female', 'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', '(469) 5247402', 'dughini4@mapquest.com'),
('simone', 'simone', 'simone', 'simone', '2222-12-12', 'hombre', 'simonesimonesimonesimonesimonesimonesimonesimonesimone', '123456789', 'mysite@you.me.net'),
('filipe', 'filipe', 'filipe', 'filipe', '2222-12-12', 'hombre', 'filipefilipefilipefilipefilipefilipefilipefilipe', '123456789', 'mysite@you.me.net'),
('aaaaaa', 'aaaaaa', 'aaaaaaa', 'aaaaaaa', '2222-12-28', 'hombre', 'mohammedd sebti', '123456789', 'm@m.com'),
('sebtim', 'sebtim', 'sebtim', 'sebtim', '2222-12-12', 'hombre', 'sebtimsebtimsebtimsebtimsebtim', '123456789', 'mysite@you.me.net');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
