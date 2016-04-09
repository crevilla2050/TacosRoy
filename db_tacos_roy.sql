CREATE DATABASE  IF NOT EXISTS `db_tacos_roy` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `db_tacos_roy`;
-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: db_tacos_roy
-- ------------------------------------------------------
-- Server version	5.5.47-0ubuntu0.14.04.1

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
-- Table structure for table `tbl_categorias`
--

DROP TABLE IF EXISTS `tbl_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_cat` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_cat` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `fl_orden` float NOT NULL,
  `bool_activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorias`
--

LOCK TABLES `tbl_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_categorias` DISABLE KEYS */;
INSERT INTO `tbl_categorias` VALUES (1,'Sin Categoria','Para productos sin categoria',1,1),(2,'Tacos al Vapor','Tacos al vapor',2,1),(3,'Tacos Ahogados','Tacos ahogados en salsa',3,1),(4,'Tacos a la plancha','Tacos preparados a la plancha',4,1),(5,'A la Plancha','Productos elaborados en plancha',5,1),(6,'Preparados','Productos preparados varios (Pozole, Queso fundido, etc).',6,1),(7,'Bebidas','Bebidas frías o calientes',7,1),(8,'Postres','Postres y alimentos dulces',8,1),(9,'Tostadas','Tostadas con diferentes carnes e ingredientes',4.5,1),(10,'Pozole','Pozoles con diferentes tipos de carne',6.5,1);
/*!40000 ALTER TABLE `tbl_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_consecutivo`
--

DROP TABLE IF EXISTS `tbl_consecutivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_consecutivo` (
  `id_ticketNrConsecutivo` int(11) NOT NULL AUTO_INCREMENT,
  `chr_consecutivo` int(11) NOT NULL,
  PRIMARY KEY (`id_ticketNrConsecutivo`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consecutivo`
--

