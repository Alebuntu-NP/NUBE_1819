grant all on *.* to 'root'@'localhost' identified by '2Asirtriana.' WITH GRANT OPTION;
grant all on *.* to 'root'@'%' identified by '2Asirtriana.' WITH GRANT OPTION;
grant all on *.* to 'root'@'127.0.0.1' identified by '2Asirtriana.' WITH GRANT OPTION;
grant all on *.* to 'root'@'::1' identified by '2Asirtriana.' WITH GRANT OPTION;
GRANT ALL ON alebuntu.* TO 'root'@'localhost' IDENTIFIED BY "2Asirtriana." WITH GRANT OPTION;
GRANT ALL ON alebuntu.* TO 'root'@'%' IDENTIFIED BY "2Asirtriana." WITH GRANT OPTION;
GRANT ALL ON alebuntu.* TO 'root'@'127.0.0.1' IDENTIFIED BY "2Asirtriana." WITH GRANT OPTION;
GRANT ALL ON alebuntu.* TO 'root'@'::1' IDENTIFIED BY "2Asirtriana." WITH GRANT OPTION;
flush privileges;
CREATE USER 'usuario'@'localhost' IDENTIFIED BY '2asirtriana';
CREATE USER 'usuario'@'127.0.0.1' IDENTIFIED BY '2asirtriana';
CREATE USER 'usuario'@'%' IDENTIFIED BY '2asirtriana';
CREATE USER 'usuario'@'::1' IDENTIFIED BY '2asirtriana';
GRANT select,insert,update,delete ON alebuntu.* TO 'usuario'@'localhost' IDENTIFIED BY "2asirtriana";
GRANT select,insert,update,delete ON alebuntu.* TO 'usuario'@'%' IDENTIFIED BY "2asirtriana";
GRANT select,insert,update,delete ON alebuntu.* TO 'usuario'@'127.0.0.1' IDENTIFIED BY "2asirtriana";
GRANT select,insert,update,delete ON alebuntu.* TO 'usuario'@'::1' IDENTIFIED BY "2asirtriana";
flush privileges;
-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: alebuntu
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE IF EXISTS exampleDB;
CREATE DATABASE alebuntu;
USE alebuntu;
--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `cod_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(200) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_manual` int(11) NOT NULL,
  PRIMARY KEY (`cod_comentario`),
  KEY `fk_comentarios_1_idx` (`cod_usuario`),
  KEY `fk_comentarios_2_idx` (`cod_manual`),
  CONSTRAINT `fk_comentarios_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comentarios_2` FOREIGN KEY (`cod_manual`) REFERENCES `manuales` (`cod_manual`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manuales`
--

DROP TABLE IF EXISTS `manuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manuales` (
  `cod_manual` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_revisado` date DEFAULT NULL,
  `n_pag` int(11) DEFAULT NULL,
  `dificultad` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cod_manual`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manuales`
--

LOCK TABLES `manuales` WRITE;
/*!40000 ALTER TABLE `manuales` DISABLE KEYS */;
/*!40000 ALTER TABLE `manuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `para`
--

DROP TABLE IF EXISTS `para`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `para` (
  `cod_so` int(11) NOT NULL,
  `cod_manual` int(11) NOT NULL,
  PRIMARY KEY (`cod_so`,`cod_manual`),
  KEY `fk_para_1_idx` (`cod_manual`),
  CONSTRAINT `fk_para_1` FOREIGN KEY (`cod_manual`) REFERENCES `manuales` (`cod_manual`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_para_2` FOREIGN KEY (`cod_so`) REFERENCES `so` (`cod_so`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `para`
--

LOCK TABLES `para` WRITE;
/*!40000 ALTER TABLE `para` DISABLE KEYS */;
/*!40000 ALTER TABLE `para` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so`
--

DROP TABLE IF EXISTS `so`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so` (
  `cod_so` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `version` decimal(4,2) DEFAULT NULL,
  `año_de_lanzamiento` year(4) DEFAULT NULL,
  PRIMARY KEY (`cod_so`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so`
--

LOCK TABLES `so` WRITE;
/*!40000 ALTER TABLE `so` DISABLE KEYS */;
/*!40000 ALTER TABLE `so` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `edad` int(11) NOT NULL,
  `id` varchar(10) NOT NULL,
  `password` varchar(40) NOT NULL,
  `fecha_alta` date NOT NULL,
  PRIMARY KEY (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valora`
--

DROP TABLE IF EXISTS `valora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valora` (
  `cod_usuario` int(11) NOT NULL,
  `cod_manual` int(11) NOT NULL,
  `fecha_valoracion` date NOT NULL,
  `valoracion` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_usuario`,`cod_manual`),
  KEY `fk_valora_2_idx` (`cod_manual`),
  CONSTRAINT `fk_valora_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_valora_2` FOREIGN KEY (`cod_manual`) REFERENCES `manuales` (`cod_manual`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valora`
--

LOCK TABLES `valora` WRITE;
/*!40000 ALTER TABLE `valora` DISABLE KEYS */;
/*!40000 ALTER TABLE `valora` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-05 18:48:49

INSERT INTO usuarios ( nombre , apellido, edad, id , password,fecha_alta)
VALUES ( 'Alejandro' , 'Roman Caballero', 23, 'admin','7ed1ca45414f40612d0c469e24453e40',CURDATE());
