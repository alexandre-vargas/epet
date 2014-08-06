CREATE DATABASE  IF NOT EXISTS `epet` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `epet`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: epet
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `loja`
--

DROP TABLE IF EXISTS `loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cpf_cnpj` varchar(14) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `logradouro` text NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(150) NOT NULL,
  `cidade` varchar(150) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `email` varchar(200) NOT NULL,
  `ddd_tel1` int(11) NOT NULL,
  `tel1` varchar(15) NOT NULL,
  `ddd_tel2` int(11) DEFAULT NULL,
  `tel2` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descr_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loja`
--

LOCK TABLES `loja` WRITE;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  `id_pessoa` int(11) DEFAULT NULL,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'SYS','123456','teste',1,'2014-08-05 19:59:54','2014-08-05 20:15:25'),(2,'SYS2','123456','teste',1,'2014-08-05 19:59:54','2014-08-05 20:15:25'),(3,'SYS2','123456','teste',1,'2014-08-05 19:59:54','2014-08-05 20:15:25'),(4,'SYS2','123456','teste',1,'2014-08-05 19:59:54','2014-08-05 20:15:25'),(5,'SYS2','123456','teste',1,'2014-08-05 19:59:54','2014-08-05 20:15:25'),(6,'SYS2','123456','teste',1,'2014-08-05 19:59:54','2014-08-05 20:15:25'),(7,'SYS2','123456','teste',1,'2014-08-05 19:59:54','2014-08-05 20:15:25');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-06 11:43:11


ALTER TABLE `epet`.`loja` ADD COLUMN `log_data_alt` TIMESTAMP NULL  AFTER `tel2` ;

ALTER TABLE `epet`.`loja`
ADD COLUMN `log_data_insert` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP() AFTER `tel2`;

ALTER TABLE `epet`.`loja` 
RENAME TO  `epet`.`pessoa` ;

ALTER TABLE `epet`.`produto` 
ADD COLUMN `log_data_insert` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER `nome`,
ADD COLUMN `log_data_alt` TIMESTAMP NULL AFTER `log_data_insert`;

ALTER TABLE `epet`.`usuario` 
CHANGE COLUMN `log_data_insert` `log_data_insert` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP AFTER `id_pessoa`;
