-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: instituto
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CURSO`
--

DROP TABLE IF EXISTS `CURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CURSO` (
  `curso` varchar(255) NOT NULL,
  `descripcion_curso` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURSO`
--

LOCK TABLES `CURSO` WRITE;
/*!40000 ALTER TABLE `CURSO` DISABLE KEYS */;
INSERT INTO `CURSO` VALUES ('2021-2022','Curso detallado - 1','2022-03-20 15:46:37',1),('2022-2023','Curso detallado - 2','2022-03-20 15:46:37',2),('2023-2024','Curso detallado - 3','2022-03-20 15:46:37',3),('2024-2025','Curso detallado - 4','2022-03-20 15:46:37',4),('2025-2026','Curso detallado - 5','2022-03-20 15:46:37',5),('2026-2027','Curso detallado - 6','2022-04-02 14:00:32',NULL),('2027-2028','Curso detallado - 7wwww','2022-04-02 13:54:26',NULL),('2030-2031','ddddddddddddd','2022-04-02 14:09:06',1952);
/*!40000 ALTER TABLE `CURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CURSO_MATERIA`
--

DROP TABLE IF EXISTS `CURSO_MATERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CURSO_MATERIA` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL,
  PRIMARY KEY (`Curso_curso`,`listaMaterias_materia`),
  KEY `FK_CURSO_MATERIA_listaMaterias_materia` (`listaMaterias_materia`),
  CONSTRAINT `FK_CURSO_MATERIA_Curso_curso` FOREIGN KEY (`Curso_curso`) REFERENCES `CURSO` (`curso`),
  CONSTRAINT `FK_CURSO_MATERIA_listaMaterias_materia` FOREIGN KEY (`listaMaterias_materia`) REFERENCES `MATERIA` (`materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURSO_MATERIA`
--

LOCK TABLES `CURSO_MATERIA` WRITE;
/*!40000 ALTER TABLE `CURSO_MATERIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CURSO_MATERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CURSO_PERSONAL_NO_DOCENTE`
--

DROP TABLE IF EXISTS `CURSO_PERSONAL_NO_DOCENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CURSO_PERSONAL_NO_DOCENTE` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaPersonalNoDocente_dni` varchar(255) NOT NULL,
  PRIMARY KEY (`Curso_curso`,`listaPersonalNoDocente_dni`),
  KEY `CURSOPERSONAL_NO_DOCENTElistaPersonalNoDocente_dni` (`listaPersonalNoDocente_dni`),
  CONSTRAINT `CURSOPERSONAL_NO_DOCENTElistaPersonalNoDocente_dni` FOREIGN KEY (`listaPersonalNoDocente_dni`) REFERENCES `PERSONAL_NO_DOCENTE` (`dni`),
  CONSTRAINT `FK_CURSO_PERSONAL_NO_DOCENTE_Curso_curso` FOREIGN KEY (`Curso_curso`) REFERENCES `CURSO` (`curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURSO_PERSONAL_NO_DOCENTE`
--

LOCK TABLES `CURSO_PERSONAL_NO_DOCENTE` WRITE;
/*!40000 ALTER TABLE `CURSO_PERSONAL_NO_DOCENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CURSO_PERSONAL_NO_DOCENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTAMENTO_INSTITUTO`
--

DROP TABLE IF EXISTS `DEPARTAMENTO_INSTITUTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPARTAMENTO_INSTITUTO` (
  `nombre_departamento` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`nombre_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTAMENTO_INSTITUTO`
--

LOCK TABLES `DEPARTAMENTO_INSTITUTO` WRITE;
/*!40000 ALTER TABLE `DEPARTAMENTO_INSTITUTO` DISABLE KEYS */;
INSERT INTO `DEPARTAMENTO_INSTITUTO` VALUES ('Comercio','2022-03-19 14:27:02',901),('Eletricidad','2022-03-19 14:27:02',902),('Fisica','2022-03-19 16:48:14',NULL),('Informatica','2022-03-19 14:27:02',903),('Nuevo','2022-04-08 10:42:58',NULL),('Q inorganica','2022-04-03 14:27:59',NULL),('Quimica','2022-03-19 14:27:02',904);
/*!40000 ALTER TABLE `DEPARTAMENTO_INSTITUTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS`
--

DROP TABLE IF EXISTS `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS` (
  `Departamento_instituto_nombre_departamento` varchar(255) NOT NULL,
  `listaProfesores_dni` varchar(255) NOT NULL,
  PRIMARY KEY (`Departamento_instituto_nombre_departamento`,`listaProfesores_dni`),
  KEY `DPRTMENTOINSTITUTOREGISTRARUSUARIOSlstPrfesoresdni` (`listaProfesores_dni`),
  CONSTRAINT `DPRTMENTOINSTITUTOREGISTRARUSUARIOSlstPrfesoresdni` FOREIGN KEY (`listaProfesores_dni`) REFERENCES `REGISTRAR_USUARIOS` (`dni`),
  CONSTRAINT `DPRTMNTNSTTTRGSTRRSARIOSDprtmntnstttnmbrdprtamento` FOREIGN KEY (`Departamento_instituto_nombre_departamento`) REFERENCES `DEPARTAMENTO_INSTITUTO` (`nombre_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS`
--

LOCK TABLES `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS` WRITE;
/*!40000 ALTER TABLE `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DEPARTAMENTO_INSTITUTO_REGISTRAR_USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVALUACION`
--

DROP TABLE IF EXISTS `EVALUACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVALUACION` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EVALUACION_dni_alumno` (`dni_alumno`),
  CONSTRAINT `FK_EVALUACION_dni_alumno` FOREIGN KEY (`dni_alumno`) REFERENCES `REGISTRAR_ALUMNOS` (`dni_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVALUACION`
--

LOCK TABLES `EVALUACION` WRITE;
/*!40000 ALTER TABLE `EVALUACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVALUACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSERTAR_NOTICIAS`
--

DROP TABLE IF EXISTS `INSERTAR_NOTICIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INSERTAR_NOTICIAS` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creado_el` varchar(255) DEFAULT NULL,
  `nombre_noticia` varchar(255) DEFAULT NULL,
  `texto_noticia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSERTAR_NOTICIAS`
--

LOCK TABLES `INSERTAR_NOTICIAS` WRITE;
/*!40000 ALTER TABLE `INSERTAR_NOTICIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `INSERTAR_NOTICIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSERTAR_OFERTA`
--

DROP TABLE IF EXISTS `INSERTAR_OFERTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INSERTAR_OFERTA` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ciudad_oferta` varchar(255) DEFAULT NULL,
  `descripcion_oferta` varchar(255) DEFAULT NULL,
  `empresa_oferta` varchar(255) DEFAULT NULL,
  `fecha_actual` varchar(255) DEFAULT NULL,
  `fecha_oferta` date DEFAULT NULL,
  `nombre_oferta` varchar(255) DEFAULT NULL,
  `referencia_oferta` varchar(255) DEFAULT NULL,
  `tipo_oferta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSERTAR_OFERTA`
--

LOCK TABLES `INSERTAR_OFERTA` WRITE;
/*!40000 ALTER TABLE `INSERTAR_OFERTA` DISABLE KEYS */;
/*!40000 ALTER TABLE `INSERTAR_OFERTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATERIA`
--

DROP TABLE IF EXISTS `MATERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATERIA` (
  `materia` varchar(255) NOT NULL,
  `descripcion_materia` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  `dni_profesor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`materia`),
  KEY `FK_MATERIA_dni_profesor` (`dni_profesor`),
  CONSTRAINT `FK_MATERIA_dni_profesor` FOREIGN KEY (`dni_profesor`) REFERENCES `REGISTRAR_USUARIOS` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATERIA`
--

LOCK TABLES `MATERIA` WRITE;
/*!40000 ALTER TABLE `MATERIA` DISABLE KEYS */;
INSERT INTO `MATERIA` VALUES ('Despliegue','Mejor materia del mundo3','2022-03-20 15:02:45',1401,'b'),('DiseÃ±o','Mejor materia del mundo0','2022-03-20 15:02:45',1401,'1'),('Electronica','Electronica detallada 234',NULL,NULL,'11'),('Empresa','Mejor materia del mundo0',NULL,NULL,'11'),('Entorno cliente','Mejor materia del mundo055555',NULL,NULL,'b'),('Fisica','Mejor materia del mundo0444444',NULL,NULL,'b'),('HLC','Mejor materia del mundo07889',NULL,NULL,'11'),('java2','Mejor materia del mundo0','2022-04-02 12:25:51',NULL,'1'),('Programacion','ssaSDSSAMejor materia del mundo0',NULL,NULL,'111'),('Quimica','Quimica Organica','2022-03-27 21:18:32',1601,'111');
/*!40000 ALTER TABLE `MATERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATERIA_MATRICULA`
--

DROP TABLE IF EXISTS `MATERIA_MATRICULA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATERIA_MATRICULA` (
  `Materia_materia` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint NOT NULL,
  PRIMARY KEY (`Materia_materia`,`listaMatriculaciones_ID`),
  KEY `FK_MATERIA_MATRICULA_listaMatriculaciones_ID` (`listaMatriculaciones_ID`),
  CONSTRAINT `FK_MATERIA_MATRICULA_listaMatriculaciones_ID` FOREIGN KEY (`listaMatriculaciones_ID`) REFERENCES `MATRICULA` (`ID`),
  CONSTRAINT `FK_MATERIA_MATRICULA_Materia_materia` FOREIGN KEY (`Materia_materia`) REFERENCES `MATERIA` (`materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATERIA_MATRICULA`
--

LOCK TABLES `MATERIA_MATRICULA` WRITE;
/*!40000 ALTER TABLE `MATERIA_MATRICULA` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATERIA_MATRICULA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATRICULA`
--

DROP TABLE IF EXISTS `MATRICULA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATRICULA` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `creado_el` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre_matricula` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  `nombre_materia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MATRICULA_nombre_materia` (`nombre_materia`),
  KEY `FK_MATRICULA_dni_alumno` (`dni_alumno`),
  CONSTRAINT `FK_MATRICULA_dni_alumno` FOREIGN KEY (`dni_alumno`) REFERENCES `REGISTRAR_ALUMNOS` (`dni_alumno`),
  CONSTRAINT `FK_MATRICULA_nombre_materia` FOREIGN KEY (`nombre_materia`) REFERENCES `MATERIA` (`materia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATRICULA`
--

LOCK TABLES `MATRICULA` WRITE;
/*!40000 ALTER TABLE `MATRICULA` DISABLE KEYS */;
INSERT INTO `MATRICULA` VALUES (1,'2022-03-20 15:56:13','Descripcion matricula-1','Matricula-1','a4','DiseÃ±o'),(2,'2022-03-20 15:56:13','Descripcion matricula-2','Matricula-2','a9','Despliegue'),(3,'2022-04-02 21:07:05','Descripcion matricula-3','Matricula-3','a3','Fisica'),(4,'2022-03-20 15:56:13','Descripcion matricula-4','Matricula-4','a1','Despliegue'),(5,'2022-03-20 15:56:13','Descripcion matricula-5','Matricula-5','a7','Empresa'),(6,'2022-03-20 15:56:13','Descripcion matricula-6','Matricula-6','a8','HLC'),(8,'2022-03-20 15:56:36','Descripcion matricula-1','Matricula-1','a1','Programacion'),(9,'2022-04-02 21:07:25','Descripcion matricula-2','Matricula-2','a7','Programacion'),(10,'2022-04-02 21:23:41','matricula 19 matricula 19 matricula 19','matricula 19','a8','Quimica');
/*!40000 ALTER TABLE `MATRICULA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATRICULA_EVALUACION`
--

DROP TABLE IF EXISTS `MATRICULA_EVALUACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATRICULA_EVALUACION` (
  `Matricula_ID` bigint NOT NULL,
  `listaEvaluaciones_ID` bigint NOT NULL,
  PRIMARY KEY (`Matricula_ID`,`listaEvaluaciones_ID`),
  KEY `FK_MATRICULA_EVALUACION_listaEvaluaciones_ID` (`listaEvaluaciones_ID`),
  CONSTRAINT `FK_MATRICULA_EVALUACION_listaEvaluaciones_ID` FOREIGN KEY (`listaEvaluaciones_ID`) REFERENCES `EVALUACION` (`ID`),
  CONSTRAINT `FK_MATRICULA_EVALUACION_Matricula_ID` FOREIGN KEY (`Matricula_ID`) REFERENCES `MATRICULA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATRICULA_EVALUACION`
--

LOCK TABLES `MATRICULA_EVALUACION` WRITE;
/*!40000 ALTER TABLE `MATRICULA_EVALUACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATRICULA_EVALUACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NIVEL_INSTITUTO`
--

DROP TABLE IF EXISTS `NIVEL_INSTITUTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NIVEL_INSTITUTO` (
  `nombre_nivel` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`nombre_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NIVEL_INSTITUTO`
--

LOCK TABLES `NIVEL_INSTITUTO` WRITE;
/*!40000 ALTER TABLE `NIVEL_INSTITUTO` DISABLE KEYS */;
INSERT INTO `NIVEL_INSTITUTO` VALUES ('Bachillerato','2022-03-19 16:42:09',1251),('ESO','2022-03-19 16:42:09',1252),('Eso 2','2022-04-02 12:19:42',123),('FPGS','2022-03-19 16:42:09',1253),('Otros','2022-04-02 12:24:21',34588);
/*!40000 ALTER TABLE `NIVEL_INSTITUTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFILES`
--

DROP TABLE IF EXISTS `PERFILES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERFILES` (
  `perfil` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFILES`
--

LOCK TABLES `PERFILES` WRITE;
/*!40000 ALTER TABLE `PERFILES` DISABLE KEYS */;
INSERT INTO `PERFILES` VALUES ('administrador','2022-03-19 12:27:49',51),('estudiante','2022-03-19 12:27:49',52),('jefatura','2022-03-19 12:27:49',53),('otro','2022-04-03 12:22:29',NULL),('otro2','2022-04-03 12:23:57',NULL),('personal_no_docente','2022-03-19 14:43:20',1005),('profesor','2022-03-19 12:27:49',54);
/*!40000 ALTER TABLE `PERFILES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSONAL_NO_DOCENTE`
--

DROP TABLE IF EXISTS `PERSONAL_NO_DOCENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERSONAL_NO_DOCENTE` (
  `dni` varchar(255) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK_PERSONAL_NO_DOCENTE_perfil` (`perfil`),
  KEY `FK_PERSONAL_NO_DOCENTE_departamento` (`departamento`),
  CONSTRAINT `FK_PERSONAL_NO_DOCENTE_departamento` FOREIGN KEY (`departamento`) REFERENCES `DEPARTAMENTO_INSTITUTO` (`nombre_departamento`),
  CONSTRAINT `FK_PERSONAL_NO_DOCENTE_perfil` FOREIGN KEY (`perfil`) REFERENCES `PERFILES` (`perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSONAL_NO_DOCENTE`
--

LOCK TABLES `PERSONAL_NO_DOCENTE` WRITE;
/*!40000 ALTER TABLE `PERSONAL_NO_DOCENTE` DISABLE KEYS */;
INSERT INTO `PERSONAL_NO_DOCENTE` VALUES ('1231','Sebti1','Sevilla','x1','Gines','a1@b.fr','2022-01-31','2022-03-19 14:48:19',1101,'mohamed1','EspaÃ±a','654321981','x1','Comercio','personal_no_docente'),('1232','Sebti2','Sevilla','x2','Gines','a2@b.fr','2022-02-01','2022-03-19 14:48:19',1101,'mohamed2','EspaÃ±a','654321982','x2','Eletricidad','personal_no_docente'),('1233','Sebti3','Sevilla','x3','Gines','a3@b.fr','2022-02-02','2022-03-19 14:48:19',1101,'mohamed3','EspaÃ±a','654321983','x3','Eletricidad','personal_no_docente'),('1234','Sebti4','Sevilla','x4','Gines','a4@b.fr','2022-02-03','2022-03-19 14:48:19',1101,'mohamed4','EspaÃ±a','654321984','x4','Eletricidad','personal_no_docente'),('1235','Sebti5','Sevilla','x5','Gines','a5@b.fr','2022-02-04','2022-03-19 14:48:19',1101,'mohamed5','EspaÃ±a','654321985','x5','Comercio','personal_no_docente'),('1236','Sebti6','Sevilla','x6','Gines','a6@b.fr','2022-02-05','2022-03-19 14:48:19',1101,'mohamed6','EspaÃ±a','654321986','x6','Eletricidad','personal_no_docente'),('1237','Sebti7','Sevilla','x7','Gines','a7@b.fr','2022-02-06','2022-03-19 14:48:19',1101,'mohamed7','EspaÃ±a','654321987','x7','Informatica','personal_no_docente'),('1238','Sebti8','Sevilla','x8','Gines','a8@b.fr','2022-02-07','2022-03-19 14:48:19',1101,'mohamed8','EspaÃ±a','654321988','x8','Comercio','personal_no_docente'),('1239','Sebti9','Sevilla','x9','Gines','a9@b.fr','2022-02-08','2022-03-19 14:48:19',1101,'mohamed9','EspaÃ±a','654321989','x9','Comercio','personal_no_docente'),('mo','mo','mo','mo','momomomomomomo','msb.tesla@gmail.com','2022-03-25','2022-03-19 16:43:29',NULL,'mo','mo','momo','mo','Quimica',NULL);
/*!40000 ALTER TABLE `PERSONAL_NO_DOCENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTRAR_ALUMNOS`
--

DROP TABLE IF EXISTS `REGISTRAR_ALUMNOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REGISTRAR_ALUMNOS` (
  `dni_alumno` varchar(255) NOT NULL,
  `calle_alumno` varchar(255) DEFAULT NULL,
  `ciudad_alumno` varchar(255) DEFAULT NULL,
  `cp_alumno` varchar(255) DEFAULT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `email_alumno` varchar(255) DEFAULT NULL,
  `fecha_nacimiento_alumno` date DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  `imagen_alumno` longtext,
  `nombre_alumno` varchar(255) DEFAULT NULL,
  `pais_alumno` varchar(255) DEFAULT NULL,
  `primer_apellido_alumno` varchar(255) DEFAULT NULL,
  `segundo_apellido_alumno` varchar(255) DEFAULT NULL,
  `telefono_alumno` varchar(255) DEFAULT NULL,
  `nivel_alumno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni_alumno`),
  KEY `FK_REGISTRAR_ALUMNOS_nivel_alumno` (`nivel_alumno`),
  CONSTRAINT `FK_REGISTRAR_ALUMNOS_nivel_alumno` FOREIGN KEY (`nivel_alumno`) REFERENCES `NIVEL_INSTITUTO` (`nombre_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTRAR_ALUMNOS`
--

LOCK TABLES `REGISTRAR_ALUMNOS` WRITE;
/*!40000 ALTER TABLE `REGISTRAR_ALUMNOS` DISABLE KEYS */;
INSERT INTO `REGISTRAR_ALUMNOS` VALUES ('a1','Calle camas 1','Camas','41222','2022-03-19 14:11:22','a1@a.com','2022-01-31','hombre',751,'logoInstituto.jpg','a1','EspaÃ±a','a1','b1','123456781','FPGS'),('a2','Calle camas 2','Camas','41222','2022-03-19 14:11:22','a2@a.com','2022-02-01','mujer',751,'logoInstituto.jpg','a2','EspaÃ±a','a2','b2','123456782','Bachillerato'),('a3','Calle camas 3','Camas','41222','2022-03-19 14:11:22','a3@a.com','2022-02-02','hombre',751,'logoInstituto.jpg','a3','EspaÃ±a','a3','b3','123456783','FPGS'),('a4','Calle camas 4','Camas','41222','2022-03-19 14:11:22','a4@a.com','2022-02-03','hombre',751,'logoInstituto.jpg','a4','EspaÃ±a','a4','b4','123456784','Bachillerato'),('a5','Calle camas 5','Camas','41222','2022-03-19 14:11:22','a5@a.com','2022-02-04','mujer',751,'logoInstituto.jpg','a5','EspaÃ±a','a5','b5','123456785','FPGS'),('a6','Calle camas 6','Camas','41222','2022-03-19 14:11:22','a6@a.com','2022-02-05','hombre',751,'logoInstituto.jpg','a6','EspaÃ±a','a6','b6','123456786','ESO'),('a7','Calle camas 7','Camas','41222','2022-03-19 14:11:22','msb.tesla@gmail.com','2022-02-06','hombre',751,'logoInstituto.jpg','a7','EspaÃ±a','a7','b7','123456787','FPGS'),('a8','Calle camas 8','Camas','41222','2022-03-19 14:11:22','a8@a.com','2022-02-07','hombre',751,'logoInstituto.jpg','a8','EspaÃ±a','a8','b8','123456788','FPGS'),('a9','Calle camas 9','Camas','41222','2022-03-19 14:11:22','a9@a.com','2022-02-08','hombre',751,'logoInstituto.jpg','a9','EspaÃ±a','a9','b9','123456789','ESO');
/*!40000 ALTER TABLE `REGISTRAR_ALUMNOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTRAR_ALUMNOS_MATRICULA`
--

DROP TABLE IF EXISTS `REGISTRAR_ALUMNOS_MATRICULA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REGISTRAR_ALUMNOS_MATRICULA` (
  `Registrar_alumnos_dni_alumno` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint NOT NULL,
  PRIMARY KEY (`Registrar_alumnos_dni_alumno`,`listaMatriculaciones_ID`),
  KEY `REGISTRAR_ALUMNOS_MATRICULAlistaMatriculaciones_ID` (`listaMatriculaciones_ID`),
  CONSTRAINT `REGISTRAR_ALUMNOS_MATRICULAlistaMatriculaciones_ID` FOREIGN KEY (`listaMatriculaciones_ID`) REFERENCES `MATRICULA` (`ID`),
  CONSTRAINT `REGISTRARALUMNOSMATRICULARegistraralumnosdnialumno` FOREIGN KEY (`Registrar_alumnos_dni_alumno`) REFERENCES `REGISTRAR_ALUMNOS` (`dni_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTRAR_ALUMNOS_MATRICULA`
--

LOCK TABLES `REGISTRAR_ALUMNOS_MATRICULA` WRITE;
/*!40000 ALTER TABLE `REGISTRAR_ALUMNOS_MATRICULA` DISABLE KEYS */;
/*!40000 ALTER TABLE `REGISTRAR_ALUMNOS_MATRICULA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTRAR_USUARIOS`
--

DROP TABLE IF EXISTS `REGISTRAR_USUARIOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REGISTRAR_USUARIOS` (
  `dni` varchar(255) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `perfil` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `FK_REGISTRAR_USUARIOS_perfil` (`perfil`),
  KEY `FK_REGISTRAR_USUARIOS_departamento` (`departamento`),
  CONSTRAINT `FK_REGISTRAR_USUARIOS_departamento` FOREIGN KEY (`departamento`) REFERENCES `DEPARTAMENTO_INSTITUTO` (`nombre_departamento`),
  CONSTRAINT `FK_REGISTRAR_USUARIOS_perfil` FOREIGN KEY (`perfil`) REFERENCES `PERFILES` (`perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTRAR_USUARIOS`
--

LOCK TABLES `REGISTRAR_USUARIOS` WRITE;
/*!40000 ALTER TABLE `REGISTRAR_USUARIOS` DISABLE KEYS */;
INSERT INTO `REGISTRAR_USUARIOS` VALUES ('1','a','Sevilla','a','Camas','msb.caixa@gmail.com','2022-01-22','2022-03-19 13:10:12',251,'a','EspaÃ±a','123123123','a','Comercio','administrador'),('11','aa','Sevilla','aa','Camas','a@a.com','2022-02-22','2022-03-19 13:14:04',351,'aa','EspaÃ¯Â¿Â½a','123123123','aa','Nuevo','jefatura'),('111','aaa','Sevilla','aaa','Camas','a@a.com','2022-02-22','2022-03-19 13:16:39',452,'aaabbb','EspaÃ¯Â¿Â½a','123123123','aaa','Informatica','profesor'),('b','b','b','b','bbbbb','msb.duck@gmail.com','2022-03-16','2022-03-19 16:09:52',NULL,'b','b','456789432','b','Quimica',NULL);
/*!40000 ALTER TABLE `REGISTRAR_USUARIOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REGISTRAR_USUARIOS_MATERIA`
--

DROP TABLE IF EXISTS `REGISTRAR_USUARIOS_MATERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REGISTRAR_USUARIOS_MATERIA` (
  `Registrar_usuarios_dni` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL,
  PRIMARY KEY (`Registrar_usuarios_dni`,`listaMaterias_materia`),
  KEY `REGISTRAR_USUARIOS_MATERIA_listaMaterias_materia` (`listaMaterias_materia`),
  CONSTRAINT `REGISTRAR_USUARIOS_MATERIA_listaMaterias_materia` FOREIGN KEY (`listaMaterias_materia`) REFERENCES `MATERIA` (`materia`),
  CONSTRAINT `REGISTRAR_USUARIOS_MATERIA_Registrar_usuarios_dni` FOREIGN KEY (`Registrar_usuarios_dni`) REFERENCES `REGISTRAR_USUARIOS` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTRAR_USUARIOS_MATERIA`
--

LOCK TABLES `REGISTRAR_USUARIOS_MATERIA` WRITE;
/*!40000 ALTER TABLE `REGISTRAR_USUARIOS_MATERIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `REGISTRAR_USUARIOS_MATERIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEQUENCE`
--

DROP TABLE IF EXISTS `SEQUENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE`
--

LOCK TABLES `SEQUENCE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE` DISABLE KEYS */;
INSERT INTO `SEQUENCE` VALUES ('SEQ_GEN',0);
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUBIDADOCUMENTO`
--

DROP TABLE IF EXISTS `SUBIDADOCUMENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUBIDADOCUMENTO` (
  `ID` bigint NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `subida_documento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUBIDADOCUMENTO`
--

LOCK TABLES `SUBIDADOCUMENTO` WRITE;
/*!40000 ALTER TABLE `SUBIDADOCUMENTO` DISABLE KEYS */;
INSERT INTO `SUBIDADOCUMENTO` VALUES (2560,'2022-04-10 17:46:46','imagenes/ÃƒÂ­ndicee.png'),(2561,'2022-04-10 17:47:15','imagenes/ÃƒÂ­ndice.png'),(2562,'2022-04-13 14:19:32','imagenes/ÃƒÂ­ndice.png');
/*!40000 ALTER TABLE `SUBIDADOCUMENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_libro`
--

DROP TABLE IF EXISTS `categoria_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_libro` (
  `categoria` varchar(200) NOT NULL,
  `creado_el` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_libro`
