-- MySQL dump 10.17  Distrib 10.3.22-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_tacosRoy
-- ------------------------------------------------------
-- Server version	10.3.22-MariaDB-1ubuntu1

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
INSERT INTO `tbl_categorias` VALUES (1,'Sin Categoria','Para productos sin categoria',1,1,1),(2,'Tacos al Vapor','Tacos al vapor',2,1,1),(3,'Tacos Ahogados','Tacos ahogados en salsa',3,1,1),(4,'Tacos a la plancha','Tacos preparados a la plancha',4,1,1),(5,'A la Plancha','Productos elaborados en plancha',5,1,1),(6,'Preparados','Productos preparados varios (Pozole, Queso fundido, etc).',6,1,1),(7,'Bebidas','Bebidas frías o calientes',7,1,1),(8,'Postres','Postres y alimentos dulces',8,1,1),(9,'Tostadas','Tostadas con diferentes carnes e ingredientes',4.5,1,1),(10,'Pozole','Pozoles con diferentes tipos de carne',6.5,1,1),(11,'Para llevar','Costos extra ordenes para llevar',9,1,1),(12,'A Domicilio','Costos extra ordenes a domicilio',10,1,1),(13,'Combos','Combos disponibles',8.5,1,1),(14,'Producto Combo','Productos pertenecientes a un combo',11,0,1),(15,'Ordenes de Carne','Ordenes de carne de res, cerdo o combinada, 1kg, 1/2 kg o 300 gr.',12,1,1);
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
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `chr_telefono_UNIQUE` (`chr_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clientes`
--

LOCK TABLES `tbl_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_clientes` DISABLE KEYS */;
INSERT INTO `tbl_clientes` VALUES (1,'Carlos','Revilla Maldonado','951-2987896','Morelos','1402','Altos','N/A','Centro','68000','Oaxaca','a 2 cuadras mercado merced casa blanca con azul'),(2,'Pedrito','Fernandez','951-1234567','Calle Principal','201','N/A','N/A','Centro','68000','Oaxaca','Entre la casa blanca y la verde'),(3,'Doctor','Chunga','951-5555555','Abasolo','420','N/A','N/A','Centro','68000','Oaxaca','Casa con perro echado al frente');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_combos`
--

LOCK TABLES `tbl_combos` WRITE;
/*!40000 ALTER TABLE `tbl_combos` DISABLE KEYS */;
INSERT INTO `tbl_combos` VALUES (1,'Paquete de Todo un Poco',112,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consecutivo`
--

LOCK TABLES `tbl_consecutivo` WRITE;
/*!40000 ALTER TABLE `tbl_consecutivo` DISABLE KEYS */;
INSERT INTO `tbl_consecutivo` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50),(51,51),(52,52),(53,53),(54,54),(55,55),(56,56),(57,57),(58,58),(59,59),(60,60),(61,61),(62,62),(63,63),(64,64),(65,65),(66,66),(67,67),(68,68),(69,69),(70,70),(71,71),(72,72),(73,73),(74,74),(75,75),(76,76),(77,77),(78,78),(79,79),(80,80),(81,81),(82,82),(83,83),(84,84),(85,85),(86,86),(87,87),(88,88),(89,89),(90,90),(91,91),(92,92),(93,93),(94,94),(95,95),(96,96),(97,97),(98,98),(99,99),(100,100),(101,101),(102,102),(103,103),(104,104),(105,105),(106,106),(107,107),(108,108),(109,109),(110,110),(111,111),(112,112),(113,113),(114,114),(115,115),(116,116),(117,117),(118,118),(119,119),(120,120),(121,121),(122,122),(123,123),(124,124),(125,125),(126,126),(127,127),(128,128),(129,129),(130,130),(131,131);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_control_fechas`
--

LOCK TABLES `tbl_control_fechas` WRITE;
/*!40000 ALTER TABLE `tbl_control_fechas` DISABLE KEYS */;
INSERT INTO `tbl_control_fechas` VALUES (1,'2020-09-27 00:17:28','2020-09-27 00:17:28',NULL,'12345',1),(3,'2020-09-27 02:51:37','2020-09-27 02:51:37','2020-09-27 18:00:00','$1$tacosroy$DAvVuOft3l/kF2Ph0BbAk.',1),(4,'2020-10-07 18:11:10','2020-10-07 18:11:10',NULL,'$1$tacosroy$R8A6EM3nniTNAdPzxjSyD.',1),(5,'2020-10-08 00:16:05','2020-10-08 00:16:05',NULL,'$1$tacosroy$RE.1JcIBU.IlT30Qri/5B0',1),(6,'2020-10-10 01:42:16','2020-10-10 01:42:16',NULL,'$1$tacosroy$6WFEjBpPBmDT8Uaj3vrol.',1),(7,'2020-10-12 15:07:04','2020-10-12 15:07:04',NULL,'$1$tacosroy$Gm5hmEo/MJqNsH/eA0cMZ0',1),(8,'2020-10-13 03:22:37','2020-10-13 03:22:37',NULL,'$1$tacosroy$yJj2EpRU7/vezulAD7kY/1',1),(9,'2020-10-17 02:11:56','2020-10-17 02:11:56',NULL,'$1$tacosroy$ugWXOq9lCwGotPF35Bvpe1',1),(10,'2020-10-22 00:12:08','2020-10-22 00:12:08',NULL,'$1$tacosroy$N0/i7CQglTTBnkbYyyujF.',1);
/*!40000 ALTER TABLE `tbl_control_fechas` ENABLE KEYS */;
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
INSERT INTO `tbl_datos_sucursal` VALUES (1,'Tacos Roy Matriz','Trujano 201','Col. Centro','CP. 68000, Oaxaca, Oaxaca.','9511722708','000000000',0),(2,'asdfasd','asdfasdf','asdfasd','asdfasdf','3216545','321654',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes`
--

