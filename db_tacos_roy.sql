-- MySQL dump 10.17  Distrib 10.3.25-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_tacosRoy
-- ------------------------------------------------------
-- Server version	10.3.25-MariaDB-0ubuntu0.20.04.1

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
  `bit_visible` int(11) NOT NULL DEFAULT 1,
  `bit_activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorias`
--

LOCK TABLES `tbl_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_categorias` DISABLE KEYS */;
INSERT INTO `tbl_categorias` VALUES (1,'Sin Categoria','Para productos sin categoria',1,1,1),(2,'Tacos al Vapor','Tacos al vapor',2,1,1),(3,'Tacos Ahogados','Tacos ahogados en salsa',3,1,1),(4,'Tacos a la plancha','Tacos preparados a la plancha',4,1,1),(5,'A la Plancha','Productos elaborados en plancha',5,1,1),(6,'Preparados','Productos preparados varios (Pozole, Queso fundido, etc).',6,1,1),(7,'Bebidas','Bebidas frías o calientes',7,1,1),(8,'Postres','Postres y alimentos dulces',8,1,1),(9,'Tostadas','Tostadas con diferentes carnes e ingredientes',4.5,1,1),(10,'Pozole','Pozoles con diferentes tipos de carne',6.5,1,1),(11,'Para llevar','Costos extra ordenes para llevar',9,1,1),(12,'A Domicilio','Costos extra ordenes a domicilio',10,1,1),(13,'Combos','Combos disponibles',8.5,1,1),(14,'Producto Combo','Productos pertenecientes a un combo',11,0,1),(15,'Ordenes de Carne','Ordenes de carne de res, cerdo o combinada, 1kg, 1/2 kg o 300 gr.',6.5,1,1);
/*!40000 ALTER TABLE `tbl_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clientes`
--

DROP TABLE IF EXISTS `tbl_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_apellidos` varchar(145) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_direccion1` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_num_ext` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_num_int` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_direccion2` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_colonia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_CP` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_ciudad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_referencia` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_longitud` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_latitud` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `chr_telefono_UNIQUE` (`chr_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clientes`
--

LOCK TABLES `tbl_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_clientes` DISABLE KEYS */;
INSERT INTO `tbl_clientes` VALUES (1,'Carlos','Revilla Maldonado','951-2987896','Morelos','1402','Altos','N/A','Centro','68000','Oaxaca','a 2 cuadras mercado merced casa blanca con azul','-96.717564','17.061454'),(2,'Pedrito','Fernandez','951-1234567','Calle Principal','201','N/A','N/A','Centro','68000','Oaxaca','Entre la casa blanca y la verde','-96.717564','17.061454'),(3,'Doctor','Chunga','951-5555555','Abasolo','420','N/A','N/A','Centro','68000','Oaxaca','Casa con perro echado al frente',NULL,NULL);
/*!40000 ALTER TABLE `tbl_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_combos`
--

DROP TABLE IF EXISTS `tbl_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_combos` (
  `id_combo` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_combo` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_producto_relacionado` int(11) NOT NULL,
  `bit_activo` int(11) DEFAULT 1,
  PRIMARY KEY (`id_combo`),
  KEY `index2` (`id_producto_relacionado`),
  CONSTRAINT `fk_tbl_combos_1` FOREIGN KEY (`id_producto_relacionado`) REFERENCES `tbl_productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_combos`
--

LOCK TABLES `tbl_combos` WRITE;
/*!40000 ALTER TABLE `tbl_combos` DISABLE KEYS */;
INSERT INTO `tbl_combos` VALUES (1,'Paquete de Todo un Poco',112,1),(2,NULL,168,1);
/*!40000 ALTER TABLE `tbl_combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_combos_ordenes`
--

DROP TABLE IF EXISTS `tbl_combos_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_combos_ordenes` (
  `id_combos_ordenes` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden_id` int(11) NOT NULL,
  `id_combo_id` int(11) NOT NULL,
  `id_prod_x_orden_combo` int(11) NOT NULL,
  `id_prod_x_orden_parte_combo` int(11) NOT NULL,
  PRIMARY KEY (`id_combos_ordenes`),
  KEY `index2` (`id_prod_x_orden_combo`),
  KEY `index3` (`id_prod_x_orden_parte_combo`),
  KEY `fk_tbl_combos_ordenes_1_idx` (`id_orden_id`),
  KEY `index5` (`id_combo_id`),
  CONSTRAINT `fk_tbl_combos_ordenes_1` FOREIGN KEY (`id_prod_x_orden_combo`) REFERENCES `tbl_prods_x_orden` (`id_prod_x_orden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_combos_ordenes_2` FOREIGN KEY (`id_prod_x_orden_parte_combo`) REFERENCES `tbl_prods_x_orden` (`id_prod_x_orden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_combos_ordenes_3` FOREIGN KEY (`id_orden_id`) REFERENCES `tbl_prods_x_orden` (`int_orden_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_combos_ordenes_4` FOREIGN KEY (`id_combo_id`) REFERENCES `tbl_prods_x_orden` (`int_producto_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_combos_ordenes`
--

LOCK TABLES `tbl_combos_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_combos_ordenes` DISABLE KEYS */;
INSERT INTO `tbl_combos_ordenes` VALUES (1,103,112,114,487),(2,103,112,115,488),(3,86,112,114,490),(4,86,112,115,491),(5,90,112,114,493),(6,90,112,115,494),(9,108,112,498,499),(10,108,112,498,500);
/*!40000 ALTER TABLE `tbl_combos_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_configs`
--

DROP TABLE IF EXISTS `tbl_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_configs` (
  `id_config` int(11) NOT NULL AUTO_INCREMENT,
  `chr_var_name` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_var_value` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_configs`
--

LOCK TABLES `tbl_configs` WRITE;
/*!40000 ALTER TABLE `tbl_configs` DISABLE KEYS */;
INSERT INTO `tbl_configs` VALUES (1,'CombosCategory','13');
/*!40000 ALTER TABLE `tbl_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_consecutivo`
--

DROP TABLE IF EXISTS `tbl_consecutivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_consecutivo` (
  `id_consecutivo` int(11) NOT NULL AUTO_INCREMENT,
  `chr_consecutivo` int(11) NOT NULL,
  PRIMARY KEY (`id_consecutivo`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consecutivo`
--

LOCK TABLES `tbl_consecutivo` WRITE;
/*!40000 ALTER TABLE `tbl_consecutivo` DISABLE KEYS */;
INSERT INTO `tbl_consecutivo` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100),(101,101),(102,102),(103,103),(104,104),(105,105),(106,106),(107,107),(108,108),(109,109),(110,110),(111,111),(112,112),(113,113),(114,114),(115,115),(116,116),(117,117),(118,118),(119,119),(120,120),(121,121),(122,122),(123,123),(124,124),(125,125),(126,126),(127,127),(128,128),(129,129),(130,130),(131,131),(132,132),(133,133),(134,134),(135,135),(136,136),(137,137),(138,138),(139,1),(140,2),(141,3),(142,4),(143,5),(144,6),(145,7),(146,8),(147,9),(148,10),(149,11),(150,12),(151,13),(152,14),(153,15),(154,16),(155,17),(156,18),(157,19),(158,20),(159,21),(160,22);
/*!40000 ALTER TABLE `tbl_consecutivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_control_fechas`
--

DROP TABLE IF EXISTS `tbl_control_fechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_control_fechas` (
  `id_control_fechas` int(11) NOT NULL AUTO_INCREMENT,
  `dt_fecha_calendario` datetime DEFAULT current_timestamp(),
  `dt_comienzo_labores` datetime DEFAULT NULL,
  `dt_finaliza_labores` datetime DEFAULT NULL,
  `chr_control` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_activo` int(11) DEFAULT 1,
  PRIMARY KEY (`id_control_fechas`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_control_fechas`
--

LOCK TABLES `tbl_control_fechas` WRITE;
/*!40000 ALTER TABLE `tbl_control_fechas` DISABLE KEYS */;
INSERT INTO `tbl_control_fechas` VALUES (1,'2020-09-27 00:17:28','2020-09-27 00:17:28',NULL,'12345',1),(3,'2020-09-27 02:51:37','2020-09-27 02:51:37','2020-09-27 18:00:00','$1$tacosroy$DAvVuOft3l/kF2Ph0BbAk.',1),(4,'2020-10-07 18:11:10','2020-10-07 18:11:10',NULL,'$1$tacosroy$R8A6EM3nniTNAdPzxjSyD.',1),(5,'2020-10-08 00:16:05','2020-10-08 00:16:05',NULL,'$1$tacosroy$RE.1JcIBU.IlT30Qri/5B0',1),(6,'2020-10-10 01:42:16','2020-10-10 01:42:16',NULL,'$1$tacosroy$6WFEjBpPBmDT8Uaj3vrol.',1),(7,'2020-10-12 15:07:04','2020-10-12 15:07:04',NULL,'$1$tacosroy$Gm5hmEo/MJqNsH/eA0cMZ0',1),(8,'2020-10-13 03:22:37','2020-10-13 03:22:37',NULL,'$1$tacosroy$yJj2EpRU7/vezulAD7kY/1',1),(9,'2020-10-17 02:11:56','2020-10-17 02:11:56',NULL,'$1$tacosroy$ugWXOq9lCwGotPF35Bvpe1',1),(10,'2020-10-22 00:12:08','2020-10-22 00:12:08',NULL,'$1$tacosroy$N0/i7CQglTTBnkbYyyujF.',1),(11,'2020-10-24 22:08:23','2020-10-24 22:08:23',NULL,'$1$tacosroy$Nz//RaYTU25hkN1E2yiKq1',1),(12,'2020-10-25 20:34:37','2020-10-25 20:34:37',NULL,'$1$tacosroy$bw1x7SAYD2bl4SsqfVhw61',1),(13,'2020-10-31 00:56:40','2020-10-31 00:56:40',NULL,'$1$tacosroy$vJxaKUX9QcdXBEypEviM00',1),(14,'2020-11-08 22:48:08','2020-11-08 22:48:08',NULL,'$1$tacosroy$wblnuBcL999WYYxu.Psxo/',1),(15,'2020-11-09 17:25:37','2020-11-09 17:25:37',NULL,'$1$tacosroy$JtMoacYXZBS3VAE4nmSOS0',1),(16,'2020-11-10 14:54:08','2020-11-10 14:54:08',NULL,'$1$tacosroy$vwjS7BNMFzsezLRzSWTl/.',1),(17,'2020-11-14 02:27:54','2020-11-14 02:27:54',NULL,'$1$tacosroy$xqzcH6dEYpYFJnawFuseU0',1),(18,'2020-11-15 19:02:03','2020-11-15 19:02:03',NULL,'$1$tacosroy$UuAQ7VEipUViXqLLsGLbC/',1),(19,'2020-11-16 00:26:08','2020-11-16 00:26:08',NULL,'$1$tacosroy$iNOnggFy5DTTs8uRohR9f0',1),(20,'2020-11-17 00:22:01','2020-11-17 00:22:01',NULL,'$1$tacosroy$3hGzb2eFL/v0GANORU5jQ1',1),(21,'2020-11-18 03:10:14','2020-11-18 03:10:14',NULL,'$1$tacosroy$e76WPejCoz0Zh/CzscScq0',1),(22,'2020-11-19 19:33:20','2020-11-19 19:33:20',NULL,'$1$tacosroy$rr8uFDC7G3Mt5WgBEFOq31',1),(23,'2020-11-20 00:49:59','2020-11-20 00:49:59',NULL,'$1$tacosroy$BZ2DMc9wRgjtwGFIpiAx/0',1);
/*!40000 ALTER TABLE `tbl_control_fechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_costos_extra_var_prod`
--

DROP TABLE IF EXISTS `tbl_costos_extra_var_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_costos_extra_var_prod` (
  `id_costos_extra_var_prod` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto_variante` int(11) DEFAULT NULL,
  `id_fecha_control` int(11) DEFAULT NULL,
  `fl_costo_extra` float DEFAULT NULL,
  `id_tipo_precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_costos_extra_var_prod`),
  KEY `fk_tbl_costos_extra_var_prod_2_idx` (`id_producto_variante`),
  KEY `fk_tbl_costos_extra_var_prod_3_idx` (`id_fecha_control`),
  KEY `index5` (`id_tipo_precio`),
  CONSTRAINT `fk_tbl_costos_extra_var_prod_2` FOREIGN KEY (`id_producto_variante`) REFERENCES `tbl_prods_variantes` (`id_prods_variantes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_costos_extra_var_prod_3` FOREIGN KEY (`id_fecha_control`) REFERENCES `tbl_control_fechas` (`id_control_fechas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_costos_extra_var_prod_4` FOREIGN KEY (`id_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_costos_extra_var_prod`
--

LOCK TABLES `tbl_costos_extra_var_prod` WRITE;
/*!40000 ALTER TABLE `tbl_costos_extra_var_prod` DISABLE KEYS */;
INSERT INTO `tbl_costos_extra_var_prod` VALUES (1,2217,17,10,1),(2,2190,18,10,2),(3,2214,18,5,1),(4,2148,18,5,2),(5,2150,18,5,1),(6,2152,18,10,2),(7,2155,18,5,2),(8,2157,18,5,1),(9,2159,18,10,2),(10,876,18,5,1),(11,877,18,5,1),(12,876,18,5,2),(13,877,18,5,2),(14,1228,18,0,1),(15,1228,18,0,2),(16,1229,18,0,1),(17,1229,18,0,2),(18,1231,18,0,1),(19,1231,18,0,2),(20,1245,18,0,1),(21,1245,18,0,2),(22,1246,18,0,1),(23,1246,18,0,2),(24,1248,18,0,1),(25,1248,18,0,2),(26,1287,18,0,1),(27,1287,18,0,2),(28,1288,18,0,1),(29,1288,18,0,2),(30,1311,18,0,1),(31,1311,18,0,2),(32,1312,18,0,1),(33,1312,18,0,2),(34,1314,18,0,1),(35,1314,18,0,2),(36,1337,18,0,1),(37,1337,18,0,2),(38,1338,18,0,1),(39,1338,18,0,2),(40,1369,18,0,1),(41,1369,18,0,2),(42,1370,18,0,1),(43,1370,18,0,2),(44,1372,18,0,1),(45,1372,18,0,2),(46,1403,18,0,1),(47,1403,18,0,2),(48,1404,18,0,1),(49,1404,18,0,2),(50,1406,18,0,1),(51,1406,18,0,2),(52,1421,18,0,1),(53,1421,18,0,2),(54,1422,18,0,1),(55,1422,18,0,2),(56,1424,18,0,1),(57,1424,18,0,2),(58,1157,18,0,1),(59,1157,18,0,2),(60,1066,18,5,1),(61,1066,18,5,2),(62,1067,18,5,1),(63,1067,18,5,2),(64,1075,18,5,1),(65,1075,18,5,2),(66,1076,18,5,1),(67,1076,18,5,2),(68,857,18,5,1),(69,857,18,5,2),(70,1058,18,5,1),(71,1058,18,5,2),(72,1059,18,5,1),(73,1059,18,5,2),(74,2148,18,5,1),(75,191,18,5,1),(76,191,18,5,2),(77,192,18,5,1),(78,192,18,5,2),(79,193,18,5,1),(80,193,18,5,2),(81,194,18,5,1),(82,194,18,5,2),(83,195,18,5,1),(84,195,18,5,2),(85,196,18,5,1),(86,196,18,5,2),(87,197,18,5,1),(88,197,18,5,2),(89,210,18,5,1),(90,210,18,5,2),(91,211,18,5,1),(92,211,18,5,2),(93,213,18,5,1),(94,213,18,5,2),(95,214,18,5,1),(96,214,18,5,2),(97,270,18,5,1),(98,270,18,5,2),(99,322,18,5,1),(100,322,18,5,2),(101,326,18,5,1),(102,326,18,5,2),(103,330,18,5,1),(104,330,18,5,2),(105,334,18,5,1),(106,334,18,5,2),(107,338,18,5,1),(108,338,18,5,2),(109,342,18,5,1),(110,342,18,5,2),(111,346,18,5,1),(112,346,18,5,2),(113,350,18,5,1),(114,350,18,5,2),(115,354,18,5,1),(116,354,18,5,2),(117,358,18,5,1),(118,358,18,5,2),(119,362,18,5,1),(120,362,18,5,2),(121,412,18,5,1),(122,412,18,5,2),(123,415,18,5,1),(124,415,18,5,2),(125,417,18,5,1),(126,417,18,5,2),(127,418,18,5,1),(128,418,18,5,2),(129,419,18,5,1),(130,419,18,5,2),(131,420,18,5,1),(132,420,18,5,2),(133,442,18,5,1),(134,442,18,5,2),(135,462,18,5,1),(136,462,18,5,2),(137,463,18,5,1),(138,463,18,5,2),(139,470,18,5,1),(140,470,18,5,2),(141,473,18,5,1),(142,473,18,5,2),(143,490,18,5,1),(144,490,18,5,2),(145,493,18,5,1),(146,493,18,5,2),(147,509,18,5,1),(148,509,18,5,2),(149,512,18,5,1),(150,512,18,5,2),(151,558,18,5,1),(152,558,18,5,2),(153,559,18,5,1),(154,559,18,5,2),(155,561,18,10,1),(156,561,18,10,2),(157,577,18,5,1),(158,577,18,5,2),(159,578,18,5,1),(160,578,18,5,2),(161,580,18,10,1),(162,580,18,10,2),(163,583,18,5,1),(164,583,18,5,2),(165,584,18,5,1),(166,584,18,5,2),(167,587,18,5,1),(168,587,18,5,2),(169,588,18,5,1),(170,588,18,5,2),(171,589,18,5,1),(172,589,18,5,2),(173,590,18,5,1),(174,590,18,5,2),(175,591,18,5,1),(176,591,18,5,2),(177,592,18,5,1),(178,592,18,5,2),(179,593,18,5,1),(180,593,18,5,2),(181,594,18,5,1),(182,594,18,5,2),(183,782,18,5,1),(184,782,18,5,2),(185,783,18,5,1),(186,783,18,5,2),(187,785,18,10,1),(188,785,18,10,2),(189,786,18,5,1),(190,786,18,5,2),(191,787,18,5,1),(192,787,18,5,2),(193,789,18,10,1),(194,789,18,10,2),(195,792,18,5,1),(196,792,18,5,2),(197,793,18,5,1),(198,793,18,5,2),(199,827,18,5,1),(200,827,18,5,2),(201,828,18,5,1),(202,828,18,5,2),(203,834,18,5,1),(204,834,18,5,2),(205,835,18,5,1),(206,835,18,5,2),(207,924,18,5,1),(208,924,18,5,2),(209,925,18,5,1),(210,925,18,5,2),(211,962,18,5,1),(212,962,18,5,2),(213,963,18,5,1),(214,963,18,5,2),(215,970,18,5,1),(216,970,18,5,2),(217,971,18,5,1),(218,971,18,5,2),(219,978,18,5,1),(220,978,18,5,2),(221,979,18,5,1),(222,979,18,5,2),(223,986,18,5,1),(224,986,18,5,2),(225,987,18,5,1),(226,987,18,5,2),(227,994,18,5,1),(228,994,18,5,2),(229,995,18,5,1),(230,995,18,5,2),(231,1042,18,5,1),(232,1042,18,5,2),(233,1043,18,5,1),(234,1043,18,5,2),(235,1050,18,5,1),(236,1050,18,5,2),(237,1051,18,5,1),(238,1051,18,5,2),(239,1108,18,5,1),(240,1108,18,5,2),(241,1109,18,5,1),(242,1109,18,5,2),(243,1116,18,5,1),(244,1116,18,5,2),(245,1117,18,5,1),(246,1117,18,5,2),(247,1124,18,5,1),(248,1124,18,5,2),(249,1125,18,5,1),(250,1125,18,5,2),(251,1132,18,5,1),(252,1132,18,5,2),(253,1133,18,5,1),(254,1133,18,5,2),(255,1142,18,0,1),(256,1142,18,0,2),(257,1143,18,0,1),(258,1143,18,0,2),(259,1263,18,0,1),(260,1263,18,0,2),(261,1264,18,0,1),(262,1264,18,0,2),(263,1295,18,0,1),(264,1295,18,0,2),(265,1296,18,0,1),(266,1296,18,0,2),(267,1303,18,0,1),(268,1303,18,0,2),(269,1304,18,0,1),(270,1304,18,0,2),(271,1321,18,0,1),(272,1321,18,0,2),(273,1322,18,0,1),(274,1322,18,0,2),(275,1361,18,0,1),(276,1361,18,0,2),(277,1362,18,0,1),(278,1362,18,0,2),(279,1395,18,0,1),(280,1395,18,0,2),(281,1396,18,0,1),(282,1396,18,0,2),(283,1413,18,0,1),(284,1413,18,0,2),(285,1414,18,0,1),(286,1414,18,0,2),(287,1431,18,0,1),(288,1431,18,0,2),(289,1432,18,0,1),(290,1432,18,0,2),(291,1439,18,0,1),(292,1439,18,0,2),(293,1440,18,0,1),(294,1440,18,0,2),(295,1447,18,0,1),(296,1447,18,0,2),(297,1448,18,0,1),(298,1448,18,0,2),(299,1455,18,0,1),(300,1455,18,0,2),(301,1456,18,0,1),(302,1456,18,0,2),(303,1487,18,0,1),(304,1487,18,0,2),(305,1488,18,0,1),(306,1488,18,0,2),(307,1495,18,0,1),(308,1495,18,0,2),(309,1496,18,0,1),(310,1496,18,0,2),(311,1503,18,0,1),(312,1503,18,0,2),(313,1504,18,0,1),(314,1504,18,0,2),(315,1511,18,0,1),(316,1511,18,0,2),(317,1512,18,0,1),(318,1512,18,0,2),(319,1519,18,0,1),(320,1519,18,0,2),(321,1520,18,0,1),(322,1520,18,0,2),(323,1555,18,5,1),(324,1555,18,5,2),(325,1556,18,5,1),(326,1556,18,5,2),(327,1572,18,5,1),(328,1572,18,5,2),(329,1595,18,5,1),(330,1595,18,5,2),(331,1596,18,5,1),(332,1596,18,5,2),(333,1603,18,5,1),(334,1603,18,5,2),(335,1604,18,5,1),(336,1604,18,5,2),(337,1635,18,5,1),(338,1635,18,5,2),(339,1636,18,5,1),(340,1636,18,5,2),(341,1643,18,5,1),(342,1643,18,5,2),(343,1644,18,5,1),(344,1644,18,5,2),(345,1651,18,5,1),(346,1651,18,5,2),(347,1652,18,5,1),(348,1652,18,5,2),(349,1668,18,5,1),(350,1668,18,5,2),(351,1700,18,5,1),(352,1700,18,5,2),(353,1732,18,5,1),(354,1732,18,5,2),(355,1763,18,5,1),(356,1763,18,5,2),(357,1764,18,5,1),(358,1764,18,5,2),(359,1780,18,5,1),(360,1780,18,5,2),(361,1814,18,5,1),(362,1814,18,5,2),(363,1815,18,5,1),(364,1815,18,5,2),(365,1832,18,5,1),(366,1832,18,5,2),(367,1833,18,5,1),(368,1833,18,5,2),(369,1848,18,5,1),(370,1848,18,5,2),(371,1849,18,5,1),(372,1849,18,5,2),(373,1907,23,3,1),(374,1907,18,5,2),(375,1908,23,4,1),(376,1908,18,5,2),(377,1923,18,5,1),(378,1923,18,5,2),(379,1924,18,5,1),(380,1924,18,5,2),(381,1939,18,5,1),(382,1939,18,5,2),(383,1940,18,5,1),(384,1940,18,5,2),(385,1955,18,5,1),(386,1955,18,5,2),(387,1956,18,5,1),(388,1956,18,5,2),(389,1963,18,5,1),(390,1963,18,5,2),(391,1964,18,5,1),(392,1964,18,5,2),(393,1982,18,5,1),(394,1982,18,5,2),(395,1983,18,5,1),(396,1983,18,5,2),(397,1989,18,5,1),(398,1989,18,5,2),(399,1990,18,5,1),(400,1990,18,5,2),(401,1996,18,5,1),(402,1996,18,5,2),(403,1997,18,5,1),(404,1997,18,5,2),(405,2010,18,5,1),(406,2010,18,5,2),(407,2011,18,5,1),(408,2011,18,5,2),(409,2039,18,5,1),(410,2039,18,5,2),(411,2040,18,5,1),(412,2040,18,5,2),(413,2053,18,5,1),(414,2053,18,5,2),(415,2054,18,5,1),(416,2054,18,5,2),(417,2067,18,5,1),(418,2067,18,5,2),(419,2068,18,5,1),(420,2068,18,5,2),(421,2081,18,5,1),(422,2081,18,5,2),(423,2082,18,5,1),(424,2082,18,5,2),(425,2097,18,5,1),(426,2097,18,5,2),(427,2098,18,5,1),(428,2098,18,5,2),(429,2107,18,5,1),(430,2107,18,5,2),(431,2108,18,5,1),(432,2108,18,5,2),(433,2145,18,5,1),(434,2145,18,5,2),(435,2146,18,5,1),(436,2146,18,5,2),(437,2150,18,5,2),(438,2152,18,10,1),(439,2155,18,5,1),(440,2157,18,5,2),(441,2159,18,10,1),(442,2162,18,5,1),(443,2162,18,5,2),(444,2163,18,5,1),(445,2163,18,5,2),(446,2165,18,10,1),(447,2165,18,10,2),(448,2182,18,5,1),(449,2182,18,5,2),(450,2183,18,5,1),(451,2183,18,5,2),(452,2185,18,10,1),(453,2185,18,10,2),(454,2187,18,5,1),(455,2187,18,5,2),(456,2188,18,5,1),(457,2188,18,5,2),(458,2190,18,10,1),(459,2191,18,5,1),(460,2191,18,5,2),(461,2193,18,5,1),(462,2193,18,5,2),(463,2195,18,10,1),(464,2195,18,10,2),(465,2204,18,5,1),(466,2204,18,5,2),(467,2206,18,5,1),(468,2206,18,5,2),(469,2208,18,10,1),(470,2208,18,10,2),(471,2214,18,5,2),(472,2215,18,5,1),(473,2215,18,5,2),(474,2218,18,10,1),(475,2218,18,10,2),(478,2221,22,5,2),(479,2228,22,5,1),(480,2228,22,5,2),(481,2244,23,20,1),(482,2244,23,20,2),(483,2244,23,40,1),(484,2244,23,40,2),(485,2238,23,20,3),(486,2238,23,20,2),(487,2236,23,20,1),(488,2236,23,20,2),(489,2244,23,40,1),(490,2244,23,40,2),(491,2245,23,40,1),(492,2245,23,40,2),(493,2249,23,10,1),(494,2249,23,10,2),(495,2251,23,10,1),(496,2251,23,10,2),(497,2257,23,20,2),(498,2257,23,20,1),(499,2258,23,20,1),(500,2258,23,20,2),(501,2254,23,10,1),(502,2254,23,10,2),(503,2272,23,10,1);
/*!40000 ALTER TABLE `tbl_costos_extra_var_prod` ENABLE KEYS */;
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
  `dt_inicio_operaciones` date DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_sucursal`
--

LOCK TABLES `tbl_datos_sucursal` WRITE;
/*!40000 ALTER TABLE `tbl_datos_sucursal` DISABLE KEYS */;
INSERT INTO `tbl_datos_sucursal` VALUES (1,'Tacos Roy Matriz','Trujano 201','Col. Centro','CP. 68000, Oaxaca, Oaxaca.','9511722708','000000000',0,NULL),(2,'asdfasd','asdfasdf','asdfasd','asdfasdf','3216545','321654',1,NULL);
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
  `dt_horafecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `fl_cantidad` float NOT NULL,
  `chr_concepto_gasto` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario_auth` int(11) NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `id_usuario_auth` (`id_usuario_auth`),
  CONSTRAINT `tbl_gastos_ibfk_1` FOREIGN KEY (`id_usuario_auth`) REFERENCES `tbl_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_gastos`
--

LOCK TABLES `tbl_gastos` WRITE;
/*!40000 ALTER TABLE `tbl_gastos` DISABLE KEYS */;
INSERT INTO `tbl_gastos` VALUES (1,'2016-03-24 08:39:36',100,'fdsdfs a fdf asdfasdf asd f',1),(2,'2016-07-28 23:45:26',250,'Gas, recibo nr. 83293469',1);
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
  `bit_activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_insumos`
--

LOCK TABLES `tbl_insumos` WRITE;
/*!40000 ALTER TABLE `tbl_insumos` DISABLE KEYS */;
INSERT INTO `tbl_insumos` VALUES (1,'Tortilla','Tortilla de Maiz',1),(2,'Tortilla de harina','Tortilla de harina de trigo',1),(3,'Tostada','Tostada frita para acompañar alimentos',1),(4,'Pepsi','Refresco Pepsi',0),(5,'Squirt','Refresco Squirt',0),(6,'Mirinda','Refresco Mirinda',0),(7,'Sangría','Refresco Sangría',0),(8,'Cerveza Corona','Cerveza Corona',1),(9,'Cerveza Victoria','Cerveza Victoria',1),(10,'Cerveza Corona Light','Cerveza Corona Ligh',1),(11,'Cerveza León','Cerveza León',1),(12,'Cerveza Pacífico','Cerveza Pacífico',1),(13,'Cerveza Montejo','Cerveza Montejo',1),(14,'Cerveza Modelo Especial','Cerveza Modelo Especial',1),(15,'Cerveza Barrilito','Cerveza Barrilito',1),(16,'Cerveza Victoria (Lata)','Lata de cerveza Victoria',1),(17,'Cerveza Modelo (Lata)','Lata de cerveza Modelo',1),(18,'Panqué de Elote, Rebanada','Rebanada de Panqué de elote',1),(19,'Flan','Flan',1),(20,'Pastel de Queso','Pastel de Queso',1),(21,'Agua Emb. 1/2 Litro','Botella de agua de Medio litro',0),(22,'Agua Emb. 1 Litro','Botella de agua embotellada de 1 litro',0),(23,'Jugo Boing','Jugos boing de varios sabores',0),(24,'Cerveza Stella Artois','Cerveza Stella Artois',1),(25,'7 Up','Refresco 7 Up',0),(26,'Agua Mineral','Agua Mineral',1),(27,'Manzanita Sol','Refresco Manzanita Sol',0),(28,'Boing','Boing',0),(29,'Cerveza Negra Modelo','Cerveza Negra Modelo',1),(30,'Cerveza Bohemia','Cerveza Bohemia',1),(31,'Cerveza Modelo Especial (Lata)','Cerveza Modelo Especial (Lata)',1),(32,'Refresco Coca Cola','Refresco Coca Cola',1),(33,'Fanta','Fanta',1),(34,'Sidral','Sidral',1),(35,'Sprite','Sprite',1),(36,'Fresca','Fresca',1),(37,'Sangria','Sangria',1),(38,'Jugo del Valle','Jugo del Valle',1),(39,'Agua Ciel 600 ml','Agua Ciel 600 ml',1),(40,'Cerveza Negra Modelo','Cerveza Negra Modelo',1),(41,'Cerveza Cucapa','Cerveza Cucapa',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_insumos_x_platillo`
--

