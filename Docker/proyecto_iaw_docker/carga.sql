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
DROP DATABASE IF EXISTS exampleDB;
DROP DATABASE IF EXISTS alebuntu;
CREATE DATABASE  IF NOT EXISTS `alebuntu` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `alebuntu`;
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

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `cod_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(200) NOT NULL,
  `fecha_publicacion` datetime NOT NULL,
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
  `nombre` varchar(40) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_revisado` date DEFAULT NULL,
  `n_pag` int(6) NOT NULL,
  `dificultad` varchar(15) NOT NULL,
  `enlace` varchar(200) NOT NULL,
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
  KEY `fk_para_2_idx` (`cod_manual`),
  CONSTRAINT `fk_para_1` FOREIGN KEY (`cod_so`) REFERENCES `sistema_operativo` (`cod_so`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_para_2` FOREIGN KEY (`cod_manual`) REFERENCES `manuales` (`cod_manual`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `sistema_operativo`
--

DROP TABLE IF EXISTS `sistema_operativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema_operativo` (
  `cod_so` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `version` varchar(30) NOT NULL,
  `jahr_de_lanzamiento` year(4) NOT NULL,
  PRIMARY KEY (`cod_so`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistema_operativo`
--

LOCK TABLES `sistema_operativo` WRITE;
/*!40000 ALTER TABLE `sistema_operativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistema_operativo` ENABLE KEYS */;
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
  `apellido` varchar(35) NOT NULL,
  `correo_electronico` varchar(45) NOT NULL,
  `edad` int(3) NOT NULL,
  `id` varchar(15) NOT NULL,
  `password` varchar(34) NOT NULL,
  `fecha_alta` varchar(45) NOT NULL,
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
  `cod_valora` int(11) NOT NULL AUTO_INCREMENT,
  `cod_usuario` int(11) NOT NULL,
  `cod_manual` int(11) NOT NULL,
  `fecha_valoracion` date NOT NULL,
  `valoracion` int(1) NOT NULL,
  PRIMARY KEY (`cod_valora`),
  KEY `fk_valora_1_idx` (`cod_manual`),
  KEY `fk_valora_2_idx` (`cod_usuario`),
  CONSTRAINT `fk_valora_1` FOREIGN KEY (`cod_manual`) REFERENCES `manuales` (`cod_manual`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_valora_2` FOREIGN KEY (`cod_usuario`) REFERENCES `usuarios` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
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

-- Dump completed on 2019-01-20 18:00:49

INSERT INTO usuarios ( nombre , apellido, edad, id ,correo_electronico, password,fecha_alta)
VALUES ( 'Alejandro' , 'Román Caballero', 23, 'admin','admin@admin.com','7ed1ca45414f40612d0c469e24453e40',CURDATE());
INSERT INTO usuarios ( nombre , apellido, edad, id ,correo_electronico, password,fecha_alta)
VALUES ( 'a' , 'a', 999, 'a','a@a.com','7ed1ca45414f40612d0c469e24453e40',CURDATE());
INSERT INTO usuarios ( nombre , apellido, edad, id ,correo_electronico, password,fecha_alta)
VALUES ( 'b' , 'b', 999, 'b','b@b.com','7ed1ca45414f40612d0c469e24453e40',CURDATE());
INSERT INTO usuarios ( nombre , apellido, edad, id ,correo_electronico, password,fecha_alta)
VALUES ( 'c' , 'c', 999, 'c','c@c.com','7ed1ca45414f40612d0c469e24453e40',CURDATE());
INSERT INTO usuarios ( nombre , apellido, edad, id ,correo_electronico, password,fecha_alta)
VALUES ( 'd' , 'd', 999, 'd','d@d.com','7ed1ca45414f40612d0c469e24453e40',CURDATE());
INSERT INTO usuarios ( nombre , apellido, edad, id ,correo_electronico, password,fecha_alta)
VALUES ( 'e' , 'e', 999, 'e','e@e.com','7ed1ca45414f40612d0c469e24453e40',CURDATE());
INSERT INTO usuarios ( nombre , apellido, edad, id ,correo_electronico, password,fecha_alta)
VALUES ( 'f' , 'f', 999, 'f','f@f.com','7ed1ca45414f40612d0c469e24453e40',CURDATE());
INSERT INTO usuarios ( nombre , apellido, edad, id ,correo_electronico, password,fecha_alta)
VALUES ( 'g' , 'g', 999, 'g','g@g.com','7ed1ca45414f40612d0c469e24453e40',CURDATE());


INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`)
VALUES ('1', 'Nat', '2018-05-22', NULL, '25', 'Fácil','https://docs.google.com/document/d/1RiNCaBw9oZcBEsh7VeT-iUjfmInu_aeDPVJP-mM7_Q4/edit?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`)
VALUES ('2', 'Bind9', '2018-11-15', NULL, '13', 'Fácil','https://docs.google.com/document/d/16vXCG2q-a6Ts1i4aE55JTxO1dIHwyDogcwNpVULO5Rc/edit?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`)
VALUES ('3', 'Kerberos', '2018-11-15', NULL, '14', 'Fácil','https://docs.google.com/document/d/1vvy3Pi7yjsRVYkJAyPGSbsbj_IR_7jRgvx1fQMrZoDU/edit?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`)
VALUES ('4', 'Openldap', '2018-11-15', NULL, '10', 'Media','https://docs.google.com/document/d/1DthxeqBsW071_Y_n8wUtUtVCaqlYOVbvijeDPrvqsZ8/edit?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`)
VALUES ('5', 'Samba', '2018-11-15', NULL, '36', 'Media','https://docs.google.com/document/d/1NjXAAJqXFrFM5z7ZG9IYor8FmgB6jqisIyYwSGRocaI/edit?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`) 
VALUES ('6', 'Window server 2008', '2018-05-27', NULL, '63', 'Media','https://docs.google.com/document/d/1tpBxtoYnWE-HhfEYeJmWVbNJoHxjvG1pmuAqo4Q9UH8/edit?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`) 
VALUES ('7', 'Window server 2012', '2018-05-28', NULL, '216', 'Media','https://drive.google.com/file/d/1-NNLE9uUzpxkO80F0CcdpwCk88lIWOvx/view?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`) 
VALUES ('8', 'LFS 7.5', '2018-09-16', NULL, '220', 'Difícil' , 'https://drive.google.com/file/d/1lp7ZppcicdV7CIMZo3AHuLAHqclhUE8B/view?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`) 
VALUES ('9', 'LFS 8.3', '2019-01-09', NULL, '142', 'Difícil','https://docs.google.com/document/d/1ZQyY_Ci7lGLfoVuRl2ZjkxJL_IqPkH_oxsHty5jZidE/edit?usp=sharing');
INSERT INTO `alebuntu`.`manuales` (`cod_manual`, `nombre`, `fecha_publicacion`, `fecha_revisado`, `n_pag`, `dificultad`,`enlace`) 
VALUES ('10', 'Construccion de android',  '2018-11-06',NULL,  '16',  'Media','https://docs.google.com/document/d/1Mf1zh3Lz9deXt-t90VzyVYOi6Q-qj5RhMSKgF9q5V40/edit?usp=sharing');


INSERT INTO sistema_operativo (nombre,version,jahr_de_lanzamiento)
VALUES ('ubuntu','16.04 Xenial Xerus',2016);
INSERT INTO sistema_operativo (nombre,version,jahr_de_lanzamiento)
VALUES ('debian','9.4 stretch',2018);
INSERT INTO sistema_operativo (nombre,version,jahr_de_lanzamiento)
VALUES ('window ','server 2008 standar',2008);
INSERT INTO sistema_operativo (nombre,version,jahr_de_lanzamiento)
VALUES ('window','server 2012 standar',2012);
INSERT INTO sistema_operativo (nombre,version,jahr_de_lanzamiento)
VALUES ('lfs','7.5',2014);
INSERT INTO sistema_operativo (nombre,version,jahr_de_lanzamiento)
VALUES ('lfs','8.3',2018);
INSERT INTO sistema_operativo (nombre,version,jahr_de_lanzamiento)
VALUES ('android','4.3 Jelly Bean',2012);
  

INSERT INTO para(cod_so,cod_manual)
VALUES (2,1);
INSERT INTO para(cod_so,cod_manual)
VALUES (1,2);
INSERT INTO para(cod_so,cod_manual)
VALUES (1,3);
INSERT INTO para(cod_so,cod_manual)
VALUES (1,4);
INSERT INTO para(cod_so,cod_manual)
VALUES (1,5);
INSERT INTO para(cod_so,cod_manual)
VALUES (3,6);
INSERT INTO para(cod_so,cod_manual)
VALUES (4,7);
INSERT INTO para(cod_so,cod_manual)
VALUES (5,8);
INSERT INTO para(cod_so,cod_manual)
VALUES (6,9);
INSERT INTO para(cod_so,cod_manual)
VALUES (7,10);