LOCK TABLES `tbl_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes` DISABLE KEYS */;
INSERT INTO `tbl_ordenes` VALUES (1,'2016-03-25 02:11:41',1,1,'PAGADA',1),(11,'2016-03-25 02:12:36',5,17,'PAGADA',1),(12,'2016-03-25 02:10:34',8,12,'PAGADA',1),(13,'2016-03-25 02:14:37',6,13,'PAGADA',1),(14,'2016-07-28 18:40:56',7,14,'Cancelada',1),(15,'2016-03-25 02:11:41',6,15,'PAGADA',1),(16,'2016-03-12 19:16:49',7,16,'PAGADA',1),(17,'2016-03-25 02:11:41',8,17,'PAGADA',1),(18,'2016-03-15 14:54:34',9,18,'PAGADA',1),(19,'2016-03-15 14:55:40',5,19,'PAGADA',1),(20,'2016-03-15 14:56:50',3,20,'PAGADA',1),(21,'2016-03-16 20:15:08',1,21,'PAGADA',1),(22,'2016-03-25 02:09:30',12,22,'PAGADA',1),(23,'2016-03-24 23:40:47',1,23,'PAGADA',1),(24,'2016-03-25 02:18:00',7,24,'PAGADA',1),(25,'2016-03-25 02:28:00',4,25,'PAGADA',1),(26,'2016-03-28 02:23:00',9,26,'PAGADA',1),(27,'2016-03-28 02:24:00',4,27,'PAGADA',1),(28,'2016-03-28 02:27:00',5,28,'PAGADA',1),(29,'2016-03-28 02:30:00',3,29,'PAGADA',1),(30,'2016-03-28 02:31:00',8,30,'PAGADA',1),(31,'2016-03-28 02:33:00',4,31,'PAGADA',1),(32,'2016-03-28 02:38:00',4,32,'PAGADA',1),(33,'2016-03-28 02:41:00',3,33,'PAGADA',1),(34,'2016-03-28 02:42:00',5,34,'PAGADA',1),(35,'2016-03-28 02:44:00',7,35,'PAGADA',1),(36,'2016-03-28 02:47:00',6,36,'PAGADA',1),(37,'2016-03-28 02:49:00',5,37,'PAGADA',1),(38,'2016-03-28 02:56:00',2,38,'PAGADA',1),(39,'2016-03-28 02:58:00',9,39,'PAGADA',1),(40,'2016-03-28 03:00:00',2,40,'PAGADA',1),(41,'2016-03-28 03:03:00',5,41,'PAGADA',1),(42,'2016-03-28 03:06:00',5,42,'PAGADA',1),(43,'2016-03-28 03:07:00',3,43,'PAGADA',1),(44,'2016-03-28 03:09:00',8,44,'PAGADA',1),(45,'2016-03-28 03:11:00',1,45,'PAGADA',1),(46,'2016-03-28 03:12:00',4,46,'PAGADA',1),(47,'2016-03-28 18:53:00',4,47,'PAGADA',1),(48,'2016-03-28 18:59:00',1,48,'PAGADA',1),(49,'2016-03-28 19:01:00',5,49,'PAGADA',1),(50,'2016-03-28 19:03:00',5,50,'PAGADA',1),(51,'2016-03-28 19:31:00',5,51,'PAGADA',1),(52,'2016-03-28 19:35:00',3,52,'PAGADA',1),(53,'2016-03-28 19:39:00',5,53,'PAGADA',1),(54,'2016-03-28 20:00:00',10,54,'PAGADA',1),(55,'2016-03-29 19:06:00',12,55,'PAGADA',1),(56,'2016-03-29 19:14:00',11,56,'PAGADA',1),(57,'2016-03-29 19:20:00',2,57,'PAGADA',1),(58,'2016-03-29 19:24:00',5,58,'',1),(59,'2016-03-29 19:25:00',6,59,'',1),(60,'2016-03-29 19:32:00',10,60,'PAGADA',1),(61,'2016-03-29 20:00:00',8,61,'PAGADA',1),(62,'2016-03-29 20:05:00',1,62,'PAGADA',1),(63,'2016-04-11 23:11:55',4,63,'Cancelada',1),(64,'2016-03-31 01:46:00',10,64,'',1),(65,'2016-04-04 00:01:00',3,65,'PAGADA',1),(66,'2016-04-04 00:02:00',2,66,'PAGADA',1),(67,'2016-04-06 19:45:00',16,70,'PAGADA',1),(68,'2016-04-11 20:45:00',7,72,'',1),(69,'2016-04-11 23:03:36',1,73,'Cancelada',1),(70,'2016-04-11 22:34:56',7,74,'',1),(71,'2016-04-11 21:05:00',6,75,'Descuento',1),(72,'2016-04-11 23:13:00',13,76,'',1),(73,'2016-04-11 23:14:00',11,77,'Descuento',1),(74,'2016-04-15 14:52:20',16,78,'Cancelada',1),(75,'2016-04-18 19:56:00',16,79,'',1),(76,'2016-04-18 20:07:00',9,80,'',1),(77,'2016-04-18 20:08:00',15,81,'',1),(78,'2016-04-20 23:06:00',8,82,'',1),(79,'2016-05-28 17:19:00',8,83,'',1),(80,'2016-05-28 18:37:00',3,84,'Efectivo',1),(81,'2016-06-27 20:04:00',8,85,'Efectivo',1),(82,'2016-06-28 18:41:00',16,86,'',1),(83,'2020-10-08 00:23:35',2,87,'CANCELADA',1),(84,'2016-09-12 17:46:00',10,88,'',1),(85,'2020-09-03 20:03:00',9,89,'',1),(86,'2020-09-15 17:09:00',11,90,'Efectivo',1),(87,'2020-09-18 18:32:00',17,91,'',1),(88,'2020-09-19 20:00:38',16,92,'CANCELADA',1),(89,'2020-09-19 20:01:00',15,93,'',1),(90,'2020-09-19 20:23:00',10,94,'',1),(91,'2020-09-23 20:43:55',8,95,'CANCELADA',1),(92,'2020-09-24 20:43:00',17,96,'',1),(104,'2020-10-07 18:14:18',15,108,'CANCELADA',4),(105,'2020-10-07 18:16:29',3,109,'CANCELADA',4),(106,'2020-10-07 18:19:34',9,110,'CANCELADA',4),(107,'2020-10-07 18:31:06',13,111,'CANCELADA',4),(108,'2020-10-07 18:25:00',5,112,'Efectivo',4),(109,'2020-10-08 20:02:00',7,113,'',5),(110,'2020-10-10 01:42:00',13,114,'',6),(111,'2020-10-17 15:46:00',9,115,'',9),(112,'2020-10-17 16:49:00',2,116,'Efectivo',9),(113,'2020-10-17 17:00:00',8,117,'',9),(114,'2020-10-17 17:04:00',10,118,'',9),(115,'2020-10-17 17:08:00',17,119,'',9),(116,'2020-10-17 17:13:00',2,120,'',9),(117,'2020-10-17 17:18:00',10,121,'',9),(118,'2020-10-22 00:43:00',17,122,'',10),(119,'2020-10-22 00:48:00',17,123,'',10),(120,'2020-10-22 00:52:00',17,124,'',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_cerradas`
--

LOCK TABLES `tbl_ordenes_cerradas` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_cerradas` DISABLE KEYS */;
INSERT INTO `tbl_ordenes_cerradas` VALUES (1,23,'2016-03-25 05:40:47',103,0,'Nada',1,1,1),(2,22,'2016-03-25 08:09:30',328,0,'Nada',0,1,1),(3,12,'2016-03-25 08:10:34',195,0,'Nada',0,1,1),(4,11,'2016-03-25 08:12:36',132,0,'Nada',1,1,1),(5,13,'2016-03-25 08:14:37',50,0,'Nada',1,1,1),(6,24,'2016-03-25 08:19:26',142,0,'Nada',1,1,1),(7,19,'2016-03-25 08:20:40',30,0,'Nada',1,1,1),(8,17,'2016-03-25 08:21:01',105,0,'Nada',1,1,1),(9,25,'2016-03-25 08:29:03',200,0,'Nada',0,1,1),(10,21,'2016-03-28 08:19:25',201,0,'Nada',1,1,1),(11,20,'2016-03-28 08:22:33',170,0,'Nada',1,1,1),(12,26,'2016-03-28 08:24:21',175,0,'Nada',1,1,1),(13,27,'2016-03-28 08:25:37',287,0,'Nada',1,1,1),(14,28,'2016-03-28 08:28:14',175,0,'Nada',1,1,1),(15,29,'2016-03-28 08:30:38',271,0,'Nada',1,1,1),(16,30,'2016-03-28 08:31:54',200,0,'Nada',1,1,1),(17,31,'2016-03-28 08:34:25',267,0,'Nada',1,1,1),(18,16,'2016-03-28 08:35:59',225,0,'Nada',1,1,1),(19,32,'2016-03-28 08:38:40',352,0,'Nada',1,1,1),(20,33,'2016-03-28 08:41:36',357,0,'Nada',1,1,1),(21,34,'2016-03-28 08:42:54',310,0,'Nada',1,1,1),(22,35,'2016-03-28 08:44:47',202,0,'Nada',1,1,1),(23,1,'2016-03-28 08:46:10',90,0,'Nada',1,1,1),(24,36,'2016-03-28 08:47:35',307,0,'Nada',1,1,1),(25,37,'2016-03-28 08:50:03',292,0,'Nada',1,1,1),(26,38,'2016-03-28 08:56:54',329,0,'Nada',1,1,1),(27,39,'2016-03-28 08:59:19',344,0,'Nada',1,1,1),(28,40,'2016-03-28 09:01:20',350,0,'Nada',1,1,1),(29,18,'2016-03-28 09:02:28',195,0,'Nada',1,1,1),(30,41,'2016-03-28 09:04:00',353,0,'Nada',1,1,1),(31,42,'2016-03-28 09:07:00',312,0,'Nada',1,1,1),(32,43,'2016-03-28 09:08:09',302,0,'Nada',1,1,1),(33,44,'2016-03-28 09:10:09',417,0,'Nada',1,1,1),(34,45,'2016-03-28 09:11:53',382,0,'Nada',1,1,1),(35,46,'2016-03-28 09:13:37',342,0,'Nada',1,1,1),(36,49,'2016-03-29 01:03:13',130,0,'Nada',0,1,1),(37,50,'2016-03-29 01:04:23',297,0,'Nada',0,1,1),(38,51,'2016-03-29 06:08:55',84,0,'Efectivo',1,1,1),(39,54,'2016-03-30 01:04:45',98,0,'Efectivo',1,1,1),(40,55,'2016-03-30 01:07:34',84,0,'Efectivo',1,1,1),(41,53,'2016-03-30 01:12:54',327,0,'Efectivo',1,1,1),(42,56,'2016-03-30 01:18:24',486,0,'Efectivo',1,1,1),(43,60,'2016-03-30 01:49:54',234,0,'Efectivo',1,1,1),(44,57,'2016-03-30 01:52:36',170,0,'Efectivo',1,1,1),(45,15,'2016-03-30 01:55:46',219,0,'Efectivo',1,1,1),(46,61,'2016-03-30 02:01:05',269,0,'Efectivo',1,1,1),(47,52,'2016-03-30 02:03:51',365,0,'Efectivo',0,1,1),(48,62,'2016-03-30 02:06:08',205,0,'Efectivo',1,1,1),(49,65,'2016-04-07 00:35:55',284,0,'Efectivo',0,2,1),(50,47,'2016-04-11 03:49:04',223,0,'Efectivo',1,7,1),(51,48,'2016-04-11 03:54:40',207,0,'Efectivo',0,8,1),(52,67,'2016-04-11 04:10:49',284,0,'Efectivo',0,9,1),(53,66,'2016-04-11 04:13:22',158,0,'Efectivo',1,10,1),(55,69,'2016-04-10 05:00:00',0,0,'CANCELADA',1,1,1),(58,63,'2016-04-12 04:12:11',0,0,'CANCELADA',0,13,1),(60,73,'2016-04-12 04:29:03',47,0,'Descuento',1,15,1),(61,71,'2016-04-21 04:05:57',105.5,0,'Descuento',1,16,1),(62,78,'2016-05-28 20:19:01',268,0,'Efectivo',0,17,1),(63,77,'2016-05-28 20:21:35',130,0,'Efectivo',0,18,1),(64,76,'2016-05-28 20:23:45',155,0,'Efectivo',0,19,1),(65,75,'2016-05-28 20:24:30',205,0,'Efectivo',1,20,1),(66,72,'2016-05-28 20:25:36',45,0,'Efectivo',1,21,1),(67,79,'2016-06-03 00:45:27',244,0,'Efectivo',0,22,1),(68,70,'2016-06-03 00:46:22',177,0,'Efectivo',0,23,1),(69,68,'2016-06-03 00:50:18',91,0,'Efectivo',1,24,1),(70,64,'2016-06-23 18:58:13',93,0,'',1,25,1),(71,58,'2016-06-23 18:59:45',108,0,'',1,26,1),(72,59,'2016-06-28 00:55:24',130,0,'',1,27,1),(73,81,'2016-07-28 23:42:41',297,0,'Efectivo',1,28,1),(74,82,'2016-07-28 23:51:56',465,0,'',0,29,1),(75,84,'2016-09-12 22:48:38',145,0,'',0,30,1),(76,80,'2020-09-04 01:00:28',376,0,'Efectivo',1,31,1),(77,88,'2020-09-20 01:00:50',155,0,'CANCELADA',1,32,1),(78,87,'2020-09-20 01:01:14',155,0,'',1,33,1),(79,91,'2020-09-24 01:44:00',0,0,'CANCELADA',1,34,1),(80,104,'2020-10-07 23:14:23',0,0,'CANCELADA',1,35,4),(81,105,'2020-10-07 23:16:31',0,0,'CANCELADA',1,36,4),(82,106,'2020-10-07 23:19:37',0,0,'CANCELADA',1,37,4),(83,107,'2020-10-07 23:31:09',0,0,'CANCELADA',1,38,4),(84,83,'2020-10-08 05:23:38',0,0,'CANCELADA',1,39,5),(85,85,'2020-10-08 06:12:07',39,0,'',1,40,5),(86,86,'2020-10-08 06:23:13',155,0,'Efectivo',1,41,5),(87,90,'2020-10-08 06:24:30',179,0,'',1,42,5),(88,108,'2020-10-09 00:47:18',54,0,'Efectivo',1,43,5),(89,89,'2020-10-09 01:01:22',128,0,'',1,44,5),(90,110,'2020-10-12 20:08:07',92,0,'',1,45,7),(91,109,'2020-10-17 08:34:07',250,0,'',1,46,9),(92,92,'2020-10-17 20:45:31',195,0,'',1,47,9),(93,111,'2020-10-17 20:49:59',39,0,'',1,48,9),(94,112,'2020-10-17 21:52:52',77,0,'Efectivo',1,49,9),(95,113,'2020-10-17 22:03:31',139,0,'',1,50,9),(96,114,'2020-10-17 22:06:20',210,0,'',1,51,9),(97,115,'2020-10-17 22:09:27',277,0,'',1,52,9),(98,116,'2020-10-17 22:14:37',222,0,'',1,53,9),(99,117,'2020-10-17 22:20:26',266,0,'',1,54,9),(100,119,'2020-10-22 05:49:27',130,0,'',1,55,10),(101,119,'2020-10-22 05:49:35',130,0,'',1,56,10),(102,118,'2020-10-22 05:51:55',196,0,'',1,57,10),(103,120,'2020-10-22 05:53:13',345,0,'',1,58,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_personal`
--

LOCK TABLES `tbl_ordenes_personal` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_personal` DISABLE KEYS */;
INSERT INTO `tbl_ordenes_personal` VALUES (1,14,3),(2,50,3),(3,51,3),(4,52,2),(5,53,1),(6,54,3),(29,108,1),(30,109,1),(31,110,1),(32,111,1),(33,112,1),(34,113,1),(35,114,3),(36,115,1),(37,116,2),(38,117,3),(39,118,1),(40,119,1),(41,120,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_precio_tipo_ordenes`
--

LOCK TABLES `tbl_precio_tipo_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_precio_tipo_ordenes` DISABLE KEYS */;
INSERT INTO `tbl_precio_tipo_ordenes` VALUES (1,1,1),(2,11,1),(3,12,1),(4,13,1),(5,14,1),(6,15,1),(7,16,1),(8,17,1),(9,18,1),(10,19,1),(11,20,1),(12,21,1),(13,22,1),(14,23,1),(15,24,1),(16,25,1),(17,26,1),(18,27,1),(19,28,1),(20,29,1),(21,30,1),(22,31,1),(23,32,1),(24,33,1),(25,34,1),(26,35,1),(27,36,1),(28,37,1),(29,38,1),(30,39,1),(31,40,1),(32,41,1),(33,42,1),(34,43,1),(35,44,1),(36,45,1),(37,46,1),(38,47,1),(39,48,1),(40,49,1),(41,50,1),(42,51,1),(43,52,1),(44,53,1),(45,54,1),(46,55,1),(47,56,1),(48,57,1),(49,58,1),(50,59,1),(51,60,1),(52,61,1),(53,62,1),(54,63,1),(55,64,1),(56,65,1),(57,66,1),(58,67,1),(59,68,1),(60,69,1),(61,70,1),(62,71,1),(63,72,1),(64,73,1),(65,74,1),(66,75,1),(67,76,1),(68,77,1),(69,78,1),(70,79,1),(71,80,1),(72,81,1),(73,82,1),(74,83,1),(75,84,1),(76,85,1),(77,86,1),(78,87,1),(79,88,1),(80,89,1),(81,90,1),(82,91,1),(84,92,2),(97,108,1),(98,109,1),(99,110,1),(100,111,1),(101,112,1),(102,113,1),(103,114,1),(104,115,2),(105,116,1),(106,117,1),(107,118,2),(108,119,2),(109,120,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_precios_productos`
--

LOCK TABLES `tbl_precios_productos` WRITE;
/*!40000 ALTER TABLE `tbl_precios_productos` DISABLE KEYS */;
INSERT INTO `tbl_precios_productos` VALUES (1,5,11.00,1,0,'2020-09-15 00:00:00'),(2,6,10.00,1,0,'2020-09-15 00:00:00'),(3,0,10.00,1,1,'2020-09-15 00:00:00'),(4,7,10.00,1,0,'2020-09-15 00:00:00'),(5,8,10.00,1,0,'2020-09-15 00:00:00'),(6,9,10.00,1,0,'2020-09-15 00:00:00'),(7,10,10.00,1,0,'2020-09-15 00:00:00'),(8,11,10.00,1,0,'2020-09-15 00:00:00'),(9,12,10.00,1,0,'2020-09-15 00:00:00'),(10,13,10.00,1,1,'2020-09-15 00:00:00'),(11,14,12.00,1,1,'2020-09-15 00:00:00'),(12,15,10.00,1,1,'2020-09-15 00:00:00'),(13,16,15.00,1,1,'2020-09-15 00:00:00'),(14,17,15.00,1,1,'2020-09-15 00:00:00'),(15,18,80.00,1,0,'2020-09-15 00:00:00'),(16,19,80.00,1,0,'2020-09-15 00:00:00'),(17,20,75.00,1,0,'2020-09-15 00:00:00'),(18,21,80.00,1,0,'2020-09-15 00:00:00'),(19,22,75.00,1,0,'2020-09-15 00:00:00'),(20,23,75.00,1,0,'2020-09-15 00:00:00'),(21,24,75.00,1,0,'2020-09-15 00:00:00'),(22,25,1.00,1,1,'2020-09-15 00:00:00'),(23,26,45.00,1,1,'2020-09-15 00:00:00'),(24,27,40.00,1,1,'2020-09-15 00:00:00'),(25,28,40.00,1,1,'2020-09-15 00:00:00'),(26,29,45.00,1,1,'2020-09-15 00:00:00'),(27,30,27.00,1,1,'2020-09-15 00:00:00'),(28,31,27.00,1,1,'2020-09-15 00:00:00'),(29,32,24.00,1,1,'2020-09-15 00:00:00'),(30,33,22.00,1,1,'2020-09-15 00:00:00'),(31,34,22.00,1,1,'2020-09-15 00:00:00'),(32,35,27.00,1,1,'2020-09-15 00:00:00'),(33,36,2.00,1,1,'2020-09-15 00:00:00'),(34,37,17.00,1,0,'2020-09-15 00:00:00'),(35,38,50.00,1,0,'2020-09-15 00:00:00'),(36,39,17.00,1,1,'2020-09-15 00:00:00'),(37,40,50.00,1,1,'2020-09-15 00:00:00'),(38,41,17.00,1,1,'2020-09-15 00:00:00'),(39,42,50.00,1,1,'2020-09-15 00:00:00'),(40,43,17.00,1,1,'2020-09-15 00:00:00'),(41,44,50.00,1,1,'2020-09-15 00:00:00'),(42,45,17.00,1,0,'2020-09-15 00:00:00'),(43,46,17.00,1,1,'2020-09-15 00:00:00'),(44,47,17.00,1,1,'2020-09-15 00:00:00'),(45,48,17.00,1,1,'2020-09-15 00:00:00'),(46,49,17.00,1,1,'2020-09-15 00:00:00'),(47,50,17.00,1,1,'2020-09-15 00:00:00'),(48,51,15.00,1,1,'2020-09-15 00:00:00'),(49,52,15.00,1,1,'2020-09-15 00:00:00'),(50,53,12.00,1,1,'2020-09-15 00:00:00'),(51,54,25.00,1,1,'2020-09-15 00:00:00'),(52,55,25.00,1,1,'2020-09-15 00:00:00'),(53,56,30.00,1,1,'2020-09-15 00:00:00'),(54,57,24.00,1,1,'2020-09-15 00:00:00'),(55,58,24.00,1,1,'2020-09-15 00:00:00'),(56,59,24.00,1,1,'2020-09-15 00:00:00'),(57,60,24.00,1,1,'2020-09-15 00:00:00'),(58,61,24.00,1,1,'2020-09-15 00:00:00'),(59,62,24.00,1,1,'2020-09-15 00:00:00'),(60,63,24.00,1,1,'2020-09-15 00:00:00'),(61,64,24.00,1,1,'2020-09-15 00:00:00'),(62,65,24.00,1,1,'2020-09-15 00:00:00'),(63,66,24.00,1,1,'2020-09-15 00:00:00'),(64,67,24.00,1,1,'2020-09-15 00:00:00'),(65,68,24.00,1,1,'2020-09-15 00:00:00'),(66,69,24.00,1,1,'2020-09-15 00:00:00'),(68,71,10.00,1,1,'2020-09-15 00:00:00'),(69,72,10.00,1,1,'2020-09-15 00:00:00'),(70,73,10.00,1,1,'2020-09-15 00:00:00'),(71,74,10.00,1,1,'2020-09-15 00:00:00'),(72,75,10.00,1,1,'2020-09-15 00:00:00'),(73,76,10.00,1,1,'2020-09-15 00:00:00'),(74,77,10.00,1,1,'2020-09-15 00:00:00'),(75,78,10.00,1,1,'2020-09-15 00:00:00'),(76,79,12.00,1,1,'2020-09-15 00:00:00'),(77,80,10.00,1,1,'2020-09-15 00:00:00'),(78,70,10.00,1,1,'2020-09-15 00:00:00'),(79,81,45.00,1,0,'2020-09-15 00:00:00'),(80,82,45.00,1,1,'2020-09-15 00:00:00'),(81,83,45.00,1,1,'2020-09-15 00:00:00'),(82,84,45.00,1,1,'2020-09-15 00:00:00'),(83,85,40.00,1,1,'2020-09-15 00:00:00'),(84,86,40.00,1,1,'2020-09-15 00:00:00'),(85,87,40.00,1,1,'2020-09-15 00:00:00'),(86,88,40.00,1,1,'2020-09-15 00:00:00'),(87,89,15.00,1,1,'2020-09-15 00:00:00'),(88,90,20.00,1,1,'2020-09-15 00:00:00'),(89,91,28.00,1,1,'2020-09-15 00:00:00'),(90,92,22.00,1,1,'2020-09-15 00:00:00'),(91,93,22.00,1,1,'2020-09-15 00:00:00'),(92,94,35.00,1,1,'2020-09-15 00:00:00'),(93,95,17.00,1,1,'2020-09-15 00:00:00'),(94,96,50.00,1,1,'2020-09-15 00:00:00'),(95,97,18.00,1,1,'2020-09-15 00:00:00'),(96,98,22.00,1,1,'2020-09-15 00:00:00'),(97,99,22.00,1,1,'2020-09-15 00:00:00'),(98,100,27.00,1,1,'2020-09-15 00:00:00'),(99,101,27.00,1,1,'2020-09-15 00:00:00'),(100,102,25.00,1,1,'2020-09-15 00:00:00'),(101,103,25.00,1,1,'2020-09-15 00:00:00'),(102,104,8.00,1,1,'2020-09-15 00:00:00'),(103,105,8.00,1,1,'2020-09-15 00:00:00'),(104,106,2.00,1,1,'2020-09-15 00:00:00'),(105,107,8.00,1,0,'2020-09-15 00:00:00'),(106,108,8.00,1,1,'2020-09-15 00:00:00'),(107,109,90.00,1,0,'2020-09-15 00:00:00'),(108,110,-24.00,1,1,'2020-09-15 00:00:00'),(109,111,-24.00,1,1,'2020-09-15 00:00:00'),(110,112,155.00,1,0,'2020-09-15 00:00:00'),(111,18,85.00,1,0,'2020-09-16 19:05:00'),(112,18,135.00,2,1,'2020-09-16 19:06:00'),(113,20,135.00,2,1,'2020-09-16 21:30:00'),(114,19,85.00,1,0,'2020-09-16 21:30:00'),(115,19,135.00,2,1,'2020-09-16 21:31:00'),(116,21,95.00,1,0,'2020-09-17 01:55:00'),(117,21,140.00,2,1,'2020-09-17 01:55:00'),(118,22,85.00,1,0,'2020-09-17 02:07:00'),(119,22,125.00,2,1,'2020-09-17 02:08:00'),(120,45,22.00,1,1,'2020-09-17 02:09:00'),(121,113,22.00,1,0,'2020-09-17 02:11:00'),(122,113,32.00,2,1,'2020-09-17 02:12:00'),(123,112,155.00,1,0,'2020-09-17 20:27:00'),(124,112,155.00,1,0,'2020-09-17 20:30:00'),(125,113,32.00,1,1,'2020-09-17 20:33:00'),(126,112,155.00,1,1,'2020-09-17 21:12:00'),(127,114,0.00,1,0,'2020-09-18 16:51:00'),(128,114,0.00,1,1,'2020-09-18 16:57:00'),(129,115,0.00,1,0,'2020-09-19 17:41:00'),(130,115,0.00,1,1,'2020-09-19 17:45:00'),(131,81,60.00,1,1,'2020-09-21 22:15:00'),(132,23,85.00,1,0,'2020-09-23 20:20:00'),(133,23,140.00,2,1,'2020-09-23 20:20:00'),(134,6,20.00,2,1,'2020-10-04 19:25:00'),(135,6,12.00,1,0,'2020-10-08 20:05:00'),(136,18,85.00,1,1,'2020-10-17 02:46:00'),(137,19,85.00,1,1,'2020-10-17 03:00:00'),(138,20,75.00,1,1,'2020-10-17 03:01:00'),(139,21,95.00,1,1,'2020-10-17 03:01:00'),(140,22,85.00,1,1,'2020-10-17 03:02:00'),(141,23,85.00,1,1,'2020-10-17 03:03:00'),(142,24,85.00,1,1,'2020-10-17 03:04:00'),(143,24,125.00,2,1,'2020-10-17 03:04:00'),(144,37,22.00,1,1,'2020-10-17 03:05:00'),(145,37,30.00,2,1,'2020-10-17 03:05:00'),(146,38,80.00,1,1,'2020-10-17 03:05:00'),(147,38,110.00,2,1,'2020-10-17 03:06:00'),(148,25,2.00,2,1,'2020-10-17 03:06:00'),(149,36,3.00,2,1,'2020-10-17 03:07:00'),(150,106,3.00,2,1,'2020-10-17 03:07:00'),(151,107,8.00,1,1,'2020-10-17 03:08:00'),(152,5,15.00,1,0,'2020-10-17 03:08:00'),(153,5,22.00,1,0,'2020-10-17 03:09:00'),(154,5,15.00,1,1,'2020-10-17 03:09:00'),(155,5,22.00,2,1,'2020-10-17 03:09:00'),(156,6,14.00,1,1,'2020-10-17 03:10:00'),(157,7,15.00,1,1,'2020-10-17 03:11:00'),(158,7,22.00,2,1,'2020-10-17 03:11:00'),(159,8,14.00,1,1,'2020-10-17 03:12:00'),(160,8,20.00,2,1,'2020-10-17 03:12:00'),(161,9,14.00,1,1,'2020-10-17 03:19:00'),(162,9,20.00,2,1,'2020-10-17 03:19:00'),(163,10,14.00,1,1,'2020-10-17 03:21:00'),(164,10,20.00,2,1,'2020-10-17 03:21:00'),(165,11,14.00,1,1,'2020-10-17 03:22:00'),(166,11,20.00,2,1,'2020-10-17 03:22:00'),(167,12,14.00,1,1,'2020-10-17 03:22:00'),(168,12,20.00,2,1,'2020-10-17 03:23:00'),(169,109,360.00,1,0,'2020-10-17 03:24:00'),(170,109,490.00,2,1,'2020-10-17 03:26:00'),(171,116,180.00,1,0,'2020-10-17 03:28:00'),(172,116,250.00,2,1,'2020-10-17 03:28:00'),(173,109,360.00,1,1,'2020-10-17 03:32:00'),(174,116,180.00,1,1,'2020-10-17 03:32:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_orden_opciones`
--

LOCK TABLES `tbl_prods_orden_opciones` WRITE;
/*!40000 ALTER TABLE `tbl_prods_orden_opciones` DISABLE KEYS */;
INSERT INTO `tbl_prods_orden_opciones` VALUES (1,331,3),(2,331,4),(8,332,5),(9,333,10),(10,339,8),(11,339,2),(13,345,10),(14,345,11),(15,346,4),(19,363,4),(20,367,6),(21,367,7),(26,363,6),(28,411,1),(29,411,8),(30,411,1),(31,411,8),(32,414,6),(33,414,7),(34,415,8),(35,416,1),(36,416,4),(37,416,10),(38,437,5),(39,437,7),(40,439,4),(41,439,5),(42,440,1),(43,440,2),(44,442,5),(45,442,7),(46,443,2),(47,443,4),(48,444,1),(49,444,2),(50,446,10),(51,448,1),(52,448,2),(53,449,1),(54,450,10),(55,453,1),(56,453,3),(57,457,2),(58,457,3),(59,460,10),(60,466,16),(61,467,3),(62,470,15),(63,471,10),(64,471,15),(65,472,10),(66,472,15),(67,473,10),(68,473,15),(69,474,1),(70,474,2),(71,474,4),(72,475,1),(73,475,4),(74,478,3),(75,478,4),(76,479,3),(77,479,4),(78,481,2),(79,481,3),(80,481,4),(81,482,2),(82,482,3),(83,482,4),(84,484,1),(85,485,1),(86,487,2),(87,487,5),(88,488,2),(89,488,5),(90,490,1),(91,490,2),(92,491,1),(93,491,2),(94,493,2),(95,494,2),(96,495,4),(97,497,4),(98,499,4),(99,500,4),(100,501,4),(101,504,1),(102,504,2),(103,505,3),(104,505,7),(105,506,3),(106,506,4),(107,507,7),(108,507,10),(109,508,10),(110,508,18),(111,509,5),(112,509,10),(113,510,7),(114,511,3),(115,511,10),(116,515,3),(117,515,10),(118,516,4),(119,517,4),(120,517,9),(121,519,1),(122,519,3),(123,520,10),(124,520,19),(125,520,20),(126,521,17),(127,522,5),(128,523,18),(129,523,20),(130,525,7),(131,526,1),(132,526,4),(133,527,7),(134,528,15),(135,528,18),(136,531,1),(137,532,17),(138,533,1),(139,533,7),(140,534,17),(141,535,19),(142,535,20),(143,536,1),(144,536,4),(145,537,17);
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
  PRIMARY KEY (`id_prods_variantes`),
  KEY `dsff` (`id_producto`),
  KEY `id_variante` (`id_variante`),
  CONSTRAINT `tbl_prods_variantes_ibfk_1` FOREIGN KEY (`id_variante`) REFERENCES `tbl_variantes_platillos` (`id_variante_pl`),
  CONSTRAINT `tbl_prods_variantes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_precios_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=790 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_variantes`
--

LOCK TABLES `tbl_prods_variantes` WRITE;
/*!40000 ALTER TABLE `tbl_prods_variantes` DISABLE KEYS */;
INSERT INTO `tbl_prods_variantes` VALUES (147,13,1),(148,13,2),(149,13,3),(150,13,4),(151,13,5),(152,13,7),(153,13,10),(159,15,3),(160,15,4),(161,15,5),(162,15,6),(163,15,7),(164,15,10),(165,16,3),(166,16,4),(167,16,5),(168,16,7),(169,16,10),(191,28,10),(192,29,10),(193,30,10),(194,31,10),(195,33,10),(196,34,10),(197,35,10),(210,51,10),(211,52,10),(213,54,10),(214,55,10),(215,57,1),(216,57,2),(217,57,3),(218,57,4),(219,57,5),(220,57,7),(221,57,8),(222,57,10),(223,58,1),(224,58,2),(225,58,3),(226,58,4),(227,58,5),(228,58,7),(229,58,8),(230,58,10),(231,59,1),(232,59,2),(233,59,3),(234,59,4),(235,59,5),(236,59,7),(237,59,8),(238,59,10),(239,60,1),(240,60,2),(241,60,3),(242,60,4),(243,60,5),(244,60,7),(245,60,8),(246,60,10),(247,61,1),(248,61,2),(249,61,3),(250,61,4),(251,61,5),(252,61,7),(253,61,8),(254,61,10),(255,62,1),(256,62,2),(257,62,3),(258,62,4),(259,62,5),(260,62,7),(261,62,8),(262,62,10),(263,63,1),(264,63,2),(265,63,3),(266,63,4),(267,63,5),(268,63,7),(269,63,8),(270,63,10),(271,64,1),(272,64,2),(273,64,3),(274,64,4),(275,64,5),(276,64,7),(277,64,8),(278,64,10),(279,65,1),(280,65,2),(281,65,3),(282,65,4),(283,65,5),(284,65,7),(285,65,8),(286,65,10),(287,66,1),(288,66,2),(289,66,3),(290,66,4),(291,66,5),(292,66,7),(293,66,8),(294,66,10),(295,67,1),(296,67,2),(297,67,3),(298,67,4),(299,67,5),(300,67,7),(301,67,8),(302,67,10),(303,68,1),(304,68,2),(305,68,3),(306,68,4),(307,68,5),(308,68,7),(309,68,8),(310,68,10),(319,70,3),(320,70,4),(321,70,5),(322,70,10),(323,71,3),(324,71,4),(325,71,5),(326,71,10),(327,72,3),(328,72,4),(329,72,5),(330,72,10),(331,73,3),(332,73,4),(333,73,5),(334,73,10),(335,74,3),(336,74,4),(337,74,5),(338,74,10),(339,75,3),(340,75,4),(341,75,5),(342,75,10),(343,76,3),(344,76,4),(345,76,5),(346,76,10),(347,77,3),(348,77,4),(349,77,5),(350,77,10),(351,78,3),(352,78,4),(353,78,5),(354,78,10),(355,79,3),(356,79,4),(357,79,5),(358,79,10),(359,80,3),(360,80,4),(361,80,5),(362,80,10),(369,82,4),(370,82,5),(371,82,7),(372,82,8),(373,82,9),(374,82,10),(375,83,4),(376,83,5),(377,83,7),(378,83,8),(379,83,9),(380,83,10),(381,84,4),(382,84,5),(383,84,7),(384,84,8),(385,84,9),(386,84,10),(387,85,4),(388,85,5),(389,85,7),(390,85,8),(391,85,9),(392,85,10),(393,86,4),(394,86,5),(395,86,7),(396,86,8),(397,86,9),(398,86,10),(399,87,4),(400,87,5),(401,87,7),(402,87,8),(403,87,9),(404,87,10),(405,88,4),(406,88,5),(407,88,7),(408,88,8),(409,88,9),(410,88,10),(412,91,10),(415,41,10),(417,46,10),(418,47,10),(419,48,10),(420,89,10),(426,14,10),(427,17,3),(428,17,4),(429,17,5),(430,17,6),(431,17,7),(432,17,10),(433,69,1),(434,69,2),(435,69,3),(436,69,4),(437,69,5),(438,69,7),(439,69,8),(440,69,10),(442,45,10),(462,113,10),(463,113,17),(464,112,1),(465,112,2),(466,112,3),(467,112,4),(468,112,5),(469,112,6),(470,112,10),(471,112,15),(472,112,16),(473,112,17),(484,114,1),(485,114,2),(486,114,3),(487,114,4),(488,114,5),(489,114,6),(490,114,10),(491,114,15),(492,114,16),(493,114,17),(504,115,1),(505,115,2),(506,115,4),(507,115,5),(508,115,7),(509,115,10),(510,115,15),(511,115,16),(512,115,17),(513,81,3),(514,81,4),(515,81,7),(516,81,8),(517,81,9),(518,81,10),(519,81,17),(533,18,4),(534,18,10),(535,18,15),(536,18,17),(537,18,18),(538,18,19),(539,18,20),(540,19,4),(541,19,10),(542,19,15),(543,19,17),(544,19,18),(545,19,19),(546,19,20),(547,20,4),(548,20,10),(549,20,17),(550,20,18),(551,20,19),(552,21,4),(553,21,10),(554,21,17),(555,21,18),(556,21,19),(557,22,4),(558,22,10),(559,22,17),(560,22,18),(561,22,19),(562,23,10),(563,23,17),(564,23,18),(565,23,19),(576,24,4),(577,24,10),(578,24,17),(579,24,18),(580,24,19),(583,37,10),(584,37,17),(587,38,10),(588,38,17),(589,25,10),(590,25,17),(591,36,10),(592,36,17),(593,106,10),(594,106,17),(595,107,10),(596,107,17),(627,5,1),(628,5,2),(629,5,3),(630,5,4),(631,5,5),(632,5,7),(633,5,10),(634,5,17),(635,5,18),(636,5,19),(637,6,1),(638,6,2),(639,6,3),(640,6,4),(641,6,5),(642,6,10),(643,6,17),(644,6,18),(645,6,19),(656,7,1),(657,7,2),(658,7,3),(659,7,4),(660,7,5),(661,7,7),(662,7,10),(663,7,17),(664,7,18),(665,7,19),(676,8,1),(677,8,2),(678,8,3),(679,8,4),(680,8,5),(681,8,7),(682,8,10),(683,8,17),(684,8,18),(685,8,19),(696,9,1),(697,9,2),(698,9,3),(699,9,4),(700,9,5),(701,9,7),(702,9,10),(703,9,17),(704,9,18),(705,9,19),(716,10,1),(717,10,2),(718,10,3),(719,10,4),(720,10,5),(721,10,7),(722,10,10),(723,10,17),(724,10,18),(725,10,19),(736,11,1),(737,11,2),(738,11,3),(739,11,4),(740,11,5),(741,11,7),(742,11,10),(743,11,17),(744,11,18),(745,11,19),(756,12,1),(757,12,2),(758,12,3),(759,12,4),(760,12,5),(761,12,7),(762,12,10),(763,12,17),(764,12,18),(765,12,19),(774,0,10),(775,0,17),(776,0,18),(777,0,19),(782,109,10),(783,109,17),(784,109,18),(785,109,19),(786,116,10),(787,116,17),(788,116,18),(789,116,19);
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
) ENGINE=InnoDB AUTO_INCREMENT=538 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_x_orden`
--

LOCK TABLES `tbl_prods_x_orden` WRITE;
/*!40000 ALTER TABLE `tbl_prods_x_orden` DISABLE KEYS */;
INSERT INTO `tbl_prods_x_orden` VALUES (1,1,6,2,1,NULL,0,1),(2,1,8,5,1,NULL,0,1),(3,1,11,2,1,NULL,0,1),(5,12,9,7,1,NULL,0,1),(6,13,9,5,1,NULL,0,1),(8,15,15,2,1,NULL,0,1),(9,16,9,6,1,NULL,0,1),(10,16,6,6,1,NULL,0,1),(11,16,20,1,1,NULL,0,1),(12,16,45,1,1,NULL,0,1),(13,16,47,1,1,NULL,0,1),(14,17,17,7,1,NULL,1,1),(15,18,26,1,1,NULL,0,1),(16,18,20,2,1,NULL,0,1),(17,19,16,2,1,NULL,0,1),(18,20,9,8,1,NULL,0,1),(19,20,40,1,1,NULL,0,1),(20,21,15,5,1,NULL,0,1),(21,21,30,3,1,NULL,0,1),(22,21,7,4,1,NULL,0,1),(24,21,46,1,1,NULL,0,1),(25,14,5,2,1,NULL,0,1),(26,21,47,1,1,NULL,0,1),(27,20,29,1,1,NULL,0,1),(28,22,20,1,1,NULL,0,1),(29,22,18,2,1,NULL,0,1),(30,22,32,2,1,NULL,0,1),(31,22,45,1,1,NULL,0,1),(32,22,48,1,1,NULL,0,1),(33,22,52,1,1,NULL,0,1),(34,23,5,3,1,NULL,0,1),(35,23,16,1,1,NULL,0,1),(36,23,45,1,1,NULL,0,1),(37,23,48,1,1,NULL,0,1),(38,23,54,1,1,NULL,0,1),(39,12,8,5,1,NULL,0,1),(40,12,42,1,1,NULL,0,1),(41,12,56,1,1,NULL,0,1),(42,11,15,6,1,NULL,0,1),(43,11,7,3,1,NULL,0,1),(44,11,51,1,1,NULL,0,1),(45,11,31,1,1,NULL,0,1),(46,24,25,7,1,NULL,0,1),(47,24,9,5,1,NULL,0,1),(48,24,15,4,1,NULL,0,1),(49,24,42,1,1,NULL,0,1),(50,25,6,6,1,NULL,0,1),(51,25,15,5,1,NULL,0,1),(52,25,47,1,1,NULL,0,1),(54,25,54,3,1,NULL,0,1),(55,26,6,6,1,NULL,0,1),(56,26,45,1,1,NULL,0,1),(57,26,11,6,1,NULL,0,1),(58,26,48,1,1,NULL,0,1),(59,26,55,1,1,NULL,0,1),(60,27,8,6,1,NULL,0,1),(61,27,9,5,1,NULL,0,1),(62,27,20,1,1,NULL,0,1),(63,27,31,1,1,NULL,0,1),(64,27,41,1,1,NULL,0,1),(65,27,46,1,1,NULL,0,1),(66,27,49,1,1,NULL,0,1),(67,27,56,1,1,NULL,0,1),(68,28,6,6,1,NULL,0,1),(69,28,21,1,1,NULL,0,1),(70,28,55,1,1,NULL,0,1),(71,28,51,1,1,NULL,0,1),(72,29,7,9,1,NULL,0,1),(73,29,10,5,1,NULL,0,1),(74,29,14,3,1,NULL,0,1),(75,29,27,1,1,NULL,0,1),(76,29,49,1,1,NULL,0,1),(77,29,47,1,1,NULL,0,1),(78,29,54,1,1,NULL,0,1),(79,30,29,1,1,NULL,0,1),(80,30,7,4,1,NULL,0,1),(81,30,43,1,1,NULL,0,1),(82,30,24,1,1,NULL,0,1),(83,30,55,1,1,NULL,0,1),(84,31,6,6,1,NULL,0,1),(85,31,16,1,1,NULL,0,1),(86,31,19,1,1,NULL,0,1),(87,31,36,6,1,NULL,0,1),(88,31,44,1,1,NULL,0,1),(89,31,49,1,1,NULL,0,1),(90,31,48,1,1,NULL,0,1),(91,31,55,1,1,NULL,0,1),(92,32,8,6,1,NULL,0,1),(93,32,14,4,1,NULL,0,1),(94,32,21,1,1,NULL,0,1),(95,32,30,1,1,NULL,0,1),(96,32,42,1,1,NULL,0,1),(97,32,49,1,1,NULL,0,1),(98,32,56,1,1,NULL,0,1),(99,32,55,1,1,NULL,0,1),(100,32,31,1,1,NULL,0,1),(101,33,7,6,1,NULL,0,1),(102,33,15,5,1,NULL,0,1),(103,33,31,1,1,NULL,0,1),(104,33,20,1,1,NULL,0,1),(105,33,43,1,1,NULL,0,1),(106,33,41,1,1,NULL,0,1),(107,33,51,1,1,NULL,0,1),(108,33,54,3,1,NULL,0,1),(109,33,54,1,1,NULL,0,1),(110,34,6,3,1,NULL,0,1),(111,34,8,5,1,NULL,0,1),(112,34,15,7,1,NULL,0,1),(113,34,16,5,1,NULL,0,1),(114,34,40,1,1,NULL,0,1),(115,34,45,1,1,NULL,0,1),(116,34,54,1,1,NULL,0,1),(117,35,8,5,1,NULL,0,1),(118,35,20,1,1,NULL,0,1),(119,35,33,1,1,NULL,0,1),(120,35,27,1,1,NULL,0,1),(121,35,46,1,1,NULL,0,1),(122,36,7,1,1,NULL,0,1),(123,36,8,4,1,NULL,0,1),(124,36,15,6,1,NULL,0,1),(125,36,19,1,1,NULL,0,1),(126,36,30,1,1,NULL,0,1),(127,36,44,1,1,NULL,0,1),(128,36,48,1,1,NULL,0,1),(129,36,56,1,1,NULL,0,1),(130,37,6,4,1,NULL,0,1),(131,37,7,5,1,NULL,0,1),(132,37,15,1,1,NULL,0,1),(133,37,19,1,1,NULL,0,1),(134,37,30,1,1,NULL,0,1),(135,37,44,1,1,NULL,0,1),(136,37,48,1,1,NULL,0,1),(137,37,55,1,1,NULL,0,1),(138,38,25,6,1,NULL,0,1),(139,38,7,5,1,NULL,0,1),(140,38,14,4,1,NULL,0,1),(141,38,15,6,1,NULL,0,1),(142,38,28,2,1,NULL,0,1),(143,38,48,4,1,NULL,0,1),(144,38,55,1,1,NULL,0,1),(145,39,6,5,1,NULL,0,1),(146,39,6,5,1,NULL,0,1),(147,39,14,4,1,NULL,0,1),(148,39,20,1,1,NULL,0,1),(149,39,30,1,1,NULL,0,1),(150,39,32,1,1,NULL,0,1),(151,39,45,1,1,NULL,0,1),(152,39,48,1,1,NULL,0,1),(153,39,52,1,1,NULL,0,1),(154,39,55,1,1,NULL,0,1),(155,40,8,8,1,NULL,0,1),(156,40,15,5,1,NULL,0,1),(157,40,14,3,1,NULL,0,1),(158,40,20,1,1,NULL,0,1),(159,40,33,1,1,NULL,0,1),(160,40,44,1,1,NULL,0,1),(161,40,53,1,1,NULL,0,1),(162,40,56,1,1,NULL,0,1),(163,41,36,4,1,NULL,0,1),(164,41,10,5,1,NULL,0,1),(165,41,17,3,1,NULL,0,1),(166,41,29,4,1,NULL,0,1),(167,41,46,1,1,NULL,0,1),(168,41,51,1,1,NULL,0,1),(169,41,52,1,1,NULL,0,1),(170,41,55,1,1,NULL,0,1),(171,42,7,4,1,NULL,0,1),(172,42,9,6,1,NULL,0,1),(173,42,16,2,1,NULL,0,1),(174,42,30,1,1,NULL,0,1),(175,42,15,7,1,NULL,0,1),(176,42,42,1,1,NULL,0,1),(177,42,45,1,1,NULL,0,1),(178,42,54,1,1,NULL,0,1),(179,43,6,4,1,NULL,0,1),(180,43,13,5,1,NULL,0,1),(181,43,23,1,1,NULL,0,1),(182,43,28,1,1,NULL,0,1),(183,43,31,1,1,NULL,0,1),(184,43,45,1,1,NULL,0,1),(185,43,51,1,1,NULL,0,1),(186,43,52,1,1,NULL,0,1),(187,43,54,1,1,NULL,0,1),(188,44,11,6,1,NULL,0,1),(189,44,6,4,1,NULL,0,1),(190,44,15,7,1,NULL,0,1),(191,44,20,1,1,NULL,0,1),(192,44,30,1,1,NULL,0,1),(193,44,28,1,1,NULL,0,1),(194,44,46,1,1,NULL,0,1),(195,44,49,1,1,NULL,0,1),(196,44,44,1,1,NULL,0,1),(197,44,56,1,1,NULL,0,1),(198,45,9,5,1,NULL,0,1),(199,45,16,3,1,NULL,0,1),(200,45,23,1,1,NULL,0,1),(201,45,31,1,1,NULL,0,1),(202,45,44,1,1,NULL,0,1),(203,45,47,1,1,NULL,0,1),(204,45,42,1,1,NULL,0,1),(205,45,18,1,1,NULL,0,1),(206,46,9,4,1,NULL,0,1),(207,46,15,8,1,NULL,0,1),(208,46,20,1,1,NULL,0,1),(209,46,31,1,1,NULL,0,1),(210,46,29,1,1,NULL,0,1),(211,46,47,1,1,NULL,0,1),(212,46,44,1,1,NULL,0,1),(213,46,52,1,1,NULL,0,1),(214,47,15,5,1,NULL,0,1),(215,47,6,3,1,NULL,0,1),(216,47,22,1,1,NULL,0,1),(217,47,30,1,1,NULL,0,1),(218,47,41,1,1,NULL,0,1),(219,47,38,1,1,NULL,0,1),(220,47,55,1,1,NULL,0,1),(222,47,25,6,1,NULL,0,1),(223,48,7,5,1,NULL,0,1),(224,48,9,5,1,NULL,0,1),(225,48,15,4,1,NULL,0,1),(226,48,30,1,1,NULL,0,1),(227,48,49,1,1,NULL,0,1),(228,48,50,1,1,NULL,0,1),(229,48,54,1,1,NULL,0,1),(230,48,55,1,1,NULL,0,1),(231,49,21,1,1,NULL,0,1),(232,49,43,1,1,NULL,0,1),(233,49,51,1,1,NULL,0,1),(234,49,55,1,1,NULL,0,1),(235,50,7,5,1,NULL,0,1),(236,50,9,9,1,NULL,0,1),(237,50,23,1,1,NULL,0,1),(238,50,31,1,1,NULL,0,1),(239,50,45,1,1,NULL,0,1),(240,50,48,1,1,NULL,0,1),(241,50,55,1,1,NULL,0,1),(243,52,16,5,1,NULL,0,1),(246,54,8,8,1,NULL,0,1),(247,53,8,5,1,NULL,0,1),(250,53,15,5,1,NULL,0,1),(251,51,8,5,1,NULL,0,1),(252,51,15,7,1,NULL,0,1),(253,51,30,1,1,NULL,0,1),(255,54,15,6,1,NULL,0,1),(256,54,30,1,1,NULL,0,1),(257,54,48,1,1,NULL,0,1),(258,54,49,1,1,NULL,0,1),(259,54,56,1,1,NULL,0,1),(260,55,15,5,1,NULL,0,1),(261,55,22,1,1,NULL,0,1),(262,55,8,7,1,NULL,0,1),(263,55,6,5,1,NULL,0,1),(264,55,47,1,1,NULL,0,1),(265,55,51,1,1,NULL,0,1),(266,55,48,1,1,NULL,0,1),(267,53,16,6,1,NULL,0,1),(268,53,21,1,1,NULL,0,1),(269,53,33,1,1,NULL,0,1),(270,53,45,1,1,NULL,0,1),(271,53,52,1,1,NULL,0,1),(272,53,50,1,1,NULL,0,1),(273,53,55,1,1,NULL,0,1),(274,56,6,4,1,NULL,0,1),(275,56,8,8,1,NULL,0,1),(276,56,16,2,1,NULL,0,1),(277,56,22,3,1,NULL,0,1),(278,56,29,1,1,NULL,0,1),(279,56,44,1,1,NULL,0,1),(280,56,51,1,1,NULL,0,1),(281,56,56,1,1,NULL,0,1),(283,57,8,5,1,NULL,0,1),(284,57,19,1,1,NULL,0,1),(285,57,46,1,1,NULL,0,1),(286,57,50,1,1,NULL,0,1),(287,57,55,1,1,NULL,0,1),(288,60,8,5,1,NULL,0,1),(289,60,19,1,1,NULL,0,1),(290,60,15,7,1,NULL,0,1),(291,60,46,1,1,NULL,0,1),(292,60,51,1,1,NULL,0,1),(293,60,50,1,1,NULL,0,1),(294,60,55,1,1,NULL,0,1),(295,15,8,5,1,NULL,0,1),(296,15,8,5,1,NULL,0,1),(297,15,23,1,1,NULL,0,1),(298,15,45,1,1,NULL,0,1),(299,15,51,1,1,NULL,0,1),(300,15,56,1,1,NULL,0,1),(301,61,10,6,1,NULL,0,1),(302,61,15,7,1,NULL,0,1),(303,61,6,3,1,NULL,0,1),(304,61,29,1,1,NULL,0,1),(305,61,55,1,1,NULL,0,1),(306,61,48,1,1,NULL,0,1),(307,61,51,1,1,NULL,0,1),(308,61,50,1,1,NULL,0,1),(309,61,43,1,1,NULL,0,1),(310,52,8,6,1,NULL,0,1),(311,52,6,5,1,NULL,0,1),(312,52,15,9,1,NULL,0,1),(314,52,16,3,1,NULL,0,1),(315,52,44,1,1,NULL,0,1),(316,52,52,1,1,NULL,0,1),(317,52,56,1,1,NULL,0,1),(318,62,8,5,1,NULL,0,1),(319,62,16,1,1,NULL,0,1),(320,62,18,1,1,NULL,0,1),(321,62,48,1,1,NULL,0,1),(322,62,49,1,1,NULL,0,1),(323,62,52,1,1,NULL,0,1),(324,62,56,1,1,NULL,0,1),(325,64,8,5,1,NULL,0,1),(326,64,64,1,1,NULL,0,1),(327,64,76,1,1,NULL,0,1),(328,64,67,1,1,NULL,0,1),(330,66,5,3,1,NULL,0,1),(331,65,5,4,1,NULL,0,1),(332,65,15,5,1,NULL,0,1),(333,65,61,5,1,NULL,0,1),(334,65,61,5,1,NULL,0,1),(335,66,19,1,1,NULL,0,1),(336,66,82,1,1,NULL,0,1),(337,67,74,5,1,NULL,0,1),(338,67,41,3,1,NULL,0,1),(339,58,6,5,1,NULL,0,1),(340,58,45,3,1,NULL,0,1),(341,59,20,1,1,NULL,0,1),(342,59,86,1,1,NULL,0,1),(343,59,51,1,1,NULL,0,1),(344,58,15,1,1,NULL,0,1),(345,67,62,1,1,NULL,0,1),(346,67,6,3,1,NULL,0,1),(347,67,29,1,1,NULL,0,1),(348,67,83,1,1,NULL,0,1),(349,67,50,1,1,NULL,0,1),(350,67,56,1,1,NULL,0,1),(351,72,6,1,1,NULL,0,1),(352,68,7,1,1,NULL,0,1),(353,68,14,1,1,NULL,0,1),(354,68,8,3,1,NULL,0,1),(355,68,45,1,0,NULL,0,1),(356,71,17,1,1,NULL,0,1),(357,71,8,3,0,NULL,0,1),(358,71,84,1,1,NULL,0,1),(359,0,8,3,1,NULL,0,1),(360,69,8,3,1,NULL,0,1),(361,70,15,4,1,NULL,0,1),(362,70,61,1,1,NULL,0,1),(363,73,7,3,1,NULL,0,1),(364,73,60,1,1,NULL,0,1),(365,73,55,1,1,NULL,0,1),(366,73,45,1,1,NULL,0,1),(367,70,7,5,1,NULL,0,1),(368,68,61,1,1,NULL,0,1),(369,68,64,1,1,NULL,0,1),(370,68,25,1,0,NULL,0,1),(371,70,20,1,1,NULL,0,1),(372,72,94,1,1,NULL,0,1),(373,77,20,1,1,NULL,0,1),(374,77,43,1,1,NULL,0,1),(375,77,87,1,1,NULL,0,1),(376,75,11,1,1,NULL,0,1),(377,76,72,1,1,NULL,0,1),(378,71,73,1,1,NULL,0,1),(379,71,21,1,1,NULL,0,1),(380,71,28,1,0,NULL,0,1),(381,71,5,6,1,NULL,0,1),(382,75,21,2,1,'0000-00-00 00:00:00',0,1),(383,75,45,1,1,'0000-00-00 00:00:00',0,1),(384,75,17,1,1,'2016-04-21 03:57:12',0,1),(385,75,47,1,1,'2016-04-21 03:57:27',0,1),(386,78,66,1,1,'2016-04-21 04:06:35',0,1),(387,78,45,1,1,'2016-04-21 04:06:40',0,1),(388,78,86,1,1,'2016-04-21 04:06:52',0,1),(389,78,21,1,1,'2016-04-21 04:08:38',0,1),(390,78,69,1,1,'2016-04-21 04:09:18',0,1),(391,78,20,1,1,'2016-04-21 04:09:30',0,1),(392,78,52,1,1,'2016-04-21 04:09:47',0,1),(393,76,85,1,1,'2016-04-21 04:12:42',0,1),(394,76,45,1,1,'2016-04-21 04:12:49',0,1),(395,76,8,4,1,'2016-04-22 06:46:34',0,1),(396,76,15,5,1,'2016-04-22 06:46:42',0,1),(397,79,59,1,1,'2016-05-28 22:20:02',0,1),(398,79,18,1,1,'2016-05-28 22:20:13',0,1),(399,79,44,1,1,'2016-05-28 22:20:17',0,1),(400,79,7,5,1,'2016-05-28 22:20:34',0,1),(401,79,87,1,1,'2016-05-28 22:20:50',0,1),(402,80,5,5,1,'2016-05-28 23:37:57',1,1),(403,80,87,1,0,'2016-05-28 23:40:10',1,1),(404,80,86,1,0,'2016-05-28 23:53:33',1,1),(405,80,6,8,0,'2016-05-28 23:54:56',1,1),(406,80,6,1,0,'2016-05-28 23:55:48',1,1),(407,80,81,1,0,'2016-05-28 23:56:46',1,1),(408,80,7,5,0,'2016-05-28 23:58:19',1,1),(409,80,6,5,0,'2016-05-29 00:01:21',1,1),(410,80,81,2,0,'2016-05-29 00:02:32',1,1),(411,80,5,4,0,'2016-05-29 00:05:59',1,1),(412,80,8,5,0,'2016-05-29 00:21:30',1,1),(413,80,8,5,0,'2016-05-29 00:24:59',1,1),(414,80,7,5,0,'2016-05-29 00:29:32',1,1),(415,80,6,1,0,'2016-05-29 00:30:57',1,1),(416,80,8,5,1,'2016-05-31 00:07:00',1,1),(417,81,7,5,1,'2016-06-28 01:04:40',0,1),(418,81,19,1,1,'2016-06-28 01:04:56',0,1),(419,81,81,1,1,'2016-06-28 01:05:01',0,1),(420,81,43,1,1,'2016-06-28 01:05:04',0,1),(421,81,94,1,1,'2016-06-28 01:05:08',0,1),(422,81,51,3,1,'2016-06-28 01:05:12',0,1),(423,81,54,1,1,'2016-06-28 01:05:16',0,1),(424,14,15,6,1,'2016-06-28 23:36:48',0,1),(425,14,24,3,1,'2016-06-28 23:36:57',0,1),(426,14,6,5,1,'2016-06-28 23:38:45',0,1),(427,14,32,2,1,'2016-06-28 23:38:54',0,1),(428,80,22,1,1,'2016-06-28 23:39:25',1,1),(429,80,26,1,1,'2016-06-28 23:39:29',1,1),(430,80,50,1,1,'2016-06-28 23:39:32',1,1),(431,82,6,3,1,'2016-06-28 23:41:40',1,1),(432,82,19,3,1,'2016-06-28 23:41:45',1,1),(433,82,26,1,1,'2016-06-28 23:41:51',1,1),(434,82,97,1,1,'2016-06-28 23:42:25',1,1),(435,82,54,1,1,'2016-06-28 23:42:30',1,1),(436,82,32,1,1,'2016-06-28 23:43:43',1,1),(437,82,88,1,1,'2016-06-28 23:43:51',1,1),(438,82,98,1,1,'2016-07-20 03:27:23',1,1),(439,82,15,3,1,'2016-07-20 03:27:32',1,1),(440,80,68,1,1,'2016-07-20 03:29:43',1,1),(441,80,18,1,1,'2016-07-20 03:29:47',1,1),(442,80,83,1,1,'2016-07-20 03:29:56',1,1),(443,83,7,4,1,'2016-07-28 23:38:14',1,1),(444,83,68,1,0,'2016-07-28 23:38:41',1,1),(445,83,93,1,1,'2016-07-28 23:38:49',1,1),(446,83,83,1,1,'2016-07-28 23:38:58',1,1),(447,83,54,1,1,'2016-07-28 23:39:05',1,1),(448,83,6,3,1,'2016-07-28 23:40:35',1,1),(449,84,12,5,1,'2016-09-12 22:47:07',0,1),(450,84,83,1,1,'2016-09-12 22:47:20',0,1),(451,84,42,1,1,'2016-09-12 22:47:27',0,1),(452,84,55,1,0,'2016-09-12 22:47:34',0,1),(453,83,8,5,1,'2020-09-04 00:59:38',1,1),(454,85,77,1,1,'2020-09-04 01:03:40',1,1),(455,85,14,1,1,'2020-09-04 01:03:45',1,1),(456,85,43,1,1,'2020-09-04 01:03:51',1,1),(457,86,67,1,0,'2020-09-15 22:09:54',0,1),(458,87,112,1,0,'2020-09-18 23:33:03',1,1),(459,87,112,1,0,'2020-09-19 20:51:15',1,1),(460,87,112,1,1,'2020-09-19 21:22:11',1,1),(461,88,112,1,1,'2020-09-20 00:59:37',0,1),(462,89,112,1,0,'2020-09-20 01:01:54',0,1),(463,89,112,1,0,'2020-09-20 01:04:37',0,1),(464,89,112,1,0,'2020-09-20 01:06:55',0,1),(465,89,114,1,0,'2020-09-20 01:07:16',0,1),(466,89,115,1,0,'2020-09-20 01:07:18',0,1),(467,89,59,2,1,'2020-09-20 01:13:34',0,1),(468,89,112,1,0,'2020-09-20 01:14:04',0,1),(469,89,114,1,0,'2020-09-20 01:14:04',0,1),(470,89,115,1,0,'2020-09-20 01:14:04',0,1),(471,90,112,1,0,'2020-09-20 01:23:44',1,1),(472,90,114,1,0,'2020-09-20 01:23:44',1,1),(473,90,115,1,0,'2020-09-20 01:23:44',1,1),(474,90,64,1,0,'2020-09-20 01:24:59',1,1),(475,92,6,3,1,'2020-09-25 01:43:49',1,2),(476,92,20,1,1,'2020-10-01 21:45:26',1,2),(477,90,112,1,0,'2020-10-05 00:44:36',1,1),(478,90,114,1,0,'2020-10-05 00:44:36',1,1),(479,90,115,1,0,'2020-10-05 00:44:36',1,1),(480,86,112,1,0,'2020-10-06 23:01:40',0,1),(481,86,114,1,0,'2020-10-06 23:01:40',0,1),(482,86,115,1,0,'2020-10-06 23:01:40',0,1),(483,86,112,1,0,'2020-10-06 23:11:45',0,1),(484,86,114,1,0,'2020-10-06 23:11:45',0,1),(485,86,115,1,0,'2020-10-06 23:11:45',0,1),(486,103,112,1,1,'2020-10-07 03:33:00',0,1),(487,103,114,1,1,'2020-10-07 03:33:36',0,1),(488,103,115,1,1,'2020-10-07 03:33:57',0,1),(489,86,112,1,1,'2020-10-07 03:41:28',0,1),(490,86,114,1,1,'2020-10-07 03:41:28',0,1),(491,86,115,1,1,'2020-10-07 03:41:28',0,1),(492,90,112,1,1,'2020-10-07 06:34:29',0,1),(493,90,114,1,1,'2020-10-07 06:34:50',0,1),(494,90,115,1,1,'2020-10-07 06:35:11',0,1),(495,90,59,1,1,'2020-10-07 06:42:36',0,1),(496,108,15,3,1,'2020-10-07 23:30:29',1,1),(497,108,59,1,1,'2020-10-07 23:30:39',1,1),(498,108,112,1,0,'2020-10-08 01:10:02',0,1),(499,108,114,1,0,'2020-10-08 01:10:02',0,1),(500,108,115,1,0,'2020-10-08 01:10:03',0,1),(501,89,10,4,1,'2020-10-09 01:00:52',0,1),(502,89,28,1,1,'2020-10-09 01:01:07',0,1),(503,109,6,5,1,'2020-10-09 01:02:12',0,1),(504,110,6,1,1,'2020-10-10 21:12:07',0,1),(505,110,81,1,1,'2020-10-10 21:14:50',0,1),(506,110,73,1,1,'2020-10-10 21:15:00',0,1),(507,110,9,1,1,'2020-10-10 21:15:13',0,1),(508,109,116,1,1,'2020-10-17 08:33:34',0,1),(509,111,7,1,1,'2020-10-17 20:46:52',1,1),(510,111,61,1,1,'2020-10-17 20:49:13',1,1),(511,112,7,3,1,'2020-10-17 21:49:29',0,1),(512,112,113,1,1,'2020-10-17 21:49:56',0,1),(513,113,11,3,1,'2020-10-17 22:01:40',1,1),(514,113,37,1,1,'2020-10-17 22:01:55',1,1),(515,113,7,5,1,'2020-10-17 22:02:33',1,1),(516,114,12,5,1,'2020-10-17 22:05:06',1,1),(517,114,81,1,1,'2020-10-17 22:05:24',1,1),(518,114,38,1,1,'2020-10-17 22:05:30',1,1),(519,115,5,5,1,'2020-10-17 22:08:43',1,1),(520,115,18,1,1,'2020-10-17 22:08:58',1,1),(521,115,113,1,1,'2020-10-17 22:09:11',1,1),(522,116,7,5,1,'2020-10-17 22:13:26',1,1),(523,116,18,1,1,'2020-10-17 22:13:36',1,1),(524,116,37,1,1,'2020-10-17 22:13:43',1,1),(525,116,87,1,1,'2020-10-17 22:13:50',1,1),(526,117,7,5,1,'2020-10-17 22:18:51',1,1),(527,117,59,1,1,'2020-10-17 22:18:57',1,1),(528,117,19,1,1,'2020-10-17 22:19:14',1,1),(529,117,42,1,1,'2020-10-17 22:19:25',1,1),(530,117,113,1,1,'2020-10-17 22:19:38',1,1),(531,118,11,5,1,'2020-10-22 05:44:50',0,1),(532,118,113,3,1,'2020-10-22 05:44:56',0,1),(533,119,10,5,1,'2020-10-22 05:49:08',0,1),(534,119,37,1,1,'2020-10-22 05:49:14',0,1),(535,120,18,1,1,'2020-10-22 05:52:35',0,1),(536,120,11,5,1,'2020-10-22 05:52:43',0,1),(537,120,38,1,1,'2020-10-22 05:52:51',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productos`
--

LOCK TABLES `tbl_productos` WRITE;
/*!40000 ALTER TABLE `tbl_productos` DISABLE KEYS */;
INSERT INTO `tbl_productos` VALUES (5,'Maciza de Res','Tacos de maciza de Res','5.jpg',2,1),(6,'Maciza de Puerco','Tacos de maciza de puerco','6.jpg',2,1),(7,'Lengua de cerdo','Tacos de lengua de cerdo al vapor','7.jpg',2,1),(8,'Carnitas','Tacos de carnitas','8.jpg',2,1),(9,'Buche','Tacos de buche','9.jpg',2,1),(10,'Oreja','Tacos de oreja de cerdo','10.jpg',2,1),(11,'Azadura','Tacos de azadura','11.jpg',2,1),(12,'Trompa','Tacos de trompa de cerdo','12.jpg',2,1),(13,'Corazón','Tacos de corazón','13.jpg',2,1),(14,'Bistec de res','Tacos de bistec de res','14.jpg',4,1),(15,'Pastor','Tacos al pastor','15.jpg',4,1),(16,'Bistec con quesillo','Taco de bistec de res con quesillo','16.jpg',4,1),(17,'Pastor con quesillo','Taco al pastor con quesillo','17.jpg',4,1),(18,'Mula Terca','Tocino/Jamón/Bistec de res o carne al pastor y quesillo','18.jpg',5,1),(19,'Plato Suizo','Bistec de res o carne al pastor y quesillo','19.jpg',5,1),(20,'Alambre','Cebolla, Chile Morrón, Tocino, Bistec de Res y Quesillo','20.jpg',5,1),(21,'Alambre Especial','Cebolla, Chile morrón, Tocino, Bistec de Res, Jamón, Champiñones, Carne al pastor y Quesillo','21.jpg',5,1),(22,'Mata Hambre','Cebolla, Chile Morrón, Tocino, Bistec de Res, Jamón, Carne al pastor, Tomate y Quesillo','22.jpg',5,1),(23,'Plato Mixto','Tocino, Jamón, Carne al pastor, Salsa Mexicana y quesillo','23.jpg',5,1),(24,'Vegetariano','Cebolla, Chile Morrón, Tomate, Champiñones y quesillo','24.jpg',5,1),(25,'Tortilla adicional','Tortilla adicional','25.jpg',1,1),(26,'Pozole rojo','Plato de pozole rojo, grande','26.jpg',6,1),(27,'Pozole Rojo Chico','Pozole Rojo Chico','27.jpg',6,1),(28,'Queso Fundido','Queso fundido normal','28.jpg',6,1),(29,'Queso Especial','Queso fundido combinado con bistec, pastor o champiñones','29.jpg',6,1),(30,'Gringa','Tortilla de harina con queso y carne','30.jpg',6,1),(31,'Sincronizada','Tortilla de harina con queso y jamón','31.jpg',6,1),(32,'Tostada','Se prepara con la carne de su elección','32.jpg',6,1),(33,'Burrita','Burrita de tortilla de harina con quesillo','33.jpg',6,1),(34,'Quesadilla','Quesadilla','34.jpg',6,1),(35,'Quesadilla Especial','Con Bistec de res, pastor o champiñones','35.jpg',6,1),(36,'Tostada adicional','Tostada adicional para cualquier alimento','36.jpg',1,1),(37,'Vaso Agua de horchata','Agua fresca de horchata, un vaso','37.jpg',7,1),(38,'Agua de horchata, Jarra','Jarra de agua de horchata','38.jpg',7,1),(39,'Agua de Jamaica, Vaso','Vaso de agua de jamaica','39.jpg',7,1),(40,'Agua de Jamaica, Jarra','Jarra de agua de jamaica','40.jpg',7,1),(41,'Agua de Maracuya, Vaso','Vaso de agua de Maracuya','41.jpg',7,1),(42,'Agua de Maracuya, Jarra','Jarra de agua de Maracuya','42.jpg',7,1),(43,'Agua de Mandarina, Vaso','Vaso de agua de mandarina','43.jpg',7,1),(44,'Agua de Mandarina, Jarra','Jarra de agua de mandarina','44.jpg',7,1),(45,'R. Pepsi','Refresco marca Pepsi','45.jpg',7,0),(46,'Mirinda','Refresco mirinda','46.jpg',7,1),(47,'Sangria','Refresco Sangría','47.jpg',7,1),(48,'7 Up','Refresco 7up','48.jpg',7,1),(49,'Manzanita Sol','Refresco Manzanita Sol','49.jpg',7,1),(50,'Agua Mineral','Agua mineral embotellada','50.jpg',7,1),(51,'Café','Tasa de café','51.jpg',7,1),(52,'Atole','Atole','52.jpg',7,1),(53,'Agua SIN gas 1/2 Lt.','Agua embotellada SIN gas 1/2 Lt.','53.jpg',7,1),(54,'Panqué de elote','Panqué de elote','54.jpg',8,1),(55,'Flan','Flan','55.jpg',8,1),(56,'Pastel de Queso','Pastel de queso','56.jpg',8,1),(57,'Tostada Maciza de Puerco','Tostada Maciza de Puerco','57.jpg',9,1),(58,'Tostada Maciza de Res','Tostada Maciza de Res','58.jpg',9,1),(59,'Tostada Carnitas','Tostada de Carnitas','59.jpg',9,1),(60,'Tostada de Trompa','Tostada de Trompa','60.jpg',9,1),(61,'Tostada de Buche','Tostada de Buche','61.jpg',9,1),(62,'Tostada de Azadura','Tostada de Azadura','62.jpg',9,1),(63,'Tostada de Cabeza','Tostada de Cabeza','63.jpg',9,1),(64,'Tostada de Oreja','Tostada de Oreja','64.jpg',9,1),(65,'Tostada de Lengua','Tostada de Lengua','65.jpg',9,1),(66,'Tostada de Quesillo','Tostada de Quesillo','66.jpg',9,1),(67,'Tostada de Pastor','Tostada con carne al Pastor','67.jpg',9,1),(68,'Tostada de Bistec','Tostada de Bistec de Res','68.jpg',9,1),(69,'Tostada de Chamorro','Tostada de Chamorro','69.jpg',9,1),(70,'T. Ahogado Maciza de Res','Taco ahogado en salsa y guacamole de Maciza de Res','70.jpg',3,1),(71,'T. Ahogado Maciza de Puerco','Taco ahogado de maciza de puerco','71.jpg',3,1),(72,'T. Ahogado Lengua de Puerco','Taco ahogado de lengua de puerco','72.jpg',3,1),(73,'T. Ahogado de Carnitas','Taco ahogado de carnitas mixtas','73.jpg',3,1),(74,'T. Ahogado de Buche','Taco ahogado de Buche','74.jpg',3,1),(75,'T. Ahogado de Oreja','Taco Ahogado de Oreja','75.jpg',3,1),(76,'T. Ahogado de Azadura','Taco ahogado de Azadura','76.jpg',3,1),(77,'T. Ahogado de Trompa','Taco ahogado de trompa','77.jpg',3,1),(78,'T. Ahogado de Corazón','Taco ahogado de corazón','78.jpg',3,1),(79,'T. Ahogado de Bistec de Res','Taco ahogado de bistec de Res','79.jpg',3,1),(80,'Taco ahogado al Pastor','Taco Ahogado al pastor','80.jpg',3,1),(81,'Poz. Maciza de Puerco','Pozole de maciza de puerco','81.jpg',10,1),(82,'Poz. Maciza de Res','Pozole de Maciza de Res','82.jpg',10,1),(83,'Poz. de Surtido, Puerco','Pozole de carne surtida de puerco','83.jpg',10,1),(84,'Poz. Mixto de Puerco y Res','Pozole Mixto de Puerco y Res','84.jpg',10,1),(85,'Poz. Maciza de Puerco CHICO','Pozole de maciza de puerco, chico','85.jpg',10,1),(86,'Poz. Maciza de Res CHICO','Poz. Maciza de Res CHICO','86.jpg',10,1),(87,'Poz. Surtida de Puerco CHICO','Pozole con carne surtida de puerco, chico','87.jpg',10,1),(88,'Poz. Mixto CHICO','Pozole Mixto Chico','88.jpg',10,1),(89,'Agua SIN Gas 1 Litro','Botella de Agua sin Gas 1 Lt.','89.jpg',7,1),(91,'Cerveza Stella Artois','Cerveza Stella Artois','91.jpg',7,1),(92,'Cerveza Corona','Cerveza Corona','92.jpg',7,1),(93,'Cerveza Victoria','Cerveza Victoria	','93.jpg',7,1),(94,'Cerveza Bohemia','Cerveza Bohemia	','94.jpg',7,1),(95,'Agua de Limón, Vaso','Vaso de Agua de Limón','95.jpg',7,1),(96,'Agua de Limón, Jarra','Jarra de Agua de Limón','96.jpg',7,1),(97,'Boing','(Tamarindo, Guayaba, Fresa, Mango o Uva)','97.jpg',7,1),(98,'Cerveza Corona Light','Cerveza Corona Light','98.jpg',7,1),(99,'Cerveza Barrilito','Cerveza Barrilito','99.jpg',7,1),(100,'Cerveza Negra Modelo','Cerveza Negra Modelo','100.jpg',7,1),(101,'Cerveza Modelo Especial','Cerveza Modelo Especial','101.jpg',7,1),(102,'Lata Cerveza Modelo Especial','Cerveza Modelo Especial, LATA','102.jpg',7,1),(103,'Cerveza Victoria Lata','Cerveza Victoria Lata','103.jpg',7,1),(104,'Base Suero','Base Suero','104.jpg',7,1),(105,'Base Michelada','Base Michelada','105.jpg',7,1),(106,'Tortilla de Harina Extra','Tortilla de Harina Extra','106.jpg',1,1),(107,'Orden Guacamole','Orden Guacamole','107.jpg',1,1),(108,'Orden Zanahoria','Orden Zanahoria','108.jpg',2,1),(109,'Orden Carne Surtida 1 Kg.','Orden Carne Surtida 1 Kg','109.jpg',15,1),(110,'Promo Lunes','Promocion de Lunes','110.jpg',9,0),(111,'Promo Miercoles','Promo Miercoles','111.jpg',9,0),(112,'Paquete de todo un poco','2 tacos de al pastor o puerco,  2 tostadas al pastor o puerco,  1 pozole de puerco o pollo,  2 litros de agua de sabor o refresco de 2 litros','112.jpg',13,1),(113,'Coca-Cola vidrio','Refresco Coca-Cola de vidrio','113.jpg',7,1),(114,'2 tacos paquete 112 ','2 tacos para paquete \"De todo un poco\"','114.jpg',14,1),(115,'2 Tostadas Pollo o Puerco','2 Tostadas de Pollo o Puerco\npara paquete \"De todo un poco\"','',14,1),(116,'Orden de Carne Surtida 1/2 Kg.','Orden de Carne Surtida 1/2 Kg.','',15,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ticket_cons`
--

LOCK TABLES `tbl_ticket_cons` WRITE;
/*!40000 ALTER TABLE `tbl_ticket_cons` DISABLE KEYS */;
INSERT INTO `tbl_ticket_cons` VALUES (1,61),(2,62),(3,63),(4,64),(5,65),(6,66),(7,67),(8,68),(9,69),(10,70),(11,71),(12,72),(13,73),(14,74),(15,75),(16,76),(17,77),(18,78),(19,79),(20,80),(21,81),(22,82),(23,83),(24,84),(25,85),(26,86),(27,87),(28,88),(29,88),(30,88),(31,89),(32,90),(33,91),(34,92),(35,93),(36,94),(37,95),(38,96),(39,97),(40,90),(41,91),(42,95),(43,113),(44,94),(45,115),(46,114),(47,97),(48,116),(49,117),(50,118),(51,119),(52,120),(53,121),(54,122),(55,124),(56,124),(57,123),(58,125);
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
  PRIMARY KEY (`id_tipo_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipos_precios`
--

LOCK TABLES `tbl_tipos_precios` WRITE;
/*!40000 ALTER TABLE `tbl_tipos_precios` DISABLE KEYS */;
INSERT INTO `tbl_tipos_precios` VALUES (1,'Normal'),(2,'Plataforma'),(3,'Cortesía'),(4,'Otro');
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
INSERT INTO `tbl_usuarios` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1,1),(2,'Cajero','936400f151ba2146a86cfcc342279f57',2,1),(3,'Mesero1','85770ae9def3473f559e0dbe0609060a',3,1);
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
  PRIMARY KEY (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variantes_platillos`
--

LOCK TABLES `tbl_variantes_platillos` WRITE;
/*!40000 ALTER TABLE `tbl_variantes_platillos` DISABLE KEYS */;
INSERT INTO `tbl_variantes_platillos` VALUES (1,'Sin Salsa','Productos preparados no llevan salsa','S/Salsa'),(2,'Sin Guacamole','Productos preparados no llevan guacamoles','S/Gua'),(3,'Sin Verdura','Los platillos preparados no llevan verdura','S/Verd'),(4,'Sin Cebolla','Los platillos preparados no llevan cebolla','S/Ceb'),(5,'Sin Cilantro','Los platillos preparados no llevan cilantro','S/Cil'),(6,'Sin Piña','Los platillos preparados no llevan piña','S/Piña'),(7,'Pura Carne','Los platillos preparados llevan pura carne al natural','PCne'),(8,'Sin Col','Los platillos preparados no llevan Col','S/Col'),(9,'Sin Rábano','Los platillos preparados no llevan Rábano','S/Rab'),(10,'Para llevar','Los productos son para llevar','PLLEV'),(11,'Maciza de Puerco','El pozole lleva carne maciza de puerco','MacizaPco'),(12,'Maciza de Res','El pozole lleva carne Maciza de Res','MacizaRes'),(13,'Surtido Puerco','El pozole lleva carne surtida de puerco','SurtidaPco'),(14,'Mixto Puerco y Res','El pozole lleva carne mixta de puerco y res','Mixto'),(15,'Carne pastor','Para tacos o tostadas de paquete','Carne Pastor'),(16,'Carne Puerco','Para tacos o tostadas de paquete','Carne Pco'),(17,'A Domicilio','Producto a domicilio','Domic.'),(18,'Tortilla Maiz','Producto con tortillas de maiz','Tt. Maiz'),(19,'Tortilla Harina','Producto con tortillas de harina','Tt. Harina'),(20,'Bistec Res','Producto preparado con Bistec de Res','C/BistecRes');
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
  `ID Variante` tinyint NOT NULL,
  `ID Cat` tinyint NOT NULL
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
/*!50001 VIEW `vw_variantes_x_platillo` AS select `tbl_prods_variantes`.`id_producto` AS `ID Producto`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_variantes_platillos`.`chr_variante_nombre` AS `Variante`,`tbl_prods_variantes`.`id_variante` AS `ID Variante`,`tbl_categorias`.`id_categoria` AS `ID Cat` from (((`tbl_productos` left join `tbl_prods_variantes` on(`tbl_prods_variantes`.`id_producto` = `tbl_productos`.`id_producto`)) left join `tbl_variantes_platillos` on(`tbl_prods_variantes`.`id_variante` = `tbl_variantes_platillos`.`id_variante_pl`)) left join `tbl_categorias` on(`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`)) */;
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

-- Dump completed on 2020-10-22 16:30:03