--

LOCK TABLES `categoria_libro` WRITE;
/*!40000 ALTER TABLE `categoria_libro` DISABLE KEYS */;
INSERT INTO `categoria_libro` VALUES ('Novela','2022-04-12 11:07:12'),('Ciencia Ficción','2022-04-12 11:07:12'),('Drama','2022-04-12 11:08:09'),('Programming & Development','2022-04-12 11:08:09'),('Coches','2022-04-12 11:08:09'),('oooo','2022-04-12 12:11:11'),('sa','2022-04-13 07:26:47'),('ds','2022-04-13 07:29:02'),('df','2022-04-13 07:29:24'),('cdx','2022-04-13 07:33:38'),('asdfgh','2022-04-13 10:02:26'),('xcxcxcxcx','2022-04-13 10:27:29');
/*!40000 ALTER TABLE `categoria_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `curso` varchar(255) NOT NULL,
  `descripcion_curso` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`curso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES ('2021-2022','Curso detallado - 1','2022-03-20 15:46:37',1),('2022-2023','Curso detallado - 2','2022-03-20 15:46:37',2),('2023-2024','Curso detallado - 3','2022-03-20 15:46:37',3),('2024-2025','Curso detallado - 4','2022-03-20 15:46:37',4),('2025-2026','Curso detallado - 5','2022-03-20 15:46:37',5),('2026-2027','Curso detallado - 6','2022-04-02 14:00:32',NULL),('2027-2028','Curso detallado - 7wwww','2022-04-02 13:54:26',NULL),('2030-2031','ddddddddddddd','2022-04-02 14:09:06',1952);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_materia`
--

DROP TABLE IF EXISTS `curso_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_materia` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL,
  PRIMARY KEY (`Curso_curso`,`listaMaterias_materia`),
  KEY `FK_CURSO_MATERIA_listaMaterias_materia` (`listaMaterias_materia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_materia`
--

LOCK TABLES `curso_materia` WRITE;
/*!40000 ALTER TABLE `curso_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_personal_no_docente`
--

DROP TABLE IF EXISTS `curso_personal_no_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_personal_no_docente` (
  `Curso_curso` varchar(255) NOT NULL,
  `listaPersonalNoDocente_dni` varchar(255) NOT NULL,
  PRIMARY KEY (`Curso_curso`,`listaPersonalNoDocente_dni`),
  KEY `CURSOPERSONAL_NO_DOCENTElistaPersonalNoDocente_dni` (`listaPersonalNoDocente_dni`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_personal_no_docente`
--

LOCK TABLES `curso_personal_no_docente` WRITE;
/*!40000 ALTER TABLE `curso_personal_no_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_personal_no_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento_instituto`
--

DROP TABLE IF EXISTS `departamento_instituto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento_instituto` (
  `nombre_departamento` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`nombre_departamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento_instituto`
--

LOCK TABLES `departamento_instituto` WRITE;
/*!40000 ALTER TABLE `departamento_instituto` DISABLE KEYS */;
INSERT INTO `departamento_instituto` VALUES ('Comercio','2022-03-19 14:27:02',901),('Eletricidad','2022-03-19 14:27:02',902),('Informatica','2022-03-19 14:27:02',903),('Quimica','2022-03-19 14:27:02',904),('Fisica','2022-03-19 16:48:14',NULL),('Q inorganica','2022-04-03 14:27:59',NULL),('Nuevo','2022-04-08 10:42:58',NULL);
/*!40000 ALTER TABLE `departamento_instituto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento_instituto_registrar_usuarios`
--

DROP TABLE IF EXISTS `departamento_instituto_registrar_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento_instituto_registrar_usuarios` (
  `Departamento_instituto_nombre_departamento` varchar(255) NOT NULL,
  `listaProfesores_dni` varchar(255) NOT NULL,
  PRIMARY KEY (`Departamento_instituto_nombre_departamento`,`listaProfesores_dni`),
  KEY `DPRTMENTOINSTITUTOREGISTRARUSUARIOSlstPrfesoresdni` (`listaProfesores_dni`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento_instituto_registrar_usuarios`
--

LOCK TABLES `departamento_instituto_registrar_usuarios` WRITE;
/*!40000 ALTER TABLE `departamento_instituto_registrar_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento_instituto_registrar_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacion` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `nota` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_EVALUACION_dni_alumno` (`dni_alumno`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion` VALUES (2,'2022-03-20 15:39:52','2','Observacion-1','a9'),(3,'2022-03-20 15:39:52','3','Observacion-2','a9'),(6,'2022-03-20 15:39:52','6','Observacion-5','a5'),(8,'2022-03-20 15:39:52','8','Observacion-7','a7'),(9,'2022-04-02 17:12:25','9','Observacion-8','a7'),(11,'2022-03-20 15:53:09','1','Observacion-0','a5'),(12,'2022-03-20 15:53:09','2','Observacion-1','a6'),(21,'2022-04-02 17:33:46','234','fffffffffffffffffffffffffffff','a3'),(17,'2022-04-02 17:11:37','7','Observacion-64dd','a7'),(19,'2022-04-02 17:12:36','9','Observacion-8','a3'),(20,'2022-03-20 15:53:09','10','Observacion-9','a7');
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insertar_noticias`
--

DROP TABLE IF EXISTS `insertar_noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insertar_noticias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creado_el` varchar(255) DEFAULT NULL,
  `nombre_noticia` varchar(255) DEFAULT NULL,
  `texto_noticia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insertar_noticias`
--

LOCK TABLES `insertar_noticias` WRITE;
/*!40000 ALTER TABLE `insertar_noticias` DISABLE KEYS */;
INSERT INTO `insertar_noticias` VALUES (1,'2022-03-19 16:27:47','Nueva noticia-1','Lorem lorem 1'),(2,'2022-03-19 16:27:47','Nueva noticia-2','Lorem lorem 2'),(3,'2022-03-19 16:27:47','Nueva noticia-3','Lorem lorem 3'),(4,'2022-03-19 16:27:47','Nueva noticia-4','Lorem lorem 4'),(5,'2022-03-19 16:27:47','Nueva noticia-5','Lorem lorem 5'),(6,'2022-03-19 16:27:47','Nueva noticia-6','Lorem lorem 6'),(7,'2022-03-19 16:27:47','Nueva noticia-7','Lorem lorem 7'),(8,'2022-03-19 16:27:47','Nueva noticia-8','Lorem lorem 8'),(9,'2022-03-19 16:27:47','Nueva noticia-9','Lorem lorem 9'),(10,'2022-03-19 16:28:23','Alhamdulillah ','Alhamdulillah');
/*!40000 ALTER TABLE `insertar_noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insertar_oferta`
--

DROP TABLE IF EXISTS `insertar_oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insertar_oferta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ciudad_oferta` varchar(255) DEFAULT NULL,
  `descripcion_oferta` varchar(255) DEFAULT NULL,
  `empresa_oferta` varchar(255) DEFAULT NULL,
  `fecha_actual` varchar(255) DEFAULT NULL,
  `fecha_oferta` date DEFAULT NULL,
  `nombre_oferta` varchar(255) DEFAULT NULL,
  `referencia_oferta` varchar(255) DEFAULT NULL,
  `tipo_oferta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insertar_oferta`
--

LOCK TABLES `insertar_oferta` WRITE;
/*!40000 ALTER TABLE `insertar_oferta` DISABLE KEYS */;
INSERT INTO `insertar_oferta` VALUES (1,'Ciudad-1','Descripcion-1231','Empresa-1','2022-03-19 15:57:00','2022-02-28','Oferta-1','Ref-1','Tipo-1'),(2,'Ciudad-2','Descripcion-1232','Empresa-2','2022-03-19 15:57:00','2022-03-01','Oferta-2','Ref-2','Tipo-2'),(3,'Ciudad-3','Descripcion-1233','Empresa-3','2022-03-19 15:57:00','2022-03-02','Oferta-3','Ref-3','Tipo-3'),(4,'Ciudad-4','Descripcion-1234','Empresa-4','2022-03-19 15:57:00','2022-03-03','Oferta-4','Ref-4','Tipo-4'),(5,'Ciudad-5','Descripcion-1235','Empresa-5','2022-03-19 15:57:00','2022-03-04','Oferta-5','Ref-5','Tipo-5'),(6,'Ciudad-6','Descripcion-1236','Empresa-6','2022-03-19 15:57:00','2022-03-05','Oferta-6','Ref-6','Tipo-6'),(7,'Ciudad-7','Descripcion-1237','Empresa-7','2022-03-19 15:57:00','2022-03-06','Oferta-7','Ref-7','Tipo-7'),(8,'Ciudad-8','Descripcion-1238','Empresa-8','2022-03-19 15:57:00','2022-03-07','Oferta-8','Ref-8','Tipo-8'),(9,'Ciudad-9','Descripcion-1239','Empresa-9','2022-03-19 15:57:00','2022-03-08','Oferta-9','Ref-9','Tipo-9'),(10,'mohammed','mohammed','mohammed','2022-03-19 15:59:24','2022-03-23','mohammed','mohammed','mohammed'),(11,'sebti','sebti','sebti','2022-03-19 16:05:53','2024-03-23','sebti','sebti','sebti'),(12,'sebti','sebti','sebti','2022-03-19 16:06:26','2024-03-23','sebti','sebti','sebti'),(14,'Ciudad-1','Descripcion-1231','Empresa-1','2022-03-19 16:08:16','2022-02-28','Oferta-1','Ref-4','Tipo-1'),(15,'Ciudad-2','Descripcion-1232','Empresa-2','2022-03-19 16:08:16','2022-03-01','Oferta-2','Ref-5','Tipo-2'),(16,'Ciudad-3','Descripcion-1233','Empresa-3','2022-03-19 16:08:16','2022-03-02','Oferta-3','Ref-6','Tipo-3'),(17,'Ciudad-4','Descripcion-1234','Empresa-4','2022-03-19 16:08:16','2022-03-03','Oferta-4','Ref-7','Tipo-4'),(18,'Ciudad-5','Descripcion-1235','Empresa-5','2022-03-19 16:08:16','2022-03-04','Oferta-5','Ref-8','Tipo-5'),(19,'Ciudad-6','Descripcion-1236','Empresa-6','2022-03-19 16:08:16','2022-03-05','Oferta-6','Ref-9','Tipo-6'),(20,'Ciudad-7','Descripcion-1237','Empresa-7','2022-03-19 16:08:16','2022-03-06','Oferta-7','Ref-10','Tipo-7'),(21,'Ciudad-8','Descripcion-1238','Empresa-8','2022-03-19 16:08:16','2022-03-07','Oferta-8','Ref-11','Tipo-8'),(22,'Ciudad-9','Descripcion-1239','Empresa-9','2022-03-19 16:08:16','2022-03-08','Oferta-9','Ref-12','Tipo-9'),(23,'Alhamdulillah ','Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah Alhamdulillah ','Alhamdulillah ','2022-03-19 16:29:10','2047-03-20','Alhamdulillah ','Alhamdulillah ','Alhamdulillah ');
/*!40000 ALTER TABLE `insertar_oferta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreLibro` varchar(50) DEFAULT NULL,
  `descripcionLibro` varchar(50) DEFAULT NULL,
  `autorLibro` varchar(50) DEFAULT NULL,
  `categoriaLibro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_libros_categoria` (`categoriaLibro`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (91,'a','a','a','Drama'),(2,'Savages, The','Comedy|Drama','V8 Vantage','Ciencia Ficción'),(3,'Almost You','Comedy|Drama','Tacoma','Drama'),(4,'Charm School (Niñas mal)','Comedy','Tucson','Coches'),(5,'Madonna of the Seven Moons','Drama|Mystery','Tracer','Novela'),(6,'Three (a.k.a. 3 Extremes II) (Saam gaang)','Horror|Mystery','V40','df'),(7,'Hangover Square','Crime|Drama|Horror|Thriller','LX','Drama'),(10,'Cosmic Psychos: Blokes You Can Trust','Documentary|Musical','3500','Drama');
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `materia` varchar(255) NOT NULL,
  `descripcion_materia` varchar(255) DEFAULT NULL,
  `fecha_creacion` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  `dni_profesor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`materia`),
  KEY `FK_MATERIA_dni_profesor` (`dni_profesor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES ('Diseño','Mejor materia del mundo0','2022-03-20 15:02:45',1401,'1'),('HLC','Mejor materia del mundo07889',NULL,NULL,'11'),('Despliegue','Mejor materia del mundo3','2022-03-20 15:02:45',1401,'b'),('Empresa','Mejor materia del mundo0',NULL,NULL,'11'),('Programacion','ssaSDSSAMejor materia del mundo0',NULL,NULL,'111'),('java2','Mejor materia del mundo0','2022-04-02 12:25:51',NULL,'1'),('Entorno cliente','Mejor materia del mundo055555',NULL,NULL,'b'),('Quimica','Quimica Organica','2022-03-27 21:18:32',1601,'111'),('Fisica','Mejor materia del mundo0444444',NULL,NULL,'b'),('Electronica','Electronica detallada 234',NULL,NULL,'11');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_matricula`
--

DROP TABLE IF EXISTS `materia_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_matricula` (
  `Materia_materia` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint NOT NULL,
  PRIMARY KEY (`Materia_materia`,`listaMatriculaciones_ID`),
  KEY `FK_MATERIA_MATRICULA_listaMatriculaciones_ID` (`listaMatriculaciones_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_matricula`
--

LOCK TABLES `materia_matricula` WRITE;
/*!40000 ALTER TABLE `materia_matricula` DISABLE KEYS */;
INSERT INTO `materia_matricula` VALUES ('Despliegue',2),('Despliegue',3),('Despliegue',4),('Despliegue',5),('Despliegue',11),('Despliegue',12),('Despliegue',15),('Diseño',1),('Diseño',4),('Diseño',6),('Diseño',9),('Diseño',13),('Empresa',18),('Entorno cliente',10),('HLC',14),('HLC',16),('Programacion',17),('Programacion',1451),('Quimica',10);
/*!40000 ALTER TABLE `materia_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `creado_el` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nombre_matricula` varchar(255) DEFAULT NULL,
  `dni_alumno` varchar(255) DEFAULT NULL,
  `nombre_materia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MATRICULA_nombre_materia` (`nombre_materia`),
  KEY `FK_MATRICULA_dni_alumno` (`dni_alumno`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,'2022-03-20 15:56:13','Descripcion matricula-1','Matricula-1','a4','Diseño'),(2,'2022-03-20 15:56:13','Descripcion matricula-2','Matricula-2','a9','Despliegue'),(3,'2022-04-02 21:07:05','Descripcion matricula-3','Matricula-3','a3','Fisica'),(4,'2022-03-20 15:56:13','Descripcion matricula-4','Matricula-4','a1','Despliegue'),(5,'2022-03-20 15:56:13','Descripcion matricula-5','Matricula-5','a7','Empresa'),(6,'2022-03-20 15:56:13','Descripcion matricula-6','Matricula-6','a8','HLC'),(10,'2022-04-02 21:23:41','matricula 19 matricula 19 matricula 19','matricula 19','a8','Quimica'),(8,'2022-03-20 15:56:36','Descripcion matricula-1','Matricula-1','a1','Programacion'),(9,'2022-04-02 21:07:25','Descripcion matricula-2','Matricula-2','a7','Programacion');
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula_evaluacion`
--

DROP TABLE IF EXISTS `matricula_evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula_evaluacion` (
  `Matricula_ID` bigint NOT NULL,
  `listaEvaluaciones_ID` bigint NOT NULL,
  PRIMARY KEY (`Matricula_ID`,`listaEvaluaciones_ID`),
  KEY `FK_MATRICULA_EVALUACION_listaEvaluaciones_ID` (`listaEvaluaciones_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula_evaluacion`
--

LOCK TABLES `matricula_evaluacion` WRITE;
/*!40000 ALTER TABLE `matricula_evaluacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula_evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel_instituto`
--

DROP TABLE IF EXISTS `nivel_instituto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel_instituto` (
  `nombre_nivel` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`nombre_nivel`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_instituto`
--

LOCK TABLES `nivel_instituto` WRITE;
/*!40000 ALTER TABLE `nivel_instituto` DISABLE KEYS */;
INSERT INTO `nivel_instituto` VALUES ('Bachillerato','2022-03-19 16:42:09',1251),('ESO','2022-03-19 16:42:09',1252),('FPGS','2022-03-19 16:42:09',1253),('Otros','2022-04-02 12:24:21',34588),('Eso 2','2022-04-02 12:19:42',123);
/*!40000 ALTER TABLE `nivel_instituto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `perfil` varchar(255) NOT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
  PRIMARY KEY (`perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES ('administrador','2022-03-19 12:27:49',51),('estudiante','2022-03-19 12:27:49',52),('jefatura','2022-03-19 12:27:49',53),('profesor','2022-03-19 12:27:49',54),('personal_no_docente','2022-03-19 14:43:20',1005),('otro','2022-04-03 12:22:29',NULL),('otro2','2022-04-03 12:23:57',NULL);
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_no_docente`
--

DROP TABLE IF EXISTS `personal_no_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_no_docente` (
  `dni` varchar(255) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_no_docente`
--

LOCK TABLES `personal_no_docente` WRITE;
/*!40000 ALTER TABLE `personal_no_docente` DISABLE KEYS */;
INSERT INTO `personal_no_docente` VALUES ('1231','Sebti1','Sevilla','x1','Gines','a1@b.fr','2022-01-31','2022-03-19 14:48:19',1101,'mohamed1','España','654321981','x1','Comercio','personal_no_docente'),('1232','Sebti2','Sevilla','x2','Gines','a2@b.fr','2022-02-01','2022-03-19 14:48:19',1101,'mohamed2','España','654321982','x2','Eletricidad','personal_no_docente'),('1233','Sebti3','Sevilla','x3','Gines','a3@b.fr','2022-02-02','2022-03-19 14:48:19',1101,'mohamed3','España','654321983','x3','Eletricidad','personal_no_docente'),('1234','Sebti4','Sevilla','x4','Gines','a4@b.fr','2022-02-03','2022-03-19 14:48:19',1101,'mohamed4','España','654321984','x4','Eletricidad','personal_no_docente'),('1235','Sebti5','Sevilla','x5','Gines','a5@b.fr','2022-02-04','2022-03-19 14:48:19',1101,'mohamed5','España','654321985','x5','Comercio','personal_no_docente'),('1236','Sebti6','Sevilla','x6','Gines','a6@b.fr','2022-02-05','2022-03-19 14:48:19',1101,'mohamed6','España','654321986','x6','Eletricidad','personal_no_docente'),('1237','Sebti7','Sevilla','x7','Gines','a7@b.fr','2022-02-06','2022-03-19 14:48:19',1101,'mohamed7','España','654321987','x7','Informatica','personal_no_docente'),('1238','Sebti8','Sevilla','x8','Gines','a8@b.fr','2022-02-07','2022-03-19 14:48:19',1101,'mohamed8','España','654321988','x8','Comercio','personal_no_docente'),('1239','Sebti9','Sevilla','x9','Gines','a9@b.fr','2022-02-08','2022-03-19 14:48:19',1101,'mohamed9','España','654321989','x9','Comercio','personal_no_docente'),('mo','mo','mo','mo','momomomomomomo','msb.tesla@gmail.com','2022-03-25','2022-03-19 16:43:29',NULL,'mo','mo','momo','mo','Quimica',NULL);
/*!40000 ALTER TABLE `personal_no_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrar_alumnos`
--

DROP TABLE IF EXISTS `registrar_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrar_alumnos` (
  `dni_alumno` varchar(255) NOT NULL,
  `calle_alumno` varchar(255) DEFAULT NULL,
  `ciudad_alumno` varchar(255) DEFAULT NULL,
  `cp_alumno` varchar(255) DEFAULT NULL,
  `creado_el` varchar(255) DEFAULT NULL,
  `email_alumno` varchar(255) DEFAULT NULL,
  `fecha_nacimiento_alumno` date DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrar_alumnos`
--

LOCK TABLES `registrar_alumnos` WRITE;
/*!40000 ALTER TABLE `registrar_alumnos` DISABLE KEYS */;
INSERT INTO `registrar_alumnos` VALUES ('a1','Calle camas 1','Camas','41222','2022-03-19 14:11:22','a1@a.com','2022-01-31','hombre',751,'logoInstituto.jpg','a1','España','a1','b1','123456781','FPGS'),('a2','Calle camas 2','Camas','41222','2022-03-19 14:11:22','a2@a.com','2022-02-01','mujer',751,'logoInstituto.jpg','a2','España','a2','b2','123456782','Bachillerato'),('a3','Calle camas 3','Camas','41222','2022-03-19 14:11:22','a3@a.com','2022-02-02','hombre',751,'logoInstituto.jpg','a3','España','a3','b3','123456783','FPGS'),('a4','Calle camas 4','Camas','41222','2022-03-19 14:11:22','a4@a.com','2022-02-03','hombre',751,'logoInstituto.jpg','a4','España','a4','b4','123456784','Bachillerato'),('a5','Calle camas 5','Camas','41222','2022-03-19 14:11:22','a5@a.com','2022-02-04','mujer',751,'logoInstituto.jpg','a5','España','a5','b5','123456785','FPGS'),('a6','Calle camas 6','Camas','41222','2022-03-19 14:11:22','a6@a.com','2022-02-05','hombre',751,'logoInstituto.jpg','a6','España','a6','b6','123456786','ESO'),('a7','Calle camas 7','Camas','41222','2022-03-19 14:11:22','msb.tesla@gmail.com','2022-02-06','hombre',751,'logoInstituto.jpg','a7','España','a7','b7','123456787','FPGS'),('a8','Calle camas 8','Camas','41222','2022-03-19 14:11:22','a8@a.com','2022-02-07','hombre',751,'logoInstituto.jpg','a8','España','a8','b8','123456788','FPGS'),('a9','Calle camas 9','Camas','41222','2022-03-19 14:11:22','a9@a.com','2022-02-08','hombre',751,'logoInstituto.jpg','a9','España','a9','b9','123456789','ESO');
/*!40000 ALTER TABLE `registrar_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrar_alumnos_matricula`
--

DROP TABLE IF EXISTS `registrar_alumnos_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrar_alumnos_matricula` (
  `Registrar_alumnos_dni_alumno` varchar(255) NOT NULL,
  `listaMatriculaciones_ID` bigint NOT NULL,
  PRIMARY KEY (`Registrar_alumnos_dni_alumno`,`listaMatriculaciones_ID`),
  KEY `REGISTRAR_ALUMNOS_MATRICULAlistaMatriculaciones_ID` (`listaMatriculaciones_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrar_alumnos_matricula`
--

LOCK TABLES `registrar_alumnos_matricula` WRITE;
/*!40000 ALTER TABLE `registrar_alumnos_matricula` DISABLE KEYS */;
INSERT INTO `registrar_alumnos_matricula` VALUES ('a1',4),('a1',6),('a1',8),('a1',1451),('a2',3),('a2',9),('a2',18),('a3',2),('a3',3),('a3',5),('a4',1),('a4',12),('a4',14),('a5',10),('a6',1),('a7',5),('a7',7),('a7',11),('a7',15),('a7',16),('a8',4),('a8',6),('a8',10),('a8',17),('a9',2),('a9',8),('a9',13);
/*!40000 ALTER TABLE `registrar_alumnos_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrar_usuarios`
--

DROP TABLE IF EXISTS `registrar_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrar_usuarios` (
  `dni` varchar(255) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_registro` varchar(255) DEFAULT NULL,
  `ID` bigint DEFAULT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrar_usuarios`
--

LOCK TABLES `registrar_usuarios` WRITE;
/*!40000 ALTER TABLE `registrar_usuarios` DISABLE KEYS */;
INSERT INTO `registrar_usuarios` VALUES ('1','a','Sevilla','a','Camas','msb.caixa@gmail.com','2022-01-22','2022-03-19 13:10:12',251,'a','España','123123123','a','Comercio','administrador'),('11','aa','Sevilla','aa','Camas','a@a.com','2022-02-22','2022-03-19 13:14:04',351,'aa','Espaï¿½a','123123123','aa','Nuevo','jefatura'),('111','aaa','Sevilla','aaa','Camas','a@a.com','2022-02-22','2022-03-19 13:16:39',452,'aaabbb','Espaï¿½a','123123123','aaa','Informatica','profesor'),('b','b','b','b','bbbbb','msb.duck@gmail.com','2022-03-16','2022-03-19 16:09:52',NULL,'b','b','456789432','b','Quimica',NULL);
/*!40000 ALTER TABLE `registrar_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrar_usuarios_materia`
--

DROP TABLE IF EXISTS `registrar_usuarios_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrar_usuarios_materia` (
  `Registrar_usuarios_dni` varchar(255) NOT NULL,
  `listaMaterias_materia` varchar(255) NOT NULL,
  PRIMARY KEY (`Registrar_usuarios_dni`,`listaMaterias_materia`),
  KEY `REGISTRAR_USUARIOS_MATERIA_listaMaterias_materia` (`listaMaterias_materia`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrar_usuarios_materia`
--

LOCK TABLES `registrar_usuarios_materia` WRITE;
/*!40000 ALTER TABLE `registrar_usuarios_materia` DISABLE KEYS */;
INSERT INTO `registrar_usuarios_materia` VALUES ('1','Diseño'),('1','java2'),('11','Electronica'),('11','Empresa'),('11','Programacion'),('111','Fisica'),('111','Programacion'),('111','Quimica'),('b','Despliegue'),('b','Entorno cliente'),('b','Fisica'),('b','HLC'),('b','Programacion');
/*!40000 ALTER TABLE `registrar_usuarios_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES ('SEQ_GEN',2600);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subidadocumento`
--

DROP TABLE IF EXISTS `subidadocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subidadocumento` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `creado_el` varchar(255) DEFAULT NULL,
  `subida_documento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2563 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subidadocumento`
--

LOCK TABLES `subidadocumento` WRITE;
/*!40000 ALTER TABLE `subidadocumento` DISABLE KEYS */;
INSERT INTO `subidadocumento` VALUES (2560,'2022-04-10 17:46:46','imagenes/Ã­ndicee.png'),(2561,'2022-04-10 17:47:15','imagenes/Ã­ndice.png'),(2562,'2022-04-13 14:19:32','imagenes/Ã­ndice.png');
/*!40000 ALTER TABLE `subidadocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'q','q@q.com','q'),(2,'s','s','s'),(3,'d','d','ddd'),(4,'n','n','n'),(5,'b','b','bb'),(6,'g','g','g'),(7,'w','msb.caixa@gmail.com','ww'),(8,'mo','msb.tesla@gmail.com','12'),(9,'h','msebti2@gmail.com','h'),(10,'j','sebti.benzakour.mohammed@iescamas.es','j'),(11,'u','sebti74@gmail.com','u'),(12,'a','a','a'),(13,'v','v','vv');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'instituto'
--

--
-- Dumping routines for database 'instituto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 17:59:24