LOCK TABLES `tbl_insumos_x_platillo` WRITE;
/*!40000 ALTER TABLE `tbl_insumos_x_platillo` DISABLE KEYS */;
INSERT INTO `tbl_insumos_x_platillo` VALUES (1,48,25,1),(2,50,26,1),(3,89,22,1),(4,53,21,1),(5,11,1,1),(6,16,1,1),(7,14,1,1),(8,9,1,1),(9,33,2,1),(10,8,1,1),(11,91,24,1),(12,13,1,1),(13,30,2,1),(14,7,1,1),(15,6,1,1),(16,5,1,1),(17,49,27,1),(18,46,6,1),(19,10,1,1),(20,15,1,1),(21,17,1,1),(22,34,1,1),(23,35,1,1),(24,45,4,1),(25,31,2,1),(26,76,1,1),(27,79,1,1),(28,74,1,1),(29,73,1,1),(30,78,1,1),(31,75,1,1),(32,77,1,1),(33,72,1,1),(34,71,1,1),(35,70,1,1),(36,80,1,1),(37,25,1,1),(38,32,3,1),(39,36,3,1),(40,59,3,1),(41,62,3,1),(42,68,3,1),(43,61,3,1),(44,63,3,1),(45,69,3,1),(46,65,3,1),(47,64,3,1),(48,67,3,1),(49,66,3,1),(50,60,3,1),(51,57,3,1),(52,58,3,1),(53,12,1,1),(54,54,18,1),(55,56,20,1),(56,47,7,1),(57,55,19,1),(58,97,28,1),(59,99,15,1),(60,100,29,1),(61,94,30,1),(62,92,8,1),(63,98,10,1),(64,101,14,1),(65,93,9,1),(66,103,16,1),(67,102,31,1),(68,106,2,1);
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
  `id_control_fecha` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_inventario_id`),
  KEY `id_insumo_id` (`id_insumo_id`),
  KEY `index3` (`id_control_fecha`),
  CONSTRAINT `fk_tbl_inventario_1` FOREIGN KEY (`id_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_inventario_ibfk_1` FOREIGN KEY (`id_insumo_id`) REFERENCES `tbl_insumos` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventario`
--

