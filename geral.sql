CREATE DATABASE  IF NOT EXISTS `epet` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `epet`;
-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: epet
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `icone` text,
  `status` tinyint(4) DEFAULT '1',
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Categorias são os agrupadores de subcategorias.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Alimentos','',1,'2014-08-19 00:07:27',NULL,NULL,NULL),(2,'Higiêne e beleza',NULL,0,'2014-08-19 00:10:12',NULL,NULL,NULL),(3,'Roupinhas, Ambiente',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Roupinhas, Ambiente',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estoque` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL COMMENT 'Qtd movimentada naquela operação (compra e venda geralmente).',
  `data` timestamp NULL DEFAULT NULL COMMENT 'Data da operação.',
  `data_validade` timestamp NULL DEFAULT NULL COMMENT 'Validade (vencimento) do produto.',
  `preco` decimal(10,2) DEFAULT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  `preco_anterior` decimal(10,2) DEFAULT NULL COMMENT 'Preço inputado manualmente. Este preço pode ser fidedigno ou seja, preço real anterior. Porém, como este preço é inputado pelo usuário pode ser manipulado conforme sua intenção ou seja não necessariamente é o preçoo real anterior.',
  `saldo` int(11) DEFAULT NULL COMMENT 'Quantidade restante no estoque.',
  `tipo_basico` tinyint(4) DEFAULT NULL COMMENT '1- Entrada, 2- Saída',
  `tipo` tinyint(4) DEFAULT NULL COMMENT '1- Normal (compra e venda), 2- Devolução, 3- Doação, 4-Consumo próprio',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
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
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
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
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal_x_pessoa`
--

DROP TABLE IF EXISTS `animal_x_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal_x_pessoa` (
  `id_animal` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_animal`,`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal_x_pessoa`
--

LOCK TABLES `animal_x_pessoa` WRITE;
/*!40000 ALTER TABLE `animal_x_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal_x_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_x_subcategoria`
--

DROP TABLE IF EXISTS `produto_x_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_x_subcategoria` (
  `id_produto` int(11) NOT NULL,
  `id_subcategoria` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '0- Inavito, 1- Ativo',
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_produto`,`id_subcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_x_subcategoria`
--

LOCK TABLES `produto_x_subcategoria` WRITE;
/*!40000 ALTER TABLE `produto_x_subcategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_x_subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsavel`
--

DROP TABLE IF EXISTS `responsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsavel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_loja` int(11) NOT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `id_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsavel`
--

LOCK TABLES `responsavel` WRITE;
/*!40000 ALTER TABLE `responsavel` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loja`
--

DROP TABLE IF EXISTS `loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loja` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) DEFAULT NULL,
  `logo` text,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `produto_fisico`
--

DROP TABLE IF EXISTS `produto_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_fisico` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `peso` decimal(10,4) DEFAULT NULL,
  `sku` varchar(50) NOT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fisico`
--

LOCK TABLES `produto_fisico` WRITE;
/*!40000 ALTER TABLE `produto_fisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_fisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tipo de animal, ex: Cachorro, Gato, Passarinho, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
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
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'SYS','123456','teste',1,'2014-08-05 20:15:25','2014-08-05 19:59:54',NULL),(2,'SYS2','123456','teste',1,'2014-08-05 20:15:25','2014-08-05 19:59:54',NULL),(3,'SYS2','123456','teste',1,'2014-08-05 20:15:25','2014-08-05 19:59:54',NULL),(4,'SYS2','123456','teste',1,'2014-08-05 20:15:25','2014-08-05 19:59:54',NULL),(5,'SYS2','123456','teste',1,'2014-08-05 20:15:25','2014-08-05 19:59:54',NULL),(6,'SYS2','123456','teste',1,'2014-08-05 20:15:25','2014-08-05 19:59:54',NULL),(7,'SYS2','123456','teste',1,'2014-08-05 20:15:25','2014-08-05 19:59:54',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `icone` text,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animal` (
  `id` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nascimento` timestamp NULL DEFAULT NULL,
  `raca` varchar(100) DEFAULT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `porte` int(11) DEFAULT NULL COMMENT '1- Pequeno, 2- Médio, 3- Grande',
  `sexo` varchar(1) DEFAULT NULL,
  `castrado` tinyint(4) DEFAULT NULL COMMENT 'M, F',
  `observacao` text,
  `status` tinyint(4) DEFAULT '1' COMMENT '0- Animal moreu, 1- Animal vivo',
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategoria` (
  `id` int(11) NOT NULL,
  `id_categoria` varchar(45) DEFAULT NULL,
  `icone` text,
  `status` tinyint(4) DEFAULT NULL,
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cada subcategoria possui uma chave estrangeira p categoria.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoria`
--

LOCK TABLES `subcategoria` WRITE;
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
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
  `log_data_insert` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_data_alt` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `log_usuario_alt` varchar(20) DEFAULT NULL,
  `log_usuario_insert` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `descr_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-20 15:43:28

ALTER TABLE `epet`.`categoria` 
ADD COLUMN `id_menu` INT NOT NULL AFTER `id`;