LOCK TABLES `tbl_consecutivo` WRITE;
/*!40000 ALTER TABLE `tbl_consecutivo` DISABLE KEYS */;
INSERT INTO `tbl_consecutivo` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,66),(68,67),(69,68),(70,69),(71,70),(72,71);
/*!40000 ALTER TABLE `tbl_consecutivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_datos_sucursal`
--

DROP TABLE IF EXISTS `tbl_datos_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_datos_sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir1` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir2` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir3` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono1` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono2` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario_encargado` int(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_sucursal`
--

LOCK TABLES `tbl_datos_sucursal` WRITE;
/*!40000 ALTER TABLE `tbl_datos_sucursal` DISABLE KEYS */;
INSERT INTO `tbl_datos_sucursal` VALUES (1,'Tacos Roy Suc. Escuadron','Calle Escuadrón 201 Nr. 300','Col. Antiguo Aeropuerto','CP. 68050, Oaxaca, Oaxaca.','9511327096','000000000',1),(2,'asdfasd','asdfasdf','asdfasd','asdfasdf','3216545','321654',1);
/*!40000 ALTER TABLE `tbl_datos_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_gastos`
--

DROP TABLE IF EXISTS `tbl_gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_gastos` (
  `id_gasto` int(11) NOT NULL AUTO_INCREMENT,
  `dt_horafecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_cantidad` float NOT NULL,
  `chr_concepto_gasto` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario_auth` int(11) NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `id_usuario_auth` (`id_usuario_auth`),
  CONSTRAINT `tbl_gastos_ibfk_1` FOREIGN KEY (`id_usuario_auth`) REFERENCES `tbl_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_gastos`
--

LOCK TABLES `tbl_gastos` WRITE;
/*!40000 ALTER TABLE `tbl_gastos` DISABLE KEYS */;
INSERT INTO `tbl_gastos` VALUES (1,'2016-03-24 08:39:36',100,'fdsdfs a fdf asdfasdf asd f',1);
/*!40000 ALTER TABLE `tbl_gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_insumos`
--

DROP TABLE IF EXISTS `tbl_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_insumos` (
  `id_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_insumo` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_descripcion` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_insumos`
--

LOCK TABLES `tbl_insumos` WRITE;
/*!40000 ALTER TABLE `tbl_insumos` DISABLE KEYS */;
INSERT INTO `tbl_insumos` VALUES (1,'Tortilla','Tortilla de Maiz'),(2,'Tortilla de harina','Tortilla de harina de trigo'),(3,'Tostada','Tostada frita para acompañar alimentos'),(4,'Pepsi','Refresco Pepsi'),(5,'Squirt','Refresco Squirt'),(6,'Mirinda','Refresco Mirinda'),(7,'Sangría','Refresco Sangría'),(8,'Cerveza Corona','Cerveza Corona'),(9,'Cerveza Victoria','Cerveza Victoria'),(10,'Cerveza Corona Light','Cerveza Corona Ligh'),(11,'Cerveza León','Cerveza León'),(12,'Cerveza Pacífico','Cerveza Pacífico'),(13,'Cerveza Montejo','Cerveza Montejo'),(14,'Cerveza Negra Modelo','Cerveza Negra Modelo'),(15,'Cerveza Barrilito','Cerveza Barrilito'),(16,'Cerveza Victoria (Lata)','Lata de cerveza Victoria'),(17,'Cerveza Modelo (Lata)','Lata de cerveza Modelo'),(18,'Panqué de Elote, Rebanada','Rebanada de Panqué de elote'),(19,'Flan','Flan'),(20,'Pastel de Queso','Pastel de Queso'),(21,'Agua Emb. 1/2 Litro','Botella de agua de Medio litro'),(22,'Agua Emb. 1 Litro','Botella de agua embotellada de 1 litro'),(23,'Jugo Boing','Jugos boing de varios sabores'),(24,'Cerveza Stella Artois','Cerveza Stella Artois'),(25,'7 Up','Refresco 7 Up'),(26,'Agua Mineral','Agua Mineral'),(27,'Manzanita Sol','Refresco Manzanita Sol');
/*!40000 ALTER TABLE `tbl_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_insumos_x_platillo`
--

DROP TABLE IF EXISTS `tbl_insumos_x_platillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_insumos_x_platillo` (
  `id_insumo_x_platillo` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `int_cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_insumo_x_platillo`),
  KEY `sdfasdfas` (`id_producto`) COMMENT 'fsgfdsgsd',
  KEY `fhgdfggf` (`id_insumo`) COMMENT 'fghdgdh',
  CONSTRAINT `tbl_insumos_x_platillo_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  CONSTRAINT `tbl_insumos_x_platillo_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `tbl_insumos` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_insumos_x_platillo`
--

LOCK TABLES `tbl_insumos_x_platillo` WRITE;
/*!40000 ALTER TABLE `tbl_insumos_x_platillo` DISABLE KEYS */;
INSERT INTO `tbl_insumos_x_platillo` VALUES (1,48,25,1),(2,50,26,1),(3,89,22,1),(4,53,21,1),(5,11,1,1),(6,16,1,1),(7,14,1,1),(8,9,1,1),(9,33,2,1),(10,8,1,1),(11,91,24,1),(12,13,1,1),(13,30,2,1),(14,7,1,1),(15,6,1,1),(16,5,1,1),(17,49,27,1),(18,46,6,1),(19,10,1,1),(20,15,1,1),(21,17,1,1),(22,34,1,1),(23,35,1,1),(24,45,4,1),(25,31,2,1),(26,76,1,1),(27,79,1,1),(28,74,1,1),(29,73,1,1),(30,78,1,1),(31,75,1,1),(32,77,1,1),(33,72,1,1),(34,71,1,1),(35,70,1,1),(36,80,1,1),(37,25,1,1),(38,32,3,1),(39,36,3,1),(40,59,3,1),(41,62,3,1),(42,68,3,1),(43,61,3,1),(44,63,3,1),(45,69,3,1),(46,65,3,1),(47,64,3,1),(48,67,3,1),(49,66,3,1),(50,60,3,1),(51,57,3,1),(52,58,3,1),(53,12,1,1),(54,54,18,1),(55,56,20,1),(56,47,7,1),(57,55,19,1);
/*!40000 ALTER TABLE `tbl_insumos_x_platillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inventario`
--

DROP TABLE IF EXISTS `tbl_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_inventario` (
  `id_inventario_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_insumo_id` int(11) NOT NULL,
  `int_cantidad` int(11) NOT NULL,
  `dt_fecha_insumo` datetime NOT NULL,
  PRIMARY KEY (`id_inventario_id`),
  KEY `id_insumo_id` (`id_insumo_id`),
  CONSTRAINT `tbl_inventario_ibfk_1` FOREIGN KEY (`id_insumo_id`) REFERENCES `tbl_insumos` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventario`
--

LOCK TABLES `tbl_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_inventario` DISABLE KEYS */;
INSERT INTO `tbl_inventario` VALUES (4,1,300,'2016-03-18 00:00:00'),(5,2,150,'2016-03-18 00:00:00'),(6,3,50,'2016-03-18 00:00:00'),(7,4,80,'2016-03-18 00:00:00'),(8,5,50,'2016-03-18 00:00:00'),(9,6,40,'2016-03-18 00:00:00'),(10,7,50,'2016-03-18 00:00:00'),(11,8,100,'2016-03-18 00:00:00');
/*!40000 ALTER TABLE `tbl_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mesas`
--

DROP TABLE IF EXISTS `tbl_mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_mesas` (
  `id_mesa_id` int(11) NOT NULL AUTO_INCREMENT,
  `chr_mesa` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `int_nr_personas` int(11) NOT NULL,
  `bit_mesa_activa` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_mesa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mesas`
--

LOCK TABLES `tbl_mesas` WRITE;
/*!40000 ALTER TABLE `tbl_mesas` DISABLE KEYS */;
INSERT INTO `tbl_mesas` VALUES (1,'1',4,1),(2,'2',4,1),(3,'3',5,1),(4,'4',4,1),(5,'5',6,1),(6,'6',4,1),(7,'7',6,1),(8,'8',5,1),(9,'9',4,1),(10,'10',5,1),(11,'11',1,1),(12,'12',1,1),(13,'13',6,1),(14,'14',6,1),(15,'15',6,1),(16,'Para llevar',1,1);
/*!40000 ALTER TABLE `tbl_mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes`
--

DROP TABLE IF EXISTS `tbl_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ordenes` (
  `id_orden_id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_horafecha_orden` datetime NOT NULL,
  `int_mesa` int(11) NOT NULL,
  `int_consecutivo` int(11) NOT NULL,
  `chr_status_orden` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_orden_id`),
  KEY `int_mesa` (`int_mesa`),
  KEY `int_mesa_2` (`int_mesa`),
  KEY `int_consecutivo` (`int_consecutivo`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes`
--

LOCK TABLES `tbl_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes` DISABLE KEYS */;
INSERT INTO `tbl_ordenes` VALUES (1,'2016-03-25 02:11:41',1,1,'PAGADA'),(11,'2016-03-25 02:12:36',5,17,'PAGADA'),(12,'2016-03-25 02:10:34',8,12,'PAGADA'),(13,'2016-03-25 02:14:37',6,13,'PAGADA'),(14,'2016-03-12 19:13:31',7,14,'Abierta'),(15,'2016-03-25 02:11:41',6,15,'PAGADA'),(16,'2016-03-12 19:16:49',7,16,'PAGADA'),(17,'2016-03-25 02:11:41',8,17,'PAGADA'),(18,'2016-03-15 14:54:34',9,18,'PAGADA'),(19,'2016-03-15 14:55:40',5,19,'PAGADA'),(20,'2016-03-15 14:56:50',3,20,'PAGADA'),(21,'2016-03-16 20:15:08',1,21,'PAGADA'),(22,'2016-03-25 02:09:30',12,22,'PAGADA'),(23,'2016-03-24 23:40:47',1,23,'PAGADA'),(24,'2016-03-25 02:18:00',7,24,'PAGADA'),(25,'2016-03-25 02:28:00',4,25,'PAGADA'),(26,'2016-03-28 02:23:00',9,26,'PAGADA'),(27,'2016-03-28 02:24:00',4,27,'PAGADA'),(28,'2016-03-28 02:27:00',5,28,'PAGADA'),(29,'2016-03-28 02:30:00',3,29,'PAGADA'),(30,'2016-03-28 02:31:00',8,30,'PAGADA'),(31,'2016-03-28 02:33:00',4,31,'PAGADA'),(32,'2016-03-28 02:38:00',4,32,'PAGADA'),(33,'2016-03-28 02:41:00',3,33,'PAGADA'),(34,'2016-03-28 02:42:00',5,34,'PAGADA'),(35,'2016-03-28 02:44:00',7,35,'PAGADA'),(36,'2016-03-28 02:47:00',6,36,'PAGADA'),(37,'2016-03-28 02:49:00',5,37,'PAGADA'),(38,'2016-03-28 02:56:00',2,38,'PAGADA'),(39,'2016-03-28 02:58:00',9,39,'PAGADA'),(40,'2016-03-28 03:00:00',2,40,'PAGADA'),(41,'2016-03-28 03:03:00',5,41,'PAGADA'),(42,'2016-03-28 03:06:00',5,42,'PAGADA'),(43,'2016-03-28 03:07:00',3,43,'PAGADA'),(44,'2016-03-28 03:09:00',8,44,'PAGADA'),(45,'2016-03-28 03:11:00',1,45,'PAGADA'),(46,'2016-03-28 03:12:00',4,46,'PAGADA'),(47,'2016-03-28 18:53:00',4,47,'PAGADA'),(48,'2016-03-28 18:59:00',1,48,'PAGADA'),(49,'2016-03-28 19:01:00',5,49,'PAGADA'),(50,'2016-03-28 19:03:00',5,50,'PAGADA'),(51,'2016-03-28 19:31:00',5,51,'PAGADA'),(52,'2016-03-28 19:35:00',3,52,'PAGADA'),(53,'2016-03-28 19:39:00',5,53,'PAGADA'),(54,'2016-03-28 20:00:00',10,54,'PAGADA'),(55,'2016-03-29 19:06:00',12,55,'PAGADA'),(56,'2016-03-29 19:14:00',11,56,'PAGADA'),(57,'2016-03-29 19:20:00',2,57,'PAGADA'),(58,'2016-03-29 19:24:00',5,58,'Cancelada'),(59,'2016-03-29 19:25:00',6,59,'Cancelada'),(60,'2016-03-29 19:32:00',10,60,'PAGADA'),(61,'2016-03-29 20:00:00',8,61,'PAGADA'),(62,'2016-03-29 20:05:00',1,62,'PAGADA'),(63,'2016-03-31 01:38:00',4,63,'Cancelada'),(64,'2016-03-31 01:46:00',10,64,'Abierta'),(65,'2016-04-04 00:01:00',3,65,'PAGADA'),(66,'2016-04-04 00:02:00',2,66,'Abierta'),(67,'2016-04-06 19:45:00',16,70,'Abierta');
/*!40000 ALTER TABLE `tbl_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes_cerradas`
--

DROP TABLE IF EXISTS `tbl_ordenes_cerradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ordenes_cerradas` (
  `id_orden_cerrada` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden_id` int(11) NOT NULL,
  `dt_horafecha_cierre_orden` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_total` float NOT NULL,
  `bool_factura` tinyint(1) NOT NULL DEFAULT '0',
  `chr_referencia_notas` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `int_lvl_report` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_orden_cerrada`),
  KEY `id_orden_id` (`id_orden_id`),
  CONSTRAINT `Cerrada_orden_ID` FOREIGN KEY (`id_orden_id`) REFERENCES `tbl_ordenes` (`id_orden_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_cerradas`
--

LOCK TABLES `tbl_ordenes_cerradas` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_cerradas` DISABLE KEYS */;
INSERT INTO `tbl_ordenes_cerradas` VALUES (1,23,'2016-03-25 05:40:47',103,0,'Nada',1),(2,22,'2016-03-25 08:09:30',328,0,'Nada',0),(3,12,'2016-03-25 08:10:34',195,0,'Nada',0),(4,11,'2016-03-25 08:12:36',132,0,'Nada',1),(5,13,'2016-03-25 08:14:37',50,0,'Nada',1),(6,24,'2016-03-25 08:19:26',142,0,'Nada',1),(7,19,'2016-03-25 08:20:40',30,0,'Nada',1),(8,17,'2016-03-25 08:21:01',105,0,'Nada',1),(9,25,'2016-03-25 08:29:03',200,0,'Nada',0),(10,21,'2016-03-28 08:19:25',201,0,'Nada',1),(11,20,'2016-03-28 08:22:33',170,0,'Nada',1),(12,26,'2016-03-28 08:24:21',175,0,'Nada',1),(13,27,'2016-03-28 08:25:37',287,0,'Nada',1),(14,28,'2016-03-28 08:28:14',175,0,'Nada',1),(15,29,'2016-03-28 08:30:38',271,0,'Nada',1),(16,30,'2016-03-28 08:31:54',200,0,'Nada',1),(17,31,'2016-03-28 08:34:25',267,0,'Nada',1),(18,16,'2016-03-28 08:35:59',225,0,'Nada',1),(19,32,'2016-03-28 08:38:40',352,0,'Nada',1),(20,33,'2016-03-28 08:41:36',357,0,'Nada',1),(21,34,'2016-03-28 08:42:54',310,0,'Nada',1),(22,35,'2016-03-28 08:44:47',202,0,'Nada',1),(23,1,'2016-03-28 08:46:10',90,0,'Nada',1),(24,36,'2016-03-28 08:47:35',307,0,'Nada',1),(25,37,'2016-03-28 08:50:03',292,0,'Nada',1),(26,38,'2016-03-28 08:56:54',329,0,'Nada',1),(27,39,'2016-03-28 08:59:19',344,0,'Nada',1),(28,40,'2016-03-28 09:01:20',350,0,'Nada',1),(29,18,'2016-03-28 09:02:28',195,0,'Nada',1),(30,41,'2016-03-28 09:04:00',353,0,'Nada',1),(31,42,'2016-03-28 09:07:00',312,0,'Nada',1),(32,43,'2016-03-28 09:08:09',302,0,'Nada',1),(33,44,'2016-03-28 09:10:09',417,0,'Nada',1),(34,45,'2016-03-28 09:11:53',382,0,'Nada',1),(35,46,'2016-03-28 09:13:37',342,0,'Nada',1),(36,49,'2016-03-29 01:03:13',130,0,'Nada',0),(37,50,'2016-03-29 01:04:23',297,0,'Nada',0),(38,51,'2016-03-29 06:08:55',84,0,'Efectivo',1),(39,54,'2016-03-30 01:04:45',98,0,'Efectivo',1),(40,55,'2016-03-30 01:07:34',84,0,'Efectivo',1),(41,53,'2016-03-30 01:12:54',327,0,'Efectivo',1),(42,56,'2016-03-30 01:18:24',486,0,'Efectivo',1),(43,60,'2016-03-30 01:49:54',234,0,'Efectivo',1),(44,57,'2016-03-30 01:52:36',170,0,'Efectivo',1),(45,15,'2016-03-30 01:55:46',219,0,'Efectivo',1),(46,61,'2016-03-30 02:01:05',269,0,'Efectivo',1),(47,52,'2016-03-30 02:03:51',365,0,'Efectivo',0),(48,62,'2016-03-30 02:06:08',205,0,'Efectivo',1),(49,65,'2016-04-07 00:35:55',284,0,'Efectivo',0);
/*!40000 ALTER TABLE `tbl_ordenes_cerradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_precios_productos`
--

DROP TABLE IF EXISTS `tbl_precios_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_precios_productos` (
  `id_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `dbl_precio` decimal(10,2) NOT NULL,
  `int_tipo_precio` int(11) NOT NULL,
  `bit_activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_precio`),
  KEY `id_producto` (`id_producto`),
  KEY `int_tipo_precio` (`int_tipo_precio`),
  KEY `id_producto_2` (`id_producto`),
  CONSTRAINT `tbl_precios_productos_ibfk_1` FOREIGN KEY (`int_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_precios_productos`
--

LOCK TABLES `tbl_precios_productos` WRITE;
/*!40000 ALTER TABLE `tbl_precios_productos` DISABLE KEYS */;
INSERT INTO `tbl_precios_productos` VALUES (1,5,11.00,1,1),(2,6,10.00,1,1),(3,0,10.00,1,1),(4,7,10.00,1,1),(5,8,10.00,1,1),(6,9,10.00,1,1),(7,10,10.00,1,1),(8,11,10.00,1,1),(9,12,10.00,1,1),(10,13,10.00,1,1),(11,14,12.00,1,1),(12,15,10.00,1,1),(13,16,15.00,1,1),(14,17,15.00,1,1),(15,18,80.00,1,1),(16,19,80.00,1,1),(17,20,75.00,1,1),(18,21,75.00,1,1),(19,22,75.00,1,1),(20,23,75.00,1,1),(21,24,75.00,1,1),(22,25,1.00,1,1),(23,26,45.00,1,1),(24,27,40.00,1,1),(25,28,40.00,1,1),(26,29,45.00,1,1),(27,30,27.00,1,1),(28,31,27.00,1,1),(29,32,24.00,1,1),(30,33,22.00,1,1),(31,34,22.00,1,1),(32,35,27.00,1,1),(33,36,2.00,1,1),(34,37,15.00,1,1),(35,38,45.00,1,1),(36,39,15.00,1,1),(37,40,45.00,1,1),(38,41,15.00,1,1),(39,42,45.00,1,1),(40,43,15.00,1,1),(41,44,45.00,1,1),(42,45,15.00,1,1),(43,46,15.00,1,1),(44,47,15.00,1,1),(45,48,15.00,1,1),(46,49,15.00,1,1),(47,50,15.00,1,1),(48,51,15.00,1,1),(49,52,15.00,1,1),(50,53,12.00,1,1),(51,54,25.00,1,1),(52,55,25.00,1,1),(53,56,30.00,1,1),(54,57,24.00,1,1),(55,58,24.00,1,1),(56,59,24.00,1,1),(57,60,24.00,1,1),(58,61,24.00,1,1),(59,62,24.00,1,1),(60,63,24.00,1,1),(61,64,24.00,1,1),(62,65,24.00,1,1),(63,66,24.00,1,1),(64,67,24.00,1,1),(65,68,24.00,1,1),(66,69,24.00,1,1),(68,71,10.00,1,1),(69,72,10.00,1,1),(70,73,10.00,1,1),(71,74,10.00,1,1),(72,75,10.00,1,1),(73,76,10.00,1,1),(74,77,10.00,1,1),(75,78,10.00,1,1),(76,79,12.00,1,1),(77,80,10.00,1,1),(78,70,10.00,1,1),(79,81,45.00,1,1),(80,82,45.00,1,1),(81,83,45.00,1,1),(82,84,45.00,1,1),(83,85,40.00,1,1),(84,86,40.00,1,1),(85,87,40.00,1,1),(86,88,40.00,1,1),(87,89,20.00,1,1),(88,90,20.00,1,1),(89,91,28.00,1,1);
/*!40000 ALTER TABLE `tbl_precios_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prods_orden_opciones`
--

DROP TABLE IF EXISTS `tbl_prods_orden_opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_prods_orden_opciones` (
  `id_prod_orden_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `id_prod_x_orden` int(11) NOT NULL,
  `id_variante_platillo` int(11) NOT NULL,
  PRIMARY KEY (`id_prod_orden_opcion`),
  KEY `id_prod_x_orden` (`id_prod_x_orden`),
  KEY `dasdfasdf` (`id_variante_platillo`) COMMENT 'edsafasdf',
  CONSTRAINT `tbl_prods_orden_opciones_ibfk_1` FOREIGN KEY (`id_prod_x_orden`) REFERENCES `tbl_prods_x_orden` (`id_prod_x_orden`),
  CONSTRAINT `tbl_prods_orden_opciones_ibfk_2` FOREIGN KEY (`id_variante_platillo`) REFERENCES `tbl_variantes_platillos` (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_orden_opciones`
--

LOCK TABLES `tbl_prods_orden_opciones` WRITE;
/*!40000 ALTER TABLE `tbl_prods_orden_opciones` DISABLE KEYS */;
INSERT INTO `tbl_prods_orden_opciones` VALUES (1,331,3),(2,331,4),(8,332,5),(9,333,10);
/*!40000 ALTER TABLE `tbl_prods_orden_opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prods_variantes`
--

DROP TABLE IF EXISTS `tbl_prods_variantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_prods_variantes` (
  `id_prods_variantes` int(11) NOT NULL AUTO_INCREMENT,
  `id_variante` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  PRIMARY KEY (`id_prods_variantes`),
  KEY `dsff` (`id_producto`),
  KEY `id_variante` (`id_variante`),
  CONSTRAINT `tbl_prods_variantes_ibfk_1` FOREIGN KEY (`id_variante`) REFERENCES `tbl_variantes_platillos` (`id_variante_pl`),
  CONSTRAINT `tbl_prods_variantes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_precios_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_variantes`
--

LOCK TABLES `tbl_prods_variantes` WRITE;
/*!40000 ALTER TABLE `tbl_prods_variantes` DISABLE KEYS */;
INSERT INTO `tbl_prods_variantes` VALUES (91,1,5),(92,2,5),(93,3,5),(94,4,5),(95,5,5),(96,7,5),(97,10,5),(98,1,6),(99,2,6),(100,3,6),(101,4,6),(102,5,6),(103,7,6),(104,10,6),(105,1,7),(106,2,7),(107,3,7),(108,4,7),(109,5,7),(110,7,7),(111,10,7),(112,1,8),(113,2,8),(114,3,8),(115,4,8),(116,5,8),(117,7,8),(118,10,8),(119,1,9),(120,2,9),(121,3,9),(122,4,9),(123,5,9),(124,7,9),(125,10,9),(126,1,10),(127,2,10),(128,3,10),(129,4,10),(130,5,10),(131,7,10),(132,10,10),(133,1,11),(134,2,11),(135,3,11),(136,4,11),(137,5,11),(138,7,11),(139,10,11),(140,1,12),(141,2,12),(142,3,12),(143,4,12),(144,5,12),(145,7,12),(146,10,12),(147,1,13),(148,2,13),(149,3,13),(150,4,13),(151,5,13),(152,7,13),(153,10,13),(154,3,14),(155,4,14),(156,5,14),(157,7,14),(158,10,14),(159,3,15),(160,4,15),(161,5,15),(162,6,15),(163,7,15),(164,10,15),(165,3,16),(166,4,16),(167,5,16),(168,7,16),(169,10,16),(170,3,17),(171,4,17),(172,5,17),(173,6,17),(174,7,17),(175,10,17),(176,4,18),(177,10,18),(178,4,19),(179,10,19),(180,4,20),(181,10,20),(182,4,21),(183,10,21),(184,4,22),(185,10,22),(186,4,23),(187,10,23),(188,4,24),(189,10,24),(190,10,25),(191,10,28),(192,10,29),(193,10,30),(194,10,31),(195,10,33),(196,10,34),(197,10,35),(198,10,36),(199,10,37),(200,10,39),(201,10,41),(203,10,43),(204,10,45),(205,10,46),(206,10,47),(207,10,48),(208,10,49),(209,10,50),(210,10,51),(211,10,52),(213,10,54),(214,10,55),(215,1,57),(216,2,57),(217,3,57),(218,4,57),(219,5,57),(220,7,57),(221,8,57),(222,10,57),(223,1,58),(224,2,58),(225,3,58),(226,4,58),(227,5,58),(228,7,58),(229,8,58),(230,10,58),(231,1,59),(232,2,59),(233,3,59),(234,4,59),(235,5,59),(236,7,59),(237,8,59),(238,10,59),(239,1,60),(240,2,60),(241,3,60),(242,4,60),(243,5,60),(244,7,60),(245,8,60),(246,10,60),(247,1,61),(248,2,61),(249,3,61),(250,4,61),(251,5,61),(252,7,61),(253,8,61),(254,10,61),(255,1,62),(256,2,62),(257,3,62),(258,4,62),(259,5,62),(260,7,62),(261,8,62),(262,10,62),(263,1,63),(264,2,63),(265,3,63),(266,4,63),(267,5,63),(268,7,63),(269,8,63),(270,10,63),(271,1,64),(272,2,64),(273,3,64),(274,4,64),(275,5,64),(276,7,64),(277,8,64),(278,10,64),(279,1,65),(280,2,65),(281,3,65),(282,4,65),(283,5,65),(284,7,65),(285,8,65),(286,10,65),(287,1,66),(288,2,66),(289,3,66),(290,4,66),(291,5,66),(292,7,66),(293,8,66),(294,10,66),(295,1,67),(296,2,67),(297,3,67),(298,4,67),(299,5,67),(300,7,67),(301,8,67),(302,10,67),(303,1,68),(304,2,68),(305,3,68),(306,4,68),(307,5,68),(308,7,68),(309,8,68),(310,10,68),(311,1,69),(312,2,69),(313,3,69),(314,4,69),(315,5,69),(316,7,69),(317,8,69),(318,10,69),(319,3,70),(320,4,70),(321,5,70),(322,10,70),(323,3,71),(324,4,71),(325,5,71),(326,10,71),(327,3,72),(328,4,72),(329,5,72),(330,10,72),(331,3,73),(332,4,73),(333,5,73),(334,10,73),(335,3,74),(336,4,74),(337,5,74),(338,10,74),(339,3,75),(340,4,75),(341,5,75),(342,10,75),(343,3,76),(344,4,76),(345,5,76),(346,10,76),(347,3,77),(348,4,77),(349,5,77),(350,10,77),(351,3,78),(352,4,78),(353,5,78),(354,10,78),(355,3,79),(356,4,79),(357,5,79),(358,10,79),(359,3,80),(360,4,80),(361,5,80),(362,10,80),(363,4,81),(364,5,81),(365,7,81),(366,8,81),(367,9,81),(368,10,81),(369,4,82),(370,5,82),(371,7,82),(372,8,82),(373,9,82),(374,10,82),(375,4,83),(376,5,83),(377,7,83),(378,8,83),(379,9,83),(380,10,83),(381,4,84),(382,5,84),(383,7,84),(384,8,84),(385,9,84),(386,10,84),(387,4,85),(388,5,85),(389,7,85),(390,8,85),(391,9,85),(392,10,85),(393,4,86),(394,5,86),(395,7,86),(396,8,86),(397,9,86),(398,10,86),(399,4,87),(400,5,87),(401,7,87),(402,8,87),(403,9,87),(404,10,87),(405,4,88),(406,5,88),(407,7,88),(408,8,88),(409,9,88),(410,10,88),(411,10,89),(412,10,91);
/*!40000 ALTER TABLE `tbl_prods_variantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prods_x_orden`
--

DROP TABLE IF EXISTS `tbl_prods_x_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_prods_x_orden` (
  `id_prod_x_orden` int(11) NOT NULL AUTO_INCREMENT,
  `int_orden_id` int(11) NOT NULL,
  `int_producto_id` int(11) NOT NULL,
  `int_cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_prod_x_orden`),
  KEY `int_orden_id` (`int_orden_id`,`int_producto_id`),
  KEY `int_producto_id` (`int_producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_x_orden`
--

LOCK TABLES `tbl_prods_x_orden` WRITE;
/*!40000 ALTER TABLE `tbl_prods_x_orden` DISABLE KEYS */;
INSERT INTO `tbl_prods_x_orden` VALUES (1,1,6,2),(2,1,8,5),(3,1,11,2),(5,12,9,7),(6,13,9,5),(8,15,15,2),(9,16,9,6),(10,16,6,6),(11,16,20,1),(12,16,45,1),(13,16,47,1),(14,17,17,7),(15,18,26,1),(16,18,20,2),(17,19,16,2),(18,20,9,8),(19,20,40,1),(20,21,15,5),(21,21,30,3),(22,21,7,4),(24,21,46,1),(25,14,5,2),(26,21,47,1),(27,20,29,1),(28,22,20,1),(29,22,18,2),(30,22,32,2),(31,22,45,1),(32,22,48,1),(33,22,52,1),(34,23,5,3),(35,23,16,1),(36,23,45,1),(37,23,48,1),(38,23,54,1),(39,12,8,5),(40,12,42,1),(41,12,56,1),(42,11,15,6),(43,11,7,3),(44,11,51,1),(45,11,31,1),(46,24,25,7),(47,24,9,5),(48,24,15,4),(49,24,42,1),(50,25,6,6),(51,25,15,5),(52,25,47,1),(54,25,54,3),(55,26,6,6),(56,26,45,1),(57,26,11,6),(58,26,48,1),(59,26,55,1),(60,27,8,6),(61,27,9,5),(62,27,20,1),(63,27,31,1),(64,27,41,1),(65,27,46,1),(66,27,49,1),(67,27,56,1),(68,28,6,6),(69,28,21,1),(70,28,55,1),(71,28,51,1),(72,29,7,9),(73,29,10,5),(74,29,14,3),(75,29,27,1),(76,29,49,1),(77,29,47,1),(78,29,54,1),(79,30,29,1),(80,30,7,4),(81,30,43,1),(82,30,24,1),(83,30,55,1),(84,31,6,6),(85,31,16,1),(86,31,19,1),(87,31,36,6),(88,31,44,1),(89,31,49,1),(90,31,48,1),(91,31,55,1),(92,32,8,6),(93,32,14,4),(94,32,21,1),(95,32,30,1),(96,32,42,1),(97,32,49,1),(98,32,56,1),(99,32,55,1),(100,32,31,1),(101,33,7,6),(102,33,15,5),(103,33,31,1),(104,33,20,1),(105,33,43,1),(106,33,41,1),(107,33,51,1),(108,33,54,3),(109,33,54,1),(110,34,6,3),(111,34,8,5),(112,34,15,7),(113,34,16,5),(114,34,40,1),(115,34,45,1),(116,34,54,1),(117,35,8,5),(118,35,20,1),(119,35,33,1),(120,35,27,1),(121,35,46,1),(122,36,7,1),(123,36,8,4),(124,36,15,6),(125,36,19,1),(126,36,30,1),(127,36,44,1),(128,36,48,1),(129,36,56,1),(130,37,6,4),(131,37,7,5),(132,37,15,1),(133,37,19,1),(134,37,30,1),(135,37,44,1),(136,37,48,1),(137,37,55,1),(138,38,25,6),(139,38,7,5),(140,38,14,4),(141,38,15,6),(142,38,28,2),(143,38,48,4),(144,38,55,1),(145,39,6,5),(146,39,6,5),(147,39,14,4),(148,39,20,1),(149,39,30,1),(150,39,32,1),(151,39,45,1),(152,39,48,1),(153,39,52,1),(154,39,55,1),(155,40,8,8),(156,40,15,5),(157,40,14,3),(158,40,20,1),(159,40,33,1),(160,40,44,1),(161,40,53,1),(162,40,56,1),(163,41,36,4),(164,41,10,5),(165,41,17,3),(166,41,29,4),(167,41,46,1),(168,41,51,1),(169,41,52,1),(170,41,55,1),(171,42,7,4),(172,42,9,6),(173,42,16,2),(174,42,30,1),(175,42,15,7),(176,42,42,1),(177,42,45,1),(178,42,54,1),(179,43,6,4),(180,43,13,5),(181,43,23,1),(182,43,28,1),(183,43,31,1),(184,43,45,1),(185,43,51,1),(186,43,52,1),(187,43,54,1),(188,44,11,6),(189,44,6,4),(190,44,15,7),(191,44,20,1),(192,44,30,1),(193,44,28,1),(194,44,46,1),(195,44,49,1),(196,44,44,1),(197,44,56,1),(198,45,9,5),(199,45,16,3),(200,45,23,1),(201,45,31,1),(202,45,44,1),(203,45,47,1),(204,45,42,1),(205,45,18,1),(206,46,9,4),(207,46,15,8),(208,46,20,1),(209,46,31,1),(210,46,29,1),(211,46,47,1),(212,46,44,1),(213,46,52,1),(214,47,15,5),(215,47,6,3),(216,47,22,1),(217,47,30,1),(218,47,41,1),(219,47,38,1),(220,47,55,1),(222,47,25,6),(223,48,7,5),(224,48,9,5),(225,48,15,4),(226,48,30,1),(227,48,49,1),(228,48,50,1),(229,48,54,1),(230,48,55,1),(231,49,21,1),(232,49,43,1),(233,49,51,1),(234,49,55,1),(235,50,7,5),(236,50,9,9),(237,50,23,1),(238,50,31,1),(239,50,45,1),(240,50,48,1),(241,50,55,1),(243,52,16,5),(246,54,8,8),(247,53,8,5),(250,53,15,5),(251,51,8,5),(252,51,15,7),(253,51,30,1),(255,54,15,6),(256,54,30,1),(257,54,48,1),(258,54,49,1),(259,54,56,1),(260,55,15,5),(261,55,22,1),(262,55,8,7),(263,55,6,5),(264,55,47,1),(265,55,51,1),(266,55,48,1),(267,53,16,6),(268,53,21,1),(269,53,33,1),(270,53,45,1),(271,53,52,1),(272,53,50,1),(273,53,55,1),(274,56,6,4),(275,56,8,8),(276,56,16,2),(277,56,22,3),(278,56,29,1),(279,56,44,1),(280,56,51,1),(281,56,56,1),(283,57,8,5),(284,57,19,1),(285,57,46,1),(286,57,50,1),(287,57,55,1),(288,60,8,5),(289,60,19,1),(290,60,15,7),(291,60,46,1),(292,60,51,1),(293,60,50,1),(294,60,55,1),(295,15,8,5),(296,15,8,5),(297,15,23,1),(298,15,45,1),(299,15,51,1),(300,15,56,1),(301,61,10,6),(302,61,15,7),(303,61,6,3),(304,61,29,1),(305,61,55,1),(306,61,48,1),(307,61,51,1),(308,61,50,1),(309,61,43,1),(310,52,8,6),(311,52,6,5),(312,52,15,9),(314,52,16,3),(315,52,44,1),(316,52,52,1),(317,52,56,1),(318,62,8,5),(319,62,16,1),(320,62,18,1),(321,62,48,1),(322,62,49,1),(323,62,52,1),(324,62,56,1),(325,64,8,5),(326,64,64,1),(327,64,76,1),(328,64,67,1),(329,64,30,1),(330,66,5,3),(331,65,5,4),(332,65,15,5),(333,65,61,5),(334,65,61,5),(335,66,19,1),(336,66,82,1);
/*!40000 ALTER TABLE `tbl_prods_x_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productos`
--

DROP TABLE IF EXISTS `tbl_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_prod` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_prod` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `chr_pic_prod_path` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `int_activo` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `tbl_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productos`
--

LOCK TABLES `tbl_productos` WRITE;
/*!40000 ALTER TABLE `tbl_productos` DISABLE KEYS */;
INSERT INTO `tbl_productos` VALUES (5,'Maciza de Res','Tacos de maciza de Res','5.jpg',2,1),(6,'Maciza de Puerco','Tacos de maciza de puerco','6.jpg',2,1),(7,'Lengua de cerdo','Tacos de lengua de cerdo al vapor','7.jpg',2,1),(8,'Carnitas','Tacos de carnitas','8.jpg',2,1),(9,'Buche','Tacos de buche','9.jpg',2,1),(10,'Oreja','Tacos de oreja de cerdo','10.jpg',2,1),(11,'Azadura','Tacos de azadura','11.jpg',2,1),(12,'Trompa','Tacos de trompa de cerdo','12.jpg',2,1),(13,'Corazón','Tacos de corazón','13.jpg',2,1),(14,'Bistec de res','Tacos de bistec de res','14.jpg',4,1),(15,'Pastor','Tacos al pastor','15.jpg',4,1),(16,'Bistec con quesillo','Taco de bistec de res con quesillo','16.jpg',4,1),(17,'Pastor con quesillo','Taco al pastor con quesillo','17.jpg',4,1),(18,'Mula Terca','Tocino/Jamón/Bistec de res o carne al pastor y quesillo','18.jpg',5,1),(19,'Plato Suizo','Bistec de res o carne al pastor y quesillo','19.jpg',5,1),(20,'Alambre','Cebolla, Chile Morrón, Tocino, Bistec de Res y Quesillo','20.jpg',5,1),(21,'Alambre Especial','Cebolla, Chile morrón, Tocino, Bistec de Res, Jamón, Champiñones, Carne al pastor y Quesillo','21.jpg',5,1),(22,'Mata Hambre','Cebolla, Chile Morrón, Tocino, Bistec de Res, Jamón, Carne al pastor, Tomate y Quesillo','22.jpg',5,1),(23,'Plato Mixto','Tocino, Jamón, Carne al pastor, Salsa Mexicana y quesillo','23.jpg',5,1),(24,'Vegetariano','Cebolla, Chile Morrón, Tomate, Champiñones y quesillo','24.jpg',5,1),(25,'Tortilla adicional','Tortilla adicional','25.jpg',1,1),(26,'Pozole rojo','Plato de pozole rojo, grande','26.jpg',6,0),(27,'Pozole Rojo Chico','Pozole Rojo Chico','27.jpg',6,0),(28,'Queso Fundido','Queso fundido normal','28.jpg',6,1),(29,'Queso Especial','Queso fundido combinado con bistec, pastor o champiñones','29.jpg',6,1),(30,'Gringa','Tortilla de harina con queso y carne','30.jpg',6,1),(31,'Sincronizada','Tortilla de harina con queso y jamón','31.jpg',6,1),(32,'Tostada','Se prepara con la carne de su elección','32.jpg',6,0),(33,'Burrita','Burrita de tortilla de harina con quesillo','33.jpg',6,1),(34,'Quesadilla','Quesadilla','34.jpg',6,1),(35,'Quesadilla Especial','Con Bistec de res, pastor o champiñones','35.jpg',6,1),(36,'Tostada adicional','Tostada adicional para cualquier alimento','36.jpg',1,1),(37,'Vaso Agua de horchata','Agua fresca de horchata, un vaso','37.jpg',7,1),(38,'Agua de horchata, Jarra','Jarra de agua de horchata','38.jpg',7,1),(39,'Agua de Jamaica, Vaso','Vaso de agua de jamaica','39.jpg',7,1),(40,'Agua de Jamaica, Jarra','Jarra de agua de jamaica','40.jpg',7,1),(41,'Agua de Naranja, Vaso','Vaso de agua de naranja','41.jpg',7,1),(42,'Agua de naranja, Jarra','Jarra de agua de naranja','42.jpg',7,1),(43,'Agua de Mandarina, Vaso','Vaso de agua de mandarina','43.jpg',7,1),(44,'Agua de Mandarina, Jarra','Jarra de agua de mandarina','44.jpg',7,1),(45,'R. Pepsi','Refresco marca Pepsi','45.jpg',7,1),(46,'Mirinda','Refresco mirinda','46.jpg',7,1),(47,'Sangria','Refresco Sangría','47.jpg',7,1),(48,'7 Up','Refresco 7up','48.jpg',7,1),(49,'Manzanita Sol','Refresco Manzanita Sol','49.jpg',7,1),(50,'Agua Mineral','Agua mineral embotellada','50.jpg',7,1),(51,'Café','Tasa de café','51.jpg',7,1),(52,'Atole','Atole','52.jpg',7,1),(53,'Agua SIN gas 1/2 Lt.','Agua embotellada SIN gas 1/2 Lt.','53.jpg',7,1),(54,'Panqué de elote','Panqué de elote','54.jpg',8,1),(55,'Flan','Flan','55.jpg',8,1),(56,'Pastel de Queso','Pastel de queso','56.jpg',8,1),(57,'Tostada Maciza de Puerco','Tostada Maciza de Puerco','57.jpg',9,1),(58,'Tostada Maciza de Res','Tostada Maciza de Res','58.jpg',9,1),(59,'Tostada Carnitas','Tostada de Carnitas','59.jpg',9,1),(60,'Tostada de Trompa','Tostada de Trompa','60.jpg',9,1),(61,'Tostada de Buche','Tostada de Buche','61.jpg',9,1),(62,'Tostada de Azadura','Tostada de Azadura','62.jpg',9,1),(63,'Tostada de Cabeza','Tostada de Cabeza','63.jpg',9,1),(64,'Tostada de Oreja','Tostada de Oreja','64.jpg',9,1),(65,'Tostada de Lengua','Tostada de Lengua','65.jpg',9,1),(66,'Tostada de Quesillo','Tostada de Quesillo','66.jpg',9,1),(67,'Tostada de Pastor','Tostada con carne al Pastor','67.jpg',9,1),(68,'Tostada de Bistec','Tostada de Bistec de Res','68.jpg',9,1),(69,'Tostada de Chamorro','Tostada de Chamorro','69.jpg',9,1),(70,'T. Ahogado Maciza de Res','Taco ahogado en salsa y guacamole de Maciza de Res','70.jpg',3,1),(71,'T. Ahogado Maciza de Puerco','Taco ahogado de maciza de puerco','71.jpg',3,1),(72,'T. Ahogado Lengua de Puerco','Taco ahogado de lengua de puerco','72.jpg',3,1),(73,'T. Ahogado de Carnitas','Taco ahogado de carnitas mixtas','73.jpg',3,1),(74,'T. Ahogado de Buche','Taco ahogado de Buche','74.jpg',3,1),(75,'T. Ahogado de Oreja','Taco Ahogado de Oreja','75.jpg',3,1),(76,'T. Ahogado de Azadura','Taco ahogado de Azadura','76.jpg',3,1),(77,'T. Ahogado de Trompa','Taco ahogado de trompa','77.jpg',3,1),(78,'T. Ahogado de Corazón','Taco ahogado de corazón','78.jpg',3,1),(79,'T. Ahogado de Bistec de Res','Taco ahogado de bistec de Res','79.jpg',3,1),(80,'Taco ahogado al Pastor','Taco Ahogado al pastor','80.jpg',3,1),(81,'Poz. Maciza de Puerco','Pozole de maciza de puerco','81.jpg',10,1),(82,'Poz. Maciza de Res','Pozole de Maciza de Res','82.jpg',10,1),(83,'Poz. de Surtido, Puerco','Pozole de carne surtida de puerco','83.jpg',10,1),(84,'Poz. Mixto de Puerco y Res','Pozole Mixto de Puerco y Res','84.jpg',10,1),(85,'Poz. Maciza de Puerco CHICO','Pozole de maciza de puerco, chico','85.jpg',10,1),(86,'Poz. Maciza de Res CHICO','Poz. Maciza de Res CHICO','86.jpg',10,1),(87,'Poz. Surtida de Puerco CHICO','Pozole con carne surtida de puerco, chico','87.jpg',10,1),(88,'Poz. Mixto CHICO','Pozole Mixto Chico','88.jpg',10,1),(89,'Agua SIN Gas 1 Litro','Botella de Agua sin Gas 1 Lt.','89.jpg',7,1),(91,'Cerveza Stella Artois','Cerveza Stella Artois','91.jpg',7,1);
/*!40000 ALTER TABLE `tbl_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promociones`
--

DROP TABLE IF EXISTS `tbl_promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_promociones` (
  `id_promocion` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `fl_descuento` float NOT NULL,
  `dt_fecha_inicio` date NOT NULL,
  `dt_fecha_final` date NOT NULL,
  `chr_dias_valido` varchar(7) COLLATE utf8_spanish_ci NOT NULL,
  `bit_activo` int(11) NOT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `id_precio` (`fl_descuento`),
  KEY `id_precio_2` (`fl_descuento`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tbl_promociones_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promociones`
--

LOCK TABLES `tbl_promociones` WRITE;
/*!40000 ALTER TABLE `tbl_promociones` DISABLE KEYS */;
INSERT INTO `tbl_promociones` VALUES (1,8,0.3,'2016-03-01','2029-12-31','0010100',1),(2,15,0.3,'2016-03-01','2029-12-31','0010100',1);
/*!40000 ALTER TABLE `tbl_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_recetas_productos`
--

DROP TABLE IF EXISTS `tbl_recetas_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_recetas_productos` (
  `id_receta_prod` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `int_cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_receta_prod`),
  KEY `id_producto` (`id_producto`,`id_insumo`),
  KEY `id_insumo` (`id_insumo`),
  CONSTRAINT `tbl_recetas_productos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  CONSTRAINT `tbl_recetas_productos_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `tbl_insumos` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_recetas_productos`
--

LOCK TABLES `tbl_recetas_productos` WRITE;
/*!40000 ALTER TABLE `tbl_recetas_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_recetas_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reportes`
--

DROP TABLE IF EXISTS `tbl_reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_reportes` (
  `id_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `dt_fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `chr_reporte` text COLLATE utf8_spanish_ci NOT NULL,
  `int_tipo_reporte_id` int(11) NOT NULL,
  PRIMARY KEY (`id_reporte`),
  KEY `int_tipo_reporte_id` (`int_tipo_reporte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reportes`
--

LOCK TABLES `tbl_reportes` WRITE;
/*!40000 ALTER TABLE `tbl_reportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `chr_status` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status`
--

LOCK TABLES `tbl_status` WRITE;
/*!40000 ALTER TABLE `tbl_status` DISABLE KEYS */;
INSERT INTO `tbl_status` VALUES (1,'Administrador'),(2,'Normal');
/*!40000 ALTER TABLE `tbl_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_reporte`
--

DROP TABLE IF EXISTS `tbl_tipo_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipo_reporte` (
  `id_tipo_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `chr_tipo_reporte` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_tipo_reporte` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_reporte`),
  KEY `id_tipo_reporte` (`id_tipo_reporte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_reporte`
--

LOCK TABLES `tbl_tipo_reporte` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_reporte` DISABLE KEYS */;
INSERT INTO `tbl_tipo_reporte` VALUES (1,'Normal','Reporte de ventas diarias normal'),(2,'Mantenimiento','Reporte de mantenimiento');
/*!40000 ALTER TABLE `tbl_tipo_reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipos_precios`
--

DROP TABLE IF EXISTS `tbl_tipos_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_tipos_precios` (
  `id_tipo_precio` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_precio` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipos_precios`
--

LOCK TABLES `tbl_tipos_precios` WRITE;
/*!40000 ALTER TABLE `tbl_tipos_precios` DISABLE KEYS */;
INSERT INTO `tbl_tipos_precios` VALUES (1,'Normal'),(2,'Promocion'),(3,'Cortesía'),(4,'Otro');
/*!40000 ALTER TABLE `tbl_tipos_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_usuario` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `chr_login` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `chr_password` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono_usuario` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_email_usuario` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `int_status` int(11) NOT NULL,
  `bit_activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios`
--

LOCK TABLES `tbl_usuarios` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` VALUES (1,'Usuario de Sistema','admin','$1$tacosroy$vwYxruF1CJ4oZkH25OGaY/','123565656','mail@mail.com',1,0);
/*!40000 ALTER TABLE `tbl_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_variantes_categorias`
--

DROP TABLE IF EXISTS `tbl_variantes_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_variantes_categorias` (
  `id_variante_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_catgoria` int(11) NOT NULL,
  `id_variante_platillo` int(11) NOT NULL,
  PRIMARY KEY (`id_variante_categoria`),
  KEY `gfsdger` (`id_catgoria`),
  KEY `fdvswzsd` (`id_variante_platillo`),
  CONSTRAINT `tbl_variantes_categorias_ibfk_1` FOREIGN KEY (`id_catgoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  CONSTRAINT `tbl_variantes_categorias_ibfk_2` FOREIGN KEY (`id_variante_platillo`) REFERENCES `tbl_variantes_platillos` (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variantes_categorias`
--

LOCK TABLES `tbl_variantes_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_variantes_categorias` DISABLE KEYS */;
INSERT INTO `tbl_variantes_categorias` VALUES (1,2,1),(2,2,3),(3,2,4),(4,2,5),(5,4,6),(6,2,7),(7,2,10),(8,2,2),(9,9,1),(10,9,3),(11,9,4),(12,9,5),(13,9,7),(14,9,10),(15,9,8),(16,9,2),(17,10,4),(18,10,5),(19,10,7),(20,10,10),(21,10,8),(22,10,9),(23,3,3),(24,3,4),(25,3,5),(26,4,3),(27,4,4),(28,4,5),(29,4,7),(30,4,10),(31,5,4),(32,5,10),(33,6,4),(34,6,5),(35,6,7),(36,6,10),(37,10,11),(38,10,12),(39,10,13),(40,10,14),(41,1,10),(42,7,10),(43,8,10),(44,3,10);
/*!40000 ALTER TABLE `tbl_variantes_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_variantes_platillos`
--

DROP TABLE IF EXISTS `tbl_variantes_platillos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_variantes_platillos` (
  `id_variante_pl` int(11) NOT NULL AUTO_INCREMENT,
  `chr_variante_nombre` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_variante_descripcion` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_imprimir` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variantes_platillos`
--

LOCK TABLES `tbl_variantes_platillos` WRITE;
/*!40000 ALTER TABLE `tbl_variantes_platillos` DISABLE KEYS */;
INSERT INTO `tbl_variantes_platillos` VALUES (1,'Sin Salsa','Productos preparados no llevan salsa','S/Salsa'),(2,'Sin Guacamole','Productos preparados no llevan guacamoles','S/Gua'),(3,'Sin Verdura','Los platillos preparados no llevan verdura','S/Verd'),(4,'Sin Cebolla','Los platillos preparados no llevan cebolla','S/Ceb'),(5,'Sin Cilantro','Los platillos preparados no llevan cilantro','S/Cil'),(6,'Sin Piña','Los platillos preparados no llevan piña','S/Piña'),(7,'Pura Carne','Los platillos preparados llevan pura carne al natural','PCne'),(8,'Sin Col','Los platillos preparados no llevan Col','S/Col'),(9,'Sin Rábano','Los platillos preparados no llevan Rábano','S/Rab'),(10,'Para llevar','Los productos son para llevar','PLLEV'),(11,'Maciza de Puerco','El pozole lleva carne maciza de puerco','McPco'),(12,'Maciza de Res','El pozole lleva carne Maciza de Res','McRes'),(13,'Surtido Puerco','El pozole lleva carne surtida de puerco','StPco'),(14,'Mixto Puerco y Res','El pozole lleva carne mixta de puerco y res','Mixto');
/*!40000 ALTER TABLE `tbl_variantes_platillos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_datos_usuarios`
--

DROP TABLE IF EXISTS `vw_datos_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_datos_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_datos_usuarios` (
  `ID` tinyint NOT NULL,
  `Nombre` tinyint NOT NULL,
  `Login` tinyint NOT NULL,
  `Teléfono` tinyint NOT NULL,
  `Email` tinyint NOT NULL,
  `Activo` tinyint NOT NULL,
  `Tipo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_insumos_usados_x_orden`
--

DROP TABLE IF EXISTS `vw_insumos_usados_x_orden`;
/*!50001 DROP VIEW IF EXISTS `vw_insumos_usados_x_orden`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_insumos_usados_x_orden` (
  `OrdenID` tinyint NOT NULL,
  `HoraFecha` tinyint NOT NULL,
  `InsumoID` tinyint NOT NULL,
  `Insumo` tinyint NOT NULL,
  `Usado` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_inventarios_fecha`
--

DROP TABLE IF EXISTS `vw_inventarios_fecha`;
/*!50001 DROP VIEW IF EXISTS `vw_inventarios_fecha`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_inventarios_fecha` (
  `InvID` tinyint NOT NULL,
  `Insumo` tinyint NOT NULL,
  `Cantidad` tinyint NOT NULL,
  `Fecha` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_opciones_platillos_ticket`
--

DROP TABLE IF EXISTS `vw_opciones_platillos_ticket`;
/*!50001 DROP VIEW IF EXISTS `vw_opciones_platillos_ticket`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_opciones_platillos_ticket` (
  `ID` tinyint NOT NULL,
  `IDPO` tinyint NOT NULL,
  `TxtTicket` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_orden_prods_precio`
--

DROP TABLE IF EXISTS `vw_orden_prods_precio`;
/*!50001 DROP VIEW IF EXISTS `vw_orden_prods_precio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_orden_prods_precio` (
  `Orden` tinyint NOT NULL,
  `IDPO` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `IDPR` tinyint NOT NULL,
  `Cantidad` tinyint NOT NULL,
  `Precio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_precios_productos`
--

DROP TABLE IF EXISTS `vw_precios_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_precios_productos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_precios_productos` (
  `ID` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Precio` tinyint NOT NULL,
  `Tipo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_products_catprecio`
--

DROP TABLE IF EXISTS `vw_products_catprecio`;
/*!50001 DROP VIEW IF EXISTS `vw_products_catprecio`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_products_catprecio` (
  `ID` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Desc` tinyint NOT NULL,
  `Categoria` tinyint NOT NULL,
  `Tooltip` tinyint NOT NULL,
  `CatID` tinyint NOT NULL,
  `Precio` tinyint NOT NULL,
  `Tipo` tinyint NOT NULL,
  `Activo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_products_infoCat`
--

DROP TABLE IF EXISTS `vw_products_infoCat`;
/*!50001 DROP VIEW IF EXISTS `vw_products_infoCat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_products_infoCat` (
  `ID` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Descripcion` tinyint NOT NULL,
  `Categoria` tinyint NOT NULL,
  `Tooltip` tinyint NOT NULL,
  `Activo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_variantes_x_categoria`
--

DROP TABLE IF EXISTS `vw_variantes_x_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_x_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_variantes_x_categoria` (
  `ID` tinyint NOT NULL,
  `IDCAT` tinyint NOT NULL,
  `Categoria` tinyint NOT NULL,
  `IDVAR` tinyint NOT NULL,
  `Variante` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_datos_usuarios`
--

/*!50001 DROP TABLE IF EXISTS `vw_datos_usuarios`*/;
/*!50001 DROP VIEW IF EXISTS `vw_datos_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_datos_usuarios` AS select `tbl_usuarios`.`id_usuario` AS `ID`,`tbl_usuarios`.`chr_nombre_usuario` AS `Nombre`,`tbl_usuarios`.`chr_login` AS `Login`,`tbl_usuarios`.`chr_telefono_usuario` AS `Teléfono`,`tbl_usuarios`.`chr_email_usuario` AS `Email`,`tbl_usuarios`.`bit_activo` AS `Activo`,`tbl_status`.`chr_status` AS `Tipo` from (`tbl_usuarios` left join `tbl_status` on((`tbl_usuarios`.`int_status` = `tbl_status`.`id_status`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_insumos_usados_x_orden`
--

/*!50001 DROP TABLE IF EXISTS `vw_insumos_usados_x_orden`*/;
/*!50001 DROP VIEW IF EXISTS `vw_insumos_usados_x_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_insumos_usados_x_orden` AS select `tbl_ordenes_cerradas`.`id_orden_cerrada` AS `OrdenID`,`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden` AS `HoraFecha`,`tbl_insumos`.`id_insumo` AS `InsumoID`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,(`tbl_prods_x_orden`.`int_cantidad` * `tbl_insumos_x_platillo`.`int_cantidad`) AS `Usado` from ((((`tbl_ordenes_cerradas` left join `tbl_prods_x_orden` on((`tbl_prods_x_orden`.`int_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`))) left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_insumos_x_platillo` on((`tbl_insumos_x_platillo`.`id_producto` = `tbl_productos`.`id_producto`))) left join `tbl_insumos` on((`tbl_insumos`.`id_insumo` = `tbl_insumos_x_platillo`.`id_insumo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_inventarios_fecha`
--

/*!50001 DROP TABLE IF EXISTS `vw_inventarios_fecha`*/;
/*!50001 DROP VIEW IF EXISTS `vw_inventarios_fecha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inventarios_fecha` AS select `tbl_inventario`.`id_inventario_id` AS `InvID`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,`tbl_inventario`.`int_cantidad` AS `Cantidad`,`tbl_inventario`.`dt_fecha_insumo` AS `Fecha` from (`tbl_inventario` left join `tbl_insumos` on((`tbl_inventario`.`id_insumo_id` = `tbl_insumos`.`id_insumo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_opciones_platillos_ticket`
--

/*!50001 DROP TABLE IF EXISTS `vw_opciones_platillos_ticket`*/;
/*!50001 DROP VIEW IF EXISTS `vw_opciones_platillos_ticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_opciones_platillos_ticket` AS select `tbl_prods_orden_opciones`.`id_prod_orden_opcion` AS `ID`,`tbl_prods_orden_opciones`.`id_prod_x_orden` AS `IDPO`,`tbl_variantes_platillos`.`chr_imprimir` AS `TxtTicket` from (`tbl_prods_orden_opciones` left join `tbl_variantes_platillos` on((`tbl_prods_orden_opciones`.`id_variante_platillo` = `tbl_variantes_platillos`.`id_variante_pl`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_orden_prods_precio`
--

/*!50001 DROP TABLE IF EXISTS `vw_orden_prods_precio`*/;
/*!50001 DROP VIEW IF EXISTS `vw_orden_prods_precio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orden_prods_precio` AS select `tbl_ordenes`.`id_orden_id` AS `Orden`,`tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPO`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`id_producto` AS `IDPR`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_precios_productos`.`dbl_precio` AS `Precio` from (((`tbl_ordenes` left join `tbl_prods_x_orden` on((`tbl_ordenes`.`id_orden_id` = `tbl_prods_x_orden`.`int_orden_id`))) left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_precios_productos` on((`tbl_precios_productos`.`id_producto` = `tbl_productos`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_precios_productos`
--

/*!50001 DROP TABLE IF EXISTS `vw_precios_productos`*/;
/*!50001 DROP VIEW IF EXISTS `vw_precios_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_precios_productos` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `Tipo` from ((`tbl_productos` left join `tbl_precios_productos` on((`tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_catprecio`
--

/*!50001 DROP TABLE IF EXISTS `vw_products_catprecio`*/;
/*!50001 DROP VIEW IF EXISTS `vw_products_catprecio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_catprecio` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Desc`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`chr_desc_cat` AS `Tooltip`,`tbl_categorias`.`id_categoria` AS `CatID`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `Tipo`,`tbl_productos`.`int_activo` AS `Activo` from (((`tbl_productos` left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`))) left join `tbl_precios_productos` on((`tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_infoCat`
--

/*!50001 DROP TABLE IF EXISTS `vw_products_infoCat`*/;
/*!50001 DROP VIEW IF EXISTS `vw_products_infoCat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_infoCat` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Descripcion`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`chr_desc_cat` AS `Tooltip`,`tbl_productos`.`int_activo` AS `Activo` from (`tbl_productos` left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_variantes_x_categoria`
--

/*!50001 DROP TABLE IF EXISTS `vw_variantes_x_categoria`*/;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_x_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_variantes_x_categoria` AS select `tbl_variantes_categorias`.`id_variante_categoria` AS `ID`,`tbl_variantes_categorias`.`id_catgoria` AS `IDCAT`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_variantes_platillos`.`id_variante_pl` AS `IDVAR`,`tbl_variantes_platillos`.`chr_variante_nombre` AS `Variante` from ((`tbl_variantes_categorias` left join `tbl_categorias` on((`tbl_variantes_categorias`.`id_catgoria` = `tbl_categorias`.`id_categoria`))) left join `tbl_variantes_platillos` on((`tbl_variantes_platillos`.`id_variante_pl` = `tbl_variantes_categorias`.`id_variante_platillo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-09 14:54:30