LOCK TABLES `tbl_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_inventario` DISABLE KEYS */;
INSERT INTO `tbl_inventario` VALUES (4,1,300,'2016-03-18 00:00:00',NULL),(5,2,150,'2016-03-18 00:00:00',NULL),(6,3,50,'2016-03-18 00:00:00',NULL),(7,4,80,'2016-03-18 00:00:00',NULL),(8,5,50,'2016-03-18 00:00:00',NULL),(9,6,40,'2016-03-18 00:00:00',NULL),(10,7,50,'2016-03-18 00:00:00',NULL),(11,8,100,'2016-03-18 00:00:00',NULL),(12,25,100,'2016-03-25 00:00:00',NULL),(13,22,100,'2016-03-25 00:00:00',NULL),(14,21,100,'2016-03-25 00:00:00',NULL),(15,26,100,'2016-03-25 00:00:00',NULL),(16,15,100,'2016-03-25 00:00:00',NULL),(17,8,100,'2016-03-25 00:00:00',NULL),(18,10,100,'2016-03-25 00:00:00',NULL),(19,11,100,'2016-03-25 00:00:00',NULL),(20,17,100,'2016-03-25 00:00:00',NULL),(21,13,100,'2016-03-25 00:00:00',NULL),(22,14,100,'2016-03-25 00:00:00',NULL),(23,12,100,'2016-03-25 00:00:00',NULL),(24,24,100,'2016-03-25 00:00:00',NULL),(25,9,100,'2016-03-25 00:00:00',NULL),(26,16,100,'2016-03-25 00:00:00',NULL),(27,19,100,'2016-03-25 00:00:00',NULL),(28,23,100,'2016-03-25 00:00:00',NULL),(29,27,100,'2016-03-25 00:00:00',NULL),(30,6,100,'2016-03-25 00:00:00',NULL),(31,18,100,'2016-03-25 00:00:00',NULL),(32,20,100,'2016-03-25 00:00:00',NULL),(33,4,100,'2016-03-25 00:00:00',NULL),(34,7,100,'2016-03-25 00:00:00',NULL),(35,5,100,'2016-03-25 00:00:00',NULL),(36,1,100,'2016-03-25 00:00:00',NULL),(37,2,100,'2016-03-25 00:00:00',NULL),(38,3,100,'2016-03-25 00:00:00',NULL),(39,25,20,'2016-04-11 00:00:00',NULL),(40,22,20,'2016-04-11 00:00:00',NULL),(41,21,20,'2016-04-11 00:00:00',NULL),(42,26,20,'2016-04-11 00:00:00',NULL),(43,15,20,'2016-04-11 00:00:00',NULL),(44,8,20,'2016-04-11 00:00:00',NULL),(45,10,20,'2016-04-11 00:00:00',NULL),(46,11,20,'2016-04-11 00:00:00',NULL),(47,17,20,'2016-04-11 00:00:00',NULL),(48,13,20,'2016-04-11 00:00:00',NULL),(49,14,20,'2016-04-11 00:00:00',NULL),(50,12,20,'2016-04-11 00:00:00',NULL),(51,24,20,'2016-04-11 00:00:00',NULL),(52,9,20,'2016-04-11 00:00:00',NULL),(53,16,20,'2016-04-11 00:00:00',NULL),(54,19,20,'2016-04-11 00:00:00',NULL),(55,23,20,'2016-04-11 00:00:00',NULL),(56,27,20,'2016-04-11 00:00:00',NULL),(57,6,20,'2016-04-11 00:00:00',NULL),(58,18,20,'2016-04-11 00:00:00',NULL),(59,20,20,'2016-04-11 00:00:00',NULL),(60,4,20,'2016-04-11 00:00:00',NULL),(61,7,20,'2016-04-11 00:00:00',NULL),(62,5,20,'2016-04-11 00:00:00',NULL),(63,1,20,'2016-04-11 00:00:00',NULL),(64,2,20,'2016-04-11 00:00:00',NULL),(65,3,20,'2016-04-11 00:00:00',NULL),(66,25,10,'2016-07-28 00:00:00',NULL),(67,22,10,'2016-07-28 00:00:00',NULL),(68,21,10,'2016-07-28 00:00:00',NULL),(69,26,10,'2016-07-28 00:00:00',NULL),(70,28,10,'2016-07-28 00:00:00',NULL),(71,15,10,'2016-07-28 00:00:00',NULL),(72,30,10,'2016-07-28 00:00:00',NULL),(73,8,10,'2016-07-28 00:00:00',NULL),(74,10,10,'2016-07-28 00:00:00',NULL),(75,11,10,'2016-07-28 00:00:00',NULL),(76,17,10,'2016-07-28 00:00:00',NULL),(77,14,10,'2016-07-28 00:00:00',NULL),(78,31,10,'2016-07-28 00:00:00',NULL),(79,13,10,'2016-07-28 00:00:00',NULL),(80,29,10,'2016-07-28 00:00:00',NULL),(81,12,10,'2016-07-28 00:00:00',NULL),(82,24,10,'2016-07-28 00:00:00',NULL),(83,9,10,'2016-07-28 00:00:00',NULL),(84,16,10,'2016-07-28 00:00:00',NULL),(85,19,10,'2016-07-28 00:00:00',NULL),(86,23,10,'2016-07-28 00:00:00',NULL),(87,27,10,'2016-07-28 00:00:00',NULL),(88,6,10,'2016-07-28 00:00:00',NULL),(89,18,10,'2016-07-28 00:00:00',NULL),(90,20,10,'2016-07-28 00:00:00',NULL),(91,4,10,'2016-07-28 00:00:00',NULL),(92,7,10,'2016-07-28 00:00:00',NULL),(93,5,10,'2016-07-28 00:00:00',NULL),(94,1,10,'2016-07-28 00:00:00',NULL),(95,2,10,'2016-07-28 00:00:00',NULL),(96,3,10,'2016-07-28 00:00:00',NULL),(97,25,25,'2020-10-12 00:00:00',7),(98,22,25,'2020-10-12 00:00:00',7),(99,21,25,'2020-10-12 00:00:00',7),(100,26,25,'2020-10-12 00:00:00',7),(101,28,25,'2020-10-12 00:00:00',7),(102,15,25,'2020-10-12 00:00:00',7),(103,30,25,'2020-10-12 00:00:00',7),(104,8,25,'2020-10-12 00:00:00',7),(105,10,25,'2020-10-12 00:00:00',7),(106,11,25,'2020-10-12 00:00:00',7),(107,17,25,'2020-10-12 00:00:00',7),(108,14,25,'2020-10-12 00:00:00',7),(109,31,25,'2020-10-12 00:00:00',7),(110,13,25,'2020-10-12 00:00:00',7),(111,29,25,'2020-10-12 00:00:00',7);
/*!40000 ALTER TABLE `tbl_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mermas`
--

DROP TABLE IF EXISTS `tbl_mermas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_mermas` (
  `id_merma` int(11) NOT NULL AUTO_INCREMENT,
  `id_insumo` int(11) NOT NULL,
  `int_cantidad` int(11) DEFAULT NULL,
  `dt_control_fecha` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_merma`),
  KEY `index2` (`id_insumo`),
  KEY `index3` (`dt_control_fecha`),
  CONSTRAINT `fk_tbl_mermas_1` FOREIGN KEY (`id_insumo`) REFERENCES `tbl_insumos` (`id_insumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_mermas_2` FOREIGN KEY (`dt_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mermas`
--

LOCK TABLES `tbl_mermas` WRITE;
/*!40000 ALTER TABLE `tbl_mermas` DISABLE KEYS */;
INSERT INTO `tbl_mermas` VALUES (3,2,3,13);
/*!40000 ALTER TABLE `tbl_mermas` ENABLE KEYS */;
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
  `bit_domicilio` int(11) DEFAULT 0,
  PRIMARY KEY (`id_mesa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mesas`
--

LOCK TABLES `tbl_mesas` WRITE;
/*!40000 ALTER TABLE `tbl_mesas` DISABLE KEYS */;
INSERT INTO `tbl_mesas` VALUES (1,'1',4,1,0),(2,'2',4,1,0),(3,'3',5,1,0),(4,'4',4,1,0),(5,'5',6,1,0),(6,'6',4,1,0),(7,'7',6,1,0),(8,'8',5,1,0),(9,'9',4,1,0),(10,'10',5,1,0),(11,'11',1,1,0),(12,'12',1,1,0),(13,'13',6,1,0),(14,'14',6,1,0),(15,'15',6,1,0),(16,'Para llevar',1,1,0),(17,'A domicilio',1,1,1);
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
  `id_control_fecha` int(11) NOT NULL,
  PRIMARY KEY (`id_orden_id`),
  KEY `int_mesa` (`int_mesa`),
  KEY `int_consecutivo` (`int_consecutivo`),
  KEY `index4` (`id_control_fecha`),
  CONSTRAINT `fk_tbl_ordenes_1` FOREIGN KEY (`int_mesa`) REFERENCES `tbl_mesas` (`id_mesa_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_ordenes_2` FOREIGN KEY (`int_consecutivo`) REFERENCES `tbl_consecutivo` (`id_consecutivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_ordenes_3` FOREIGN KEY (`id_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes`
--

LOCK TABLES `tbl_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes` DISABLE KEYS */;
INSERT INTO `tbl_ordenes` VALUES (1,'2016-03-25 02:11:41',1,1,'PAGADA',1),(11,'2016-03-25 02:12:36',5,17,'PAGADA',1),(12,'2016-03-25 02:10:34',8,12,'PAGADA',1),(13,'2016-03-25 02:14:37',6,13,'PAGADA',1),(14,'2016-07-28 18:40:56',7,14,'Cancelada',1),(15,'2016-03-25 02:11:41',6,15,'PAGADA',1),(16,'2016-03-12 19:16:49',7,16,'PAGADA',1),(17,'2016-03-25 02:11:41',8,17,'PAGADA',1),(18,'2016-03-15 14:54:34',9,18,'PAGADA',1),(19,'2016-03-15 14:55:40',5,19,'PAGADA',1),(20,'2016-03-15 14:56:50',3,20,'PAGADA',1),(21,'2016-03-16 20:15:08',1,21,'PAGADA',1),(22,'2016-03-25 02:09:30',12,22,'PAGADA',1),(23,'2016-03-24 23:40:47',1,23,'PAGADA',1),(24,'2016-03-25 02:18:00',7,24,'PAGADA',1),(25,'2016-03-25 02:28:00',4,25,'PAGADA',1),(26,'2016-03-28 02:23:00',9,26,'PAGADA',1),(27,'2016-03-28 02:24:00',4,27,'PAGADA',1),(28,'2016-03-28 02:27:00',5,28,'PAGADA',1),(29,'2016-03-28 02:30:00',3,29,'PAGADA',1),(30,'2016-03-28 02:31:00',8,30,'PAGADA',1),(31,'2016-03-28 02:33:00',4,31,'PAGADA',1),(32,'2016-03-28 02:38:00',4,32,'PAGADA',1),(33,'2016-03-28 02:41:00',3,33,'PAGADA',1),(34,'2016-03-28 02:42:00',5,34,'PAGADA',1),(35,'2016-03-28 02:44:00',7,35,'PAGADA',1),(36,'2016-03-28 02:47:00',6,36,'PAGADA',1),(37,'2016-03-28 02:49:00',5,37,'PAGADA',1),(38,'2016-03-28 02:56:00',2,38,'PAGADA',1),(39,'2016-03-28 02:58:00',9,39,'PAGADA',1),(40,'2016-03-28 03:00:00',2,40,'PAGADA',1),(41,'2016-03-28 03:03:00',5,41,'PAGADA',1),(42,'2016-03-28 03:06:00',5,42,'PAGADA',1),(43,'2016-03-28 03:07:00',3,43,'PAGADA',1),(44,'2016-03-28 03:09:00',8,44,'PAGADA',1),(45,'2016-03-28 03:11:00',1,45,'PAGADA',1),(46,'2016-03-28 03:12:00',4,46,'PAGADA',1),(47,'2016-03-28 18:53:00',4,47,'PAGADA',1),(48,'2016-03-28 18:59:00',1,48,'PAGADA',1),(49,'2016-03-28 19:01:00',5,49,'PAGADA',1),(50,'2016-03-28 19:03:00',5,50,'PAGADA',1),(51,'2016-03-28 19:31:00',5,51,'PAGADA',1),(52,'2016-03-28 19:35:00',3,52,'PAGADA',1),(53,'2016-03-28 19:39:00',5,53,'PAGADA',1),(54,'2016-03-28 20:00:00',10,54,'PAGADA',1),(55,'2016-03-29 19:06:00',12,55,'PAGADA',1),(56,'2016-03-29 19:14:00',11,56,'PAGADA',1),(57,'2016-03-29 19:20:00',2,57,'PAGADA',1),(58,'2016-03-29 19:24:00',5,58,'',1),(59,'2016-03-29 19:25:00',6,59,'',1),(60,'2016-03-29 19:32:00',10,60,'PAGADA',1),(61,'2016-03-29 20:00:00',8,61,'PAGADA',1),(62,'2016-03-29 20:05:00',1,62,'PAGADA',1),(63,'2016-04-11 23:11:55',4,63,'Cancelada',1),(64,'2016-03-31 01:46:00',10,64,'',1),(65,'2016-04-04 00:01:00',3,65,'PAGADA',1),(66,'2016-04-04 00:02:00',2,66,'PAGADA',1),(67,'2016-04-06 19:45:00',16,70,'PAGADA',1),(68,'2016-04-11 20:45:00',7,72,'',1),(69,'2016-04-11 23:03:36',1,73,'Cancelada',1),(70,'2016-04-11 22:34:56',7,74,'',1),(71,'2016-04-11 21:05:00',6,75,'Descuento',1),(72,'2016-04-11 23:13:00',13,76,'',1),(73,'2016-04-11 23:14:00',11,77,'Descuento',1),(74,'2016-04-15 14:52:20',16,78,'Cancelada',1),(75,'2016-04-18 19:56:00',16,79,'',1),(76,'2016-04-18 20:07:00',9,80,'',1),(77,'2016-04-18 20:08:00',15,81,'',1),(78,'2016-04-20 23:06:00',8,82,'',1),(79,'2016-05-28 17:19:00',8,83,'',1),(80,'2016-05-28 18:37:00',3,84,'Efectivo',1),(81,'2016-06-27 20:04:00',8,85,'Efectivo',1),(82,'2016-06-28 18:41:00',16,86,'',1),(83,'2020-10-08 00:23:35',2,87,'CANCELADA',1),(84,'2016-09-12 17:46:00',10,88,'',1),(85,'2020-09-03 20:03:00',9,89,'',1),(86,'2020-09-15 17:09:00',11,90,'Efectivo',1),(87,'2020-09-18 18:32:00',17,91,'',1),(88,'2020-09-19 20:00:38',16,92,'CANCELADA',1),(89,'2020-09-19 20:01:00',15,93,'',1),(90,'2020-09-19 20:23:00',10,94,'',1),(91,'2020-09-23 20:43:55',8,95,'CANCELADA',1),(92,'2020-09-24 20:43:00',17,96,'',1),(104,'2020-10-07 18:14:18',15,108,'CANCELADA',4),(105,'2020-10-07 18:16:29',3,109,'CANCELADA',4),(106,'2020-10-07 18:19:34',9,110,'CANCELADA',4),(107,'2020-10-07 18:31:06',13,111,'CANCELADA',4),(108,'2020-10-07 18:25:00',5,112,'Efectivo',4),(109,'2020-10-08 20:02:00',7,113,'',5),(110,'2020-10-10 01:42:00',13,114,'',6),(111,'2020-10-17 15:46:00',9,115,'',9),(112,'2020-10-17 16:49:00',2,116,'Efectivo',9),(113,'2020-10-17 17:00:00',8,117,'',9),(114,'2020-10-17 17:04:00',10,118,'',9),(115,'2020-10-17 17:08:00',17,119,'',9),(116,'2020-10-17 17:13:00',2,120,'',9),(117,'2020-10-17 17:18:00',10,121,'',9),(118,'2020-10-22 00:43:00',17,122,'',10),(119,'2020-10-22 00:48:00',17,123,'',10),(120,'2020-10-22 00:52:00',17,124,'',10),(121,'2020-11-08 22:49:44',9,131,'Cancelada',11),(122,'2020-10-25 20:48:06',17,138,'',12),(123,'2020-11-16 01:44:58',11,1,'',19),(124,'2020-11-16 17:57:15',9,2,'Efectivo',19),(125,'2020-11-17 00:52:14',10,3,'Efectivo',20),(126,'2020-11-17 00:57:02',9,4,'Efectivo',20),(127,'2020-11-17 01:02:55',4,5,'',20),(128,'2020-11-17 01:07:03',7,6,'Efectivo',20),(129,'2020-11-17 01:09:07',11,7,'',20),(130,'2020-11-17 01:12:25',14,8,'',20),(131,'2020-11-17 01:14:40',13,9,'',20),(132,'2020-11-17 01:18:15',12,10,'',20),(133,'2020-11-17 01:23:30',8,11,'',20),(134,'2020-11-17 01:25:20',6,12,'',20),(135,'2020-11-17 01:30:05',2,13,'',20),(136,'2020-11-17 01:57:31',8,14,'',20),(137,'2020-11-17 01:59:37',3,15,'',20),(138,'2020-11-17 02:03:05',5,16,'',20),(139,'2020-11-18 18:01:21',8,17,'',21),(140,'2020-11-18 18:01:52',7,18,'',21),(141,'2020-11-18 23:01:36',1,19,'',21),(142,'2020-11-20 00:50:27',8,20,'Efectivo',23),(143,'2020-11-20 18:03:04',9,21,'Abierta',23);
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
  `dt_horafecha_cierre_orden` timestamp NOT NULL DEFAULT current_timestamp(),
  `fl_total` float NOT NULL,
  `bool_factura` tinyint(1) NOT NULL DEFAULT 0,
  `chr_referencia_notas` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `int_lvl_report` int(11) NOT NULL DEFAULT 1,
  `id_ticket_IDNr` int(11) NOT NULL,
  `id_control_fecha` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_orden_cerrada`),
  KEY `id_orden_id` (`id_orden_id`),
  KEY `bsbfs` (`id_ticket_IDNr`) COMMENT 'fdsagr',
  KEY `index4` (`id_control_fecha`),
  CONSTRAINT `Cerrada_orden_ID` FOREIGN KEY (`id_orden_id`) REFERENCES `tbl_ordenes` (`id_orden_id`),
  CONSTRAINT `fk_tbl_ordenes_cerradas_1` FOREIGN KEY (`id_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tbl_ordenes_cerradas_ibfk_1` FOREIGN KEY (`id_ticket_IDNr`) REFERENCES `tbl_ticket_cons` (`id_ticketNrConsecutivo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_cerradas`
--

LOCK TABLES `tbl_ordenes_cerradas` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_cerradas` DISABLE KEYS */;
INSERT INTO `tbl_ordenes_cerradas` VALUES (1,123,'2020-11-16 23:45:11',95,0,NULL,1,60,19),(2,124,'2020-11-17 06:50:59',0,0,'Efectivo',1,61,20),(3,125,'2020-11-17 06:53:53',0,0,'Efectivo',1,62,20),(4,126,'2020-11-17 06:58:24',0,0,'Efectivo',1,63,20),(5,127,'2020-11-17 07:05:06',0,0,NULL,1,64,20),(6,128,'2020-11-17 07:08:21',0,0,'Efectivo',1,65,20),(7,129,'2020-11-17 07:09:53',0,0,NULL,1,66,20),(8,130,'2020-11-17 07:13:16',0,0,NULL,1,67,20),(9,131,'2020-11-17 07:15:25',0,0,NULL,1,68,20),(10,132,'2020-11-17 07:18:59',0,0,NULL,1,69,20),(11,133,'2020-11-17 07:24:17',279,0,NULL,1,70,20),(12,134,'2020-11-17 07:26:29',137,0,NULL,1,71,20),(13,135,'2020-11-17 07:31:06',307,0,NULL,1,72,20),(14,136,'2020-11-17 07:58:11',306,0,NULL,1,73,20),(15,137,'2020-11-17 08:01:05',449,0,NULL,1,74,20),(16,138,'2020-11-17 08:05:06',351,0,NULL,1,75,20),(17,139,'2020-11-19 01:35:26',227,0,NULL,1,76,21),(18,140,'2020-11-19 01:39:37',310,0,NULL,1,77,21),(19,141,'2020-11-19 05:25:43',0,0,NULL,1,78,21),(20,142,'2020-11-20 07:58:14',775,0,'Efectivo',1,79,23);
/*!40000 ALTER TABLE `tbl_ordenes_cerradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes_personal`
--

DROP TABLE IF EXISTS `tbl_ordenes_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ordenes_personal` (
  `id_orden_personal` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden_id` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  PRIMARY KEY (`id_orden_personal`),
  KEY `id_orden_id` (`id_orden_id`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `tbl_ordenes_personal_ibfk_1` FOREIGN KEY (`id_orden_id`) REFERENCES `tbl_ordenes` (`id_orden_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_ordenes_personal_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `tbl_personal` (`id_personal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_personal`
--

LOCK TABLES `tbl_ordenes_personal` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_personal` DISABLE KEYS */;
INSERT INTO `tbl_ordenes_personal` VALUES (1,123,1),(2,124,1),(3,125,1),(4,126,2),(5,127,1),(6,128,1),(7,129,1),(8,130,1),(9,131,1),(10,132,1),(11,133,1),(12,134,1),(13,135,1),(14,136,1),(15,137,1),(16,138,1),(17,139,1),(18,140,1),(19,141,1),(20,142,1),(21,143,1);
/*!40000 ALTER TABLE `tbl_ordenes_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes_x_clientes`
--

DROP TABLE IF EXISTS `tbl_ordenes_x_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ordenes_x_clientes` (
  `id_ordenes_x_clientes` int(11) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ordenes_x_clientes`),
  KEY `index2` (`id_orden`),
  KEY `index3` (`id_cliente`),
  CONSTRAINT `fk_tbl_ordenes_x_clientes_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes` (`id_orden_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_ordenes_x_clientes_2` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_x_clientes`
--

LOCK TABLES `tbl_ordenes_x_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_x_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenes_x_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_personal`
--

DROP TABLE IF EXISTS `tbl_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_personal` (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_persona` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `chr_apellidos` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_CURP` varchar(18) COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `int_puesto` int(11) NOT NULL,
  `bit_activo` int(11) NOT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `int_puesto` (`int_puesto`),
  CONSTRAINT `tbl_personal_ibfk_1` FOREIGN KEY (`int_puesto`) REFERENCES `tbl_puestos` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_personal`
--

LOCK TABLES `tbl_personal` WRITE;
/*!40000 ALTER TABLE `tbl_personal` DISABLE KEYS */;
INSERT INTO `tbl_personal` VALUES (1,'Administrador','De la sucursal','ABCDUFIDUSOAISDUFO','1234567890',1,1),(2,'Cajero principal','De la sucursal','CAJEROJDKFJSLDFJLA','9876543210',2,1),(3,'Mesero','De la sucursal','MESERO34238947J','1234567890',3,1);
/*!40000 ALTER TABLE `tbl_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_precio_tipo_ordenes`
--

DROP TABLE IF EXISTS `tbl_precio_tipo_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_precio_tipo_ordenes` (
  `id_precio_tipo_ordenes` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden` int(11) NOT NULL,
  `id_tipo_precio` int(11) NOT NULL,
  PRIMARY KEY (`id_precio_tipo_ordenes`),
  KEY `index2` (`id_orden`),
  KEY `index3` (`id_tipo_precio`),
  CONSTRAINT `fk_tbl_precio_tipo_ordenes_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes` (`id_orden_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_precio_tipo_ordenes_2` FOREIGN KEY (`id_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_precio_tipo_ordenes`
--

LOCK TABLES `tbl_precio_tipo_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_precio_tipo_ordenes` DISABLE KEYS */;
INSERT INTO `tbl_precio_tipo_ordenes` VALUES (1,1,1),(2,11,1),(3,12,1),(4,13,1),(5,14,1),(6,15,1),(7,16,1),(8,17,1),(9,18,1),(10,19,1),(11,20,1),(12,21,1),(13,22,1),(14,23,1),(15,24,1),(16,25,1),(17,26,1),(18,27,1),(19,28,1),(20,29,1),(21,30,1),(22,31,1),(23,32,1),(24,33,1),(25,34,1),(26,35,1),(27,36,1),(28,37,1),(29,38,1),(30,39,1),(31,40,1),(32,41,1),(33,42,1),(34,43,1),(35,44,1),(36,45,1),(37,46,1),(38,47,1),(39,48,1),(40,49,1),(41,50,1),(42,51,1),(43,52,1),(44,53,1),(45,54,1),(46,55,1),(47,56,1),(48,57,1),(49,58,1),(50,59,1),(51,60,1),(52,61,1),(53,62,1),(54,63,1),(55,64,1),(56,65,1),(57,66,1),(58,67,1),(59,68,1),(60,69,1),(61,70,1),(62,71,1),(63,72,1),(64,73,1),(65,74,1),(66,75,1),(67,76,1),(68,77,1),(69,78,1),(70,79,1),(71,80,1),(72,81,1),(73,82,1),(74,83,1),(75,84,1),(76,85,1),(77,86,1),(78,87,1),(79,88,1),(80,89,1),(81,90,1),(82,91,1),(84,92,2),(97,108,1),(98,109,1),(99,110,1),(100,111,1),(101,112,1),(102,113,1),(103,114,1),(104,115,2),(105,116,1),(106,117,1),(107,118,2),(108,119,2),(109,120,2),(116,121,1),(120,122,1),(121,123,1),(122,124,1),(123,125,1),(124,126,1),(125,127,1),(126,128,1),(127,129,1),(128,130,1),(129,131,1),(130,132,1),(131,133,1),(132,134,1),(133,135,1),(134,136,1),(135,137,1),(136,138,1),(137,139,1),(138,140,1),(139,141,3),(140,142,1),(141,143,1);
/*!40000 ALTER TABLE `tbl_precio_tipo_ordenes` ENABLE KEYS */;
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
  `dbl_precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `int_tipo_precio` int(11) NOT NULL,
  `bit_activo` tinyint(4) NOT NULL DEFAULT 1,
  `dat_fecha_precio_activo` datetime DEFAULT NULL,
  PRIMARY KEY (`id_precio`),
  KEY `id_producto` (`id_producto`),
  KEY `int_tipo_precio` (`int_tipo_precio`),
  KEY `id_producto_2` (`id_producto`),
  CONSTRAINT `tbl_precios_productos_ibfk_1` FOREIGN KEY (`int_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=616 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_precios_productos`
--

LOCK TABLES `tbl_precios_productos` WRITE;
/*!40000 ALTER TABLE `tbl_precios_productos` DISABLE KEYS */;
INSERT INTO `tbl_precios_productos` VALUES (1,5,11.00,1,0,'2020-09-15 00:00:00'),(2,6,10.00,1,0,'2020-09-15 00:00:00'),(3,0,10.00,1,1,'2020-09-15 00:00:00'),(4,7,10.00,1,0,'2020-09-15 00:00:00'),(5,8,10.00,1,0,'2020-09-15 00:00:00'),(6,9,10.00,1,0,'2020-09-15 00:00:00'),(7,10,10.00,1,0,'2020-09-15 00:00:00'),(8,11,10.00,1,0,'2020-09-15 00:00:00'),(9,12,10.00,1,0,'2020-09-15 00:00:00'),(10,13,10.00,1,0,'2020-09-15 00:00:00'),(11,14,12.00,1,0,'2020-09-15 00:00:00'),(12,15,10.00,1,0,'2020-09-15 00:00:00'),(13,16,15.00,1,0,'2020-09-15 00:00:00'),(14,17,15.00,1,0,'2020-09-15 00:00:00'),(15,18,80.00,1,0,'2020-09-15 00:00:00'),(16,19,80.00,1,0,'2020-09-15 00:00:00'),(17,20,75.00,1,0,'2020-09-15 00:00:00'),(18,21,80.00,1,0,'2020-09-15 00:00:00'),(19,22,75.00,1,0,'2020-09-15 00:00:00'),(20,23,75.00,1,0,'2020-09-15 00:00:00'),(21,24,75.00,1,0,'2020-09-15 00:00:00'),(22,25,1.00,1,1,'2020-09-15 00:00:00'),(23,26,45.00,1,1,'2020-09-15 00:00:00'),(24,27,40.00,1,1,'2020-09-15 00:00:00'),(25,28,40.00,1,1,'2020-09-15 00:00:00'),(26,29,45.00,1,1,'2020-09-15 00:00:00'),(27,30,27.00,1,1,'2020-09-15 00:00:00'),(28,31,27.00,1,1,'2020-09-15 00:00:00'),(29,32,24.00,1,1,'2020-09-15 00:00:00'),(30,33,22.00,1,1,'2020-09-15 00:00:00'),(31,34,22.00,1,1,'2020-09-15 00:00:00'),(32,35,27.00,1,1,'2020-09-15 00:00:00'),(33,36,2.00,1,1,'2020-09-15 00:00:00'),(34,37,17.00,1,0,'2020-09-15 00:00:00'),(35,38,50.00,1,0,'2020-09-15 00:00:00'),(36,39,17.00,1,1,'2020-09-15 00:00:00'),(37,40,50.00,1,1,'2020-09-15 00:00:00'),(38,41,17.00,1,1,'2020-09-15 00:00:00'),(39,42,50.00,1,1,'2020-09-15 00:00:00'),(40,43,17.00,1,1,'2020-09-15 00:00:00'),(41,44,50.00,1,1,'2020-09-15 00:00:00'),(42,45,17.00,1,0,'2020-09-15 00:00:00'),(43,46,17.00,1,1,'2020-09-15 00:00:00'),(44,47,17.00,1,1,'2020-09-15 00:00:00'),(45,48,17.00,1,1,'2020-09-15 00:00:00'),(46,49,17.00,1,1,'2020-09-15 00:00:00'),(47,50,17.00,1,1,'2020-09-15 00:00:00'),(48,51,15.00,1,1,'2020-09-15 00:00:00'),(49,52,15.00,1,1,'2020-09-15 00:00:00'),(50,53,12.00,1,1,'2020-09-15 00:00:00'),(51,54,25.00,1,0,'2020-09-15 00:00:00'),(52,55,25.00,1,0,'2020-09-15 00:00:00'),(53,56,30.00,1,0,'2020-09-15 00:00:00'),(54,57,24.00,1,0,'2020-09-15 00:00:00'),(55,58,24.00,1,0,'2020-09-15 00:00:00'),(56,59,24.00,1,0,'2020-09-15 00:00:00'),(57,60,24.00,1,0,'2020-09-15 00:00:00'),(58,61,24.00,1,0,'2020-09-15 00:00:00'),(59,62,24.00,1,0,'2020-09-15 00:00:00'),(60,63,24.00,1,1,'2020-09-15 00:00:00'),(61,64,24.00,1,0,'2020-09-15 00:00:00'),(62,65,24.00,1,0,'2020-09-15 00:00:00'),(63,66,24.00,1,0,'2020-09-15 00:00:00'),(64,67,24.00,1,0,'2020-09-15 00:00:00'),(65,68,24.00,1,0,'2020-09-15 00:00:00'),(66,69,24.00,1,0,'2020-09-15 00:00:00'),(68,71,10.00,1,1,'2020-09-15 00:00:00'),(69,72,10.00,1,1,'2020-09-15 00:00:00'),(70,73,10.00,1,1,'2020-09-15 00:00:00'),(71,74,10.00,1,1,'2020-09-15 00:00:00'),(72,75,10.00,1,1,'2020-09-15 00:00:00'),(73,76,10.00,1,1,'2020-09-15 00:00:00'),(74,77,10.00,1,1,'2020-09-15 00:00:00'),(75,78,10.00,1,1,'2020-09-15 00:00:00'),(76,79,12.00,1,1,'2020-09-15 00:00:00'),(77,80,10.00,1,1,'2020-09-15 00:00:00'),(78,70,10.00,1,1,'2020-09-15 00:00:00'),(79,81,45.00,1,0,'2020-09-15 00:00:00'),(80,82,45.00,1,0,'2020-09-15 00:00:00'),(81,83,45.00,1,0,'2020-09-15 00:00:00'),(82,84,45.00,1,0,'2020-09-15 00:00:00'),(83,85,40.00,1,0,'2020-09-15 00:00:00'),(84,86,40.00,1,0,'2020-09-15 00:00:00'),(85,87,40.00,1,0,'2020-09-15 00:00:00'),(86,88,40.00,1,0,'2020-09-15 00:00:00'),(87,89,15.00,1,1,'2020-09-15 00:00:00'),(88,90,20.00,1,1,'2020-09-15 00:00:00'),(89,91,28.00,1,1,'2020-09-15 00:00:00'),(90,92,22.00,1,1,'2020-09-15 00:00:00'),(91,93,22.00,1,1,'2020-09-15 00:00:00'),(92,94,35.00,1,1,'2020-09-15 00:00:00'),(93,95,17.00,1,1,'2020-09-15 00:00:00'),(94,96,50.00,1,1,'2020-09-15 00:00:00'),(95,97,18.00,1,1,'2020-09-15 00:00:00'),(96,98,22.00,1,1,'2020-09-15 00:00:00'),(97,99,22.00,1,1,'2020-09-15 00:00:00'),(98,100,27.00,1,1,'2020-09-15 00:00:00'),(99,101,27.00,1,1,'2020-09-15 00:00:00'),(100,102,25.00,1,1,'2020-09-15 00:00:00'),(101,103,25.00,1,1,'2020-09-15 00:00:00'),(102,104,8.00,1,1,'2020-09-15 00:00:00'),(103,105,8.00,1,1,'2020-09-15 00:00:00'),(104,106,2.00,1,1,'2020-09-15 00:00:00'),(105,107,8.00,1,0,'2020-09-15 00:00:00'),(106,108,8.00,1,0,'2020-09-15 00:00:00'),(107,109,90.00,1,0,'2020-09-15 00:00:00'),(108,110,-24.00,1,1,'2020-09-15 00:00:00'),(109,111,-24.00,1,1,'2020-09-15 00:00:00'),(110,112,155.00,1,0,'2020-09-15 00:00:00'),(111,18,85.00,1,0,'2020-09-16 19:05:00'),(112,18,135.00,2,0,'2020-09-16 19:06:00'),(113,20,135.00,2,0,'2020-09-16 21:30:00'),(114,19,85.00,1,0,'2020-09-16 21:30:00'),(115,19,135.00,2,0,'2020-09-16 21:31:00'),(116,21,95.00,1,0,'2020-09-17 01:55:00'),(117,21,140.00,2,0,'2020-09-17 01:55:00'),(118,22,85.00,1,0,'2020-09-17 02:07:00'),(119,22,125.00,2,1,'2020-09-17 02:08:00'),(120,45,22.00,1,1,'2020-09-17 02:09:00'),(121,113,22.00,1,0,'2020-09-17 02:11:00'),(122,113,32.00,2,1,'2020-09-17 02:12:00'),(123,112,155.00,1,0,'2020-09-17 20:27:00'),(124,112,155.00,1,0,'2020-09-17 20:30:00'),(125,113,32.00,1,1,'2020-09-17 20:33:00'),(126,112,155.00,1,1,'2020-09-17 21:12:00'),(127,114,0.00,1,0,'2020-09-18 16:51:00'),(128,114,0.00,1,1,'2020-09-18 16:57:00'),(129,115,0.00,1,0,'2020-09-19 17:41:00'),(130,115,0.00,1,1,'2020-09-19 17:45:00'),(131,81,60.00,1,0,'2020-09-21 22:15:00'),(132,23,85.00,1,0,'2020-09-23 20:20:00'),(133,23,140.00,2,0,'2020-09-23 20:20:00'),(134,6,20.00,2,1,'2020-10-04 19:25:00'),(135,6,12.00,1,0,'2020-10-08 20:05:00'),(136,18,85.00,1,0,'2020-10-17 02:46:00'),(137,19,85.00,1,0,'2020-10-17 03:00:00'),(138,20,75.00,1,0,'2020-10-17 03:01:00'),(139,21,95.00,1,1,'2020-10-17 03:01:00'),(140,22,85.00,1,1,'2020-10-17 03:02:00'),(141,23,85.00,1,0,'2020-10-17 03:03:00'),(142,24,85.00,1,1,'2020-10-17 03:04:00'),(143,24,125.00,2,1,'2020-10-17 03:04:00'),(144,37,22.00,1,1,'2020-10-17 03:05:00'),(145,37,30.00,2,1,'2020-10-17 03:05:00'),(146,38,80.00,1,1,'2020-10-17 03:05:00'),(147,38,110.00,2,1,'2020-10-17 03:06:00'),(148,25,2.00,2,1,'2020-10-17 03:06:00'),(149,36,3.00,2,1,'2020-10-17 03:07:00'),(150,106,3.00,2,1,'2020-10-17 03:07:00'),(151,107,8.00,1,1,'2020-10-17 03:08:00'),(152,5,15.00,1,0,'2020-10-17 03:08:00'),(153,5,22.00,1,0,'2020-10-17 03:09:00'),(154,5,15.00,1,1,'2020-10-17 03:09:00'),(155,5,22.00,2,1,'2020-10-17 03:09:00'),(156,6,14.00,1,1,'2020-10-17 03:10:00'),(157,7,15.00,1,0,'2020-10-17 03:11:00'),(158,7,22.00,2,1,'2020-10-17 03:11:00'),(159,8,14.00,1,1,'2020-10-17 03:12:00'),(160,8,20.00,2,1,'2020-10-17 03:12:00'),(161,9,14.00,1,0,'2020-10-17 03:19:00'),(162,9,20.00,2,1,'2020-10-17 03:19:00'),(163,10,14.00,1,1,'2020-10-17 03:21:00'),(164,10,20.00,2,1,'2020-10-17 03:21:00'),(165,11,14.00,1,1,'2020-10-17 03:22:00'),(166,11,20.00,2,1,'2020-10-17 03:22:00'),(167,12,14.00,1,1,'2020-10-17 03:22:00'),(168,12,20.00,2,1,'2020-10-17 03:23:00'),(169,109,360.00,1,0,'2020-10-17 03:24:00'),(170,109,490.00,2,0,'2020-10-17 03:26:00'),(171,116,180.00,1,0,'2020-10-17 03:28:00'),(172,116,250.00,2,0,'2020-10-17 03:28:00'),(173,109,360.00,1,0,'2020-10-17 03:32:00'),(174,116,180.00,1,0,'2020-10-17 03:32:00'),(175,107,8.00,2,1,'2020-11-10 14:55:00'),(176,13,14.00,1,0,'2020-11-10 14:55:00'),(177,13,20.00,2,1,'2020-11-10 14:56:00'),(178,108,8.00,2,1,'2020-11-10 14:56:00'),(179,14,17.00,1,0,'2020-11-10 14:57:00'),(180,14,22.00,2,1,'2020-11-10 14:57:00'),(181,117,15.00,1,1,'2020-11-10 14:58:00'),(182,117,22.00,2,1,'2020-11-10 14:58:00'),(183,118,15.00,1,1,'2020-11-10 15:08:00'),(184,118,22.00,2,1,'2020-11-10 15:09:00'),(185,15,14.00,1,0,'2020-11-10 15:10:00'),(186,15,20.00,2,1,'2020-11-10 15:10:00'),(187,16,20.00,1,1,'2020-11-10 15:10:00'),(188,16,30.00,2,1,'2020-11-10 15:10:00'),(189,17,18.00,1,0,'2020-11-10 15:11:00'),(190,17,26.00,2,1,'2020-11-10 15:11:00'),(191,119,14.00,1,0,'2020-11-10 15:13:00'),(192,119,22.00,1,0,'2020-11-10 15:14:00'),(193,119,14.00,1,1,'2020-11-10 15:14:00'),(194,119,22.00,2,1,'2020-11-10 15:14:00'),(195,120,20.00,2,1,'2020-11-10 15:15:00'),(196,120,14.00,1,1,'2020-11-10 15:15:00'),(197,121,18.00,1,0,'2020-11-10 15:22:00'),(198,121,26.00,2,1,'2020-11-10 15:22:00'),(199,122,18.00,1,0,'2020-11-10 15:33:00'),(200,122,26.00,2,1,'2020-11-10 15:33:00'),(201,123,18.00,1,0,'2020-11-10 15:34:00'),(202,123,26.00,2,1,'2020-11-10 15:34:00'),(203,124,18.00,1,1,'2020-11-10 15:35:00'),(204,124,26.00,2,1,'2020-11-10 15:36:00'),(205,123,26.00,1,1,'2020-11-10 15:36:00'),(206,122,18.00,1,1,'2020-11-10 15:36:00'),(207,121,18.00,1,1,'2020-11-10 15:37:00'),(208,125,18.00,1,1,'2020-11-10 15:38:00'),(209,125,26.00,2,1,'2020-11-10 15:38:00'),(210,126,18.00,1,0,'2020-11-10 15:40:00'),(211,126,26.00,2,1,'2020-11-10 15:41:00'),(212,127,16.00,1,0,'2020-11-10 15:42:00'),(213,127,23.00,1,0,'2020-11-10 15:42:00'),(214,127,23.00,2,0,'2020-11-10 15:42:00'),(215,127,18.00,1,1,'2020-11-10 15:43:00'),(216,128,23.00,2,0,'2020-11-10 15:43:00'),(217,128,16.00,1,1,'2020-11-10 15:44:00'),(218,127,23.00,2,1,'2020-11-10 15:44:00'),(219,126,26.00,1,1,'2020-11-10 15:44:00'),(220,17,18.00,1,1,'2020-11-10 15:45:00'),(221,14,22.00,1,1,'2020-11-10 15:45:00'),(222,15,20.00,1,1,'2020-11-10 15:45:00'),(223,129,15.00,1,0,'2020-11-10 16:07:00'),(224,129,22.00,2,1,'2020-11-10 16:08:00'),(225,130,15.00,1,0,'2020-11-10 16:08:00'),(226,130,22.00,1,0,'2020-11-10 16:09:00'),(227,130,15.00,1,1,'2020-11-10 16:09:00'),(228,130,22.00,2,1,'2020-11-10 16:09:00'),(229,128,23.00,2,1,'2020-11-10 16:11:00'),(230,129,15.00,1,1,'2020-11-10 16:12:00'),(231,131,15.00,1,1,'2020-11-10 16:13:00'),(232,131,22.00,2,1,'2020-11-10 16:13:00'),(233,132,14.00,1,1,'2020-11-10 16:16:00'),(234,132,22.00,2,1,'2020-11-10 16:17:00'),(235,108,8.00,1,1,'2020-11-10 16:17:00'),(236,13,22.00,1,0,'2020-11-10 16:24:00'),(237,13,14.00,1,1,'2020-11-10 16:25:00'),(238,133,14.00,1,0,'2020-11-10 16:26:00'),(239,133,20.00,1,0,'2020-11-10 16:26:00'),(240,133,14.00,1,0,'2020-11-10 16:27:00'),(241,133,20.00,2,1,'2020-11-10 16:27:00'),(242,134,14.00,1,1,'2020-11-10 16:28:00'),(243,134,20.00,2,1,'2020-11-10 16:28:00'),(244,135,14.00,1,0,'2020-11-10 16:29:00'),(245,135,20.00,1,0,'2020-11-10 16:29:00'),(246,135,20.00,2,1,'2020-11-10 16:29:00'),(247,135,14.00,1,1,'2020-11-10 16:29:00'),(248,136,16.00,1,1,'2020-11-10 16:41:00'),(249,136,22.00,2,0,'2020-11-10 16:41:00'),(250,137,16.00,1,0,'2020-11-10 16:42:00'),(251,137,22.00,2,1,'2020-11-10 16:42:00'),(252,136,22.00,2,1,'2020-11-10 16:43:00'),(253,7,22.00,1,0,'2020-11-10 16:43:00'),(254,7,15.00,1,1,'2020-11-10 16:44:00'),(255,138,16.00,1,1,'2020-11-10 16:45:00'),(256,138,23.00,2,1,'2020-11-10 16:45:00'),(257,137,15.00,1,1,'2020-11-10 16:46:00'),(258,139,15.00,1,1,'2020-11-10 16:47:00'),(259,139,22.00,2,1,'2020-11-10 16:48:00'),(260,9,14.00,1,1,'2020-11-10 16:48:00'),(261,140,22.00,2,0,'2020-11-10 16:49:00'),(262,140,15.00,2,0,'2020-11-10 16:49:00'),(263,140,15.00,1,1,'2020-11-10 16:49:00'),(264,140,22.00,2,1,'2020-11-10 16:50:00'),(265,141,15.00,1,0,'2020-11-10 16:51:00'),(266,141,22.00,1,0,'2020-11-10 16:51:00'),(267,141,22.00,2,1,'2020-11-10 16:51:00'),(268,141,15.00,1,1,'2020-11-10 16:52:00'),(269,142,15.00,1,1,'2020-11-10 16:52:00'),(270,142,22.00,2,1,'2020-11-10 16:53:00'),(271,143,15.00,1,1,'2020-11-10 21:18:47'),(272,143,22.00,2,1,'2020-11-10 21:19:00'),(273,144,15.00,1,1,'2020-11-10 21:20:19'),(274,144,22.00,2,1,'2020-11-10 21:20:00'),(275,145,15.00,1,0,'2020-11-10 21:22:23'),(276,133,14.00,1,1,'2020-11-10 21:22:00'),(277,145,22.00,1,0,'2020-11-10 21:22:00'),(278,145,22.00,2,1,'2020-11-10 21:23:00'),(279,145,15.00,1,1,'2020-11-10 21:23:00'),(280,146,15.00,1,1,'2020-11-10 21:24:10'),(281,146,22.00,2,1,'2020-11-10 21:24:00'),(282,147,15.00,1,1,'2020-11-10 21:25:06'),(283,147,22.00,2,1,'2020-11-10 21:25:00'),(284,68,30.00,1,0,'2020-11-10 21:26:00'),(285,68,40.00,2,0,'2020-11-10 21:27:00'),(286,68,30.00,1,1,'2020-11-10 21:28:00'),(287,68,40.00,2,1,'2020-11-10 21:34:00'),(288,58,28.00,1,1,'2020-11-10 21:35:00'),(289,58,38.00,2,1,'2020-11-10 21:35:00'),(290,66,26.00,1,1,'2020-11-10 21:36:00'),(291,66,36.00,2,1,'2020-11-10 21:36:00'),(292,148,26.00,1,1,'2020-11-10 21:39:48'),(293,148,36.00,2,1,'2020-11-10 21:40:00'),(294,67,26.00,1,1,'2020-11-10 21:40:00'),(295,67,36.00,2,1,'2020-11-10 21:40:00'),(296,149,26.00,1,1,'2020-11-10 21:42:09'),(297,149,36.00,2,1,'2020-11-10 21:42:00'),(298,150,26.00,1,1,'2020-11-10 21:43:18'),(299,150,36.00,2,1,'2020-11-10 21:43:00'),(300,57,26.00,1,1,'2020-11-10 21:44:00'),(301,57,36.00,2,1,'2020-11-10 21:44:00'),(302,59,26.00,1,0,'2020-11-10 21:44:00'),(303,59,36.00,1,0,'2020-11-10 21:45:00'),(304,59,36.00,2,1,'2020-11-10 21:45:00'),(305,59,26.00,1,1,'2020-11-10 21:45:00'),(306,60,26.00,1,1,'2020-11-10 21:45:00'),(307,60,36.00,2,1,'2020-11-10 21:45:00'),(308,61,26.00,1,1,'2020-11-10 21:46:00'),(309,61,36.00,2,1,'2020-11-10 21:46:00'),(310,64,26.00,1,1,'2020-11-10 21:46:00'),(311,64,36.00,2,1,'2020-11-10 21:46:00'),(312,151,26.00,1,1,'2020-11-10 21:47:24'),(313,151,36.00,2,1,'2020-11-10 21:47:00'),(314,152,26.00,1,1,'2020-11-10 21:48:09'),(315,152,36.00,2,1,'2020-11-10 21:48:00'),(316,69,26.00,1,1,'2020-11-10 21:48:00'),(317,69,36.00,2,1,'2020-11-10 21:49:00'),(318,65,26.00,1,0,'2020-11-10 21:49:00'),(319,65,36.00,1,0,'2020-11-10 21:49:00'),(320,65,36.00,2,1,'2020-11-10 21:49:00'),(321,65,26.00,1,1,'2020-11-10 21:49:00'),(322,62,26.00,1,1,'2020-11-10 21:50:00'),(323,62,36.00,2,1,'2020-11-10 21:50:00'),(324,153,35.00,1,1,'2020-11-10 21:52:47'),(325,153,45.00,2,1,'2020-11-10 21:53:00'),(326,154,32.00,1,1,'2020-11-10 21:53:51'),(327,154,42.00,2,1,'2020-11-10 21:54:00'),(328,155,30.00,1,0,'2020-11-10 21:55:02'),(329,155,40.00,1,0,'2020-11-10 21:55:00'),(330,155,40.00,2,1,'2020-11-10 21:55:00'),(331,155,30.00,1,1,'2020-11-10 21:55:00'),(332,156,30.00,1,0,'2020-11-10 21:56:35'),(333,156,40.00,2,1,'2020-11-10 21:56:00'),(334,156,40.00,1,1,'2020-11-10 21:57:00'),(335,157,30.00,1,1,'2020-11-10 21:57:40'),(336,157,40.00,2,1,'2020-11-10 21:58:00'),(337,158,30.00,1,1,'2020-11-10 21:58:23'),(338,158,40.00,2,1,'2020-11-10 21:58:00'),(339,159,30.00,1,1,'2020-11-10 21:59:09'),(340,159,40.00,2,1,'2020-11-10 21:59:00'),(341,160,30.00,1,1,'2020-11-10 21:59:59'),(342,160,40.00,2,1,'2020-11-10 22:00:00'),(343,86,65.00,1,0,'2020-11-10 22:01:00'),(344,85,60.00,1,0,'2020-11-10 22:01:00'),(345,87,60.00,1,1,'2020-11-10 22:01:00'),(346,85,60.00,1,1,'2020-11-10 22:01:00'),(347,86,65.00,1,1,'2020-11-10 22:02:00'),(348,88,60.00,1,1,'2020-11-10 22:02:00'),(349,161,60.00,1,0,'2020-11-10 22:02:53'),(350,161,60.00,1,1,'2020-11-10 22:03:00'),(351,162,50.00,1,0,'2020-11-10 22:03:53'),(352,162,50.00,1,1,'2020-11-10 22:04:00'),(353,82,70.00,1,1,'2020-11-10 22:04:00'),(354,82,90.00,2,1,'2020-11-10 22:04:00'),(355,81,65.00,1,1,'2020-11-10 22:05:00'),(356,81,90.00,2,1,'2020-11-10 22:05:00'),(357,83,65.00,1,1,'2020-11-10 22:05:00'),(358,83,90.00,2,1,'2020-11-10 22:06:00'),(359,84,65.00,1,1,'2020-11-10 22:06:00'),(360,84,90.00,2,1,'2020-11-10 22:06:00'),(361,163,65.00,1,0,'2020-11-10 22:12:28'),(362,163,90.00,1,0,'2020-11-10 22:12:00'),(363,163,90.00,2,0,'2020-11-10 22:13:00'),(364,163,65.00,1,0,'2020-11-10 22:13:00'),(365,164,55.00,1,1,'2020-11-10 22:13:41'),(366,164,80.00,2,1,'2020-11-10 22:14:00'),(367,18,95.00,1,0,'2020-11-10 22:15:00'),(368,19,95.00,1,0,'2020-11-10 22:15:00'),(369,21,135.00,2,1,'2020-11-12 16:16:00'),(370,23,140.00,2,1,'2020-11-12 16:17:00'),(371,165,125.00,2,0,'2020-11-12 16:18:38'),(372,165,85.00,1,0,'2020-11-12 16:19:00'),(373,166,85.00,1,0,'2020-11-12 16:19:55'),(374,166,125.00,2,0,'2020-11-12 16:20:00'),(375,23,125.00,1,1,'2020-11-12 16:20:00'),(376,20,135.00,2,1,'2020-11-12 16:21:00'),(377,20,75.00,1,1,'2020-11-12 16:21:00'),(378,165,125.00,2,0,'2020-11-13 22:15:00'),(379,166,85.00,1,0,'2020-11-13 22:17:00'),(380,166,85.00,2,0,'2020-11-13 22:18:00'),(381,166,85.00,1,0,'2020-11-13 22:20:00'),(382,166,125.00,2,0,'2020-11-13 22:23:00'),(383,166,125.00,2,0,'2020-11-13 22:25:00'),(384,166,125.00,2,0,'2020-11-13 22:26:00'),(385,166,125.00,2,0,'2020-11-13 22:27:00'),(386,166,125.00,2,0,'2020-11-13 22:30:00'),(387,166,85.00,1,0,'2020-11-13 22:32:00'),(388,166,85.00,2,0,'2020-11-13 22:33:00'),(389,166,85.00,1,0,'2020-11-13 22:36:00'),(390,166,125.00,2,0,'2020-11-13 22:38:00'),(391,166,85.00,1,0,'2020-11-13 22:39:00'),(392,166,85.00,1,0,'2020-11-13 22:42:00'),(393,166,85.00,1,1,'2020-11-13 22:43:00'),(394,165,125.00,2,0,'2020-11-13 22:47:00'),(395,167,85.00,1,0,'2020-11-13 22:54:55'),(396,167,125.00,2,0,'2020-11-13 22:55:00'),(397,166,125.00,2,0,'2020-11-13 22:55:00'),(398,166,125.00,2,0,'2020-11-13 22:57:00'),(399,166,125.00,2,0,'2020-11-13 22:59:00'),(400,166,125.00,2,0,'2020-11-13 23:00:00'),(401,165,85.00,1,0,'2020-11-14 02:28:00'),(402,165,125.00,2,0,'2020-11-14 02:29:00'),(403,165,85.00,1,1,'2020-11-14 02:30:00'),(404,165,85.00,2,1,'2020-11-14 02:35:00'),(405,167,125.00,2,0,'2020-11-14 02:36:00'),(406,167,125.00,1,0,'2020-11-14 02:37:00'),(407,167,125.00,2,0,'2020-11-14 02:41:00'),(408,167,125.00,2,0,'2020-11-14 02:44:00'),(409,167,85.00,1,0,'2020-11-14 02:50:00'),(410,167,125.00,2,0,'2020-11-14 18:23:00'),(411,167,125.00,2,1,'2020-11-14 18:27:00'),(412,167,85.00,1,0,'2020-11-14 18:29:00'),(413,166,125.00,2,1,'2020-11-15 19:02:00'),(414,167,85.00,1,1,'2020-11-15 19:03:00'),(415,18,135.00,2,0,'2020-11-15 19:03:00'),(416,18,95.00,1,1,'2020-11-15 19:04:00'),(417,18,135.00,2,1,'2020-11-15 19:04:00'),(418,19,135.00,2,0,'2020-11-15 19:26:00'),(419,19,95.00,1,1,'2020-11-15 19:27:00'),(420,19,135.00,2,1,'2020-11-15 19:27:00'),(421,5,0.00,3,1,'2020-11-18 23:22:42'),(422,6,0.00,3,1,'2020-11-18 23:22:46'),(423,7,0.00,3,1,'2020-11-18 23:23:06'),(424,8,0.00,3,1,'2020-11-18 23:23:06'),(425,9,0.00,3,1,'2020-11-18 23:23:06'),(426,10,0.00,3,1,'2020-11-18 23:23:06'),(427,11,0.00,3,1,'2020-11-18 23:23:06'),(428,12,0.00,3,1,'2020-11-18 23:23:06'),(429,13,0.00,3,1,'2020-11-18 23:23:06'),(430,14,0.00,3,1,'2020-11-18 23:23:07'),(431,15,0.00,3,1,'2020-11-18 23:23:07'),(432,16,0.00,3,1,'2020-11-18 23:23:07'),(433,17,0.00,3,1,'2020-11-18 23:23:07'),(434,18,0.00,3,1,'2020-11-18 23:23:07'),(435,19,0.00,3,1,'2020-11-18 23:23:07'),(436,20,0.00,3,1,'2020-11-18 23:23:07'),(437,21,0.00,3,1,'2020-11-18 23:23:07'),(438,22,0.00,3,1,'2020-11-18 23:23:07'),(439,23,0.00,3,1,'2020-11-18 23:23:07'),(440,24,0.00,3,1,'2020-11-18 23:23:07'),(441,25,0.00,3,1,'2020-11-18 23:23:07'),(442,28,0.00,3,1,'2020-11-18 23:23:07'),(443,29,0.00,3,1,'2020-11-18 23:23:07'),(444,30,0.00,3,1,'2020-11-18 23:23:07'),(445,31,0.00,3,1,'2020-11-18 23:23:07'),(446,32,0.00,3,1,'2020-11-18 23:23:07'),(447,33,0.00,3,1,'2020-11-18 23:23:07'),(448,34,0.00,3,1,'2020-11-18 23:23:07'),(449,35,0.00,3,1,'2020-11-18 23:23:07'),(450,36,0.00,3,1,'2020-11-18 23:23:07'),(451,37,0.00,3,1,'2020-11-18 23:23:07'),(452,38,0.00,3,1,'2020-11-18 23:23:07'),(453,39,0.00,3,1,'2020-11-18 23:23:07'),(454,40,0.00,3,1,'2020-11-18 23:23:07'),(455,41,0.00,3,1,'2020-11-18 23:23:07'),(456,42,0.00,3,1,'2020-11-18 23:23:07'),(457,43,0.00,3,1,'2020-11-18 23:23:07'),(458,44,0.00,3,1,'2020-11-18 23:23:07'),(459,46,0.00,3,1,'2020-11-18 23:23:07'),(460,47,0.00,3,1,'2020-11-18 23:23:07'),(461,48,0.00,3,1,'2020-11-18 23:23:08'),(462,49,0.00,3,1,'2020-11-18 23:23:08'),(463,50,0.00,3,1,'2020-11-18 23:23:08'),(464,51,0.00,3,1,'2020-11-18 23:23:08'),(465,52,0.00,3,1,'2020-11-18 23:23:08'),(466,53,0.00,3,1,'2020-11-18 23:23:08'),(467,54,0.00,3,1,'2020-11-18 23:23:08'),(468,55,0.00,3,1,'2020-11-18 23:23:08'),(469,56,0.00,3,1,'2020-11-18 23:23:08'),(470,57,0.00,3,1,'2020-11-18 23:23:08'),(471,58,0.00,3,1,'2020-11-18 23:23:08'),(472,59,0.00,3,1,'2020-11-18 23:23:08'),(473,60,0.00,3,1,'2020-11-18 23:23:08'),(474,61,0.00,3,1,'2020-11-18 23:23:08'),(475,62,0.00,3,1,'2020-11-18 23:23:08'),(476,64,0.00,3,1,'2020-11-18 23:23:08'),(477,65,0.00,3,1,'2020-11-18 23:23:08'),(478,66,0.00,3,1,'2020-11-18 23:23:08'),(479,67,0.00,3,1,'2020-11-18 23:23:08'),(480,68,0.00,3,1,'2020-11-18 23:23:08'),(481,69,0.00,3,1,'2020-11-18 23:23:08'),(482,70,0.00,3,1,'2020-11-18 23:23:08'),(483,71,0.00,3,1,'2020-11-18 23:23:08'),(484,72,0.00,3,1,'2020-11-18 23:23:09'),(485,73,0.00,3,1,'2020-11-18 23:23:09'),(486,74,0.00,3,1,'2020-11-18 23:23:09'),(487,75,0.00,3,1,'2020-11-18 23:23:09'),(488,76,0.00,3,1,'2020-11-18 23:23:09'),(489,77,0.00,3,1,'2020-11-18 23:23:09'),(490,78,0.00,3,1,'2020-11-18 23:23:09'),(491,79,0.00,3,1,'2020-11-18 23:23:09'),(492,80,0.00,3,1,'2020-11-18 23:23:09'),(493,81,0.00,3,1,'2020-11-18 23:23:09'),(494,82,0.00,3,1,'2020-11-18 23:23:09'),(495,83,0.00,3,1,'2020-11-18 23:23:09'),(496,84,0.00,3,1,'2020-11-18 23:23:09'),(497,85,0.00,3,1,'2020-11-18 23:23:09'),(498,86,0.00,3,1,'2020-11-18 23:23:09'),(499,87,0.00,3,1,'2020-11-18 23:23:09'),(500,88,0.00,3,1,'2020-11-18 23:23:09'),(501,89,0.00,3,1,'2020-11-18 23:23:09'),(502,91,0.00,3,1,'2020-11-18 23:23:09'),(503,92,0.00,3,1,'2020-11-18 23:23:09'),(504,93,0.00,3,1,'2020-11-18 23:23:09'),(505,94,0.00,3,1,'2020-11-18 23:23:09'),(506,95,0.00,3,1,'2020-11-18 23:23:09'),(507,96,0.00,3,1,'2020-11-18 23:23:10'),(508,97,0.00,3,1,'2020-11-18 23:23:10'),(509,98,0.00,3,1,'2020-11-18 23:23:10'),(510,99,0.00,3,1,'2020-11-18 23:23:10'),(511,100,0.00,3,1,'2020-11-18 23:23:10'),(512,101,0.00,3,1,'2020-11-18 23:23:10'),(513,102,0.00,3,1,'2020-11-18 23:23:10'),(514,103,0.00,3,1,'2020-11-18 23:23:10'),(515,104,0.00,3,1,'2020-11-18 23:23:10'),(516,105,0.00,3,1,'2020-11-18 23:23:10'),(517,106,0.00,3,1,'2020-11-18 23:23:10'),(518,107,0.00,3,1,'2020-11-18 23:23:10'),(519,108,0.00,3,1,'2020-11-18 23:23:10'),(520,109,0.00,3,0,'2020-11-18 23:23:10'),(521,112,0.00,3,1,'2020-11-18 23:23:10'),(522,113,0.00,3,1,'2020-11-18 23:23:10'),(523,114,0.00,3,1,'2020-11-18 23:23:10'),(524,115,0.00,3,1,'2020-11-18 23:23:10'),(525,116,0.00,3,1,'2020-11-18 23:23:10'),(526,117,0.00,3,1,'2020-11-18 23:23:10'),(527,118,0.00,3,1,'2020-11-18 23:23:10'),(528,119,0.00,3,1,'2020-11-18 23:23:10'),(529,120,0.00,3,1,'2020-11-18 23:23:10'),(530,121,0.00,3,1,'2020-11-18 23:23:11'),(531,122,0.00,3,1,'2020-11-18 23:23:11'),(532,123,0.00,3,1,'2020-11-18 23:23:11'),(533,124,0.00,3,1,'2020-11-18 23:23:11'),(534,125,0.00,3,1,'2020-11-18 23:23:11'),(535,126,0.00,3,1,'2020-11-18 23:23:11'),(536,127,0.00,3,1,'2020-11-18 23:23:11'),(537,128,0.00,3,1,'2020-11-18 23:23:11'),(538,129,0.00,3,1,'2020-11-18 23:23:11'),(539,130,0.00,3,1,'2020-11-18 23:23:11'),(540,131,0.00,3,1,'2020-11-18 23:23:11'),(541,132,0.00,3,1,'2020-11-18 23:23:11'),(542,133,0.00,3,1,'2020-11-18 23:23:11'),(543,134,0.00,3,1,'2020-11-18 23:23:11'),(544,135,0.00,3,1,'2020-11-18 23:23:11'),(545,136,0.00,3,1,'2020-11-18 23:23:11'),(546,137,0.00,3,1,'2020-11-18 23:23:11'),(547,138,0.00,3,1,'2020-11-18 23:23:11'),(548,139,0.00,3,1,'2020-11-18 23:23:11'),(549,140,0.00,3,1,'2020-11-18 23:23:11'),(550,141,0.00,3,1,'2020-11-18 23:23:11'),(551,142,0.00,3,1,'2020-11-18 23:23:11'),(552,143,0.00,3,1,'2020-11-18 23:23:11'),(553,144,0.00,3,1,'2020-11-18 23:23:11'),(554,145,0.00,3,1,'2020-11-18 23:23:11'),(555,146,0.00,3,1,'2020-11-18 23:23:11'),(556,147,0.00,3,1,'2020-11-18 23:23:11'),(557,148,0.00,3,1,'2020-11-18 23:23:11'),(558,149,0.00,3,1,'2020-11-18 23:23:11'),(559,150,0.00,3,1,'2020-11-18 23:23:11'),(560,151,0.00,3,1,'2020-11-18 23:23:12'),(561,152,0.00,3,1,'2020-11-18 23:23:12'),(562,153,0.00,3,1,'2020-11-18 23:23:12'),(563,154,0.00,3,1,'2020-11-18 23:23:12'),(564,155,0.00,3,1,'2020-11-18 23:23:12'),(565,156,0.00,3,1,'2020-11-18 23:23:12'),(566,157,0.00,3,1,'2020-11-18 23:23:12'),(567,158,0.00,3,1,'2020-11-18 23:23:12'),(568,159,0.00,3,1,'2020-11-18 23:23:12'),(569,160,0.00,3,1,'2020-11-18 23:23:12'),(570,161,0.00,3,1,'2020-11-18 23:23:12'),(571,162,0.00,3,1,'2020-11-18 23:23:12'),(572,163,0.00,3,0,'2020-11-18 23:23:12'),(573,164,0.00,3,1,'2020-11-18 23:23:12'),(574,165,0.00,3,1,'2020-11-18 23:23:12'),(575,166,0.00,3,1,'2020-11-18 23:23:12'),(576,167,0.00,3,1,'2020-11-18 23:23:12'),(577,163,90.00,2,0,'2020-11-19 19:26:00'),(578,163,0.00,3,0,'2020-11-19 19:26:00'),(579,163,0.00,3,1,'2020-11-19 19:27:00'),(580,163,65.00,1,0,'2020-11-19 19:31:00'),(581,163,90.00,2,1,'2020-11-19 19:34:00'),(582,163,65.00,1,0,'2020-11-19 19:35:00'),(583,163,65.00,1,1,'2020-11-19 19:37:00'),(584,54,35.00,1,1,'2020-11-20 00:54:00'),(585,54,50.00,2,1,'2020-11-20 00:54:00'),(586,55,30.00,1,1,'2020-11-20 00:54:00'),(587,55,40.00,2,1,'2020-11-20 00:54:00'),(588,56,40.00,1,1,'2020-11-20 00:55:00'),(589,56,60.00,2,1,'2020-11-20 00:55:00'),(590,109,490.00,2,0,'2020-11-20 01:13:00'),(591,109,0.00,3,1,'2020-11-20 01:15:00'),(592,109,360.00,1,0,'2020-11-20 01:16:00'),(593,109,490.00,2,0,'2020-11-20 01:16:00'),(594,109,360.00,1,0,'2020-11-20 01:17:00'),(595,109,490.00,2,0,'2020-11-20 01:18:00'),(596,109,360.00,1,0,'2020-11-20 01:19:00'),(597,109,490.00,2,0,'2020-11-20 01:19:00'),(598,109,360.00,1,0,'2020-11-20 01:20:00'),(599,109,490.00,2,0,'2020-11-20 01:20:00'),(600,109,360.00,1,1,'2020-11-20 01:48:00'),(601,109,490.00,2,1,'2020-11-20 01:49:00'),(602,116,250.00,2,0,'2020-11-20 02:15:00'),(603,116,180.00,1,0,'2020-11-20 02:15:00'),(604,116,250.00,2,0,'2020-11-20 02:16:00'),(605,116,180.00,1,0,'2020-11-20 02:18:00'),(606,116,250.00,2,0,'2020-11-20 02:18:00'),(607,116,250.00,2,1,'2020-11-20 02:19:00'),(608,116,180.00,1,0,'2020-11-20 02:20:00'),(609,116,180.00,1,1,'2020-11-20 02:22:00'),(610,168,110.00,1,0,'2020-11-20 18:09:48'),(611,168,160.00,1,0,'2020-11-20 18:10:00'),(612,168,160.00,2,1,'2020-11-20 18:12:00'),(613,168,110.00,1,0,'2020-11-20 19:17:00'),(614,168,0.00,3,1,'2020-11-20 19:20:00'),(615,168,110.00,1,1,'2020-11-20 19:22:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_orden_opciones`
--

LOCK TABLES `tbl_prods_orden_opciones` WRITE;
/*!40000 ALTER TABLE `tbl_prods_orden_opciones` DISABLE KEYS */;
INSERT INTO `tbl_prods_orden_opciones` VALUES (1,331,3),(2,331,4),(8,332,5),(9,333,10),(10,339,8),(11,339,2),(13,345,10),(14,345,11),(15,346,4),(19,363,4),(20,367,6),(21,367,7),(26,363,6),(28,411,1),(29,411,8),(30,411,1),(31,411,8),(32,414,6),(33,414,7),(34,415,8),(35,416,1),(36,416,4),(37,416,10),(38,437,5),(39,437,7),(40,439,4),(41,439,5),(42,440,1),(43,440,2),(44,442,5),(45,442,7),(46,443,2),(47,443,4),(48,444,1),(49,444,2),(50,446,10),(51,448,1),(52,448,2),(53,449,1),(54,450,10),(55,453,1),(56,453,3),(57,457,2),(58,457,3),(59,460,10),(60,466,16),(61,467,3),(62,470,15),(63,471,10),(64,471,15),(65,472,10),(66,472,15),(67,473,10),(68,473,15),(69,474,1),(70,474,2),(71,474,4),(72,475,1),(73,475,4),(74,478,3),(75,478,4),(76,479,3),(77,479,4),(78,481,2),(79,481,3),(80,481,4),(81,482,2),(82,482,3),(83,482,4),(84,484,1),(85,485,1),(86,487,2),(87,487,5),(88,488,2),(89,488,5),(90,490,1),(91,490,2),(92,491,1),(93,491,2),(94,493,2),(95,494,2),(96,495,4),(97,497,4),(98,499,4),(99,500,4),(100,501,4),(101,504,1),(102,504,2),(103,505,3),(104,505,7),(105,506,3),(106,506,4),(107,507,7),(108,507,10),(109,508,10),(110,508,18),(111,509,5),(112,509,10),(113,510,7),(114,511,3),(115,511,10),(116,515,3),(117,515,10),(118,516,4),(119,517,4),(120,517,9),(121,519,1),(122,519,3),(123,520,10),(124,520,19),(125,520,20),(126,521,17),(127,522,5),(128,523,18),(129,523,20),(130,525,7),(131,526,1),(132,526,4),(133,527,7),(134,528,15),(135,528,18),(136,531,1),(137,532,17),(138,533,1),(139,533,7),(140,534,17),(141,535,19),(142,535,20),(143,536,1),(144,536,4),(145,537,17),(146,538,18),(147,539,3),(148,539,4),(149,540,15),(150,540,18),(151,542,10),(152,542,19),(153,543,10),(154,543,22),(155,543,19),(156,544,10),(157,544,19),(158,545,10),(159,546,17),(160,546,19),(161,546,21),(162,547,17),(163,548,17),(164,548,19),(165,549,17),(166,550,10),(167,550,19),(168,551,10),(169,552,10),(170,553,10),(171,553,19),(172,554,10),(173,555,10),(174,555,19),(175,556,10),(176,557,9),(177,557,10),(178,558,19),(179,559,10),(180,560,10),(181,560,19),(182,560,24),(183,561,4),(184,561,10),(185,562,10),(186,563,10),(187,564,10),(188,564,19),(189,565,10),(190,566,10),(191,566,19),(192,567,10),(193,568,10),(194,569,10),(195,569,19),(196,570,10),(197,571,10),(198,571,19),(199,572,10),(200,573,10),(201,575,10),(202,576,10),(203,576,19),(204,577,10),(205,578,10),(206,579,17),(207,579,19),(208,579,20),(209,580,1),(210,580,7),(211,581,10),(212,582,19),(213,583,4),(214,585,10),(215,586,10),(216,587,4),(217,587,10),(218,587,20),(219,589,4),(220,589,10),(221,590,10),(222,591,5),(223,591,10),(224,593,18),(225,593,27),(226,594,10),(227,594,19),(228,594,20),(229,595,10),(230,596,4),(231,596,10),(232,596,19),(233,597,10);
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
  `id_producto` int(11) NOT NULL,
  `id_variante` int(11) NOT NULL,
  `int_activo` int(11) DEFAULT 1,
  PRIMARY KEY (`id_prods_variantes`),
  KEY `dsff` (`id_producto`),
  KEY `id_variante` (`id_variante`),
  CONSTRAINT `tbl_prods_variantes_ibfk_1` FOREIGN KEY (`id_variante`) REFERENCES `tbl_variantes_platillos` (`id_variante_pl`),
  CONSTRAINT `tbl_prods_variantes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_precios_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2275 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_variantes`
--

LOCK TABLES `tbl_prods_variantes` WRITE;
/*!40000 ALTER TABLE `tbl_prods_variantes` DISABLE KEYS */;
INSERT INTO `tbl_prods_variantes` VALUES (191,28,10,1),(192,29,10,1),(193,30,10,1),(194,31,10,1),(195,33,10,1),(196,34,10,1),(197,35,10,1),(210,51,10,1),(211,52,10,1),(213,54,10,1),(214,55,10,1),(263,63,1,1),(264,63,2,1),(265,63,3,1),(266,63,4,1),(267,63,5,1),(268,63,7,1),(269,63,8,1),(270,63,10,1),(319,70,3,1),(320,70,4,1),(321,70,5,1),(322,70,10,1),(323,71,3,1),(324,71,4,1),(325,71,5,1),(326,71,10,1),(327,72,3,1),(328,72,4,1),(329,72,5,1),(330,72,10,1),(331,73,3,1),(332,73,4,1),(333,73,5,1),(334,73,10,1),(335,74,3,1),(336,74,4,1),(337,74,5,1),(338,74,10,1),(339,75,3,1),(340,75,4,1),(341,75,5,1),(342,75,10,1),(343,76,3,1),(344,76,4,1),(345,76,5,1),(346,76,10,1),(347,77,3,1),(348,77,4,1),(349,77,5,1),(350,77,10,1),(351,78,3,1),(352,78,4,1),(353,78,5,1),(354,78,10,1),(355,79,3,1),(356,79,4,1),(357,79,5,1),(358,79,10,1),(359,80,3,1),(360,80,4,1),(361,80,5,1),(362,80,10,1),(412,91,10,1),(415,41,10,1),(417,46,10,1),(418,47,10,1),(419,48,10,1),(420,89,10,1),(442,45,10,1),(462,113,10,1),(463,113,17,1),(464,112,1,1),(465,112,2,1),(466,112,3,1),(467,112,4,1),(468,112,5,1),(469,112,6,1),(470,112,10,1),(471,112,15,1),(472,112,16,1),(473,112,17,1),(484,114,1,1),(485,114,2,1),(486,114,3,1),(487,114,4,1),(488,114,5,1),(489,114,6,1),(490,114,10,1),(491,114,15,1),(492,114,16,1),(493,114,17,1),(504,115,1,1),(505,115,2,1),(506,115,4,1),(507,115,5,1),(508,115,7,1),(509,115,10,1),(510,115,15,1),(511,115,16,1),(512,115,17,1),(557,22,4,1),(558,22,10,1),(559,22,17,1),(560,22,18,1),(561,22,19,1),(576,24,4,1),(577,24,10,1),(578,24,17,1),(579,24,18,1),(580,24,19,1),(583,37,10,1),(584,37,17,1),(587,38,10,1),(588,38,17,1),(589,25,10,1),(590,25,17,1),(591,36,10,1),(592,36,17,1),(593,106,10,1),(594,106,17,1),(782,109,10,1),(783,109,17,1),(784,109,18,1),(785,109,19,1),(786,116,10,1),(787,116,17,1),(788,116,18,1),(789,116,19,1),(792,107,10,1),(793,107,17,1),(822,117,1,1),(823,117,2,1),(824,117,3,1),(825,117,4,1),(826,117,5,1),(827,117,10,1),(828,117,17,1),(829,118,1,1),(830,118,2,1),(831,118,3,1),(832,118,4,1),(833,118,5,1),(834,118,10,1),(835,118,17,1),(853,16,3,1),(854,16,4,1),(855,16,5,1),(856,16,7,1),(857,16,10,1),(870,0,1,1),(871,0,2,1),(872,0,3,1),(873,0,4,1),(874,0,5,1),(875,0,7,1),(876,0,10,1),(877,0,17,1),(918,120,1,1),(919,120,2,1),(920,120,3,1),(921,120,4,1),(922,120,5,1),(923,120,7,1),(924,120,10,1),(925,120,17,1),(956,124,1,1),(957,124,2,1),(958,124,3,1),(959,124,4,1),(960,124,5,1),(961,124,7,1),(962,124,10,1),(963,124,17,1),(964,123,1,1),(965,123,2,1),(966,123,3,1),(967,123,4,1),(968,123,5,1),(969,123,7,1),(970,123,10,1),(971,123,17,1),(972,122,1,1),(973,122,2,1),(974,122,3,1),(975,122,4,1),(976,122,5,1),(977,122,7,1),(978,122,10,1),(979,122,17,1),(980,121,1,1),(981,121,2,1),(982,121,3,1),(983,121,4,1),(984,121,5,1),(985,121,7,1),(986,121,10,1),(987,121,17,1),(988,125,1,1),(989,125,2,1),(990,125,3,1),(991,125,4,1),(992,125,5,1),(993,125,7,1),(994,125,10,1),(995,125,17,1),(1036,127,1,1),(1037,127,2,1),(1038,127,3,1),(1039,127,4,1),(1040,127,5,1),(1041,127,7,1),(1042,127,10,1),(1043,127,17,1),(1044,126,1,1),(1045,126,2,1),(1046,126,3,1),(1047,126,4,1),(1048,126,5,1),(1049,126,7,1),(1050,126,10,1),(1051,126,17,1),(1052,17,1,1),(1053,17,2,1),(1054,17,3,1),(1055,17,4,1),(1056,17,5,1),(1057,17,7,1),(1058,17,10,1),(1059,17,17,1),(1060,14,1,1),(1061,14,2,1),(1062,14,3,1),(1063,14,4,1),(1064,14,5,1),(1065,14,7,1),(1066,14,10,1),(1067,14,17,1),(1068,15,1,1),(1069,15,2,1),(1070,15,3,1),(1071,15,4,1),(1072,15,5,1),(1073,15,6,1),(1074,15,7,1),(1075,15,10,1),(1076,15,17,1),(1102,130,1,1),(1103,130,2,1),(1104,130,3,1),(1105,130,4,1),(1106,130,5,1),(1107,130,7,1),(1108,130,10,1),(1109,130,17,1),(1110,128,1,1),(1111,128,2,1),(1112,128,3,1),(1113,128,4,1),(1114,128,5,1),(1115,128,7,1),(1116,128,10,1),(1117,128,17,1),(1118,129,1,1),(1119,129,2,1),(1120,129,3,1),(1121,129,4,1),(1122,129,5,1),(1123,129,7,1),(1124,129,10,1),(1125,129,17,1),(1126,131,1,1),(1127,131,2,1),(1128,131,3,1),(1129,131,4,1),(1130,131,5,1),(1131,131,7,1),(1132,131,10,1),(1133,131,17,1),(1142,108,10,1),(1143,108,17,1),(1151,13,1,1),(1152,13,2,1),(1153,13,3,1),(1154,13,4,1),(1155,13,5,1),(1156,13,7,1),(1157,13,10,1),(1222,5,1,1),(1223,5,2,1),(1224,5,3,1),(1225,5,4,1),(1226,5,5,1),(1227,5,7,1),(1228,5,10,1),(1229,5,17,1),(1230,5,18,1),(1231,5,19,1),(1240,6,1,1),(1241,6,2,1),(1242,6,3,1),(1243,6,4,1),(1244,6,5,1),(1245,6,10,1),(1246,6,17,1),(1247,6,18,1),(1248,6,19,1),(1257,136,1,1),(1258,136,2,1),(1259,136,3,1),(1260,136,4,1),(1261,136,5,1),(1262,136,7,1),(1263,136,10,1),(1264,136,17,1),(1281,7,1,1),(1282,7,2,1),(1283,7,3,1),(1284,7,4,1),(1285,7,5,1),(1286,7,7,1),(1287,7,10,1),(1288,7,17,1),(1289,138,1,1),(1290,138,2,1),(1291,138,3,1),(1292,138,4,1),(1293,138,5,1),(1294,138,7,1),(1295,138,10,1),(1296,138,17,1),(1297,137,1,1),(1298,137,2,1),(1299,137,3,1),(1300,137,4,1),(1301,137,5,1),(1302,137,7,1),(1303,137,10,1),(1304,137,17,1),(1305,8,1,1),(1306,8,2,1),(1307,8,3,1),(1308,8,4,1),(1309,8,5,1),(1310,8,7,1),(1311,8,10,1),(1312,8,17,1),(1313,8,18,1),(1314,8,19,1),(1315,139,1,1),(1316,139,2,1),(1317,139,3,1),(1318,139,4,1),(1319,139,5,1),(1320,139,7,1),(1321,139,10,1),(1322,139,17,1),(1331,9,1,1),(1332,9,2,1),(1333,9,3,1),(1334,9,4,1),(1335,9,5,1),(1336,9,7,1),(1337,9,10,1),(1338,9,17,1),(1355,140,1,1),(1356,140,2,1),(1357,140,3,1),(1358,140,4,1),(1359,140,5,1),(1360,140,7,1),(1361,140,10,1),(1362,140,17,1),(1363,10,1,1),(1364,10,2,1),(1365,10,3,1),(1366,10,4,1),(1367,10,5,1),(1368,10,7,1),(1369,10,10,1),(1370,10,17,1),(1371,10,18,1),(1372,10,19,1),(1389,141,1,1),(1390,141,2,1),(1391,141,3,1),(1392,141,4,1),(1393,141,5,1),(1394,141,7,1),(1395,141,10,1),(1396,141,17,1),(1397,11,1,1),(1398,11,2,1),(1399,11,3,1),(1400,11,4,1),(1401,11,5,1),(1402,11,7,1),(1403,11,10,1),(1404,11,17,1),(1405,11,18,1),(1406,11,19,1),(1407,142,1,1),(1408,142,2,1),(1409,142,3,1),(1410,142,4,1),(1411,142,5,1),(1412,142,7,1),(1413,142,10,1),(1414,142,17,1),(1415,12,1,1),(1416,12,2,1),(1417,12,3,1),(1418,12,4,1),(1419,12,5,1),(1420,12,7,1),(1421,12,10,1),(1422,12,17,1),(1423,12,18,1),(1424,12,19,1),(1425,143,1,1),(1426,143,2,1),(1427,143,3,1),(1428,143,4,1),(1429,143,5,1),(1430,143,7,1),(1431,143,10,1),(1432,143,17,1),(1433,132,1,1),(1434,132,2,1),(1435,132,3,1),(1436,132,4,1),(1437,132,5,1),(1438,132,7,1),(1439,132,10,1),(1440,132,17,1),(1441,144,1,1),(1442,144,2,1),(1443,144,3,1),(1444,144,4,1),(1445,144,5,1),(1446,144,7,1),(1447,144,10,1),(1448,144,17,1),(1449,133,1,1),(1450,133,2,1),(1451,133,3,1),(1452,133,4,1),(1453,133,5,1),(1454,133,7,1),(1455,133,10,1),(1456,133,17,1),(1481,145,1,1),(1482,145,2,1),(1483,145,3,1),(1484,145,4,1),(1485,145,5,1),(1486,145,7,1),(1487,145,10,1),(1488,145,17,1),(1489,134,1,1),(1490,134,2,1),(1491,134,3,1),(1492,134,4,1),(1493,134,5,1),(1494,134,7,1),(1495,134,10,1),(1496,134,17,1),(1497,146,1,1),(1498,146,2,1),(1499,146,3,1),(1500,146,4,1),(1501,146,5,1),(1502,146,7,1),(1503,146,10,1),(1504,146,17,1),(1505,135,1,1),(1506,135,2,1),(1507,135,3,1),(1508,135,4,1),(1509,135,5,1),(1510,135,7,1),(1511,135,10,1),(1512,135,17,1),(1513,147,1,1),(1514,147,2,1),(1515,147,3,1),(1516,147,4,1),(1517,147,5,1),(1518,147,7,1),(1519,147,10,1),(1520,147,17,1),(1548,68,1,1),(1549,68,2,1),(1550,68,3,1),(1551,68,4,1),(1552,68,5,1),(1553,68,7,1),(1554,68,8,1),(1555,68,10,1),(1556,68,17,1),(1565,58,1,1),(1566,58,2,1),(1567,58,3,1),(1568,58,4,1),(1569,58,5,1),(1570,58,7,1),(1571,58,8,1),(1572,58,10,1),(1589,66,1,1),(1590,66,2,1),(1591,66,3,1),(1592,66,4,1),(1593,66,5,1),(1594,66,7,1),(1595,66,10,1),(1596,66,17,1),(1597,148,1,1),(1598,148,2,1),(1599,148,3,1),(1600,148,4,1),(1601,148,5,1),(1602,148,7,1),(1603,148,10,1),(1604,148,17,1),(1629,67,1,1),(1630,67,2,1),(1631,67,3,1),(1632,67,4,1),(1633,67,5,1),(1634,67,7,1),(1635,67,10,1),(1636,67,17,1),(1637,149,1,1),(1638,149,2,1),(1639,149,3,1),(1640,149,4,1),(1641,149,5,1),(1642,149,7,1),(1643,149,10,1),(1644,149,17,1),(1645,150,1,1),(1646,150,2,1),(1647,150,3,1),(1648,150,4,1),(1649,150,5,1),(1650,150,7,1),(1651,150,10,1),(1652,150,17,1),(1661,57,1,1),(1662,57,2,1),(1663,57,3,1),(1664,57,4,1),(1665,57,5,1),(1666,57,7,1),(1667,57,8,1),(1668,57,10,1),(1693,59,1,1),(1694,59,2,1),(1695,59,3,1),(1696,59,4,1),(1697,59,5,1),(1698,59,7,1),(1699,59,8,1),(1700,59,10,1),(1725,61,1,1),(1726,61,2,1),(1727,61,3,1),(1728,61,4,1),(1729,61,5,1),(1730,61,7,1),(1731,61,8,1),(1732,61,10,1),(1757,152,1,1),(1758,152,2,1),(1759,152,3,1),(1760,152,4,1),(1761,152,5,1),(1762,152,7,1),(1763,152,10,1),(1764,152,17,1),(1773,69,1,1),(1774,69,2,1),(1775,69,3,1),(1776,69,4,1),(1777,69,5,1),(1778,69,7,1),(1779,69,8,1),(1780,69,10,1),(1807,65,1,1),(1808,65,2,1),(1809,65,3,1),(1810,65,4,1),(1811,65,5,1),(1812,65,7,1),(1813,65,8,1),(1814,65,10,1),(1815,65,17,1),(1825,62,1,1),(1826,62,2,1),(1827,62,3,1),(1828,62,4,1),(1829,62,5,1),(1830,62,7,1),(1831,62,8,1),(1832,62,10,1),(1833,62,17,1),(1842,153,1,1),(1843,153,2,1),(1844,153,3,1),(1845,153,4,1),(1846,153,5,1),(1847,153,7,1),(1848,153,10,1),(1849,153,17,1),(1900,156,1,1),(1901,156,2,1),(1902,156,3,1),(1903,156,4,1),(1904,156,5,1),(1905,156,6,1),(1906,156,7,1),(1907,156,10,1),(1908,156,17,1),(1917,157,1,1),(1918,157,2,1),(1919,157,3,1),(1920,157,4,1),(1921,157,5,1),(1922,157,7,1),(1923,157,10,1),(1924,157,17,1),(1933,158,1,1),(1934,158,2,1),(1935,158,3,1),(1936,158,4,1),(1937,158,5,1),(1938,158,7,1),(1939,158,10,1),(1940,158,17,1),(1949,159,1,1),(1950,159,2,1),(1951,159,3,1),(1952,159,4,1),(1953,159,5,1),(1954,159,7,1),(1955,159,10,1),(1956,159,17,1),(1957,160,1,1),(1958,160,2,1),(1959,160,3,1),(1960,160,4,1),(1961,160,5,1),(1962,160,7,1),(1963,160,10,1),(1964,160,17,1),(1977,87,4,1),(1978,87,5,1),(1979,87,7,1),(1980,87,8,1),(1981,87,9,1),(1982,87,10,1),(1983,87,17,1),(1984,85,4,1),(1985,85,5,1),(1986,85,7,1),(1987,85,8,1),(1988,85,9,1),(1989,85,10,1),(1990,85,17,1),(1991,86,4,1),(1992,86,5,1),(1993,86,7,1),(1994,86,8,1),(1995,86,9,1),(1996,86,10,1),(1997,86,17,1),(2005,88,4,1),(2006,88,5,1),(2007,88,7,1),(2008,88,8,1),(2009,88,9,1),(2010,88,10,1),(2011,88,17,1),(2032,162,1,1),(2033,162,2,1),(2034,162,3,1),(2035,162,4,1),(2036,162,5,1),(2037,162,8,1),(2038,162,9,1),(2039,162,10,1),(2040,162,17,1),(2047,82,3,1),(2048,82,4,1),(2049,82,5,1),(2050,82,7,1),(2051,82,8,1),(2052,82,9,1),(2053,82,10,1),(2054,82,17,1),(2062,81,3,1),(2063,81,4,1),(2064,81,7,1),(2065,81,8,1),(2066,81,9,1),(2067,81,10,1),(2068,81,17,1),(2076,83,4,1),(2077,83,5,1),(2078,83,7,1),(2079,83,8,1),(2080,83,9,1),(2081,83,10,1),(2082,83,17,1),(2091,84,3,1),(2092,84,4,1),(2093,84,5,1),(2094,84,7,1),(2095,84,8,1),(2096,84,9,1),(2097,84,10,1),(2098,84,17,1),(2099,161,1,1),(2100,161,2,1),(2101,161,3,1),(2102,161,4,1),(2103,161,5,1),(2104,161,7,1),(2105,161,8,1),(2106,161,9,1),(2107,161,10,1),(2108,161,17,1),(2140,164,3,1),(2141,164,4,1),(2142,164,5,1),(2143,164,8,1),(2144,164,9,1),(2145,164,10,1),(2146,164,17,1),(2147,18,4,1),(2148,18,10,1),(2149,18,15,1),(2150,18,17,1),(2151,18,18,1),(2152,18,19,1),(2153,18,20,1),(2154,19,4,1),(2155,19,10,1),(2156,19,15,1),(2157,19,17,1),(2158,19,18,1),(2159,19,19,1),(2160,19,20,1),(2161,21,4,1),(2162,21,10,1),(2163,21,17,1),(2164,21,18,1),(2165,21,19,1),(2181,165,4,1),(2182,165,10,1),(2183,165,17,1),(2184,165,18,1),(2185,165,19,1),(2186,166,4,1),(2187,166,10,1),(2188,166,17,1),(2189,166,18,1),(2190,166,19,1),(2191,23,10,1),(2192,23,15,1),(2193,23,17,1),(2194,23,18,1),(2195,23,19,1),(2196,23,20,1),(2203,20,4,1),(2204,20,10,1),(2205,20,15,1),(2206,20,17,1),(2207,20,18,1),(2208,20,19,1),(2209,20,20,1),(2210,166,24,1),(2211,165,21,1),(2212,166,22,0),(2213,167,4,1),(2214,167,10,1),(2215,167,17,1),(2216,167,22,1),(2217,167,18,1),(2218,167,19,1),(2219,163,8,1),(2220,163,9,1),(2221,163,10,1),(2222,163,17,1),(2223,163,1,1),(2224,163,2,1),(2225,163,3,1),(2226,163,4,1),(2227,163,5,1),(2228,163,7,1),(2229,54,17,1),(2230,55,17,1),(2231,56,10,1),(2232,56,17,1),(2233,109,1,1),(2234,109,2,1),(2235,109,3,1),(2236,109,4,1),(2237,109,5,1),(2238,109,15,1),(2239,109,16,1),(2240,109,11,1),(2241,109,12,1),(2242,109,13,1),(2243,109,27,1),(2244,109,14,1),(2245,109,20,1),(2246,116,1,1),(2247,116,2,1),(2248,116,3,1),(2249,116,4,0),(2250,116,5,0),(2251,116,11,1),(2252,116,12,1),(2253,116,13,1),(2254,116,27,1),(2255,116,14,1),(2256,116,15,1),(2257,116,16,1),(2258,116,20,1),(2259,168,18,1),(2260,168,19,1),(2261,168,1,1),(2262,168,2,1),(2263,168,3,1),(2264,168,7,1),(2265,168,11,1),(2266,168,12,1),(2267,168,13,1),(2268,168,27,1),(2269,168,14,1),(2270,168,15,1),(2271,168,16,1),(2272,168,20,1),(2273,168,10,1),(2274,168,17,1);
/*!40000 ALTER TABLE `tbl_prods_variantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prods_x_combo`
--

DROP TABLE IF EXISTS `tbl_prods_x_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_prods_x_combo` (
  `id_prod_x_combo` int(11) NOT NULL AUTO_INCREMENT,
  `id_combo` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `int_cantidad` int(11) NOT NULL,
  `bol_activo` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_prod_x_combo`),
  KEY `index2` (`id_producto`),
  KEY `index3` (`id_combo`),
  CONSTRAINT `fk_tbl_prods_x_combo_1` FOREIGN KEY (`id_combo`) REFERENCES `tbl_combos` (`id_combo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_prods_x_combo_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_x_combo`
--

LOCK TABLES `tbl_prods_x_combo` WRITE;
/*!40000 ALTER TABLE `tbl_prods_x_combo` DISABLE KEYS */;
INSERT INTO `tbl_prods_x_combo` VALUES (1,1,114,1,1),(2,1,115,1,1);
/*!40000 ALTER TABLE `tbl_prods_x_combo` ENABLE KEYS */;
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
  `bool_activo` int(11) DEFAULT NULL,
  `dt_horafecha_pedido` timestamp NULL DEFAULT NULL,
  `bool_impreso` int(11) DEFAULT 0,
  `int_tipo_precio` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_prod_x_orden`),
  KEY `int_producto_id` (`int_producto_id`),
  KEY `index4` (`int_tipo_precio`),
  KEY `int_orden_id` (`int_orden_id`),
  CONSTRAINT `fk_tbl_prods_x_orden_1` FOREIGN KEY (`int_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_prods_x_orden_2` FOREIGN KEY (`int_producto_id`) REFERENCES `tbl_productos` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_x_orden`
--

LOCK TABLES `tbl_prods_x_orden` WRITE;
/*!40000 ALTER TABLE `tbl_prods_x_orden` DISABLE KEYS */;
INSERT INTO `tbl_prods_x_orden` VALUES (1,1,6,2,1,NULL,0,1),(2,1,8,5,1,NULL,0,1),(3,1,11,2,1,NULL,0,1),(5,12,9,7,1,NULL,0,1),(6,13,9,5,1,NULL,0,1),(8,15,15,2,1,NULL,0,1),(9,16,9,6,1,NULL,0,1),(10,16,6,6,1,NULL,0,1),(11,16,20,1,1,NULL,0,1),(12,16,45,1,1,NULL,0,1),(13,16,47,1,1,NULL,0,1),(14,17,17,7,1,NULL,1,1),(15,18,26,1,1,NULL,0,1),(16,18,20,2,1,NULL,0,1),(17,19,16,2,1,NULL,0,1),(18,20,9,8,1,NULL,0,1),(19,20,40,1,1,NULL,0,1),(20,21,15,5,1,NULL,0,1),(21,21,30,3,1,NULL,0,1),(22,21,7,4,1,NULL,0,1),(24,21,46,1,1,NULL,0,1),(25,14,5,2,1,NULL,0,1),(26,21,47,1,1,NULL,0,1),(27,20,29,1,1,NULL,0,1),(28,22,20,1,1,NULL,0,1),(29,22,18,2,1,NULL,0,1),(30,22,32,2,1,NULL,0,1),(31,22,45,1,1,NULL,0,1),(32,22,48,1,1,NULL,0,1),(33,22,52,1,1,NULL,0,1),(34,23,5,3,1,NULL,0,1),(35,23,16,1,1,NULL,0,1),(36,23,45,1,1,NULL,0,1),(37,23,48,1,1,NULL,0,1),(38,23,54,1,1,NULL,0,1),(39,12,8,5,1,NULL,0,1),(40,12,42,1,1,NULL,0,1),(41,12,56,1,1,NULL,0,1),(42,11,15,6,1,NULL,0,1),(43,11,7,3,1,NULL,0,1),(44,11,51,1,1,NULL,0,1),(45,11,31,1,1,NULL,0,1),(46,24,25,7,1,NULL,0,1),(47,24,9,5,1,NULL,0,1),(48,24,15,4,1,NULL,0,1),(49,24,42,1,1,NULL,0,1),(50,25,6,6,1,NULL,0,1),(51,25,15,5,1,NULL,0,1),(52,25,47,1,1,NULL,0,1),(54,25,54,3,1,NULL,0,1),(55,26,6,6,1,NULL,0,1),(56,26,45,1,1,NULL,0,1),(57,26,11,6,1,NULL,0,1),(58,26,48,1,1,NULL,0,1),(59,26,55,1,1,NULL,0,1),(60,27,8,6,1,NULL,0,1),(61,27,9,5,1,NULL,0,1),(62,27,20,1,1,NULL,0,1),(63,27,31,1,1,NULL,0,1),(64,27,41,1,1,NULL,0,1),(65,27,46,1,1,NULL,0,1),(66,27,49,1,1,NULL,0,1),(67,27,56,1,1,NULL,0,1),(68,28,6,6,1,NULL,0,1),(69,28,21,1,1,NULL,0,1),(70,28,55,1,1,NULL,0,1),(71,28,51,1,1,NULL,0,1),(72,29,7,9,1,NULL,0,1),(73,29,10,5,1,NULL,0,1),(74,29,14,3,1,NULL,0,1),(75,29,27,1,1,NULL,0,1),(76,29,49,1,1,NULL,0,1),(77,29,47,1,1,NULL,0,1),(78,29,54,1,1,NULL,0,1),(79,30,29,1,1,NULL,0,1),(80,30,7,4,1,NULL,0,1),(81,30,43,1,1,NULL,0,1),(82,30,24,1,1,NULL,0,1),(83,30,55,1,1,NULL,0,1),(84,31,6,6,1,NULL,0,1),(85,31,16,1,1,NULL,0,1),(86,31,19,1,1,NULL,0,1),(87,31,36,6,1,NULL,0,1),(88,31,44,1,1,NULL,0,1),(89,31,49,1,1,NULL,0,1),(90,31,48,1,1,NULL,0,1),(91,31,55,1,1,NULL,0,1),(92,32,8,6,1,NULL,0,1),(93,32,14,4,1,NULL,0,1),(94,32,21,1,1,NULL,0,1),(95,32,30,1,1,NULL,0,1),(96,32,42,1,1,NULL,0,1),(97,32,49,1,1,NULL,0,1),(98,32,56,1,1,NULL,0,1),(99,32,55,1,1,NULL,0,1),(100,32,31,1,1,NULL,0,1),(101,33,7,6,1,NULL,0,1),(102,33,15,5,1,NULL,0,1),(103,33,31,1,1,NULL,0,1),(104,33,20,1,1,NULL,0,1),(105,33,43,1,1,NULL,0,1),(106,33,41,1,1,NULL,0,1),(107,33,51,1,1,NULL,0,1),(108,33,54,3,1,NULL,0,1),(109,33,54,1,1,NULL,0,1),(110,34,6,3,1,NULL,0,1),(111,34,8,5,1,NULL,0,1),(112,34,15,7,1,NULL,0,1),(113,34,16,5,1,NULL,0,1),(114,34,40,1,1,NULL,0,1),(115,34,45,1,1,NULL,0,1),(116,34,54,1,1,NULL,0,1),(117,35,8,5,1,NULL,0,1),(118,35,20,1,1,NULL,0,1),(119,35,33,1,1,NULL,0,1),(120,35,27,1,1,NULL,0,1),(121,35,46,1,1,NULL,0,1),(122,36,7,1,1,NULL,0,1),(123,36,8,4,1,NULL,0,1),(124,36,15,6,1,NULL,0,1),(125,36,19,1,1,NULL,0,1),(126,36,30,1,1,NULL,0,1),(127,36,44,1,1,NULL,0,1),(128,36,48,1,1,NULL,0,1),(129,36,56,1,1,NULL,0,1),(130,37,6,4,1,NULL,0,1),(131,37,7,5,1,NULL,0,1),(132,37,15,1,1,NULL,0,1),(133,37,19,1,1,NULL,0,1),(134,37,30,1,1,NULL,0,1),(135,37,44,1,1,NULL,0,1),(136,37,48,1,1,NULL,0,1),(137,37,55,1,1,NULL,0,1),(138,38,25,6,1,NULL,0,1),(139,38,7,5,1,NULL,0,1),(140,38,14,4,1,NULL,0,1),(141,38,15,6,1,NULL,0,1),(142,38,28,2,1,NULL,0,1),(143,38,48,4,1,NULL,0,1),(144,38,55,1,1,NULL,0,1),(145,39,6,5,1,NULL,0,1),(146,39,6,5,1,NULL,0,1),(147,39,14,4,1,NULL,0,1),(148,39,20,1,1,NULL,0,1),(149,39,30,1,1,NULL,0,1),(150,39,32,1,1,NULL,0,1),(151,39,45,1,1,NULL,0,1),(152,39,48,1,1,NULL,0,1),(153,39,52,1,1,NULL,0,1),(154,39,55,1,1,NULL,0,1),(155,40,8,8,1,NULL,0,1),(156,40,15,5,1,NULL,0,1),(157,40,14,3,1,NULL,0,1),(158,40,20,1,1,NULL,0,1),(159,40,33,1,1,NULL,0,1),(160,40,44,1,1,NULL,0,1),(161,40,53,1,1,NULL,0,1),(162,40,56,1,1,NULL,0,1),(163,41,36,4,1,NULL,0,1),(164,41,10,5,1,NULL,0,1),(165,41,17,3,1,NULL,0,1),(166,41,29,4,1,NULL,0,1),(167,41,46,1,1,NULL,0,1),(168,41,51,1,1,NULL,0,1),(169,41,52,1,1,NULL,0,1),(170,41,55,1,1,NULL,0,1),(171,42,7,4,1,NULL,0,1),(172,42,9,6,1,NULL,0,1),(173,42,16,2,1,NULL,0,1),(174,42,30,1,1,NULL,0,1),(175,42,15,7,1,NULL,0,1),(176,42,42,1,1,NULL,0,1),(177,42,45,1,1,NULL,0,1),(178,42,54,1,1,NULL,0,1),(179,43,6,4,1,NULL,0,1),(180,43,13,5,1,NULL,0,1),(181,43,23,1,1,NULL,0,1),(182,43,28,1,1,NULL,0,1),(183,43,31,1,1,NULL,0,1),(184,43,45,1,1,NULL,0,1),(185,43,51,1,1,NULL,0,1),(186,43,52,1,1,NULL,0,1),(187,43,54,1,1,NULL,0,1),(188,44,11,6,1,NULL,0,1),(189,44,6,4,1,NULL,0,1),(190,44,15,7,1,NULL,0,1),(191,44,20,1,1,NULL,0,1),(192,44,30,1,1,NULL,0,1),(193,44,28,1,1,NULL,0,1),(194,44,46,1,1,NULL,0,1),(195,44,49,1,1,NULL,0,1),(196,44,44,1,1,NULL,0,1),(197,44,56,1,1,NULL,0,1),(198,45,9,5,1,NULL,0,1),(199,45,16,3,1,NULL,0,1),(200,45,23,1,1,NULL,0,1),(201,45,31,1,1,NULL,0,1),(202,45,44,1,1,NULL,0,1),(203,45,47,1,1,NULL,0,1),(204,45,42,1,1,NULL,0,1),(205,45,18,1,1,NULL,0,1),(206,46,9,4,1,NULL,0,1),(207,46,15,8,1,NULL,0,1),(208,46,20,1,1,NULL,0,1),(209,46,31,1,1,NULL,0,1),(210,46,29,1,1,NULL,0,1),(211,46,47,1,1,NULL,0,1),(212,46,44,1,1,NULL,0,1),(213,46,52,1,1,NULL,0,1),(214,47,15,5,1,NULL,0,1),(215,47,6,3,1,NULL,0,1),(216,47,22,1,1,NULL,0,1),(217,47,30,1,1,NULL,0,1),(218,47,41,1,1,NULL,0,1),(219,47,38,1,1,NULL,0,1),(220,47,55,1,1,NULL,0,1),(222,47,25,6,1,NULL,0,1),(223,48,7,5,1,NULL,0,1),(224,48,9,5,1,NULL,0,1),(225,48,15,4,1,NULL,0,1),(226,48,30,1,1,NULL,0,1),(227,48,49,1,1,NULL,0,1),(228,48,50,1,1,NULL,0,1),(229,48,54,1,1,NULL,0,1),(230,48,55,1,1,NULL,0,1),(231,49,21,1,1,NULL,0,1),(232,49,43,1,1,NULL,0,1),(233,49,51,1,1,NULL,0,1),(234,49,55,1,1,NULL,0,1),(235,50,7,5,1,NULL,0,1),(236,50,9,9,1,NULL,0,1),(237,50,23,1,1,NULL,0,1),(238,50,31,1,1,NULL,0,1),(239,50,45,1,1,NULL,0,1),(240,50,48,1,1,NULL,0,1),(241,50,55,1,1,NULL,0,1),(243,52,16,5,1,NULL,0,1),(246,54,8,8,1,NULL,0,1),(247,53,8,5,1,NULL,0,1),(250,53,15,5,1,NULL,0,1),(251,51,8,5,1,NULL,0,1),(252,51,15,7,1,NULL,0,1),(253,51,30,1,1,NULL,0,1),(255,54,15,6,1,NULL,0,1),(256,54,30,1,1,NULL,0,1),(257,54,48,1,1,NULL,0,1),(258,54,49,1,1,NULL,0,1),(259,54,56,1,1,NULL,0,1),(260,55,15,5,1,NULL,0,1),(261,55,22,1,1,NULL,0,1),(262,55,8,7,1,NULL,0,1),(263,55,6,5,1,NULL,0,1),(264,55,47,1,1,NULL,0,1),(265,55,51,1,1,NULL,0,1),(266,55,48,1,1,NULL,0,1),(267,53,16,6,1,NULL,0,1),(268,53,21,1,1,NULL,0,1),(269,53,33,1,1,NULL,0,1),(270,53,45,1,1,NULL,0,1),(271,53,52,1,1,NULL,0,1),(272,53,50,1,1,NULL,0,1),(273,53,55,1,1,NULL,0,1),(274,56,6,4,1,NULL,0,1),(275,56,8,8,1,NULL,0,1),(276,56,16,2,1,NULL,0,1),(277,56,22,3,1,NULL,0,1),(278,56,29,1,1,NULL,0,1),(279,56,44,1,1,NULL,0,1),(280,56,51,1,1,NULL,0,1),(281,56,56,1,1,NULL,0,1),(283,57,8,5,1,NULL,0,1),(284,57,19,1,1,NULL,0,1),(285,57,46,1,1,NULL,0,1),(286,57,50,1,1,NULL,0,1),(287,57,55,1,1,NULL,0,1),(288,60,8,5,1,NULL,0,1),(289,60,19,1,1,NULL,0,1),(290,60,15,7,1,NULL,0,1),(291,60,46,1,1,NULL,0,1),(292,60,51,1,1,NULL,0,1),(293,60,50,1,1,NULL,0,1),(294,60,55,1,1,NULL,0,1),(295,15,8,5,1,NULL,0,1),(296,15,8,5,1,NULL,0,1),(297,15,23,1,1,NULL,0,1),(298,15,45,1,1,NULL,0,1),(299,15,51,1,1,NULL,0,1),(300,15,56,1,1,NULL,0,1),(301,61,10,6,1,NULL,0,1),(302,61,15,7,1,NULL,0,1),(303,61,6,3,1,NULL,0,1),(304,61,29,1,1,NULL,0,1),(305,61,55,1,1,NULL,0,1),(306,61,48,1,1,NULL,0,1),(307,61,51,1,1,NULL,0,1),(308,61,50,1,1,NULL,0,1),(309,61,43,1,1,NULL,0,1),(310,52,8,6,1,NULL,0,1),(311,52,6,5,1,NULL,0,1),(312,52,15,9,1,NULL,0,1),(314,52,16,3,1,NULL,0,1),(315,52,44,1,1,NULL,0,1),(316,52,52,1,1,NULL,0,1),(317,52,56,1,1,NULL,0,1),(318,62,8,5,1,NULL,0,1),(319,62,16,1,1,NULL,0,1),(320,62,18,1,1,NULL,0,1),(321,62,48,1,1,NULL,0,1),(322,62,49,1,1,NULL,0,1),(323,62,52,1,1,NULL,0,1),(324,62,56,1,1,NULL,0,1),(325,64,8,5,1,NULL,0,1),(326,64,64,1,1,NULL,0,1),(327,64,76,1,1,NULL,0,1),(328,64,67,1,1,NULL,0,1),(330,66,5,3,1,NULL,0,1),(331,65,5,4,1,NULL,0,1),(332,65,15,5,1,NULL,0,1),(333,65,61,5,1,NULL,0,1),(334,65,61,5,1,NULL,0,1),(335,66,19,1,1,NULL,0,1),(336,66,82,1,1,NULL,0,1),(337,67,74,5,1,NULL,0,1),(338,67,41,3,1,NULL,0,1),(339,58,6,5,1,NULL,0,1),(340,58,45,3,1,NULL,0,1),(341,59,20,1,1,NULL,0,1),(342,59,86,1,1,NULL,0,1),(343,59,51,1,1,NULL,0,1),(344,58,15,1,1,NULL,0,1),(345,67,62,1,1,NULL,0,1),(346,67,6,3,1,NULL,0,1),(347,67,29,1,1,NULL,0,1),(348,67,83,1,1,NULL,0,1),(349,67,50,1,1,NULL,0,1),(350,67,56,1,1,NULL,0,1),(351,72,6,1,1,NULL,0,1),(352,68,7,1,1,NULL,0,1),(353,68,14,1,1,NULL,0,1),(354,68,8,3,1,NULL,0,1),(355,68,45,1,0,NULL,0,1),(356,71,17,1,1,NULL,0,1),(357,71,8,3,0,NULL,0,1),(358,71,84,1,1,NULL,0,1),(359,0,8,3,1,NULL,0,1),(360,69,8,3,1,NULL,0,1),(361,70,15,4,1,NULL,0,1),(362,70,61,1,1,NULL,0,1),(363,73,7,3,1,NULL,0,1),(364,73,60,1,1,NULL,0,1),(365,73,55,1,1,NULL,0,1),(366,73,45,1,1,NULL,0,1),(367,70,7,5,1,NULL,0,1),(368,68,61,1,1,NULL,0,1),(369,68,64,1,1,NULL,0,1),(370,68,25,1,0,NULL,0,1),(371,70,20,1,1,NULL,0,1),(372,72,94,1,1,NULL,0,1),(373,77,20,1,1,NULL,0,1),(374,77,43,1,1,NULL,0,1),(375,77,87,1,1,NULL,0,1),(376,75,11,1,1,NULL,0,1),(377,76,72,1,1,NULL,0,1),(378,71,73,1,1,NULL,0,1),(379,71,21,1,1,NULL,0,1),(380,71,28,1,0,NULL,0,1),(381,71,5,6,1,NULL,0,1),(382,75,21,2,1,'0000-00-00 00:00:00',0,1),(383,75,45,1,1,'0000-00-00 00:00:00',0,1),(384,75,17,1,1,'2016-04-21 03:57:12',0,1),(385,75,47,1,1,'2016-04-21 03:57:27',0,1),(386,78,66,1,1,'2016-04-21 04:06:35',0,1),(387,78,45,1,1,'2016-04-21 04:06:40',0,1),(388,78,86,1,1,'2016-04-21 04:06:52',0,1),(389,78,21,1,1,'2016-04-21 04:08:38',0,1),(390,78,69,1,1,'2016-04-21 04:09:18',0,1),(391,78,20,1,1,'2016-04-21 04:09:30',0,1),(392,78,52,1,1,'2016-04-21 04:09:47',0,1),(393,76,85,1,1,'2016-04-21 04:12:42',0,1),(394,76,45,1,1,'2016-04-21 04:12:49',0,1),(395,76,8,4,1,'2016-04-22 06:46:34',0,1),(396,76,15,5,1,'2016-04-22 06:46:42',0,1),(397,79,59,1,1,'2016-05-28 22:20:02',0,1),(398,79,18,1,1,'2016-05-28 22:20:13',0,1),(399,79,44,1,1,'2016-05-28 22:20:17',0,1),(400,79,7,5,1,'2016-05-28 22:20:34',0,1),(401,79,87,1,1,'2016-05-28 22:20:50',0,1),(402,80,5,5,1,'2016-05-28 23:37:57',1,1),(403,80,87,1,0,'2016-05-28 23:40:10',1,1),(404,80,86,1,0,'2016-05-28 23:53:33',1,1),(405,80,6,8,0,'2016-05-28 23:54:56',1,1),(406,80,6,1,0,'2016-05-28 23:55:48',1,1),(407,80,81,1,0,'2016-05-28 23:56:46',1,1),(408,80,7,5,0,'2016-05-28 23:58:19',1,1),(409,80,6,5,0,'2016-05-29 00:01:21',1,1),(410,80,81,2,0,'2016-05-29 00:02:32',1,1),(411,80,5,4,0,'2016-05-29 00:05:59',1,1),(412,80,8,5,0,'2016-05-29 00:21:30',1,1),(413,80,8,5,0,'2016-05-29 00:24:59',1,1),(414,80,7,5,0,'2016-05-29 00:29:32',1,1),(415,80,6,1,0,'2016-05-29 00:30:57',1,1),(416,80,8,5,1,'2016-05-31 00:07:00',1,1),(417,81,7,5,1,'2016-06-28 01:04:40',0,1),(418,81,19,1,1,'2016-06-28 01:04:56',0,1),(419,81,81,1,1,'2016-06-28 01:05:01',0,1),(420,81,43,1,1,'2016-06-28 01:05:04',0,1),(421,81,94,1,1,'2016-06-28 01:05:08',0,1),(422,81,51,3,1,'2016-06-28 01:05:12',0,1),(423,81,54,1,1,'2016-06-28 01:05:16',0,1),(424,14,15,6,1,'2016-06-28 23:36:48',0,1),(425,14,24,3,1,'2016-06-28 23:36:57',0,1),(426,14,6,5,1,'2016-06-28 23:38:45',0,1),(427,14,32,2,1,'2016-06-28 23:38:54',0,1),(428,80,22,1,1,'2016-06-28 23:39:25',1,1),(429,80,26,1,1,'2016-06-28 23:39:29',1,1),(430,80,50,1,1,'2016-06-28 23:39:32',1,1),(431,82,6,3,1,'2016-06-28 23:41:40',1,1),(432,82,19,3,1,'2016-06-28 23:41:45',1,1),(433,82,26,1,1,'2016-06-28 23:41:51',1,1),(434,82,97,1,1,'2016-06-28 23:42:25',1,1),(435,82,54,1,1,'2016-06-28 23:42:30',1,1),(436,82,32,1,1,'2016-06-28 23:43:43',1,1),(437,82,88,1,1,'2016-06-28 23:43:51',1,1),(438,82,98,1,1,'2016-07-20 03:27:23',1,1),(439,82,15,3,1,'2016-07-20 03:27:32',1,1),(440,80,68,1,1,'2016-07-20 03:29:43',1,1),(441,80,18,1,1,'2016-07-20 03:29:47',1,1),(442,80,83,1,1,'2016-07-20 03:29:56',1,1),(443,83,7,4,1,'2016-07-28 23:38:14',1,1),(444,83,68,1,0,'2016-07-28 23:38:41',1,1),(445,83,93,1,1,'2016-07-28 23:38:49',1,1),(446,83,83,1,1,'2016-07-28 23:38:58',1,1),(447,83,54,1,1,'2016-07-28 23:39:05',1,1),(448,83,6,3,1,'2016-07-28 23:40:35',1,1),(449,84,12,5,1,'2016-09-12 22:47:07',0,1),(450,84,83,1,1,'2016-09-12 22:47:20',0,1),(451,84,42,1,1,'2016-09-12 22:47:27',0,1),(452,84,55,1,0,'2016-09-12 22:47:34',0,1),(453,83,8,5,1,'2020-09-04 00:59:38',1,1),(454,85,77,1,1,'2020-09-04 01:03:40',1,1),(455,85,14,1,1,'2020-09-04 01:03:45',1,1),(456,85,43,1,1,'2020-09-04 01:03:51',1,1),(457,86,67,1,0,'2020-09-15 22:09:54',0,1),(458,87,112,1,0,'2020-09-18 23:33:03',1,1),(459,87,112,1,0,'2020-09-19 20:51:15',1,1),(460,87,112,1,1,'2020-09-19 21:22:11',1,1),(461,88,112,1,1,'2020-09-20 00:59:37',0,1),(462,89,112,1,0,'2020-09-20 01:01:54',0,1),(463,89,112,1,0,'2020-09-20 01:04:37',0,1),(464,89,112,1,0,'2020-09-20 01:06:55',0,1),(465,89,114,1,0,'2020-09-20 01:07:16',0,1),(466,89,115,1,0,'2020-09-20 01:07:18',0,1),(467,89,59,2,1,'2020-09-20 01:13:34',0,1),(468,89,112,1,0,'2020-09-20 01:14:04',0,1),(469,89,114,1,0,'2020-09-20 01:14:04',0,1),(470,89,115,1,0,'2020-09-20 01:14:04',0,1),(471,90,112,1,0,'2020-09-20 01:23:44',1,1),(472,90,114,1,0,'2020-09-20 01:23:44',1,1),(473,90,115,1,0,'2020-09-20 01:23:44',1,1),(474,90,64,1,0,'2020-09-20 01:24:59',1,1),(475,92,6,3,1,'2020-09-25 01:43:49',1,2),(476,92,20,1,1,'2020-10-01 21:45:26',1,2),(477,90,112,1,0,'2020-10-05 00:44:36',1,1),(478,90,114,1,0,'2020-10-05 00:44:36',1,1),(479,90,115,1,0,'2020-10-05 00:44:36',1,1),(480,86,112,1,0,'2020-10-06 23:01:40',0,1),(481,86,114,1,0,'2020-10-06 23:01:40',0,1),(482,86,115,1,0,'2020-10-06 23:01:40',0,1),(483,86,112,1,0,'2020-10-06 23:11:45',0,1),(484,86,114,1,0,'2020-10-06 23:11:45',0,1),(485,86,115,1,0,'2020-10-06 23:11:45',0,1),(486,103,112,1,1,'2020-10-07 03:33:00',0,1),(487,103,114,1,1,'2020-10-07 03:33:36',0,1),(488,103,115,1,1,'2020-10-07 03:33:57',0,1),(489,86,112,1,1,'2020-10-07 03:41:28',0,1),(490,86,114,1,1,'2020-10-07 03:41:28',0,1),(491,86,115,1,1,'2020-10-07 03:41:28',0,1),(492,90,112,1,1,'2020-10-07 06:34:29',0,1),(493,90,114,1,1,'2020-10-07 06:34:50',0,1),(494,90,115,1,1,'2020-10-07 06:35:11',0,1),(495,90,59,1,1,'2020-10-07 06:42:36',0,1),(496,108,15,3,1,'2020-10-07 23:30:29',1,1),(497,108,59,1,1,'2020-10-07 23:30:39',1,1),(498,108,112,1,0,'2020-10-08 01:10:02',0,1),(499,108,114,1,0,'2020-10-08 01:10:02',0,1),(500,108,115,1,0,'2020-10-08 01:10:03',0,1),(501,89,10,4,1,'2020-10-09 01:00:52',0,1),(502,89,28,1,1,'2020-10-09 01:01:07',0,1),(503,109,6,5,1,'2020-10-09 01:02:12',0,1),(504,110,6,1,1,'2020-10-10 21:12:07',0,1),(505,110,81,1,1,'2020-10-10 21:14:50',0,1),(506,110,73,1,1,'2020-10-10 21:15:00',0,1),(507,110,9,1,1,'2020-10-10 21:15:13',0,1),(508,109,116,1,1,'2020-10-17 08:33:34',0,1),(509,111,7,1,1,'2020-10-17 20:46:52',1,1),(510,111,61,1,1,'2020-10-17 20:49:13',1,1),(511,112,7,3,1,'2020-10-17 21:49:29',0,1),(512,112,113,1,1,'2020-10-17 21:49:56',0,1),(513,113,11,3,1,'2020-10-17 22:01:40',1,1),(514,113,37,1,1,'2020-10-17 22:01:55',1,1),(515,113,7,5,1,'2020-10-17 22:02:33',1,1),(516,114,12,5,1,'2020-10-17 22:05:06',1,1),(517,114,81,1,1,'2020-10-17 22:05:24',1,1),(518,114,38,1,1,'2020-10-17 22:05:30',1,1),(519,115,5,5,1,'2020-10-17 22:08:43',1,1),(520,115,18,1,1,'2020-10-17 22:08:58',1,1),(521,115,113,1,1,'2020-10-17 22:09:11',1,1),(522,116,7,5,1,'2020-10-17 22:13:26',1,1),(523,116,18,1,1,'2020-10-17 22:13:36',1,1),(524,116,37,1,1,'2020-10-17 22:13:43',1,1),(525,116,87,1,1,'2020-10-17 22:13:50',1,1),(526,117,7,5,1,'2020-10-17 22:18:51',1,1),(527,117,59,1,1,'2020-10-17 22:18:57',1,1),(528,117,19,1,1,'2020-10-17 22:19:14',1,1),(529,117,42,1,1,'2020-10-17 22:19:25',1,1),(530,117,113,1,1,'2020-10-17 22:19:38',1,1),(531,118,11,5,1,'2020-10-22 05:44:50',0,1),(532,118,113,3,1,'2020-10-22 05:44:56',0,1),(533,119,10,5,1,'2020-10-22 05:49:08',0,1),(534,119,37,1,1,'2020-10-22 05:49:14',0,1),(535,120,18,1,1,'2020-10-22 05:52:35',0,1),(536,120,11,5,1,'2020-10-22 05:52:43',0,1),(537,120,38,1,1,'2020-10-22 05:52:51',0,1),(538,121,23,1,1,'2020-10-25 03:09:10',0,1),(539,122,16,5,1,'2020-10-26 02:49:52',1,1),(540,122,19,1,1,'2020-10-26 02:50:00',1,1),(541,122,38,1,1,'2020-10-26 02:50:08',1,1),(542,123,18,1,1,'2020-11-16 07:46:31',1,1),(543,124,167,1,1,'2020-11-16 23:57:27',0,1),(544,125,20,1,1,'2020-11-17 06:52:33',1,1),(545,125,37,1,1,'2020-11-17 06:52:43',1,1),(546,126,165,1,1,'2020-11-17 06:57:11',0,1),(547,126,37,2,1,'2020-11-17 06:57:21',0,1),(548,127,21,1,1,'2020-11-17 07:03:06',1,1),(549,127,37,1,1,'2020-11-17 07:03:20',1,1),(550,128,20,1,1,'2020-11-17 07:07:24',0,1),(551,128,48,1,1,'2020-11-17 07:07:46',0,1),(552,129,126,5,1,'2020-11-17 07:09:20',1,1),(553,129,19,1,1,'2020-11-17 07:09:28',1,1),(554,129,37,1,1,'2020-11-17 07:09:34',1,1),(555,130,21,1,1,'2020-11-17 07:12:35',1,1),(556,130,127,5,1,'2020-11-17 07:12:46',1,1),(557,130,82,1,1,'2020-11-17 07:13:04',1,1),(558,131,22,1,1,'2020-11-17 07:14:47',1,1),(559,131,37,2,1,'2020-11-17 07:15:03',1,1),(560,132,166,1,1,'2020-11-17 07:18:30',1,1),(561,132,140,1,1,'2020-11-17 07:18:37',1,1),(562,132,37,2,1,'2020-11-17 07:18:46',1,1),(563,133,125,5,1,'2020-11-17 07:23:40',1,1),(564,133,21,1,1,'2020-11-17 07:23:52',1,1),(565,133,37,2,1,'2020-11-17 07:23:58',1,1),(566,134,21,1,1,'2020-11-17 07:25:24',0,1),(567,134,37,1,1,'2020-11-17 07:26:08',0,1),(568,135,138,6,1,'2020-11-17 07:30:20',1,1),(569,135,165,1,1,'2020-11-17 07:30:27',1,1),(570,135,37,3,1,'2020-11-17 07:30:36',1,1),(571,136,21,1,1,'2020-11-17 07:57:37',1,1),(572,136,37,3,1,'2020-11-17 07:57:43',1,1),(573,136,127,5,1,'2020-11-17 07:57:56',1,1),(574,137,126,5,1,'2020-11-17 07:59:49',1,1),(575,137,126,5,1,'2020-11-17 08:00:07',1,1),(576,137,19,1,1,'2020-11-17 08:00:17',1,1),(577,137,37,2,1,'2020-11-17 08:00:25',1,1),(578,138,127,5,1,'2020-11-17 08:04:06',1,1),(579,138,19,1,1,'2020-11-17 08:04:24',1,1),(580,138,127,4,1,'2020-11-17 08:04:42',1,1),(581,138,37,2,1,'2020-11-17 08:04:51',1,1),(582,139,19,1,1,'2020-11-19 00:06:54',0,1),(583,139,16,5,1,'2020-11-19 00:07:02',0,1),(584,139,37,1,1,'2020-11-19 00:07:09',0,1),(585,140,125,5,1,'2020-11-19 01:38:00',1,1),(586,140,38,1,1,'2020-11-19 01:38:06',1,1),(587,140,20,1,1,'2020-11-19 01:38:19',1,1),(588,140,56,1,1,'2020-11-19 01:38:26',1,1),(589,141,20,1,1,'2020-11-19 05:24:23',1,1),(590,141,37,1,1,'2020-11-19 05:24:29',1,1),(591,141,13,5,1,'2020-11-19 05:24:39',1,1),(592,142,56,1,1,'2020-11-20 06:50:51',1,1),(593,142,109,1,1,'2020-11-20 07:21:42',1,1),(594,142,109,1,1,'2020-11-20 07:40:35',1,1),(595,143,54,1,1,'2020-11-21 00:03:10',1,1),(596,143,165,1,1,'2020-11-21 00:03:44',1,1),(597,143,38,1,1,'2020-11-21 00:03:52',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productos`
--

LOCK TABLES `tbl_productos` WRITE;
/*!40000 ALTER TABLE `tbl_productos` DISABLE KEYS */;
INSERT INTO `tbl_productos` VALUES (5,'Maciza de Res','Tacos de maciza de Res','5.jpg',2,1),(6,'Maciza de Puerco','Tacos de maciza de puerco','6.jpg',2,1),(7,'Lengua de cerdo','Tacos de lengua de cerdo al vapor','7.jpg',2,1),(8,'Carnitas','Tacos de carnitas','8.jpg',2,1),(9,'Buche','Tacos de buche','9.jpg',2,1),(10,'Oreja','Tacos de oreja de cerdo','10.jpg',2,1),(11,'Azadura','Tacos de azadura','11.jpg',2,1),(12,'Trompa','Tacos de trompa de cerdo','12.jpg',2,1),(13,'Corazón','Tacos de corazón','13.jpg',2,1),(14,'Bistec de res','Tacos de bistec de res','14.jpg',4,1),(15,'Pastor','Tacos al pastor','15.jpg',4,1),(16,'Bistec con quesillo','Taco de bistec de res con quesillo','16.jpg',4,1),(17,'Pastor con quesillo','Taco al pastor con quesillo','17.jpg',4,1),(18,'Mula Terca','Tocino/Jamón/Bistec de res o carne al pastor y quesillo','18.jpg',5,1),(19,'Plato Suizo','Bistec de res o carne al pastor y quesillo','19.jpg',5,1),(20,'Alambre','Cebolla, Chile Morrón, Tocino, Bistec de Res y Quesillo','20.jpg',5,1),(21,'Alambre Especial','Cebolla, Chile morrón, Tocino, Bistec de Res, Jamón, Champiñones, Carne al pastor y Quesillo','21.jpg',5,1),(22,'Mata Hambre','Cebolla, Chile Morrón, Tocino, Bistec de Res, Jamón, Carne al pastor, Tomate y Quesillo','22.jpg',5,1),(23,'Plato Mixto','Tocino, Jamón, Carne al pastor, Salsa Mexicana y quesillo','23.jpg',5,1),(24,'Vegetariano','Cebolla, Chile Morrón, Tomate, Champiñones y quesillo','24.jpg',5,1),(25,'Tortilla adicional','Tortilla adicional','25.jpg',1,1),(26,'Pozole rojo','Plato de pozole rojo, grande','26.jpg',6,0),(27,'Pozole Rojo Chico','Pozole Rojo Chico','27.jpg',6,0),(28,'Queso Fundido','Queso fundido normal','28.jpg',6,1),(29,'Queso Especial','Queso fundido combinado con bistec, pastor o champiñones','29.jpg',6,1),(30,'Gringa','Tortilla de harina con queso y carne','30.jpg',6,1),(31,'Sincronizada','Tortilla de harina con queso y jamón','31.jpg',6,1),(32,'Tostada','Se prepara con la carne de su elección','32.jpg',6,1),(33,'Burrita','Burrita de tortilla de harina con quesillo','33.jpg',6,1),(34,'Quesadilla','Quesadilla','34.jpg',6,1),(35,'Quesadilla Especial','Con Bistec de res, pastor o champiñones','35.jpg',6,1),(36,'Tostada adicional','Tostada adicional para cualquier alimento','36.jpg',1,1),(37,'Vaso Agua de horchata','Agua fresca de horchata, un vaso','37.jpg',7,1),(38,'Agua de horchata, Jarra','Jarra de agua de horchata','38.jpg',7,1),(39,'Agua de Jamaica, Vaso','Vaso de agua de jamaica','39.jpg',7,1),(40,'Agua de Jamaica, Jarra','Jarra de agua de jamaica','40.jpg',7,1),(41,'Agua de Maracuya, Vaso','Vaso de agua de Maracuya','41.jpg',7,1),(42,'Agua de Maracuya, Jarra','Jarra de agua de Maracuya','42.jpg',7,1),(43,'Agua de Mandarina, Vaso','Vaso de agua de mandarina','43.jpg',7,1),(44,'Agua de Mandarina, Jarra','Jarra de agua de mandarina','44.jpg',7,1),(45,'R. Pepsi','Refresco marca Pepsi','45.jpg',7,0),(46,'Mirinda','Refresco mirinda','46.jpg',7,1),(47,'Sangria','Refresco Sangría','47.jpg',7,1),(48,'7 Up','Refresco 7up','48.jpg',7,1),(49,'Manzanita Sol','Refresco Manzanita Sol','49.jpg',7,1),(50,'Agua Mineral','Agua mineral embotellada','50.jpg',7,1),(51,'Café','Tasa de café','51.jpg',7,1),(52,'Atole','Atole','52.jpg',7,1),(53,'Agua SIN gas 1/2 Lt.','Agua embotellada SIN gas 1/2 Lt.','53.jpg',7,1),(54,'Panqué de elote','Panqué de elote','54.jpg',8,1),(55,'Flan','Flan','55.jpg',8,1),(56,'Cheesecake','Pastel de queso','56.jpg',8,1),(57,'Tostada Maciza de Puerco','Tostada Maciza de Puerco','57.jpg',9,1),(58,'Tostada Maciza de Res','Tostada Maciza de Res','58.jpg',9,1),(59,'Tostada Carnitas','Tostada de Carnitas','59.jpg',9,1),(60,'Tostada de Trompa','Tostada de Trompa','60.jpg',9,1),(61,'Tostada de Buche','Tostada de Buche','61.jpg',9,1),(62,'Tostada de Azadura','Tostada de Azadura','62.jpg',9,1),(63,'Tostada de Cabeza','Tostada de Cabeza','63.jpg',9,0),(64,'Tostada de Oreja','Tostada de Oreja','64.jpg',9,1),(65,'Tostada de Lengua','Tostada de Lengua','65.jpg',9,1),(66,'Tostada de Quesillo','Tostada de Quesillo','66.jpg',9,1),(67,'Tostada de Pastor','Tostada con carne al Pastor','67.jpg',9,1),(68,'Tostada de Bistec de Res','Tostada de Bistec de Res','68.jpg',9,1),(69,'Tostada de Chamorro','Tostada de Chamorro','69.jpg',9,1),(70,'T. Ahogado Maciza de Res','Taco ahogado en salsa y guacamole de Maciza de Res','70.jpg',3,1),(71,'T. Ahogado Maciza de Puerco','Taco ahogado de maciza de puerco','71.jpg',3,1),(72,'T. Ahogado Lengua de Puerco','Taco ahogado de lengua de puerco','72.jpg',3,1),(73,'T. Ahogado de Carnitas','Taco ahogado de carnitas mixtas','73.jpg',3,1),(74,'T. Ahogado de Buche','Taco ahogado de Buche','74.jpg',3,1),(75,'T. Ahogado de Oreja','Taco Ahogado de Oreja','75.jpg',3,1),(76,'T. Ahogado de Azadura','Taco ahogado de Azadura','76.jpg',3,1),(77,'T. Ahogado de Trompa','Taco ahogado de trompa','77.jpg',3,1),(78,'T. Ahogado de Corazón','Taco ahogado de corazón','78.jpg',3,1),(79,'T. Ahogado de Bistec de Res','Taco ahogado de bistec de Res','79.jpg',3,1),(80,'Taco ahogado al Pastor','Taco Ahogado al pastor','80.jpg',3,1),(81,'Poz. Maciza de Puerco','Pozole de maciza de puerco','81.jpg',10,1),(82,'Poz. Maciza de Res','Pozole de Maciza de Res','82.jpg',10,1),(83,'Poz. de Surtido Puerco','Pozole de carne surtida de puerco','83.jpg',10,1),(84,'Pozole Combinado','Pozole Mixto de Puerco y Res','84.jpg',10,1),(85,'Poz. Maciza de Puerco CHICO','Pozole de maciza de puerco, chico','85.jpg',10,1),(86,'Poz. Maciza de Res CHICO','Poz. Maciza de Res CHICO','86.jpg',10,1),(87,'Poz. Surtida de Puerco CHICO','Pozole con carne surtida de puerco, chico','87.jpg',10,1),(88,'Poz. Combinado CHICO','Pozole Mixto Chico','88.jpg',10,1),(89,'Agua SIN Gas 1 Litro','Botella de Agua sin Gas 1 Lt.','89.jpg',7,1),(91,'Cerveza Stella Artois','Cerveza Stella Artois','91.jpg',7,1),(92,'Cerveza Corona','Cerveza Corona','92.jpg',7,1),(93,'Cerveza Victoria','Cerveza Victoria	','93.jpg',7,1),(94,'Cerveza Bohemia','Cerveza Bohemia	','94.jpg',7,1),(95,'Agua de Limón, Vaso','Vaso de Agua de Limón','95.jpg',7,1),(96,'Agua de Limón, Jarra','Jarra de Agua de Limón','96.jpg',7,1),(97,'Boing','(Tamarindo, Guayaba, Fresa, Mango o Uva)','97.jpg',7,1),(98,'Cerveza Corona Light','Cerveza Corona Light','98.jpg',7,1),(99,'Cerveza Barrilito','Cerveza Barrilito','99.jpg',7,1),(100,'Cerveza Negra Modelo','Cerveza Negra Modelo','100.jpg',7,1),(101,'Cerveza Modelo Especial','Cerveza Modelo Especial','101.jpg',7,1),(102,'Lata Cerveza Modelo Especial','Cerveza Modelo Especial, LATA','102.jpg',7,1),(103,'Cerveza Victoria Lata','Cerveza Victoria Lata','103.jpg',7,1),(104,'Base Suero','Base Suero','104.jpg',7,1),(105,'Base Michelada','Base Michelada','105.jpg',7,1),(106,'Tortilla de Harina Extra','Tortilla de Harina Extra','106.jpg',1,1),(107,'Orden Guacamole','Orden Guacamole','107.jpg',1,1),(108,'Orden Zanahoria','Orden Zanahoria','108.jpg',2,1),(109,'Orden Carne Surtida 1 Kg.','Orden Carne Surtida 1 Kg','109.jpg',15,1),(110,'Promo Lunes','Promocion de Lunes','110.jpg',9,0),(111,'Promo Miercoles','Promo Miercoles','111.jpg',9,0),(112,'Paquete de todo un poco','2 tacos de al pastor o puerco,  2 tostadas al pastor o puerco,  1 pozole de puerco o pollo,  2 litros de agua de sabor o refresco de 2 litros','112.jpg',13,1),(113,'Coca-Cola vidrio','Refresco Coca-Cola de vidrio','113.jpg',7,1),(114,'2 tacos paquete 112 ','2 tacos para paquete \"De todo un poco\"','114.jpg',14,1),(115,'2 Tostadas Pollo o Puerco','2 Tostadas de Pollo o Puerco\npara paquete \"De todo un poco\"','',14,1),(116,'Orden de Carne Surtida 1/2 Kg.','Orden de Carne Surtida 1/2 Kg.','',15,1),(117,'Tacos de costilla enchilada','Tacos de costilla enchilada','',4,1),(118,'Taco de champiñones','Tacos de champiñones','',4,1),(119,'Taco de Chuleta','Taco de chuleta de cerdo','',4,1),(120,'Taco de chorizo','Taco de chorizo','',4,1),(121,'Taco de costilla con queso','Taco de costilla con queso','',4,1),(122,'Taco de Champiñones con queso','Taco de Champiñones con queso','',4,1),(123,'T. Chuleta con Queso','Taco de chuleta de cerdo con queso','',4,1),(124,'Taco Chorizo c/Quesillo','Taco de chorizo con queso','',4,1),(125,'Taco de Pollo c/Quesillo','Taco de pollo con queso','',4,1),(126,'Taco Bisteck HARINA','Taco de bisteck con tortilla de harina','',4,1),(127,'Taco costilla HARINA','Taco de costilla de harina','',4,1),(128,'T. Champiñones HARINA','Taco de champiñones con harina','',4,1),(129,'Taco pastor HARINA','Taco al pastor elaborado con tortilla de harina','',4,1),(130,'Tacho Chuleta HARINA','Taco de chuleta en tortilla de harina','',4,1),(131,'Taco chorizo HARINA','Taco de chorizo con tortilla de harina','',4,1),(132,'Taco de Pollo','Taco de pollo al vapor','',2,1),(133,'Cabeza de Puerco','Taco de cabeza de puerco','',2,1),(134,'Nana','Taco de nana de cerdo','',2,1),(135,'Surtida','Taco de carne surtida	','',2,1),(136,'Maciza de Res HARINA','Tacos de maciza de Res en Harina','',2,1),(137,'Maciza de Puerco HARINA','Tacos de maciza de puerco en tortilla de Harina','',2,1),(138,'Lengua de cerdo HARINA','Tacos de lengua de cerdo al vapor en tortilla de Harina','',2,1),(139,'Carnitas HARINA','Tacos de carnitas en tortilla de Harina','',2,1),(140,'Buche HARINA','Tacos de buche en tortilla de Harina','',2,1),(141,'Oreja HARINA','Tacos de oreja de cerdo en tortilla de harina','',2,1),(142,'Azadura HARINA','Tacos de azadura en tortilla de harina','',2,1),(143,'Trompa HARINA','Tacos de trompa de cerdo en tortilla de Harina','',2,1),(144,'Taco de Pollo HARINA','Taco de pollo al vapor en tortilla de Harina','',2,1),(145,'Cabeza de Puerco HARINA','Taco de cabeza de puerco en tortilla de Harina','',2,1),(146,'Nana en  HARINA','Taco de nana de cerdo en tortilla de Harina','',2,1),(147,'Surtida HARINA','Taco de carne surtida en tortilla de Harina','',2,1),(148,'Tostada de pollo','Tostada de pollo','',9,1),(149,'Tostada de Costilla','Tostada de Costilla','',9,1),(150,'Tostada de Chuleta','Tostada de Chuleta','',9,1),(151,'Tostada Cabeza de Puerco','Tostada Cabeza de puerco','',9,1),(152,'Tostada de Nana','Tosatada de Nana','',9,1),(153,'Volcan Bistec de Res','Tostada con bistec de res y quesillo fundido','',9,1),(154,'Volcan Maciza de Res','Tostada con maciza de res y quesillo fundido','',9,1),(155,'Volcan de pollo','Tostada con pollo y quesillo fundido','',9,1),(156,'Volcan de Pastor','Tostada con carne al pastor y quesillo fundido','',9,1),(157,'Volcan de Costilla','Tostada con costilla  y quesillo fundido','',9,1),(158,'Volcan de Chuleta','Tostada con chuleta y quesillo fundido','',9,1),(159,'Volcan de Puerco','Tostada con carne de puerco y quesillo fundido','',9,1),(160,'Volcan de Champiñones','Tostada con champiñones y quesillo fundido','',9,1),(161,'Poz. de pollo CHICO','Pozole de pollo Chico','',10,1),(162,'Poz. sin carne CHICO','Pozole CHICO sin carne','',10,1),(163,'Poz. de pollo','Pozole de pollo','',10,1),(164,'Pozole sin Carne','Pozole sin carne','',10,1),(165,'Alambre Costilla','Cebolla, Chile Morrón, Tocino, Costilla y Quesillo','',5,1),(166,'Alambre Chuleta','Cebolla, Chile Morrón, Tocino, Chuleta y Quesillo','',5,1),(167,'Alambre de Pollo','Cebolla, Chile morrón, Tocino, Pollo y Quesillo','',5,1),(168,'Orden de Carne Surtida 300 gr.','Orden de Carne Surtida 300 gr.','',15,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promociones`
--

LOCK TABLES `tbl_promociones` WRITE;
/*!40000 ALTER TABLE `tbl_promociones` DISABLE KEYS */;
INSERT INTO `tbl_promociones` VALUES (1,8,0.3,'2016-03-01','2029-12-31','0010100',0),(2,15,0.3,'2016-03-01','2029-12-31','0010100',0),(3,110,0,'2016-03-01','2029-12-31','0100000',0),(4,111,0,'2016-03-01','2029-12-31','0001000',0);
/*!40000 ALTER TABLE `tbl_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_puestos`
--

DROP TABLE IF EXISTS `tbl_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_puestos` (
  `id_puesto` int(11) NOT NULL AUTO_INCREMENT,
  `chr_puesto` varchar(24) COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_puesto` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `bit_activo` int(11) NOT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_puestos`
--

LOCK TABLES `tbl_puestos` WRITE;
/*!40000 ALTER TABLE `tbl_puestos` DISABLE KEYS */;
INSERT INTO `tbl_puestos` VALUES (1,'Administrador','Administrador del negocio, responde por el resto del personal',1),(2,'Cajero','Se encarga de la caja',1),(3,'Mesero','Se encarga de atender las mesas',1),(4,'Auxiliar','Se encarga de otras tareas (Lavaplatos, limpieza, etc).',1);
/*!40000 ALTER TABLE `tbl_puestos` ENABLE KEYS */;
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
  `dt_fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status`
--

LOCK TABLES `tbl_status` WRITE;
/*!40000 ALTER TABLE `tbl_status` DISABLE KEYS */;
INSERT INTO `tbl_status` VALUES (1,'Administrador'),(2,'Normal'),(3,'Mesero');
/*!40000 ALTER TABLE `tbl_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ticket_cons`
--

DROP TABLE IF EXISTS `tbl_ticket_cons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_ticket_cons` (
  `id_ticketNrConsecutivo` int(11) NOT NULL AUTO_INCREMENT,
  `chr_ticketConsecutivo` int(11) NOT NULL,
  PRIMARY KEY (`id_ticketNrConsecutivo`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ticket_cons`
--

LOCK TABLES `tbl_ticket_cons` WRITE;
/*!40000 ALTER TABLE `tbl_ticket_cons` DISABLE KEYS */;
INSERT INTO `tbl_ticket_cons` VALUES (1,61),(2,62),(3,63),(4,64),(5,65),(6,66),(7,67),(8,68),(9,69),(10,70),(11,71),(12,72),(13,73),(14,74),(15,75),(16,76),(17,77),(18,78),(19,79),(20,80),(21,81),(22,82),(23,83),(24,84),(25,85),(26,86),(27,87),(28,88),(29,88),(30,88),(31,89),(32,90),(33,91),(34,92),(35,93),(36,94),(37,95),(38,96),(39,97),(40,90),(41,91),(42,95),(43,113),(44,94),(45,115),(46,114),(47,97),(48,116),(49,117),(50,118),(51,119),(52,120),(53,121),(54,122),(55,124),(56,124),(57,123),(58,125),(59,139),(60,3),(61,4),(62,5),(63,6),(64,7),(65,8),(66,9),(67,10),(68,11),(69,12),(70,13),(71,14),(72,15),(73,16),(74,17),(75,18),(76,20),(77,20),(78,21),(79,22);
/*!40000 ALTER TABLE `tbl_ticket_cons` ENABLE KEYS */;
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
  `bit_activo` int(11) DEFAULT 1,
  PRIMARY KEY (`id_tipo_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipos_precios`
--

LOCK TABLES `tbl_tipos_precios` WRITE;
/*!40000 ALTER TABLE `tbl_tipos_precios` DISABLE KEYS */;
INSERT INTO `tbl_tipos_precios` VALUES (1,'Normal',1),(2,'Plataforma',1),(3,'Cortesía',1),(4,'Otro',0);
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
  `chr_login` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `chr_password` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `int_status` int(11) NOT NULL,
  `bit_activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios`
--

LOCK TABLES `tbl_usuarios` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` VALUES (1,'admin','$1$tacosroy$tINrhk8Iak5HqU1sxDqtD1',1,1),(2,'Cajero','936400f151ba2146a86cfcc342279f57',2,1),(3,'Mesero1','85770ae9def3473f559e0dbe0609060a',3,1);
/*!40000 ALTER TABLE `tbl_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuarios_sistema`
--

DROP TABLE IF EXISTS `tbl_usuarios_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_usuarios_sistema` (
  `id_usuario_sistema` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_sistema`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `tbl_usuarios_sistema_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`),
  CONSTRAINT `tbl_usuarios_sistema_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `tbl_personal` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios_sistema`
--

LOCK TABLES `tbl_usuarios_sistema` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios_sistema` DISABLE KEYS */;
INSERT INTO `tbl_usuarios_sistema` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `tbl_usuarios_sistema` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variantes_categorias`
--

LOCK TABLES `tbl_variantes_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_variantes_categorias` DISABLE KEYS */;
INSERT INTO `tbl_variantes_categorias` VALUES (1,2,1),(2,2,3),(3,2,4),(4,2,5),(5,4,6),(6,2,7),(7,2,10),(8,2,2),(9,9,1),(10,9,3),(11,9,4),(12,9,5),(13,9,7),(14,9,10),(15,9,8),(16,9,2),(17,10,4),(18,10,5),(19,10,7),(20,10,10),(21,10,8),(22,10,9),(23,3,3),(24,3,4),(25,3,5),(26,4,3),(27,4,4),(28,4,5),(29,4,7),(30,4,10),(31,5,4),(32,5,10),(33,6,4),(34,6,5),(35,6,7),(36,6,10),(37,10,11),(38,10,12),(39,10,13),(40,10,14),(41,1,10),(42,7,10),(43,8,10),(44,3,10),(45,13,15),(46,13,16),(47,2,17),(48,4,17),(49,5,17),(50,6,17),(51,10,17),(52,1,17),(53,7,17),(54,8,17),(55,3,17),(56,13,17),(57,9,17),(58,13,10),(59,4,18),(60,4,19),(61,5,18),(62,5,19),(63,14,18),(64,14,19);
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
  `fl_ordenar` float DEFAULT NULL,
  `bit_activo` int(11) DEFAULT 1,
  PRIMARY KEY (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variantes_platillos`
--

LOCK TABLES `tbl_variantes_platillos` WRITE;
/*!40000 ALTER TABLE `tbl_variantes_platillos` DISABLE KEYS */;
INSERT INTO `tbl_variantes_platillos` VALUES (1,'Sin Salsa','Productos preparados no llevan salsa','S/Salsa',1,1),(2,'Sin Guacamole','Productos preparados no llevan guacamoles','S/Guacam',2,1),(3,'Sin Verdura','Los platillos preparados no llevan verdura','S/Verdura',3,1),(4,'Sin Cebolla','Los platillos preparados no llevan cebolla','S/Cebolla',4,1),(5,'Sin Cilantro','Los platillos preparados no llevan cilantro','S/Cilantro',5,1),(6,'Sin Piña','Los platillos preparados no llevan piña','Sin Pina',6,1),(7,'Pura Carne','Los platillos preparados llevan pura carne al natural','Pura Carne',7,1),(8,'Sin Col','Los platillos preparados no llevan Col','Sin Col',8,1),(9,'Sin Rábano','Los platillos preparados no llevan Rábano','Sin Rabano',9,1),(10,'Para llevar','Los productos son para llevar','P/Llevar',23,1),(11,'Maciza de Puerco','El pozole lleva carne maciza de puerco','MacizaPco',10,1),(12,'Maciza de Res','El pozole lleva carne Maciza de Res','MacizaRes',11,1),(13,'Surtido Puerco','El pozole lleva carne surtida de puerco','SurtidaPco',12,1),(14,'Mixto Puerco y Res','El pozole lleva carne mixta de puerco y res','Mixto',14,1),(15,'Carne pastor','Para tacos o tostadas de paquete','Carne Pastor',15,1),(16,'Carne Puerco','Para tacos o tostadas de paquete','Carne Pco',16,1),(17,'A Domicilio','Producto a domicilio','A Domic.',24,1),(18,'Tortilla Maiz','Producto con tortillas de maiz','Tt. Maiz',0.05,1),(19,'Tortilla Harina','Producto con tortillas de harina','Tt. Harina',0.75,1),(20,'Bistec Res','Producto preparado con Bistec de Res','C/BistecRes',17,1),(21,'De Costilla','Carne Costilla para los platillos a la plancha que lo requieran','c/Costilla',18,1),(22,'de Pollo','Carne de pollo para los platillos que lo requieren','c/Pollo',19,1),(24,'Chuleta','Con Chuleta para preparar el platillo a la plancha','c/Chuleta',20,1),(25,'Champiñones','Con Champiñones','c/Champñ',21,1),(26,'Chorizo','Con Chorizo','c/Chorizo',22,1),(27,'Carne de res','Producto lleva carne de Res','Surt. Res',13,1);
/*!40000 ALTER TABLE `tbl_variantes_platillos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_combos_productos`
--

DROP TABLE IF EXISTS `vw_combos_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_combos_productos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_combos_productos` (
  `ID Combo` tinyint NOT NULL,
  `Nombre Combo` tinyint NOT NULL,
  `ID Producto` tinyint NOT NULL,
  `ID Prod Rel` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Descripcion` tinyint NOT NULL,
  `Cant. x Combo` tinyint NOT NULL,
  `Activo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_costos_extra_var_opciones`
--

DROP TABLE IF EXISTS `vw_costos_extra_var_opciones`;
/*!50001 DROP VIEW IF EXISTS `vw_costos_extra_var_opciones`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_costos_extra_var_opciones` (
  `ID Orden` tinyint NOT NULL,
  `ID Prod.` tinyint NOT NULL,
  `Cantidad` tinyint NOT NULL,
  `Precio` tinyint NOT NULL,
  `IDPOp` tinyint NOT NULL,
  `Prod. x Orden` tinyint NOT NULL,
  `ID Fecha` tinyint NOT NULL,
  `Extra` tinyint NOT NULL,
  `Tipo Precio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_datos_personal_logins`
--

DROP TABLE IF EXISTS `vw_datos_personal_logins`;
/*!50001 DROP VIEW IF EXISTS `vw_datos_personal_logins`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_datos_personal_logins` (
  `ID` tinyint NOT NULL,
  `Nombre` tinyint NOT NULL,
  `Apellidos` tinyint NOT NULL,
  `CURP` tinyint NOT NULL,
  `Telefono` tinyint NOT NULL,
  `Puesto` tinyint NOT NULL,
  `Login` tinyint NOT NULL,
  `IDS` tinyint NOT NULL,
  `PData` tinyint NOT NULL,
  `Tipo` tinyint NOT NULL,
  `Activo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_info_ordenes_tickets`
--

DROP TABLE IF EXISTS `vw_info_ordenes_tickets`;
/*!50001 DROP VIEW IF EXISTS `vw_info_ordenes_tickets`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_info_ordenes_tickets` (
  `id_orden_id` tinyint NOT NULL,
  `id_orden_cerrada` tinyint NOT NULL,
  `dt_horafecha_cierre_orden` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `chr_consecutivo` tinyint NOT NULL,
  `chr_ticketConsecutivo` tinyint NOT NULL,
  `int_lvl_report` tinyint NOT NULL,
  `chr_status_orden` tinyint NOT NULL
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
  `ID` tinyint NOT NULL,
  `Orden` tinyint NOT NULL,
  `HoraFecha` tinyint NOT NULL,
  `InsumoID` tinyint NOT NULL,
  `Insumo` tinyint NOT NULL,
  `Usado` tinyint NOT NULL,
  `Estado` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_insumos_x_platillo`
--

DROP TABLE IF EXISTS `vw_insumos_x_platillo`;
/*!50001 DROP VIEW IF EXISTS `vw_insumos_x_platillo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_insumos_x_platillo` (
  `ID` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Insumo` tinyint NOT NULL,
  `Cantidad` tinyint NOT NULL
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
  `Precio` tinyint NOT NULL,
  `Tipo Precio` tinyint NOT NULL,
  `OrdenNR` tinyint NOT NULL,
  `HoraFecha` tinyint NOT NULL,
  `Activo` tinyint NOT NULL,
  `Impreso` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ordenes_x_mesero`
--

DROP TABLE IF EXISTS `vw_ordenes_x_mesero`;
/*!50001 DROP VIEW IF EXISTS `vw_ordenes_x_mesero`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_ordenes_x_mesero` (
  `Orden` tinyint NOT NULL,
  `Cierre` tinyint NOT NULL,
  `Total` tinyint NOT NULL,
  `Mesa` tinyint NOT NULL,
  `Estado` tinyint NOT NULL,
  `Atendio` tinyint NOT NULL
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
  `IDPXO` tinyint NOT NULL,
  `ID Orden` tinyint NOT NULL,
  `ID Prod` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Precio` tinyint NOT NULL,
  `Tipo Precio` tinyint NOT NULL,
  `Fecha Validez` tinyint NOT NULL,
  `Activo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_prods_x_orden`
--

DROP TABLE IF EXISTS `vw_prods_x_orden`;
/*!50001 DROP VIEW IF EXISTS `vw_prods_x_orden`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_prods_x_orden` (
  `Orden` tinyint NOT NULL,
  `IDPO` tinyint NOT NULL,
  `ID Prod` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Cantidad` tinyint NOT NULL,
  `Tipo Precio` tinyint NOT NULL,
  `HoraFecha` tinyint NOT NULL,
  `Activo` tinyint NOT NULL,
  `Impreso` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_productos_categoria`
--

DROP TABLE IF EXISTS `vw_productos_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_productos_categoria` (
  `id_producto` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Categoria` tinyint NOT NULL,
  `Activo` tinyint NOT NULL
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
  `IDTipo` tinyint NOT NULL,
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
-- Temporary table structure for view `vw_variantes_platillos_x_orden`
--

DROP TABLE IF EXISTS `vw_variantes_platillos_x_orden`;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_platillos_x_orden`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_variantes_platillos_x_orden` (
  `ID Orden` tinyint NOT NULL,
  `ID Producto` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Variante` tinyint NOT NULL,
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
-- Temporary table structure for view `vw_variantes_x_platillo`
--

DROP TABLE IF EXISTS `vw_variantes_x_platillo`;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_x_platillo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_variantes_x_platillo` (
  `ID Producto` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Variante` tinyint NOT NULL,
  `Desc` tinyint NOT NULL,
  `ID Variante` tinyint NOT NULL,
  `IDProdVar` tinyint NOT NULL,
  `ID Cat` tinyint NOT NULL,
  `Costo Extra` tinyint NOT NULL,
  `Tipo Precio` tinyint NOT NULL,
  `Ordenar` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_combos_productos`
--

/*!50001 DROP TABLE IF EXISTS `vw_combos_productos`*/;
/*!50001 DROP VIEW IF EXISTS `vw_combos_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_combos_productos` AS select `tbl_combos`.`id_combo` AS `ID Combo`,`tbl_combos`.`chr_nombre_combo` AS `Nombre Combo`,`tbl_prods_x_combo`.`id_producto` AS `ID Producto`,`tbl_combos`.`id_producto_relacionado` AS `ID Prod Rel`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Descripcion`,`tbl_prods_x_combo`.`int_cantidad` AS `Cant. x Combo`,`tbl_combos`.`bit_activo` AS `Activo` from ((`tbl_prods_x_combo` join `tbl_combos` on(`tbl_combos`.`id_combo` = `tbl_prods_x_combo`.`id_combo`)) left join `tbl_productos` on(`tbl_productos`.`id_producto` = `tbl_prods_x_combo`.`id_producto`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_costos_extra_var_opciones`
--

/*!50001 DROP TABLE IF EXISTS `vw_costos_extra_var_opciones`*/;
/*!50001 DROP VIEW IF EXISTS `vw_costos_extra_var_opciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_costos_extra_var_opciones` AS select `tbl_prods_x_orden`.`int_orden_id` AS `ID Orden`,`tbl_prods_x_orden`.`int_producto_id` AS `ID Prod.`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_prods_x_orden`.`int_tipo_precio` AS `Precio`,`tbl_prods_orden_opciones`.`id_prod_orden_opcion` AS `IDPOp`,`tbl_prods_orden_opciones`.`id_prod_x_orden` AS `Prod. x Orden`,`tbl_costos_extra_var_prod`.`id_fecha_control` AS `ID Fecha`,coalesce(`tbl_costos_extra_var_prod`.`fl_costo_extra`,'0') AS `Extra`,`tbl_costos_extra_var_prod`.`id_tipo_precio` AS `Tipo Precio` from (((`tbl_prods_x_orden` left join `tbl_prods_orden_opciones` on(`tbl_prods_orden_opciones`.`id_prod_x_orden` = `tbl_prods_x_orden`.`id_prod_x_orden`)) left join `tbl_prods_variantes` on(`tbl_prods_variantes`.`id_producto` = `tbl_prods_x_orden`.`int_producto_id` and `tbl_prods_variantes`.`id_variante` = `tbl_prods_orden_opciones`.`id_variante_platillo`)) left join `tbl_costos_extra_var_prod` on(`tbl_prods_variantes`.`id_prods_variantes` = `tbl_costos_extra_var_prod`.`id_producto_variante`)) where `tbl_prods_x_orden`.`bool_activo` = 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_datos_personal_logins`
--

/*!50001 DROP TABLE IF EXISTS `vw_datos_personal_logins`*/;
/*!50001 DROP VIEW IF EXISTS `vw_datos_personal_logins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_datos_personal_logins` AS select `tbl_usuarios_sistema`.`id_personal` AS `ID`,`tbl_personal`.`chr_nombre_persona` AS `Nombre`,`tbl_personal`.`chr_apellidos` AS `Apellidos`,`tbl_personal`.`chr_CURP` AS `CURP`,`tbl_personal`.`chr_telefono` AS `Telefono`,`tbl_puestos`.`chr_puesto` AS `Puesto`,`tbl_usuarios`.`chr_login` AS `Login`,`tbl_usuarios`.`id_usuario` AS `IDS`,`tbl_usuarios`.`chr_password` AS `PData`,`tbl_status`.`chr_status` AS `Tipo`,`tbl_personal`.`bit_activo` AS `Activo` from ((((`tbl_personal` left join `tbl_puestos` on(`tbl_personal`.`int_puesto` = `tbl_puestos`.`id_puesto`)) left join `tbl_usuarios_sistema` on(`tbl_personal`.`id_personal` = `tbl_usuarios_sistema`.`id_personal`)) left join `tbl_usuarios` on(`tbl_usuarios`.`id_usuario` = `tbl_usuarios_sistema`.`id_usuario`)) left join `tbl_status` on(`tbl_usuarios`.`int_status` = `tbl_status`.`id_status`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_ordenes_tickets`
--

/*!50001 DROP TABLE IF EXISTS `vw_info_ordenes_tickets`*/;
/*!50001 DROP VIEW IF EXISTS `vw_info_ordenes_tickets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_ordenes_tickets` AS select `tbl_ordenes`.`id_orden_id` AS `id_orden_id`,`tbl_ordenes_cerradas`.`id_orden_cerrada` AS `id_orden_cerrada`,`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden` AS `dt_horafecha_cierre_orden`,`tbl_ordenes_cerradas`.`fl_total` AS `total`,`tbl_consecutivo`.`chr_consecutivo` AS `chr_consecutivo`,`tbl_ticket_cons`.`chr_ticketConsecutivo` AS `chr_ticketConsecutivo`,`tbl_ordenes_cerradas`.`int_lvl_report` AS `int_lvl_report`,`tbl_ordenes`.`chr_status_orden` AS `chr_status_orden` from (((`tbl_ordenes` left join `tbl_ordenes_cerradas` on(`tbl_ordenes`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`)) left join `tbl_consecutivo` on(`tbl_ordenes`.`int_consecutivo` = `tbl_consecutivo`.`id_consecutivo`)) left join `tbl_ticket_cons` on(`tbl_ticket_cons`.`id_ticketNrConsecutivo` = `tbl_ordenes_cerradas`.`id_ticket_IDNr`)) */;
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
/*!50001 VIEW `vw_insumos_usados_x_orden` AS select `tbl_ordenes`.`id_orden_id` AS `ID`,`tbl_ordenes`.`int_consecutivo` AS `Orden`,`tbl_ordenes`.`dt_horafecha_orden` AS `HoraFecha`,`tbl_insumos`.`id_insumo` AS `InsumoID`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,`tbl_prods_x_orden`.`int_cantidad` * `tbl_insumos_x_platillo`.`int_cantidad` AS `Usado`,`tbl_ordenes`.`chr_status_orden` AS `Estado` from ((((`tbl_ordenes` left join `tbl_prods_x_orden` on(`tbl_prods_x_orden`.`int_orden_id` = `tbl_ordenes`.`id_orden_id`)) left join `tbl_productos` on(`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`)) left join `tbl_insumos_x_platillo` on(`tbl_insumos_x_platillo`.`id_producto` = `tbl_productos`.`id_producto`)) left join `tbl_insumos` on(`tbl_insumos`.`id_insumo` = `tbl_insumos_x_platillo`.`id_insumo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_insumos_x_platillo`
--

/*!50001 DROP TABLE IF EXISTS `vw_insumos_x_platillo`*/;
/*!50001 DROP VIEW IF EXISTS `vw_insumos_x_platillo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_insumos_x_platillo` AS select `tbl_insumos_x_platillo`.`id_insumo_x_platillo` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,`tbl_insumos_x_platillo`.`int_cantidad` AS `Cantidad` from ((`tbl_productos` left join `tbl_insumos_x_platillo` on(`tbl_insumos_x_platillo`.`id_producto` = `tbl_productos`.`id_producto`)) left join `tbl_insumos` on(`tbl_insumos_x_platillo`.`id_insumo` = `tbl_insumos`.`id_insumo`)) */;
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
/*!50001 VIEW `vw_inventarios_fecha` AS select `tbl_inventario`.`id_inventario_id` AS `InvID`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,`tbl_inventario`.`int_cantidad` AS `Cantidad`,`tbl_inventario`.`dt_fecha_insumo` AS `Fecha` from (`tbl_inventario` left join `tbl_insumos` on(`tbl_inventario`.`id_insumo_id` = `tbl_insumos`.`id_insumo`)) */;
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
/*!50001 VIEW `vw_opciones_platillos_ticket` AS select `tbl_prods_orden_opciones`.`id_prod_orden_opcion` AS `ID`,`tbl_prods_orden_opciones`.`id_prod_x_orden` AS `IDPO`,`tbl_variantes_platillos`.`chr_imprimir` AS `TxtTicket` from (`tbl_prods_orden_opciones` left join `tbl_variantes_platillos` on(`tbl_prods_orden_opciones`.`id_variante_platillo` = `tbl_variantes_platillos`.`id_variante_pl`)) */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orden_prods_precio` AS select `tbl_prods_x_orden`.`int_orden_id` AS `Orden`,`tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPO`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`id_producto` AS `IDPR`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_prods_x_orden`.`int_tipo_precio` AS `Tipo Precio`,`tbl_consecutivo`.`chr_consecutivo` AS `OrdenNR`,`tbl_ordenes`.`dt_horafecha_orden` AS `HoraFecha`,`tbl_prods_x_orden`.`bool_activo` AS `Activo`,`tbl_prods_x_orden`.`bool_impreso` AS `Impreso` from ((((`tbl_prods_x_orden` left join `tbl_ordenes` on(`tbl_ordenes`.`id_orden_id` = `tbl_prods_x_orden`.`int_orden_id`)) left join `tbl_productos` on(`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`)) left join `tbl_precios_productos` on(`tbl_prods_x_orden`.`int_producto_id` = `tbl_precios_productos`.`id_producto` and `tbl_prods_x_orden`.`int_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`)) left join `tbl_consecutivo` on(`tbl_ordenes`.`int_consecutivo` = `tbl_consecutivo`.`id_consecutivo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ordenes_x_mesero`
--

/*!50001 DROP TABLE IF EXISTS `vw_ordenes_x_mesero`*/;
/*!50001 DROP VIEW IF EXISTS `vw_ordenes_x_mesero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ordenes_x_mesero` AS select `tbl_ordenes_personal`.`id_orden_id` AS `Orden`,`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden` AS `Cierre`,`tbl_ordenes_cerradas`.`fl_total` AS `Total`,`tbl_mesas`.`chr_mesa` AS `Mesa`,`tbl_ordenes`.`chr_status_orden` AS `Estado`,`tbl_personal`.`chr_nombre_persona` AS `Atendio` from ((((`tbl_ordenes_personal` left join `tbl_personal` on(`tbl_ordenes_personal`.`id_personal` = `tbl_personal`.`id_personal`)) left join `tbl_ordenes_cerradas` on(`tbl_ordenes_personal`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`)) left join `tbl_ordenes` on(`tbl_ordenes_personal`.`id_orden_id` = `tbl_ordenes`.`id_orden_id`)) left join `tbl_mesas` on(`tbl_ordenes`.`int_mesa` = `tbl_mesas`.`id_mesa_id`)) */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_precios_productos` AS select `tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPXO`,`tbl_prods_x_orden`.`int_orden_id` AS `ID Orden`,`tbl_productos`.`id_producto` AS `ID Prod`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_prods_x_orden`.`int_tipo_precio` AS `Tipo Precio`,`tbl_precios_productos`.`dat_fecha_precio_activo` AS `Fecha Validez`,`tbl_precios_productos`.`bit_activo` AS `Activo` from ((`tbl_prods_x_orden` left join `tbl_productos` on(`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`)) left join `tbl_precios_productos` on(`tbl_prods_x_orden`.`int_producto_id` = `tbl_precios_productos`.`id_producto` and `tbl_prods_x_orden`.`int_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_prods_x_orden`
--

/*!50001 DROP TABLE IF EXISTS `vw_prods_x_orden`*/;
/*!50001 DROP VIEW IF EXISTS `vw_prods_x_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_prods_x_orden` AS select `tbl_prods_x_orden`.`int_orden_id` AS `Orden`,`tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPO`,`tbl_productos`.`id_producto` AS `ID Prod`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_tipos_precios`.`id_tipo_precio` AS `Tipo Precio`,`tbl_ordenes`.`dt_horafecha_orden` AS `HoraFecha`,`tbl_prods_x_orden`.`bool_activo` AS `Activo`,`tbl_prods_x_orden`.`bool_impreso` AS `Impreso` from ((((`tbl_prods_x_orden` left join `tbl_productos` on(`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`)) left join `tbl_precio_tipo_ordenes` on(`tbl_prods_x_orden`.`int_orden_id` = `tbl_precio_tipo_ordenes`.`id_orden`)) left join `tbl_tipos_precios` on(`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precio_tipo_ordenes`.`id_tipo_precio`)) left join `tbl_ordenes` on(`tbl_ordenes`.`id_orden_id` = `tbl_prods_x_orden`.`int_orden_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_categoria`
--

/*!50001 DROP TABLE IF EXISTS `vw_productos_categoria`*/;
/*!50001 DROP VIEW IF EXISTS `vw_productos_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_categoria` AS select `tbl_productos`.`id_producto` AS `id_producto`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_productos`.`int_activo` AS `Activo` from (`tbl_productos` left join `tbl_categorias` on(`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`)) */;
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
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_catprecio` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Desc`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`chr_desc_cat` AS `Tooltip`,`tbl_categorias`.`id_categoria` AS `CatID`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `Tipo`,`tbl_tipos_precios`.`id_tipo_precio` AS `IDTipo`,`tbl_productos`.`int_activo` AS `Activo` from (((`tbl_productos` left join `tbl_categorias` on(`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`)) left join `tbl_precios_productos` on(`tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto` and `tbl_precios_productos`.`bit_activo` = 1)) left join `tbl_tipos_precios` on(`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`)) */;
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
/*!50001 VIEW `vw_products_infoCat` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Descripcion`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`chr_desc_cat` AS `Tooltip`,`tbl_productos`.`int_activo` AS `Activo` from (`tbl_productos` left join `tbl_categorias` on(`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_variantes_platillos_x_orden`
--

/*!50001 DROP TABLE IF EXISTS `vw_variantes_platillos_x_orden`*/;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_platillos_x_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_variantes_platillos_x_orden` AS select `tbl_ordenes`.`id_orden_id` AS `ID Orden`,`tbl_productos`.`id_producto` AS `ID Producto`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_variantes_platillos`.`chr_variante_nombre` AS `Variante`,`tbl_prods_x_orden`.`bool_activo` AS `Activo` from ((((`tbl_ordenes` left join `tbl_prods_x_orden` on(`tbl_prods_x_orden`.`int_orden_id` = `tbl_ordenes`.`id_orden_id`)) left join `tbl_productos` on(`tbl_productos`.`id_producto` = `tbl_prods_x_orden`.`int_producto_id`)) left join `tbl_prods_orden_opciones` on(`tbl_prods_orden_opciones`.`id_prod_x_orden` = `tbl_prods_x_orden`.`id_prod_x_orden`)) left join `tbl_variantes_platillos` on(`tbl_variantes_platillos`.`id_variante_pl` = `tbl_prods_orden_opciones`.`id_variante_platillo`)) */;
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
/*!50001 VIEW `vw_variantes_x_categoria` AS select `tbl_variantes_categorias`.`id_variante_categoria` AS `ID`,`tbl_variantes_categorias`.`id_catgoria` AS `IDCAT`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_variantes_platillos`.`id_variante_pl` AS `IDVAR`,`tbl_variantes_platillos`.`chr_variante_nombre` AS `Variante` from ((`tbl_variantes_categorias` left join `tbl_categorias` on(`tbl_variantes_categorias`.`id_catgoria` = `tbl_categorias`.`id_categoria`)) left join `tbl_variantes_platillos` on(`tbl_variantes_platillos`.`id_variante_pl` = `tbl_variantes_categorias`.`id_variante_platillo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_variantes_x_platillo`
--

/*!50001 DROP TABLE IF EXISTS `vw_variantes_x_platillo`*/;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_x_platillo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_variantes_x_platillo` AS select `tbl_prods_variantes`.`id_producto` AS `ID Producto`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_variantes_platillos`.`chr_variante_nombre` AS `Variante`,`tbl_variantes_platillos`.`chr_variante_descripcion` AS `Desc`,`tbl_prods_variantes`.`id_variante` AS `ID Variante`,`tbl_prods_variantes`.`id_prods_variantes` AS `IDProdVar`,`tbl_categorias`.`id_categoria` AS `ID Cat`,ifnull(`tbl_costos_extra_var_prod`.`fl_costo_extra`,'0') AS `Costo Extra`,ifnull(`tbl_costos_extra_var_prod`.`id_tipo_precio`,'1') AS `Tipo Precio`,`tbl_variantes_platillos`.`fl_ordenar` AS `Ordenar` from ((((`tbl_productos` left join `tbl_prods_variantes` on(`tbl_prods_variantes`.`id_producto` = `tbl_productos`.`id_producto`)) left join `tbl_variantes_platillos` on(`tbl_prods_variantes`.`id_variante` = `tbl_variantes_platillos`.`id_variante_pl`)) left join `tbl_categorias` on(`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`)) left join `tbl_costos_extra_var_prod` on(`tbl_costos_extra_var_prod`.`id_producto_variante` = `tbl_prods_variantes`.`id_prods_variantes`)) */;
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

-- Dump completed on 2020-11-22 19:36:12
