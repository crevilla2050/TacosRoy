-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: db_tacosoftapp
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_cat` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_desc_cat` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fl_orden` float NOT NULL,
  `bit_visible` int NOT NULL DEFAULT '1',
  `bit_activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorias`
--

LOCK TABLES `tbl_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_categorias` DISABLE KEYS */;
INSERT INTO `tbl_categorias` VALUES (1,'Extras','Productos extra',14,1,1),(2,'Tacos al Vapor Maiz','Tacos al vapor Maiz',1,1,1),(3,'Tacos Ahogados','Tacos ahogados en salsa',19,1,1),(4,'Tacos a la plancha','Tacos preparados a la plancha',3,1,1),(5,'Preparados Maiz','Productos elaborados en plancha',8,1,1),(6,'Quesos fundidos Maiz','Queso fundido preparado y servido con tortillas de maiz',10,1,1),(7,'Bebidas','Bebidas frías o calientes',15,1,1),(8,'Postres','Postres y alimentos dulces',16,1,1),(9,'Tostadas Preparadas','Tostadas con diferentes carnes e ingredientes',5,1,1),(10,'Pozoles','Pozoles',7,1,1),(11,'Para llevar','Costos extra ordenes para llevar',20,1,1),(12,'A Domicilio','Costos extra ordenes a domicilio',17,0,0),(13,'Combos','Combos disponibles',100,0,0),(14,'Quesos Fundidos HARINA','Productos pertenecientes a un combo',11,1,1),(15,'Ordenes de Carne','Ordenes de carne de res, cerdo o combinada, 1kg, 1/2 kg o 300 gr.',18,1,1),(16,'Tacos Vapor HARINA','Tacos al vapor servidos en tortilla de harina',2,1,1),(17,'Tacos Plancha HARINA','Tacos preparados a la plancha en tortilla de harina',4,1,1),(18,'Volcanes','Tostadas con carne con cubierta de queso fundido',6,1,1),(19,'Preparados HARINA','Platillos preparados a la plancha servidos con tortilla de harina',9,1,1),(20,'Gringas y más HARINA','Gringas y más harina',12,1,1),(21,'Gringas y más MAIZ','Gringas y más preparados con tortilla de maiz',13,1,1);
/*!40000 ALTER TABLE `tbl_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_combos`
--

DROP TABLE IF EXISTS `tbl_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_combos` (
  `id_combo` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_combo` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `id_producto_relacionado` int NOT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_combo`),
  KEY `index2` (`id_producto_relacionado`),
  CONSTRAINT `fk_tbl_combos_1` FOREIGN KEY (`id_producto_relacionado`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_combos`
--

LOCK TABLES `tbl_combos` WRITE;
/*!40000 ALTER TABLE `tbl_combos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_combos_ordenes`
--

DROP TABLE IF EXISTS `tbl_combos_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_combos_ordenes` (
  `id_combos_ordenes` int NOT NULL AUTO_INCREMENT,
  `id_orden_id` int NOT NULL,
  `id_combo_id` int NOT NULL,
  `id_prod_x_orden_combo` int NOT NULL,
  `id_prod_x_orden_parte_combo` int NOT NULL,
  PRIMARY KEY (`id_combos_ordenes`),
  KEY `index2` (`id_prod_x_orden_combo`),
  KEY `index3` (`id_prod_x_orden_parte_combo`),
  KEY `fk_tbl_combos_ordenes_1_idx` (`id_orden_id`),
  KEY `index5` (`id_combo_id`),
  CONSTRAINT `fk_tbl_combos_ordenes_1` FOREIGN KEY (`id_prod_x_orden_combo`) REFERENCES `tbl_prods_x_orden` (`id_prod_x_orden`),
  CONSTRAINT `fk_tbl_combos_ordenes_2` FOREIGN KEY (`id_prod_x_orden_parte_combo`) REFERENCES `tbl_prods_x_orden` (`id_prod_x_orden`),
  CONSTRAINT `fk_tbl_combos_ordenes_3` FOREIGN KEY (`id_orden_id`) REFERENCES `tbl_prods_x_orden` (`int_orden_id`),
  CONSTRAINT `fk_tbl_combos_ordenes_4` FOREIGN KEY (`id_combo_id`) REFERENCES `tbl_prods_x_orden` (`int_producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_combos_ordenes`
--

LOCK TABLES `tbl_combos_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_combos_ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_combos_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_configs`
--

DROP TABLE IF EXISTS `tbl_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_configs` (
  `id_config` int NOT NULL AUTO_INCREMENT,
  `chr_var_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `chr_var_value` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_configs`
--

LOCK TABLES `tbl_configs` WRITE;
/*!40000 ALTER TABLE `tbl_configs` DISABLE KEYS */;
INSERT INTO `tbl_configs` VALUES (1,'CombosCategory','13'),(2,'personal_index','3'),(3,'email_host','smtpout.secureserver.net'),(4,'email_user','pedidos@tacosroy.com'),(5,'email_password','.tacos1965.');
/*!40000 ALTER TABLE `tbl_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_consecutivo`
--

DROP TABLE IF EXISTS `tbl_consecutivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_consecutivo` (
  `id_consecutivo` int NOT NULL AUTO_INCREMENT,
  `chr_consecutivo` int NOT NULL,
  PRIMARY KEY (`id_consecutivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consecutivo`
--

LOCK TABLES `tbl_consecutivo` WRITE;
/*!40000 ALTER TABLE `tbl_consecutivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_consecutivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_control_fechas`
--

DROP TABLE IF EXISTS `tbl_control_fechas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_control_fechas` (
  `id_control_fechas` int NOT NULL AUTO_INCREMENT,
  `dt_fecha_calendario` datetime DEFAULT CURRENT_TIMESTAMP,
  `dt_comienzo_labores` datetime DEFAULT NULL,
  `dt_finaliza_labores` datetime DEFAULT NULL,
  `chr_control` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_control_fechas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_control_fechas`
--

LOCK TABLES `tbl_control_fechas` WRITE;
/*!40000 ALTER TABLE `tbl_control_fechas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_control_fechas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_costos_extra_var_prod`
--

DROP TABLE IF EXISTS `tbl_costos_extra_var_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_costos_extra_var_prod` (
  `id_costos_extra_var_prod` int NOT NULL AUTO_INCREMENT,
  `id_producto_variante` int DEFAULT NULL,
  `id_fecha_control` int DEFAULT NULL,
  `fl_costo_extra` float DEFAULT NULL,
  `id_tipo_precio` int DEFAULT NULL,
  PRIMARY KEY (`id_costos_extra_var_prod`),
  KEY `fk_tbl_costos_extra_var_prod_2_idx` (`id_producto_variante`),
  KEY `fk_tbl_costos_extra_var_prod_3_idx` (`id_fecha_control`),
  KEY `index5` (`id_tipo_precio`),
  CONSTRAINT `fk_tbl_costos_extra_var_prod_2` FOREIGN KEY (`id_producto_variante`) REFERENCES `tbl_prods_variantes` (`id_prods_variantes`),
  CONSTRAINT `fk_tbl_costos_extra_var_prod_3` FOREIGN KEY (`id_fecha_control`) REFERENCES `tbl_control_fechas` (`id_control_fechas`),
  CONSTRAINT `fk_tbl_costos_extra_var_prod_4` FOREIGN KEY (`id_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_costos_extra_var_prod`
--

LOCK TABLES `tbl_costos_extra_var_prod` WRITE;
/*!40000 ALTER TABLE `tbl_costos_extra_var_prod` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_costos_extra_var_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_datos_sucursal`
--

DROP TABLE IF EXISTS `tbl_datos_sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_datos_sucursal` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `chr_nombre` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_dir1` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_dir2` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_dir3` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_telefono1` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_telefono2` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_usuario_encargado` int NOT NULL,
  `dt_inicio_operaciones` date DEFAULT NULL,
  `chr_prefijo_db` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `chr_cloud_directory` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_sucursal`
--

LOCK TABLES `tbl_datos_sucursal` WRITE;
/*!40000 ALTER TABLE `tbl_datos_sucursal` DISABLE KEYS */;
INSERT INTO `tbl_datos_sucursal` VALUES (1,'Tacos Roy Matriz','Trujano 201','Col. Centro','CP. 68000, Oaxaca, Oaxaca.','9511722708','000000000',0,'2021-04-01','trujano','Dropbox/2020'),(2,'asdfasd','asdfasdf','asdfasd','asdfasdf','3216545','321654',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_datos_sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_facturas`
--

DROP TABLE IF EXISTS `tbl_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_facturas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `chr_nr_factura` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `bit_realizada` int DEFAULT '0',
  PRIMARY KEY (`id_factura`),
  KEY `index2` (`id_orden`),
  CONSTRAINT `fk_tbl_facturas_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes_cerradas` (`id_orden_cerrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facturas`
--

LOCK TABLES `tbl_facturas` WRITE;
/*!40000 ALTER TABLE `tbl_facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_facturas_clientes`
--

DROP TABLE IF EXISTS `tbl_facturas_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_facturas_clientes` (
  `id_factura_cliente` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_factura` int DEFAULT NULL,
  `dt_enviada` datetime DEFAULT NULL,
  PRIMARY KEY (`id_factura_cliente`),
  KEY `index2` (`id_cliente`),
  KEY `index3` (`id_factura`),
  CONSTRAINT `fk_tbl_facturas_clientes_1` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_clientes` (`id_cliente`),
  CONSTRAINT `fk_tbl_facturas_clientes_2` FOREIGN KEY (`id_factura`) REFERENCES `tbl_facturas` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_facturas_clientes`
--

LOCK TABLES `tbl_facturas_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_facturas_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_facturas_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_formas_pago`
--

DROP TABLE IF EXISTS `tbl_formas_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_formas_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `chr_forma_pago` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `fl_comision_extra` float DEFAULT '0',
  `int_activo` int DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_formas_pago`
--

LOCK TABLES `tbl_formas_pago` WRITE;
/*!40000 ALTER TABLE `tbl_formas_pago` DISABLE KEYS */;
INSERT INTO `tbl_formas_pago` VALUES (1,'Efectivo',0,1),(2,'Descuento',0,1),(3,'Empleado/Cortesia',0,1),(4,'Tarjeta Deb/Cred',0,1),(5,'Transferencia',0,1),(6,'Cancelado',0,0);
/*!40000 ALTER TABLE `tbl_formas_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_gastos`
--

DROP TABLE IF EXISTS `tbl_gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_gastos` (
  `id_gasto` int NOT NULL AUTO_INCREMENT,
  `dt_horafecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_cantidad` float NOT NULL,
  `chr_concepto_gasto` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_usuario_auth` int NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `id_usuario_auth` (`id_usuario_auth`),
  CONSTRAINT `tbl_gastos_ibfk_1` FOREIGN KEY (`id_usuario_auth`) REFERENCES `tbl_usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_gastos`
--

LOCK TABLES `tbl_gastos` WRITE;
/*!40000 ALTER TABLE `tbl_gastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_grupos_def`
--

DROP TABLE IF EXISTS `tbl_grupos_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_grupos_def` (
  `id_grupos_def` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_grupo` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_grupos_def`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_grupos_def`
--

LOCK TABLES `tbl_grupos_def` WRITE;
/*!40000 ALTER TABLE `tbl_grupos_def` DISABLE KEYS */;
INSERT INTO `tbl_grupos_def` VALUES (1,'Tacos de cerdo Maiz',1),(3,'Tacos de cerdo HARINA',1),(4,'Tostadas de cerdo',1),(5,'Otros',1);
/*!40000 ALTER TABLE `tbl_grupos_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_insumos`
--

DROP TABLE IF EXISTS `tbl_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_insumos` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_insumo` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_descripcion` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `bit_activo` int DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_insumos`
--

LOCK TABLES `tbl_insumos` WRITE;
/*!40000 ALTER TABLE `tbl_insumos` DISABLE KEYS */;
INSERT INTO `tbl_insumos` VALUES (1,'Tortilla','Tortilla de Maiz',1),(2,'Tortilla de harina','Tortilla de harina de trigo',1),(3,'Tostada','Tostada frita para acompañar alimentos',1),(4,'Pepsi','Refresco Pepsi',0),(5,'Squirt','Refresco Squirt',0),(6,'Mirinda','Refresco Mirinda',0),(7,'Sangría','Refresco Sangría',0),(8,'Cerveza Normal','Cerveza normal',1),(9,'Cerveza Victoria','Cerveza Victoria',0),(10,'Cerveza Corona Light','Cerveza Corona Ligh',0),(11,'Cerveza León','Cerveza León',0),(12,'Cerveza Pacífico','Cerveza Pacífico',0),(13,'Cerveza Montejo','Cerveza Montejo',0),(14,'Cerveza Modelo Especial','Cerveza Modelo Especial',0),(15,'Cerveza Barrilito','Cerveza Barrilito',0),(16,'Cerveza Superior','Cerveza Superior',1),(17,'Cerveza Premium','Cerveza Premium',1),(18,'Panqué de Elote, Rebanada','Rebanada de Panqué de elote',1),(19,'Flan','Flan',1),(20,'Pastel de Queso','Pastel de Queso',1),(21,'Agua Emb. 1/2 Litro','Botella de agua de Medio litro',0),(22,'Agua Emb. 1 Litro','Botella de agua embotellada de 1 litro',0),(23,'Jugo Boing','Jugos boing de varios sabores',0),(24,'Cerveza Stella Artois','Cerveza Stella Artois',0),(25,'7 Up','Refresco 7 Up',0),(26,'Agua Mineral','Agua Mineral',0),(27,'Manzanita Sol','Refresco Manzanita Sol',0),(28,'Boing','Boing',0),(29,'Cerveza Negra Modelo','Cerveza Negra Modelo',0),(30,'Cerveza Bohemia','Cerveza Bohemia',0),(31,'Cerveza Modelo Especial (Lata)','Cerveza Modelo Especial (Lata)',0),(32,'Refresco Coca Cola','Refresco Coca Cola',1),(33,'Refresco Sabor','Refresco de sabor',1),(34,'Sidral','Sidral',0),(35,'Sprite','Sprite',0),(36,'Fresca','Fresca',0),(37,'Sangria','Sangria',0),(38,'Jugo del Valle','Jugo del Valle',0),(39,'Agua Ciel 600 ml','Agua Ciel 600 ml',1),(40,'Cerveza Negra Modelo','Cerveza Negra Modelo',0),(41,'Cerveza Cucapa','Cerveza Cucapa',0),(42,'Tizana','Tizana',1),(43,'Agua Topochico','Agua Mineral Topochico',1),(44,'Ponche','Ponche',1);
/*!40000 ALTER TABLE `tbl_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_insumos_x_platillo`
--

DROP TABLE IF EXISTS `tbl_insumos_x_platillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_insumos_x_platillo` (
  `id_insumo_x_platillo` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_insumo` int NOT NULL,
  `int_cantidad` int NOT NULL,
  PRIMARY KEY (`id_insumo_x_platillo`),
  KEY `sdfasdfas` (`id_producto`) COMMENT 'fsgfdsgsd',
  KEY `fhgdfggf` (`id_insumo`) COMMENT 'fghdgdh',
  CONSTRAINT `tbl_insumos_x_platillo_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  CONSTRAINT `tbl_insumos_x_platillo_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `tbl_insumos` (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_insumos_x_platillo`
--

LOCK TABLES `tbl_insumos_x_platillo` WRITE;
/*!40000 ALTER TABLE `tbl_insumos_x_platillo` DISABLE KEYS */;
INSERT INTO `tbl_insumos_x_platillo` VALUES (1,48,25,1),(2,50,26,1),(4,53,21,1),(5,11,1,1),(6,16,1,1),(7,14,1,1),(8,9,1,1),(10,8,1,1),(14,7,1,1),(15,6,1,1),(16,5,1,1),(17,49,27,1),(19,10,1,1),(20,15,1,1),(21,17,1,1),(22,34,1,1),(23,35,1,1),(24,45,4,1),(27,79,1,1),(37,25,1,1),(38,32,3,1),(39,36,3,1),(40,59,3,1),(41,62,3,1),(42,68,3,1),(43,61,3,1),(44,63,3,1),(45,69,3,1),(46,65,3,1),(47,64,3,1),(48,67,3,1),(49,66,3,1),(50,60,3,1),(51,57,3,1),(52,58,3,1),(53,12,1,1),(54,54,18,1),(55,56,20,1),(56,47,7,1),(57,55,19,1),(60,100,29,1),(61,94,30,1),(62,92,8,1),(63,98,10,1),(64,101,14,1),(65,93,9,1),(66,103,16,1),(67,102,31,1),(68,106,2,1),(69,20,1,6),(70,21,1,6),(72,18,1,6),(73,19,1,6),(74,22,1,6),(75,23,1,6),(76,24,1,6),(77,165,1,6),(78,166,1,6),(79,167,1,6),(80,70,1,1),(81,71,1,1),(82,72,1,1),(83,73,1,1),(84,74,1,1),(85,75,1,1),(86,76,1,1),(87,77,1,1),(88,78,1,1),(89,80,1,1),(90,117,1,1),(91,118,1,1),(92,119,1,1),(93,120,1,1),(94,121,1,1),(95,122,1,1),(96,123,1,1),(97,124,1,1),(98,125,1,1),(99,126,2,1),(100,127,2,1),(101,128,2,1),(102,129,2,1),(103,130,2,1),(104,131,2,1),(105,59,3,1),(106,148,3,1),(107,149,3,1),(108,150,3,1),(109,151,3,1),(110,152,3,1),(111,153,3,1),(112,154,3,1),(113,155,3,1),(114,156,3,1),(115,157,3,1),(116,158,3,1),(117,159,3,1),(118,160,3,1),(119,179,3,1),(120,28,1,4),(121,29,1,4),(122,30,2,2),(123,31,2,2),(124,33,2,1),(127,174,1,4),(128,81,3,2),(129,82,3,2),(130,83,3,2),(131,84,3,2),(132,85,3,2),(133,86,3,2),(134,87,3,2),(135,88,3,2),(136,161,3,2),(137,162,3,2),(138,163,3,2),(139,164,3,2),(140,180,3,2),(141,109,1,6),(143,168,1,6),(144,46,33,1),(146,91,8,1),(148,93,17,1),(150,13,1,1),(155,26,3,2),(156,27,3,2),(157,114,1,2),(158,115,3,2),(159,132,1,1),(160,133,1,1),(161,134,1,1),(162,135,1,1),(163,136,2,1),(164,137,2,1),(165,138,2,1),(166,139,2,1),(167,140,2,1),(168,141,2,1),(169,142,2,1),(170,143,2,1),(171,144,2,1),(172,145,2,1),(173,146,2,1),(174,147,2,1),(175,181,2,6),(176,182,1,4),(177,183,2,4),(178,184,2,1),(179,185,2,2),(180,186,2,1),(181,187,1,1),(182,188,1,2),(183,189,1,1),(184,190,2,1),(185,191,2,1),(186,192,2,1),(187,194,2,1),(188,195,1,1),(189,196,1,1),(190,197,1,1),(191,199,1,1),(192,200,1,1),(193,201,1,1),(194,202,1,1),(195,203,1,6),(196,204,1,6),(197,205,1,6),(198,206,1,6),(199,207,1,6),(200,208,1,6),(201,209,1,6),(202,210,1,6),(203,211,2,6),(204,212,2,6),(205,213,2,6),(206,214,2,6),(207,215,2,6),(208,216,2,6),(209,217,2,6),(210,218,2,6),(211,219,2,6),(212,220,2,6),(213,221,2,6),(214,222,2,6),(215,223,2,6),(216,224,2,6),(217,225,2,6),(218,226,2,6),(219,227,2,6),(220,228,1,4),(221,229,1,4),(222,230,1,4),(223,231,1,4),(224,232,1,4),(225,233,2,4),(226,234,2,4),(227,235,2,4),(228,236,2,4),(229,237,2,4),(230,238,2,4),(231,239,2,4),(232,240,2,4),(233,241,2,1),(234,242,2,1),(235,243,2,1),(239,247,2,2),(240,244,2,2),(241,248,2,2),(242,245,2,2),(243,246,2,2),(244,249,2,1),(245,250,2,1),(246,251,2,1),(247,255,1,1),(248,256,1,1),(249,257,1,1),(250,258,1,1),(251,259,1,1),(252,260,1,1),(253,261,1,1),(254,262,1,1),(255,263,1,2),(256,264,1,2),(257,265,1,2),(258,266,1,2),(259,267,1,2),(260,268,1,2),(264,292,1,1),(265,293,2,1),(266,294,1,1),(267,295,1,1),(268,296,2,1),(269,297,1,1),(270,298,2,1),(271,299,2,2),(272,300,3,1),(273,301,3,1),(274,302,2,1),(275,303,2,1),(276,304,3,1),(277,305,3,1),(278,306,2,2),(279,307,1,1),(280,308,2,1),(281,309,2,2),(282,312,1,6),(283,313,1,6),(284,314,1,6),(285,310,2,1),(286,97,33,1),(287,291,8,1),(288,54,18,1),(289,116,1,6),(290,281,1,6),(292,282,1,12),(293,283,1,12),(294,284,1,12),(295,285,1,24),(296,286,1,24),(297,287,1,24),(298,288,1,24),(299,289,1,24),(300,290,1,12),(301,311,1,24),(302,318,1,6),(303,316,1,1),(304,317,2,1),(305,321,1,1),(306,319,1,12),(307,320,1,24),(309,99,8,1),(310,322,33,1),(311,25,1,1),(312,5,1,1),(313,133,1,1),(314,70,1,1),(315,14,1,1),(316,57,3,1),(317,18,1,6),(319,28,1,4),(320,109,1,6),(321,324,33,1),(322,325,33,1),(323,89,39,1),(324,171,42,1),(325,172,42,1),(326,113,33,1),(327,326,1,1),(328,327,1,1),(329,328,33,1),(330,329,2,1),(331,331,1,1),(332,332,1,2),(333,338,44,1);
/*!40000 ALTER TABLE `tbl_insumos_x_platillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inventario`
--

DROP TABLE IF EXISTS `tbl_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_inventario` (
  `id_inventario_id` int NOT NULL AUTO_INCREMENT,
  `id_insumo_id` int NOT NULL,
  `int_cantidad` int NOT NULL,
  `id_control_fecha` int DEFAULT NULL,
  PRIMARY KEY (`id_inventario_id`),
  KEY `id_insumo_id` (`id_insumo_id`),
  KEY `index3` (`id_control_fecha`),
  CONSTRAINT `fk_tbl_inventario_1` FOREIGN KEY (`id_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`),
  CONSTRAINT `tbl_inventario_ibfk_1` FOREIGN KEY (`id_insumo_id`) REFERENCES `tbl_insumos` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inventario`
--

LOCK TABLES `tbl_inventario` WRITE;
/*!40000 ALTER TABLE `tbl_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mermas`
--

DROP TABLE IF EXISTS `tbl_mermas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mermas` (
  `id_merma` int NOT NULL AUTO_INCREMENT,
  `id_insumo` int NOT NULL,
  `int_cantidad` int DEFAULT NULL,
  `dt_control_fecha` int DEFAULT NULL,
  PRIMARY KEY (`id_merma`),
  KEY `index2` (`id_insumo`),
  KEY `index3` (`dt_control_fecha`),
  CONSTRAINT `fk_tbl_mermas_1` FOREIGN KEY (`id_insumo`) REFERENCES `tbl_insumos` (`id_insumo`),
  CONSTRAINT `fk_tbl_mermas_2` FOREIGN KEY (`dt_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mermas`
--

LOCK TABLES `tbl_mermas` WRITE;
/*!40000 ALTER TABLE `tbl_mermas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mermas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mesas`
--

DROP TABLE IF EXISTS `tbl_mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mesas` (
  `id_mesa_id` int NOT NULL AUTO_INCREMENT,
  `chr_mesa` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `int_nr_personas` int NOT NULL,
  `bit_mesa_activa` tinyint NOT NULL,
  `bit_domicilio` int DEFAULT '0',
  PRIMARY KEY (`id_mesa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mesas`
--

LOCK TABLES `tbl_mesas` WRITE;
/*!40000 ALTER TABLE `tbl_mesas` DISABLE KEYS */;
INSERT INTO `tbl_mesas` VALUES (1,'1',4,1,0),(2,'2',4,1,0),(3,'3',5,1,0),(4,'4',4,1,0),(5,'5',6,1,0),(6,'6',4,1,0),(7,'7',6,1,0),(8,'8',5,1,0),(9,'9',4,1,0),(10,'10',5,1,0),(11,'11',1,1,0),(12,'12',1,1,0),(13,'13',6,1,0),(14,'14',6,1,0),(15,'15',6,1,0),(16,'Para llevar',1,1,0),(17,'A domicilio',1,1,1),(18,'Temporal',1,0,0);
/*!40000 ALTER TABLE `tbl_mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_orcon`
--

DROP TABLE IF EXISTS `tbl_orcon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_orcon` (
  `id_orcon` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `id_cons` int NOT NULL,
  PRIMARY KEY (`id_orcon`),
  KEY `index2` (`id_orden`),
  KEY `index3` (`id_cons`),
  CONSTRAINT `fk_tbl_orcon_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes_cerradas` (`id_orden_cerrada`),
  CONSTRAINT `fk_tbl_orcon_2` FOREIGN KEY (`id_cons`) REFERENCES `tbl_consecutivo` (`id_consecutivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_orcon`
--

LOCK TABLES `tbl_orcon` WRITE;
/*!40000 ALTER TABLE `tbl_orcon` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orcon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes`
--

DROP TABLE IF EXISTS `tbl_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenes` (
  `id_orden_id` int NOT NULL AUTO_INCREMENT,
  `dt_horafecha_orden` datetime NOT NULL,
  `int_mesa` int NOT NULL,
  `int_consecutivo` int NOT NULL,
  `chr_status_orden` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `id_control_fecha` int NOT NULL,
  `int_nr_comanda` int DEFAULT NULL,
  PRIMARY KEY (`id_orden_id`),
  KEY `index4` (`id_control_fecha`),
  KEY `fk_tbl_ordenes_1_idx` (`int_mesa`),
  KEY `dsfafsfd` (`int_consecutivo`),
  CONSTRAINT `fk_tbl_ordenes_1` FOREIGN KEY (`int_mesa`) REFERENCES `tbl_mesas` (`id_mesa_id`),
  CONSTRAINT `fk_tbl_ordenes_2` FOREIGN KEY (`int_consecutivo`) REFERENCES `tbl_ticket_cons` (`id_ticketNrConsecutivo`),
  CONSTRAINT `fk_tbl_ordenes_3` FOREIGN KEY (`id_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes`
--

LOCK TABLES `tbl_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes_cerradas`
--

DROP TABLE IF EXISTS `tbl_ordenes_cerradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenes_cerradas` (
  `id_orden_cerrada` int NOT NULL AUTO_INCREMENT,
  `id_orden_id` int NOT NULL,
  `dt_horafecha_cierre_orden` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_total` float NOT NULL,
  `bool_factura` tinyint(1) NOT NULL DEFAULT '0',
  `chr_referencia_notas` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `int_lvl_report` int NOT NULL DEFAULT '1',
  `id_ticket_IDNr` int NOT NULL,
  `id_control_fecha` int DEFAULT NULL,
  `int_forma_pago` int DEFAULT '1',
  PRIMARY KEY (`id_orden_cerrada`),
  KEY `id_orden_id` (`id_orden_id`),
  KEY `bsbfs` (`id_ticket_IDNr`) COMMENT 'fdsagr',
  KEY `index4` (`id_control_fecha`),
  KEY `index5` (`int_forma_pago`),
  CONSTRAINT `Cerrada_orden_ID` FOREIGN KEY (`id_orden_id`) REFERENCES `tbl_ordenes` (`id_orden_id`),
  CONSTRAINT `fk_tbl_ordenes_cerradas_1` FOREIGN KEY (`id_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`),
  CONSTRAINT `fk_tbl_ordenes_cerradas_2` FOREIGN KEY (`int_forma_pago`) REFERENCES `tbl_formas_pago` (`id_forma_pago`),
  CONSTRAINT `tbl_ordenes_cerradas_ibfk_1` FOREIGN KEY (`id_ticket_IDNr`) REFERENCES `tbl_ticket_cons` (`id_ticketNrConsecutivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_cerradas`
--

LOCK TABLES `tbl_ordenes_cerradas` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_cerradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenes_cerradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes_descuento`
--

DROP TABLE IF EXISTS `tbl_ordenes_descuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenes_descuento` (
  `id_ordenes_descuento` int NOT NULL AUTO_INCREMENT,
  `id_orden_cerrada_id` int DEFAULT NULL,
  `fl_descuento_aplicado` float DEFAULT NULL,
  PRIMARY KEY (`id_ordenes_descuento`),
  KEY `index2` (`id_orden_cerrada_id`),
  CONSTRAINT `fk_tbl_ordenes_descuento_1` FOREIGN KEY (`id_orden_cerrada_id`) REFERENCES `tbl_ordenes_cerradas` (`id_orden_cerrada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_descuento`
--

LOCK TABLES `tbl_ordenes_descuento` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_descuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenes_descuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes_personal`
--

DROP TABLE IF EXISTS `tbl_ordenes_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenes_personal` (
  `id_orden_personal` int NOT NULL AUTO_INCREMENT,
  `id_orden_id` int NOT NULL,
  `id_personal` int NOT NULL,
  PRIMARY KEY (`id_orden_personal`),
  KEY `id_orden_id` (`id_orden_id`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `tbl_ordenes_personal_ibfk_1` FOREIGN KEY (`id_orden_id`) REFERENCES `tbl_ordenes` (`id_orden_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_ordenes_personal_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `tbl_personal` (`id_personal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ordenes_personal`
--

LOCK TABLES `tbl_ordenes_personal` WRITE;
/*!40000 ALTER TABLE `tbl_ordenes_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ordenes_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ordenes_x_clientes`
--

DROP TABLE IF EXISTS `tbl_ordenes_x_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ordenes_x_clientes` (
  `id_ordenes_x_clientes` int NOT NULL AUTO_INCREMENT,
  `id_orden` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_ordenes_x_clientes`),
  KEY `index2` (`id_orden`),
  KEY `index3` (`id_cliente`),
  CONSTRAINT `fk_tbl_ordenes_x_clientes_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes` (`id_orden_id`),
  CONSTRAINT `fk_tbl_ordenes_x_clientes_2` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_personal` (
  `id_personal` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_persona` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_apellidos` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_CURP` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_telefono` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `int_puesto` int NOT NULL,
  `bit_activo` int NOT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `int_puesto` (`int_puesto`),
  CONSTRAINT `tbl_personal_ibfk_1` FOREIGN KEY (`int_puesto`) REFERENCES `tbl_puestos` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_personal`
--

LOCK TABLES `tbl_personal` WRITE;
/*!40000 ALTER TABLE `tbl_personal` DISABLE KEYS */;
INSERT INTO `tbl_personal` VALUES (1,'Encargado Sucursal','De la sucursal','ABCDUFIDUSOAISDUFO','1234567890',1,1),(2,'Cajero','De la sucursal','CAJEROJDKFJSLDFJLA','9876543210',2,1),(3,'Mesero','De la sucursal','MESERO34238947J','1234567890',3,1),(4,'Adrian','Adrian','1234567890','9515555555',5,1);
/*!40000 ALTER TABLE `tbl_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_precio_tipo_ordenes`
--

DROP TABLE IF EXISTS `tbl_precio_tipo_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_precio_tipo_ordenes` (
  `id_precio_tipo_ordenes` int NOT NULL AUTO_INCREMENT,
  `id_orden` int NOT NULL,
  `id_tipo_precio` int NOT NULL,
  PRIMARY KEY (`id_precio_tipo_ordenes`),
  KEY `index2` (`id_orden`),
  KEY `index3` (`id_tipo_precio`),
  CONSTRAINT `fk_tbl_precio_tipo_ordenes_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes` (`id_orden_id`),
  CONSTRAINT `fk_tbl_precio_tipo_ordenes_2` FOREIGN KEY (`id_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_precio_tipo_ordenes`
--

LOCK TABLES `tbl_precio_tipo_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_precio_tipo_ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_precio_tipo_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_precios_productos`
--

DROP TABLE IF EXISTS `tbl_precios_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_precios_productos` (
  `id_precio` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `dbl_precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `int_tipo_precio` int NOT NULL,
  `bit_activo` tinyint NOT NULL DEFAULT '1',
  `dat_fecha_precio_activo` datetime DEFAULT NULL,
  PRIMARY KEY (`id_precio`),
  KEY `id_producto` (`id_producto`),
  KEY `int_tipo_precio` (`int_tipo_precio`),
  KEY `id_producto_2` (`id_producto`),
  CONSTRAINT `tbl_precios_productos_ibfk_1` FOREIGN KEY (`int_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2012 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_precios_productos`
--

LOCK TABLES `tbl_precios_productos` WRITE;
/*!40000 ALTER TABLE `tbl_precios_productos` DISABLE KEYS */;
INSERT INTO `tbl_precios_productos` VALUES (1,5,11.00,1,0,'2020-09-15 00:00:00'),(2,6,10.00,1,0,'2020-09-15 00:00:00'),(3,0,10.00,1,1,'2020-09-15 00:00:00'),(4,7,10.00,1,0,'2020-09-15 00:00:00'),(5,8,10.00,1,0,'2020-09-15 00:00:00'),(6,9,10.00,1,0,'2020-09-15 00:00:00'),(7,10,10.00,1,0,'2020-09-15 00:00:00'),(8,11,10.00,1,0,'2020-09-15 00:00:00'),(9,12,10.00,1,0,'2020-09-15 00:00:00'),(10,13,10.00,1,0,'2020-09-15 00:00:00'),(11,14,12.00,1,0,'2020-09-15 00:00:00'),(12,15,10.00,1,0,'2020-09-15 00:00:00'),(13,16,15.00,1,0,'2020-09-15 00:00:00'),(14,17,15.00,1,0,'2020-09-15 00:00:00'),(15,18,80.00,1,0,'2020-09-15 00:00:00'),(16,19,80.00,1,0,'2020-09-15 00:00:00'),(17,20,75.00,1,0,'2020-09-15 00:00:00'),(18,21,80.00,1,0,'2020-09-15 00:00:00'),(19,22,75.00,1,0,'2020-09-15 00:00:00'),(20,23,75.00,1,0,'2020-09-15 00:00:00'),(21,24,75.00,1,0,'2020-09-15 00:00:00'),(22,25,1.00,1,0,'2020-09-15 00:00:00'),(23,26,45.00,1,1,'2020-09-15 00:00:00'),(24,27,40.00,1,1,'2020-09-15 00:00:00'),(25,28,40.00,1,0,'2020-09-15 00:00:00'),(26,29,45.00,1,0,'2020-09-15 00:00:00'),(27,30,27.00,1,0,'2020-09-15 00:00:00'),(28,31,27.00,1,0,'2020-09-15 00:00:00'),(29,32,24.00,1,1,'2020-09-15 00:00:00'),(30,33,22.00,1,0,'2020-09-15 00:00:00'),(31,34,22.00,1,0,'2020-09-15 00:00:00'),(32,35,27.00,1,0,'2020-09-15 00:00:00'),(33,36,2.00,1,0,'2020-09-15 00:00:00'),(34,37,17.00,1,0,'2020-09-15 00:00:00'),(35,38,50.00,1,0,'2020-09-15 00:00:00'),(36,39,17.00,1,0,'2020-09-15 00:00:00'),(37,40,50.00,1,1,'2020-09-15 00:00:00'),(38,41,17.00,1,1,'2020-09-15 00:00:00'),(39,42,50.00,1,1,'2020-09-15 00:00:00'),(40,43,17.00,1,1,'2020-09-15 00:00:00'),(41,44,50.00,1,1,'2020-09-15 00:00:00'),(42,45,17.00,1,0,'2020-09-15 00:00:00'),(43,46,17.00,1,0,'2020-09-15 00:00:00'),(44,47,17.00,1,0,'2020-09-15 00:00:00'),(45,48,17.00,1,0,'2020-09-15 00:00:00'),(46,49,17.00,1,0,'2020-09-15 00:00:00'),(47,50,17.00,1,0,'2020-09-15 00:00:00'),(48,51,15.00,1,0,'2020-09-15 00:00:00'),(49,52,15.00,1,0,'2020-09-15 00:00:00'),(50,53,12.00,1,1,'2020-09-15 00:00:00'),(51,54,25.00,1,0,'2020-09-15 00:00:00'),(52,55,25.00,1,0,'2020-09-15 00:00:00'),(53,56,30.00,1,0,'2020-09-15 00:00:00'),(54,57,24.00,1,0,'2020-09-15 00:00:00'),(55,58,24.00,1,0,'2020-09-15 00:00:00'),(56,59,24.00,1,0,'2020-09-15 00:00:00'),(57,60,24.00,1,0,'2020-09-15 00:00:00'),(58,61,24.00,1,0,'2020-09-15 00:00:00'),(59,62,24.00,1,0,'2020-09-15 00:00:00'),(60,63,24.00,1,1,'2020-09-15 00:00:00'),(61,64,24.00,1,0,'2020-09-15 00:00:00'),(62,65,24.00,1,0,'2020-09-15 00:00:00'),(63,66,24.00,1,0,'2020-09-15 00:00:00'),(64,67,24.00,1,0,'2020-09-15 00:00:00'),(65,68,24.00,1,0,'2020-09-15 00:00:00'),(66,69,24.00,1,0,'2020-09-15 00:00:00'),(68,71,10.00,1,0,'2020-09-15 00:00:00'),(69,72,10.00,1,0,'2020-09-15 00:00:00'),(70,73,10.00,1,0,'2020-09-15 00:00:00'),(71,74,10.00,1,0,'2020-09-15 00:00:00'),(72,75,10.00,1,0,'2020-09-15 00:00:00'),(73,76,10.00,1,0,'2020-09-15 00:00:00'),(74,77,10.00,1,0,'2020-09-15 00:00:00'),(75,78,10.00,1,0,'2020-09-15 00:00:00'),(76,79,12.00,1,1,'2020-09-15 00:00:00'),(77,80,10.00,1,0,'2020-09-15 00:00:00'),(78,70,10.00,1,0,'2020-09-15 00:00:00'),(79,81,45.00,1,0,'2020-09-15 00:00:00'),(80,82,45.00,1,0,'2020-09-15 00:00:00'),(81,83,45.00,1,0,'2020-09-15 00:00:00'),(82,84,45.00,1,0,'2020-09-15 00:00:00'),(83,85,40.00,1,0,'2020-09-15 00:00:00'),(84,86,40.00,1,0,'2020-09-15 00:00:00'),(85,87,40.00,1,0,'2020-09-15 00:00:00'),(86,88,40.00,1,0,'2020-09-15 00:00:00'),(87,89,15.00,1,0,'2020-09-15 00:00:00'),(88,90,20.00,1,1,'2020-09-15 00:00:00'),(89,91,28.00,1,0,'2020-09-15 00:00:00'),(90,92,22.00,1,0,'2020-09-15 00:00:00'),(91,93,22.00,1,0,'2020-09-15 00:00:00'),(92,94,35.00,1,1,'2020-09-15 00:00:00'),(93,95,17.00,1,0,'2020-09-15 00:00:00'),(94,96,50.00,1,0,'2020-09-15 00:00:00'),(95,97,18.00,1,0,'2020-09-15 00:00:00'),(96,98,22.00,1,1,'2020-09-15 00:00:00'),(97,99,22.00,1,1,'2020-09-15 00:00:00'),(98,100,27.00,1,1,'2020-09-15 00:00:00'),(99,101,27.00,1,1,'2020-09-15 00:00:00'),(100,102,25.00,1,1,'2020-09-15 00:00:00'),(101,103,25.00,1,1,'2020-09-15 00:00:00'),(102,104,8.00,1,0,'2020-09-15 00:00:00'),(103,105,8.00,1,0,'2020-09-15 00:00:00'),(104,106,2.00,1,0,'2020-09-15 00:00:00'),(105,107,8.00,1,0,'2020-09-15 00:00:00'),(106,108,8.00,1,0,'2020-09-15 00:00:00'),(107,109,90.00,1,0,'2020-09-15 00:00:00'),(108,110,-24.00,1,1,'2020-09-15 00:00:00'),(109,111,-24.00,1,1,'2020-09-15 00:00:00'),(110,112,155.00,1,0,'2020-09-15 00:00:00'),(111,18,85.00,1,0,'2020-09-16 19:05:00'),(112,18,135.00,2,0,'2020-09-16 19:06:00'),(113,20,135.00,2,0,'2020-09-16 21:30:00'),(114,19,85.00,1,0,'2020-09-16 21:30:00'),(115,19,135.00,2,0,'2020-09-16 21:31:00'),(116,21,95.00,1,0,'2020-09-17 01:55:00'),(117,21,140.00,2,0,'2020-09-17 01:55:00'),(118,22,85.00,1,0,'2020-09-17 02:07:00'),(119,22,125.00,2,1,'2020-09-17 02:08:00'),(120,45,22.00,1,1,'2020-09-17 02:09:00'),(121,113,22.00,1,0,'2020-09-17 02:11:00'),(122,113,32.00,2,1,'2020-09-17 02:12:00'),(123,112,155.00,1,0,'2020-09-17 20:27:00'),(124,112,155.00,1,0,'2020-09-17 20:30:00'),(125,113,32.00,1,0,'2020-09-17 20:33:00'),(126,112,155.00,1,0,'2020-09-17 21:12:00'),(127,114,0.00,1,0,'2020-09-18 16:51:00'),(128,114,0.00,1,1,'2020-09-18 16:57:00'),(129,115,0.00,1,0,'2020-09-19 17:41:00'),(130,115,0.00,1,1,'2020-09-19 17:45:00'),(131,81,60.00,1,0,'2020-09-21 22:15:00'),(132,23,85.00,1,0,'2020-09-23 20:20:00'),(133,23,140.00,2,0,'2020-09-23 20:20:00'),(134,6,20.00,2,1,'2020-10-04 19:25:00'),(135,6,12.00,1,0,'2020-10-08 20:05:00'),(136,18,85.00,1,0,'2020-10-17 02:46:00'),(137,19,85.00,1,0,'2020-10-17 03:00:00'),(138,20,75.00,1,0,'2020-10-17 03:01:00'),(139,21,95.00,1,0,'2020-10-17 03:01:00'),(140,22,85.00,1,0,'2020-10-17 03:02:00'),(141,23,85.00,1,0,'2020-10-17 03:03:00'),(142,24,85.00,1,0,'2020-10-17 03:04:00'),(143,24,125.00,2,1,'2020-10-17 03:04:00'),(144,37,22.00,1,0,'2020-10-17 03:05:00'),(145,37,30.00,2,0,'2020-10-17 03:05:00'),(146,38,80.00,1,0,'2020-10-17 03:05:00'),(147,38,110.00,2,1,'2020-10-17 03:06:00'),(148,25,2.00,2,1,'2020-10-17 03:06:00'),(149,36,3.00,2,0,'2020-10-17 03:07:00'),(150,106,3.00,2,0,'2020-10-17 03:07:00'),(151,107,8.00,1,0,'2020-10-17 03:08:00'),(152,5,15.00,1,0,'2020-10-17 03:08:00'),(153,5,22.00,1,0,'2020-10-17 03:09:00'),(154,5,15.00,1,0,'2020-10-17 03:09:00'),(155,5,22.00,2,1,'2020-10-17 03:09:00'),(156,6,14.00,1,0,'2020-10-17 03:10:00'),(157,7,15.00,1,0,'2020-10-17 03:11:00'),(158,7,22.00,2,1,'2020-10-17 03:11:00'),(159,8,14.00,1,0,'2020-10-17 03:12:00'),(160,8,20.00,2,1,'2020-10-17 03:12:00'),(161,9,14.00,1,0,'2020-10-17 03:19:00'),(162,9,20.00,2,1,'2020-10-17 03:19:00'),(163,10,14.00,1,0,'2020-10-17 03:21:00'),(164,10,20.00,2,1,'2020-10-17 03:21:00'),(165,11,14.00,1,0,'2020-10-17 03:22:00'),(166,11,20.00,2,1,'2020-10-17 03:22:00'),(167,12,14.00,1,0,'2020-10-17 03:22:00'),(168,12,20.00,2,1,'2020-10-17 03:23:00'),(169,109,360.00,1,0,'2020-10-17 03:24:00'),(170,109,490.00,2,0,'2020-10-17 03:26:00'),(171,116,180.00,1,0,'2020-10-17 03:28:00'),(172,116,250.00,2,0,'2020-10-17 03:28:00'),(173,109,360.00,1,0,'2020-10-17 03:32:00'),(174,116,180.00,1,0,'2020-10-17 03:32:00'),(175,107,8.00,2,0,'2020-11-10 14:55:00'),(176,13,14.00,1,0,'2020-11-10 14:55:00'),(177,13,20.00,2,1,'2020-11-10 14:56:00'),(178,108,8.00,2,0,'2020-11-10 14:56:00'),(179,14,17.00,1,0,'2020-11-10 14:57:00'),(180,14,22.00,2,0,'2020-11-10 14:57:00'),(181,117,15.00,1,0,'2020-11-10 14:58:00'),(182,117,22.00,2,0,'2020-11-10 14:58:00'),(183,118,15.00,1,0,'2020-11-10 15:08:00'),(184,118,22.00,2,1,'2020-11-10 15:09:00'),(185,15,14.00,1,0,'2020-11-10 15:10:00'),(186,15,20.00,2,1,'2020-11-10 15:10:00'),(187,16,20.00,1,0,'2020-11-10 15:10:00'),(188,16,30.00,2,1,'2020-11-10 15:10:00'),(189,17,18.00,1,0,'2020-11-10 15:11:00'),(190,17,26.00,2,1,'2020-11-10 15:11:00'),(191,119,14.00,1,0,'2020-11-10 15:13:00'),(192,119,22.00,1,0,'2020-11-10 15:14:00'),(193,119,14.00,1,0,'2020-11-10 15:14:00'),(194,119,22.00,2,0,'2020-11-10 15:14:00'),(195,120,20.00,2,1,'2020-11-10 15:15:00'),(196,120,14.00,1,0,'2020-11-10 15:15:00'),(197,121,18.00,1,0,'2020-11-10 15:22:00'),(198,121,26.00,2,1,'2020-11-10 15:22:00'),(199,122,18.00,1,0,'2020-11-10 15:33:00'),(200,122,26.00,2,1,'2020-11-10 15:33:00'),(201,123,18.00,1,0,'2020-11-10 15:34:00'),(202,123,26.00,2,1,'2020-11-10 15:34:00'),(203,124,18.00,1,0,'2020-11-10 15:35:00'),(204,124,26.00,2,1,'2020-11-10 15:36:00'),(205,123,26.00,1,0,'2020-11-10 15:36:00'),(206,122,18.00,1,0,'2020-11-10 15:36:00'),(207,121,18.00,1,0,'2020-11-10 15:37:00'),(208,125,18.00,1,0,'2020-11-10 15:38:00'),(209,125,26.00,2,1,'2020-11-10 15:38:00'),(210,126,18.00,1,0,'2020-11-10 15:40:00'),(211,126,26.00,2,0,'2020-11-10 15:41:00'),(212,127,16.00,1,0,'2020-11-10 15:42:00'),(213,127,23.00,1,0,'2020-11-10 15:42:00'),(214,127,23.00,2,0,'2020-11-10 15:42:00'),(215,127,18.00,1,0,'2020-11-10 15:43:00'),(216,128,23.00,2,0,'2020-11-10 15:43:00'),(217,128,16.00,1,0,'2020-11-10 15:44:00'),(218,127,23.00,2,1,'2020-11-10 15:44:00'),(219,126,26.00,1,0,'2020-11-10 15:44:00'),(220,17,18.00,1,0,'2020-11-10 15:45:00'),(221,14,22.00,1,0,'2020-11-10 15:45:00'),(222,15,20.00,1,0,'2020-11-10 15:45:00'),(223,129,15.00,1,0,'2020-11-10 16:07:00'),(224,129,22.00,2,1,'2020-11-10 16:08:00'),(225,130,15.00,1,0,'2020-11-10 16:08:00'),(226,130,22.00,1,0,'2020-11-10 16:09:00'),(227,130,15.00,1,0,'2020-11-10 16:09:00'),(228,130,22.00,2,1,'2020-11-10 16:09:00'),(229,128,23.00,2,0,'2020-11-10 16:11:00'),(230,129,15.00,1,0,'2020-11-10 16:12:00'),(231,131,15.00,1,0,'2020-11-10 16:13:00'),(232,131,22.00,2,1,'2020-11-10 16:13:00'),(233,132,14.00,1,1,'2020-11-10 16:16:00'),(234,132,22.00,2,0,'2020-11-10 16:17:00'),(235,108,8.00,1,0,'2020-11-10 16:17:00'),(236,13,22.00,1,0,'2020-11-10 16:24:00'),(237,13,14.00,1,0,'2020-11-10 16:25:00'),(238,133,14.00,1,0,'2020-11-10 16:26:00'),(239,133,20.00,1,0,'2020-11-10 16:26:00'),(240,133,14.00,1,0,'2020-11-10 16:27:00'),(241,133,20.00,2,1,'2020-11-10 16:27:00'),(242,134,14.00,1,0,'2020-11-10 16:28:00'),(243,134,20.00,2,1,'2020-11-10 16:28:00'),(244,135,14.00,1,0,'2020-11-10 16:29:00'),(245,135,20.00,1,0,'2020-11-10 16:29:00'),(246,135,20.00,2,1,'2020-11-10 16:29:00'),(247,135,14.00,1,0,'2020-11-10 16:29:00'),(248,136,16.00,1,0,'2020-11-10 16:41:00'),(249,136,22.00,2,0,'2020-11-10 16:41:00'),(250,137,16.00,1,0,'2020-11-10 16:42:00'),(251,137,22.00,2,1,'2020-11-10 16:42:00'),(252,136,22.00,2,0,'2020-11-10 16:43:00'),(253,7,22.00,1,0,'2020-11-10 16:43:00'),(254,7,15.00,1,0,'2020-11-10 16:44:00'),(255,138,16.00,1,0,'2020-11-10 16:45:00'),(256,138,23.00,2,1,'2020-11-10 16:45:00'),(257,137,15.00,1,0,'2020-11-10 16:46:00'),(258,139,15.00,1,0,'2020-11-10 16:47:00'),(259,139,22.00,2,1,'2020-11-10 16:48:00'),(260,9,14.00,1,0,'2020-11-10 16:48:00'),(261,140,22.00,2,0,'2020-11-10 16:49:00'),(262,140,15.00,2,0,'2020-11-10 16:49:00'),(263,140,15.00,1,0,'2020-11-10 16:49:00'),(264,140,22.00,2,1,'2020-11-10 16:50:00'),(265,141,15.00,1,0,'2020-11-10 16:51:00'),(266,141,22.00,1,0,'2020-11-10 16:51:00'),(267,141,22.00,2,1,'2020-11-10 16:51:00'),(268,141,15.00,1,0,'2020-11-10 16:52:00'),(269,142,15.00,1,0,'2020-11-10 16:52:00'),(270,142,22.00,2,1,'2020-11-10 16:53:00'),(271,143,15.00,1,0,'2020-11-10 21:18:47'),(272,143,22.00,2,1,'2020-11-10 21:19:00'),(273,144,15.00,1,0,'2020-11-10 21:20:19'),(274,144,22.00,2,1,'2020-11-10 21:20:00'),(275,145,15.00,1,0,'2020-11-10 21:22:23'),(276,133,14.00,1,0,'2020-11-10 21:22:00'),(277,145,22.00,1,0,'2020-11-10 21:22:00'),(278,145,22.00,2,0,'2020-11-10 21:23:00'),(279,145,15.00,1,0,'2020-11-10 21:23:00'),(280,146,15.00,1,0,'2020-11-10 21:24:10'),(281,146,22.00,2,1,'2020-11-10 21:24:00'),(282,147,15.00,1,0,'2020-11-10 21:25:06'),(283,147,22.00,2,1,'2020-11-10 21:25:00'),(284,68,30.00,1,0,'2020-11-10 21:26:00'),(285,68,40.00,2,0,'2020-11-10 21:27:00'),(286,68,30.00,1,0,'2020-11-10 21:28:00'),(287,68,40.00,2,1,'2020-11-10 21:34:00'),(288,58,28.00,1,0,'2020-11-10 21:35:00'),(289,58,38.00,2,1,'2020-11-10 21:35:00'),(290,66,26.00,1,0,'2020-11-10 21:36:00'),(291,66,36.00,2,1,'2020-11-10 21:36:00'),(292,148,26.00,1,0,'2020-11-10 21:39:48'),(293,148,36.00,2,1,'2020-11-10 21:40:00'),(294,67,26.00,1,0,'2020-11-10 21:40:00'),(295,67,36.00,2,1,'2020-11-10 21:40:00'),(296,149,26.00,1,0,'2020-11-10 21:42:09'),(297,149,36.00,2,1,'2020-11-10 21:42:00'),(298,150,26.00,1,0,'2020-11-10 21:43:18'),(299,150,36.00,2,1,'2020-11-10 21:43:00'),(300,57,26.00,1,0,'2020-11-10 21:44:00'),(301,57,36.00,2,0,'2020-11-10 21:44:00'),(302,59,26.00,1,0,'2020-11-10 21:44:00'),(303,59,36.00,1,0,'2020-11-10 21:45:00'),(304,59,36.00,2,1,'2020-11-10 21:45:00'),(305,59,26.00,1,0,'2020-11-10 21:45:00'),(306,60,26.00,1,0,'2020-11-10 21:45:00'),(307,60,36.00,2,1,'2020-11-10 21:45:00'),(308,61,26.00,1,0,'2020-11-10 21:46:00'),(309,61,36.00,2,0,'2020-11-10 21:46:00'),(310,64,26.00,1,0,'2020-11-10 21:46:00'),(311,64,36.00,2,0,'2020-11-10 21:46:00'),(312,151,26.00,1,0,'2020-11-10 21:47:24'),(313,151,36.00,2,1,'2020-11-10 21:47:00'),(314,152,26.00,1,0,'2020-11-10 21:48:09'),(315,152,36.00,2,1,'2020-11-10 21:48:00'),(316,69,26.00,1,0,'2020-11-10 21:48:00'),(317,69,36.00,2,0,'2020-11-10 21:49:00'),(318,65,26.00,1,0,'2020-11-10 21:49:00'),(319,65,36.00,1,0,'2020-11-10 21:49:00'),(320,65,36.00,2,1,'2020-11-10 21:49:00'),(321,65,26.00,1,0,'2020-11-10 21:49:00'),(322,62,26.00,1,0,'2020-11-10 21:50:00'),(323,62,36.00,2,1,'2020-11-10 21:50:00'),(324,153,35.00,1,0,'2020-11-10 21:52:47'),(325,153,45.00,2,1,'2020-11-10 21:53:00'),(326,154,32.00,1,0,'2020-11-10 21:53:51'),(327,154,42.00,2,0,'2020-11-10 21:54:00'),(328,155,30.00,1,0,'2020-11-10 21:55:02'),(329,155,40.00,1,0,'2020-11-10 21:55:00'),(330,155,40.00,2,1,'2020-11-10 21:55:00'),(331,155,30.00,1,0,'2020-11-10 21:55:00'),(332,156,30.00,1,0,'2020-11-10 21:56:35'),(333,156,40.00,2,0,'2020-11-10 21:56:00'),(334,156,40.00,1,0,'2020-11-10 21:57:00'),(335,157,30.00,1,0,'2020-11-10 21:57:40'),(336,157,40.00,2,1,'2020-11-10 21:58:00'),(337,158,30.00,1,0,'2020-11-10 21:58:23'),(338,158,40.00,2,1,'2020-11-10 21:58:00'),(339,159,30.00,1,0,'2020-11-10 21:59:09'),(340,159,40.00,2,1,'2020-11-10 21:59:00'),(341,160,30.00,1,0,'2020-11-10 21:59:59'),(342,160,40.00,2,1,'2020-11-10 22:00:00'),(343,86,65.00,1,0,'2020-11-10 22:01:00'),(344,85,60.00,1,0,'2020-11-10 22:01:00'),(345,87,60.00,1,0,'2020-11-10 22:01:00'),(346,85,60.00,1,0,'2020-11-10 22:01:00'),(347,86,65.00,1,0,'2020-11-10 22:02:00'),(348,88,60.00,1,0,'2020-11-10 22:02:00'),(349,161,60.00,1,0,'2020-11-10 22:02:53'),(350,161,60.00,1,0,'2020-11-10 22:03:00'),(351,162,50.00,1,0,'2020-11-10 22:03:53'),(352,162,50.00,1,1,'2020-11-10 22:04:00'),(353,82,70.00,1,0,'2020-11-10 22:04:00'),(354,82,90.00,2,1,'2020-11-10 22:04:00'),(355,81,65.00,1,0,'2020-11-10 22:05:00'),(356,81,90.00,2,0,'2020-11-10 22:05:00'),(357,83,65.00,1,0,'2020-11-10 22:05:00'),(358,83,90.00,2,1,'2020-11-10 22:06:00'),(359,84,65.00,1,0,'2020-11-10 22:06:00'),(360,84,90.00,2,0,'2020-11-10 22:06:00'),(361,163,65.00,1,0,'2020-11-10 22:12:28'),(362,163,90.00,1,0,'2020-11-10 22:12:00'),(363,163,90.00,2,0,'2020-11-10 22:13:00'),(364,163,65.00,1,0,'2020-11-10 22:13:00'),(365,164,55.00,1,0,'2020-11-10 22:13:41'),(366,164,80.00,2,1,'2020-11-10 22:14:00'),(367,18,95.00,1,0,'2020-11-10 22:15:00'),(368,19,95.00,1,0,'2020-11-10 22:15:00'),(369,21,135.00,2,0,'2020-11-12 16:16:00'),(370,23,140.00,2,0,'2020-11-12 16:17:00'),(371,165,125.00,2,0,'2020-11-12 16:18:38'),(372,165,85.00,1,0,'2020-11-12 16:19:00'),(373,166,85.00,1,0,'2020-11-12 16:19:55'),(374,166,125.00,2,0,'2020-11-12 16:20:00'),(375,23,125.00,1,0,'2020-11-12 16:20:00'),(376,20,135.00,2,0,'2020-11-12 16:21:00'),(377,20,75.00,1,0,'2020-11-12 16:21:00'),(378,165,125.00,2,0,'2020-11-13 22:15:00'),(379,166,85.00,1,0,'2020-11-13 22:17:00'),(380,166,85.00,2,0,'2020-11-13 22:18:00'),(381,166,85.00,1,0,'2020-11-13 22:20:00'),(382,166,125.00,2,0,'2020-11-13 22:23:00'),(383,166,125.00,2,0,'2020-11-13 22:25:00'),(384,166,125.00,2,0,'2020-11-13 22:26:00'),(385,166,125.00,2,0,'2020-11-13 22:27:00'),(386,166,125.00,2,0,'2020-11-13 22:30:00'),(387,166,85.00,1,0,'2020-11-13 22:32:00'),(388,166,85.00,2,0,'2020-11-13 22:33:00'),(389,166,85.00,1,0,'2020-11-13 22:36:00'),(390,166,125.00,2,0,'2020-11-13 22:38:00'),(391,166,85.00,1,0,'2020-11-13 22:39:00'),(392,166,85.00,1,0,'2020-11-13 22:42:00'),(393,166,85.00,1,0,'2020-11-13 22:43:00'),(394,165,125.00,2,0,'2020-11-13 22:47:00'),(395,167,85.00,1,0,'2020-11-13 22:54:55'),(396,167,125.00,2,0,'2020-11-13 22:55:00'),(397,166,125.00,2,0,'2020-11-13 22:55:00'),(398,166,125.00,2,0,'2020-11-13 22:57:00'),(399,166,125.00,2,0,'2020-11-13 22:59:00'),(400,166,125.00,2,0,'2020-11-13 23:00:00'),(401,165,85.00,1,0,'2020-11-14 02:28:00'),(402,165,125.00,2,0,'2020-11-14 02:29:00'),(403,165,85.00,1,0,'2020-11-14 02:30:00'),(404,165,85.00,2,0,'2020-11-14 02:35:00'),(405,167,125.00,2,0,'2020-11-14 02:36:00'),(406,167,125.00,1,0,'2020-11-14 02:37:00'),(407,167,125.00,2,0,'2020-11-14 02:41:00'),(408,167,125.00,2,0,'2020-11-14 02:44:00'),(409,167,85.00,1,0,'2020-11-14 02:50:00'),(410,167,125.00,2,0,'2020-11-14 18:23:00'),(411,167,125.00,2,1,'2020-11-14 18:27:00'),(412,167,85.00,1,0,'2020-11-14 18:29:00'),(413,166,125.00,2,1,'2020-11-15 19:02:00'),(414,167,85.00,1,0,'2020-11-15 19:03:00'),(415,18,135.00,2,0,'2020-11-15 19:03:00'),(416,18,95.00,1,0,'2020-11-15 19:04:00'),(417,18,135.00,2,1,'2020-11-15 19:04:00'),(418,19,135.00,2,0,'2020-11-15 19:26:00'),(419,19,95.00,1,0,'2020-11-15 19:27:00'),(420,19,135.00,2,1,'2020-11-15 19:27:00'),(421,5,0.00,3,1,'2020-11-18 23:22:42'),(422,6,0.00,3,1,'2020-11-18 23:22:46'),(423,7,0.00,3,1,'2020-11-18 23:23:06'),(424,8,0.00,3,1,'2020-11-18 23:23:06'),(425,9,0.00,3,1,'2020-11-18 23:23:06'),(426,10,0.00,3,1,'2020-11-18 23:23:06'),(427,11,0.00,3,1,'2020-11-18 23:23:06'),(428,12,0.00,3,1,'2020-11-18 23:23:06'),(429,13,0.00,3,1,'2020-11-18 23:23:06'),(430,14,0.00,3,1,'2020-11-18 23:23:07'),(431,15,0.00,3,1,'2020-11-18 23:23:07'),(432,16,0.00,3,1,'2020-11-18 23:23:07'),(433,17,0.00,3,1,'2020-11-18 23:23:07'),(434,18,0.00,3,1,'2020-11-18 23:23:07'),(435,19,0.00,3,1,'2020-11-18 23:23:07'),(436,20,0.00,3,0,'2020-11-18 23:23:07'),(437,21,0.00,3,1,'2020-11-18 23:23:07'),(438,22,0.00,3,1,'2020-11-18 23:23:07'),(439,23,0.00,3,1,'2020-11-18 23:23:07'),(440,24,0.00,3,1,'2020-11-18 23:23:07'),(441,25,0.00,3,1,'2020-11-18 23:23:07'),(442,28,0.00,3,0,'2020-11-18 23:23:07'),(443,29,0.00,3,0,'2020-11-18 23:23:07'),(444,30,0.00,3,0,'2020-11-18 23:23:07'),(445,31,0.00,3,0,'2020-11-18 23:23:07'),(446,32,0.00,3,1,'2020-11-18 23:23:07'),(447,33,0.00,3,0,'2020-11-18 23:23:07'),(448,34,0.00,3,1,'2020-11-18 23:23:07'),(449,35,0.00,3,1,'2020-11-18 23:23:07'),(450,36,0.00,3,1,'2020-11-18 23:23:07'),(451,37,0.00,3,1,'2020-11-18 23:23:07'),(452,38,0.00,3,1,'2020-11-18 23:23:07'),(453,39,0.00,3,1,'2020-11-18 23:23:07'),(454,40,0.00,3,1,'2020-11-18 23:23:07'),(455,41,0.00,3,1,'2020-11-18 23:23:07'),(456,42,0.00,3,1,'2020-11-18 23:23:07'),(457,43,0.00,3,1,'2020-11-18 23:23:07'),(458,44,0.00,3,1,'2020-11-18 23:23:07'),(459,46,0.00,3,1,'2020-11-18 23:23:07'),(460,47,0.00,3,1,'2020-11-18 23:23:07'),(461,48,0.00,3,1,'2020-11-18 23:23:08'),(462,49,0.00,3,1,'2020-11-18 23:23:08'),(463,50,0.00,3,1,'2020-11-18 23:23:08'),(464,51,0.00,3,0,'2020-11-18 23:23:08'),(465,52,0.00,3,1,'2020-11-18 23:23:08'),(466,53,0.00,3,1,'2020-11-18 23:23:08'),(467,54,0.00,3,1,'2020-11-18 23:23:08'),(468,55,0.00,3,1,'2020-11-18 23:23:08'),(469,56,0.00,3,1,'2020-11-18 23:23:08'),(470,57,0.00,3,1,'2020-11-18 23:23:08'),(471,58,0.00,3,0,'2020-11-18 23:23:08'),(472,59,0.00,3,1,'2020-11-18 23:23:08'),(473,60,0.00,3,1,'2020-11-18 23:23:08'),(474,61,0.00,3,1,'2020-11-18 23:23:08'),(475,62,0.00,3,1,'2020-11-18 23:23:08'),(476,64,0.00,3,1,'2020-11-18 23:23:08'),(477,65,0.00,3,1,'2020-11-18 23:23:08'),(478,66,0.00,3,1,'2020-11-18 23:23:08'),(479,67,0.00,3,1,'2020-11-18 23:23:08'),(480,68,0.00,3,1,'2020-11-18 23:23:08'),(481,69,0.00,3,1,'2020-11-18 23:23:08'),(482,70,0.00,3,1,'2020-11-18 23:23:08'),(483,71,0.00,3,1,'2020-11-18 23:23:08'),(484,72,0.00,3,1,'2020-11-18 23:23:09'),(485,73,0.00,3,1,'2020-11-18 23:23:09'),(486,74,0.00,3,1,'2020-11-18 23:23:09'),(487,75,0.00,3,1,'2020-11-18 23:23:09'),(488,76,0.00,3,1,'2020-11-18 23:23:09'),(489,77,0.00,3,1,'2020-11-18 23:23:09'),(490,78,0.00,3,1,'2020-11-18 23:23:09'),(491,79,0.00,3,1,'2020-11-18 23:23:09'),(492,80,0.00,3,1,'2020-11-18 23:23:09'),(493,81,0.00,3,1,'2020-11-18 23:23:09'),(494,82,0.00,3,1,'2020-11-18 23:23:09'),(495,83,0.00,3,1,'2020-11-18 23:23:09'),(496,84,0.00,3,1,'2020-11-18 23:23:09'),(497,85,0.00,3,1,'2020-11-18 23:23:09'),(498,86,0.00,3,1,'2020-11-18 23:23:09'),(499,87,0.00,3,1,'2020-11-18 23:23:09'),(500,88,0.00,3,1,'2020-11-18 23:23:09'),(501,89,0.00,3,1,'2020-11-18 23:23:09'),(502,91,0.00,3,1,'2020-11-18 23:23:09'),(503,92,0.00,3,1,'2020-11-18 23:23:09'),(504,93,0.00,3,1,'2020-11-18 23:23:09'),(505,94,0.00,3,1,'2020-11-18 23:23:09'),(506,95,0.00,3,1,'2020-11-18 23:23:09'),(507,96,0.00,3,1,'2020-11-18 23:23:10'),(508,97,0.00,3,1,'2020-11-18 23:23:10'),(509,98,0.00,3,1,'2020-11-18 23:23:10'),(510,99,0.00,3,1,'2020-11-18 23:23:10'),(511,100,0.00,3,1,'2020-11-18 23:23:10'),(512,101,0.00,3,1,'2020-11-18 23:23:10'),(513,102,0.00,3,1,'2020-11-18 23:23:10'),(514,103,0.00,3,1,'2020-11-18 23:23:10'),(515,104,0.00,3,0,'2020-11-18 23:23:10'),(516,105,0.00,3,1,'2020-11-18 23:23:10'),(517,106,0.00,3,1,'2020-11-18 23:23:10'),(518,107,0.00,3,1,'2020-11-18 23:23:10'),(519,108,0.00,3,1,'2020-11-18 23:23:10'),(520,109,0.00,3,0,'2020-11-18 23:23:10'),(521,112,0.00,3,0,'2020-11-18 23:23:10'),(522,113,0.00,3,1,'2020-11-18 23:23:10'),(523,114,0.00,3,1,'2020-11-18 23:23:10'),(524,115,0.00,3,1,'2020-11-18 23:23:10'),(525,116,0.00,3,0,'2020-11-18 23:23:10'),(526,117,0.00,3,1,'2020-11-18 23:23:10'),(527,118,0.00,3,1,'2020-11-18 23:23:10'),(528,119,0.00,3,1,'2020-11-18 23:23:10'),(529,120,0.00,3,1,'2020-11-18 23:23:10'),(530,121,0.00,3,1,'2020-11-18 23:23:11'),(531,122,0.00,3,1,'2020-11-18 23:23:11'),(532,123,0.00,3,1,'2020-11-18 23:23:11'),(533,124,0.00,3,1,'2020-11-18 23:23:11'),(534,125,0.00,3,1,'2020-11-18 23:23:11'),(535,126,0.00,3,1,'2020-11-18 23:23:11'),(536,127,0.00,3,1,'2020-11-18 23:23:11'),(537,128,0.00,3,1,'2020-11-18 23:23:11'),(538,129,0.00,3,1,'2020-11-18 23:23:11'),(539,130,0.00,3,1,'2020-11-18 23:23:11'),(540,131,0.00,3,1,'2020-11-18 23:23:11'),(541,132,0.00,3,1,'2020-11-18 23:23:11'),(542,133,0.00,3,1,'2020-11-18 23:23:11'),(543,134,0.00,3,1,'2020-11-18 23:23:11'),(544,135,0.00,3,1,'2020-11-18 23:23:11'),(545,136,0.00,3,1,'2020-11-18 23:23:11'),(546,137,0.00,3,1,'2020-11-18 23:23:11'),(547,138,0.00,3,1,'2020-11-18 23:23:11'),(548,139,0.00,3,1,'2020-11-18 23:23:11'),(549,140,0.00,3,1,'2020-11-18 23:23:11'),(550,141,0.00,3,1,'2020-11-18 23:23:11'),(551,142,0.00,3,1,'2020-11-18 23:23:11'),(552,143,0.00,3,1,'2020-11-18 23:23:11'),(553,144,0.00,3,1,'2020-11-18 23:23:11'),(554,145,0.00,3,1,'2020-11-18 23:23:11'),(555,146,0.00,3,1,'2020-11-18 23:23:11'),(556,147,0.00,3,1,'2020-11-18 23:23:11'),(557,148,0.00,3,1,'2020-11-18 23:23:11'),(558,149,0.00,3,1,'2020-11-18 23:23:11'),(559,150,0.00,3,1,'2020-11-18 23:23:11'),(560,151,0.00,3,1,'2020-11-18 23:23:12'),(561,152,0.00,3,1,'2020-11-18 23:23:12'),(562,153,0.00,3,1,'2020-11-18 23:23:12'),(563,154,0.00,3,1,'2020-11-18 23:23:12'),(564,155,0.00,3,1,'2020-11-18 23:23:12'),(565,156,0.00,3,0,'2020-11-18 23:23:12'),(566,157,0.00,3,1,'2020-11-18 23:23:12'),(567,158,0.00,3,1,'2020-11-18 23:23:12'),(568,159,0.00,3,1,'2020-11-18 23:23:12'),(569,160,0.00,3,1,'2020-11-18 23:23:12'),(570,161,0.00,3,1,'2020-11-18 23:23:12'),(571,162,0.00,3,1,'2020-11-18 23:23:12'),(572,163,0.00,3,0,'2020-11-18 23:23:12'),(573,164,0.00,3,1,'2020-11-18 23:23:12'),(574,165,0.00,3,1,'2020-11-18 23:23:12'),(575,166,0.00,3,1,'2020-11-18 23:23:12'),(576,167,0.00,3,1,'2020-11-18 23:23:12'),(577,163,90.00,2,0,'2020-11-19 19:26:00'),(578,163,0.00,3,0,'2020-11-19 19:26:00'),(579,163,0.00,3,1,'2020-11-19 19:27:00'),(580,163,65.00,1,0,'2020-11-19 19:31:00'),(581,163,90.00,2,1,'2020-11-19 19:34:00'),(582,163,65.00,1,0,'2020-11-19 19:35:00'),(583,163,65.00,1,0,'2020-11-19 19:37:00'),(584,54,35.00,1,0,'2020-11-20 00:54:00'),(585,54,50.00,2,1,'2020-11-20 00:54:00'),(586,55,30.00,1,0,'2020-11-20 00:54:00'),(587,55,40.00,2,1,'2020-11-20 00:54:00'),(588,56,40.00,1,0,'2020-11-20 00:55:00'),(589,56,60.00,2,1,'2020-11-20 00:55:00'),(590,109,490.00,2,0,'2020-11-20 01:13:00'),(591,109,0.00,3,0,'2020-11-20 01:15:00'),(592,109,360.00,1,0,'2020-11-20 01:16:00'),(593,109,490.00,2,0,'2020-11-20 01:16:00'),(594,109,360.00,1,0,'2020-11-20 01:17:00'),(595,109,490.00,2,0,'2020-11-20 01:18:00'),(596,109,360.00,1,0,'2020-11-20 01:19:00'),(597,109,490.00,2,0,'2020-11-20 01:19:00'),(598,109,360.00,1,0,'2020-11-20 01:20:00'),(599,109,490.00,2,0,'2020-11-20 01:20:00'),(600,109,360.00,1,0,'2020-11-20 01:48:00'),(601,109,490.00,2,0,'2020-11-20 01:49:00'),(602,116,250.00,2,0,'2020-11-20 02:15:00'),(603,116,180.00,1,0,'2020-11-20 02:15:00'),(604,116,250.00,2,0,'2020-11-20 02:16:00'),(605,116,180.00,1,0,'2020-11-20 02:18:00'),(606,116,250.00,2,0,'2020-11-20 02:18:00'),(607,116,250.00,2,0,'2020-11-20 02:19:00'),(608,116,180.00,1,0,'2020-11-20 02:20:00'),(609,116,180.00,1,0,'2020-11-20 02:22:00'),(610,168,110.00,1,0,'2020-11-20 18:09:48'),(611,168,160.00,1,0,'2020-11-20 18:10:00'),(612,168,160.00,2,0,'2020-11-20 18:12:00'),(613,168,110.00,1,0,'2020-11-20 19:17:00'),(614,168,0.00,3,0,'2020-11-20 19:20:00'),(615,168,110.00,1,0,'2020-11-20 19:22:00'),(616,156,0.00,3,0,'2020-11-22 22:01:28'),(617,156,35.00,1,0,'2020-11-22 22:01:28'),(618,156,45.00,2,0,'2020-11-22 22:01:28'),(619,156,0.00,3,0,'2020-11-22 22:14:36'),(620,156,0.00,3,0,'2020-11-22 22:59:17'),(621,156,0.00,3,0,'2020-11-22 23:03:54'),(622,156,30.00,1,0,'2020-11-22 23:28:52'),(623,156,40.00,2,1,'2020-11-22 23:29:52'),(624,156,0.00,3,1,'2020-11-22 23:30:21'),(625,168,110.00,1,0,'2020-11-22 23:49:28'),(626,168,160.00,2,0,'2020-11-22 23:49:28'),(627,168,0.00,3,0,'2020-11-22 23:49:28'),(628,168,110.00,1,0,'2020-11-22 23:55:50'),(629,168,160.00,2,1,'2020-11-22 23:55:50'),(630,168,0.00,3,1,'2020-11-22 23:55:50'),(631,168,0.00,1,0,'2020-11-22 23:55:00'),(632,116,180.00,1,0,'2020-11-22 23:56:49'),(633,116,250.00,2,0,'2020-11-22 23:56:49'),(634,116,0.00,3,0,'2020-11-22 23:56:49'),(635,116,180.00,3,0,'2020-11-22 23:57:00'),(636,116,0.00,3,1,'2020-11-22 23:58:00'),(637,168,110.00,1,0,'2020-11-22 23:58:00'),(638,28,40.00,1,0,'2020-11-23 00:02:00'),(639,28,40.00,1,0,'2020-11-23 00:03:25'),(640,28,0.00,3,0,'2020-11-23 00:03:25'),(641,28,40.00,1,0,'2020-11-23 00:40:00'),(642,28,55.00,1,0,'2020-11-23 01:20:00'),(643,28,75.00,2,0,'2020-11-23 01:20:00'),(644,29,65.00,1,0,'2020-11-23 01:32:00'),(645,29,85.00,2,1,'2020-11-23 02:24:00'),(646,29,0.00,3,1,'2020-11-23 02:26:00'),(647,28,75.00,2,0,'2020-11-23 02:27:00'),(648,28,0.00,3,1,'2020-11-23 02:31:00'),(649,30,40.00,1,0,'2020-11-23 02:45:00'),(650,30,54.00,2,0,'2020-11-23 02:45:00'),(651,30,0.00,3,1,'2020-11-23 02:46:00'),(652,30,40.00,1,0,'2020-11-23 02:47:00'),(653,31,35.00,1,0,'2020-11-23 02:48:00'),(654,31,54.00,2,0,'2020-11-23 02:48:00'),(655,31,0.00,3,1,'2020-11-23 02:49:00'),(656,33,30.00,1,0,'2020-11-23 17:56:00'),(657,33,38.00,2,1,'2020-11-23 17:56:00'),(658,33,0.00,3,1,'2020-11-23 17:58:00'),(659,30,54.00,2,1,'2020-11-23 17:59:00'),(660,33,30.00,1,0,'2020-11-23 18:00:00'),(661,31,54.00,2,1,'2020-11-23 18:00:00'),(662,34,25.00,1,0,'2020-11-23 18:02:00'),(663,34,45.00,2,1,'2020-11-23 18:02:00'),(664,35,35.00,1,1,'2020-11-23 18:03:00'),(665,35,54.00,2,0,'2020-11-23 18:04:00'),(666,35,54.00,2,1,'2020-11-23 18:09:00'),(667,57,36.00,2,1,'2020-11-23 18:11:00'),(668,58,0.00,3,1,'2020-11-23 18:11:00'),(669,59,26.00,1,0,'2020-11-23 18:11:00'),(670,60,26.00,1,0,'2020-11-23 18:12:00'),(671,61,36.00,2,1,'2020-11-23 18:13:00'),(672,64,36.00,2,1,'2020-11-23 18:13:00'),(673,69,36.00,2,1,'2020-11-23 18:13:00'),(674,151,26.00,1,0,'2020-11-23 18:14:00'),(675,154,42.00,2,1,'2020-11-23 18:19:00'),(676,155,30.00,1,0,'2020-11-23 18:20:00'),(677,84,50.00,1,0,'2020-11-23 18:22:00'),(678,84,50.00,2,0,'2020-11-23 18:24:00'),(679,39,22.00,1,1,'2020-11-23 18:29:00'),(680,37,30.00,2,0,'2020-11-23 18:30:00'),(681,38,80.00,1,0,'2020-11-23 18:31:00'),(682,95,30.00,1,0,'2020-11-23 18:36:00'),(683,95,45.00,2,1,'2020-11-23 18:36:00'),(684,96,90.00,1,0,'2020-11-23 18:37:00'),(685,96,120.00,2,1,'2020-11-23 18:38:00'),(686,169,30.00,1,0,'2020-11-23 18:41:11'),(687,169,45.00,2,1,'2020-11-23 18:41:00'),(688,169,0.00,3,1,'2020-11-23 18:42:00'),(689,170,90.00,1,0,'2020-11-23 18:42:39'),(690,170,120.00,2,1,'2020-11-23 18:42:00'),(691,170,0.00,3,1,'2020-11-23 18:43:00'),(692,171,35.00,1,0,'2020-11-23 18:44:06'),(693,171,50.00,2,1,'2020-11-23 18:44:00'),(694,171,0.00,3,1,'2020-11-23 18:44:00'),(695,172,30.00,1,0,'2020-11-23 18:45:30'),(696,172,40.00,2,1,'2020-11-23 18:45:00'),(697,172,0.00,3,1,'2020-11-23 18:46:00'),(698,52,20.00,1,0,'2020-11-23 18:46:00'),(699,52,28.00,2,1,'2020-11-23 18:46:00'),(700,51,15.00,1,0,'2020-11-23 18:47:00'),(701,51,25.00,2,1,'2020-11-23 18:47:00'),(702,173,15.00,2,0,'2020-11-23 18:48:30'),(703,173,25.00,2,0,'2020-11-23 18:48:00'),(704,173,15.00,2,0,'2020-11-23 18:49:00'),(705,173,15.00,1,0,'2020-11-23 18:49:00'),(706,173,0.00,2,0,'2020-11-23 18:49:00'),(707,173,0.00,3,0,'2020-11-23 18:49:00'),(708,46,22.00,1,0,'2020-11-23 18:50:00'),(709,46,32.00,2,1,'2020-11-23 18:50:00'),(710,47,22.00,1,1,'2020-11-23 18:51:00'),(711,47,32.00,2,1,'2020-11-23 18:51:00'),(712,48,22.00,1,1,'2020-11-23 18:51:00'),(713,48,32.00,2,1,'2020-11-23 18:51:00'),(714,49,22.00,1,1,'2020-11-23 18:52:00'),(715,49,32.00,2,1,'2020-11-23 18:52:00'),(716,50,22.00,1,1,'2020-11-23 18:53:00'),(717,50,32.00,2,1,'2020-11-23 18:53:00'),(718,97,22.00,1,1,'2020-11-23 18:54:00'),(719,97,32.00,2,1,'2020-11-23 18:54:00'),(720,108,8.00,2,0,'2020-11-28 18:48:00'),(721,14,25.00,2,1,'2020-11-29 01:35:00'),(722,14,17.00,1,0,'2020-11-29 01:35:00'),(723,126,18.00,1,0,'2020-11-29 01:36:00'),(724,132,20.00,2,1,'2020-11-29 01:40:00'),(725,136,23.00,2,1,'2020-11-29 01:41:00'),(726,15,14.00,1,0,'2020-11-29 01:43:00'),(727,119,20.00,2,1,'2020-11-29 01:44:00'),(728,123,18.00,1,0,'2020-11-29 01:45:00'),(729,20,85.00,1,0,'2020-11-29 01:48:00'),(730,20,125.00,2,0,'2020-11-29 01:49:00'),(731,21,135.00,2,1,'2020-11-29 01:51:00'),(732,23,85.00,1,0,'2020-11-29 01:51:00'),(733,23,125.00,2,1,'2020-11-29 01:52:00'),(734,165,125.00,2,1,'2020-11-29 01:52:00'),(735,174,65.00,1,0,'2020-11-29 01:54:36'),(736,174,100.00,2,1,'2020-11-29 01:55:00'),(737,174,0.00,3,1,'2020-11-29 01:55:00'),(738,28,75.00,2,1,'2020-11-29 01:56:00'),(739,107,20.00,1,1,'2020-11-29 01:59:00'),(740,107,22.00,2,1,'2020-11-29 01:59:00'),(741,108,20.00,1,1,'2020-11-29 02:00:00'),(742,108,22.00,2,1,'2020-11-29 02:00:00'),(743,175,10.00,1,1,'2020-11-29 02:01:25'),(744,175,10.00,2,1,'2020-11-29 02:01:00'),(745,176,15.00,2,1,'2020-11-29 02:02:01'),(746,176,15.00,1,1,'2020-11-29 02:02:00'),(747,177,20.00,1,1,'2020-11-29 02:02:35'),(748,177,20.00,2,1,'2020-11-29 02:02:00'),(749,178,5.00,1,1,'2020-11-29 02:03:18'),(750,178,5.00,2,1,'2020-11-29 02:03:00'),(751,36,2.00,2,1,'2020-11-29 02:04:00'),(752,106,2.00,2,1,'2020-11-29 02:04:00'),(753,179,26.00,1,0,'2020-11-29 18:02:22'),(754,179,36.00,2,1,'2020-11-29 18:02:00'),(755,179,0.00,3,1,'2020-11-29 18:03:00'),(756,81,90.00,2,1,'2020-11-29 18:06:00'),(757,180,65.00,1,0,'2020-11-29 18:09:22'),(758,180,90.00,2,1,'2020-11-29 18:10:00'),(759,180,0.00,3,0,'2020-11-29 18:10:00'),(760,180,0.00,3,1,'2020-11-29 18:10:00'),(761,46,22.00,1,0,'2020-11-29 23:29:00'),(762,91,20.00,1,0,'2020-11-29 23:31:00'),(763,91,35.00,2,0,'2020-11-29 23:32:00'),(764,92,30.00,1,0,'2020-11-29 23:33:00'),(765,92,48.00,2,1,'2020-11-29 23:33:00'),(766,91,25.00,1,0,'2020-11-29 23:33:00'),(767,91,42.00,2,1,'2020-11-29 23:34:00'),(768,93,35.00,1,0,'2020-11-29 23:34:00'),(769,93,55.00,2,1,'2020-11-29 23:35:00'),(770,113,22.00,1,0,'2020-11-29 23:36:00'),(771,37,32.00,2,1,'2020-11-29 23:37:00'),(772,70,15.00,1,0,'2020-12-23 17:59:00'),(773,70,22.00,2,1,'2020-12-23 17:59:00'),(774,71,14.00,1,0,'2020-12-23 18:00:00'),(775,72,15.00,1,0,'2020-12-23 18:00:00'),(776,73,14.00,1,0,'2020-12-23 18:00:00'),(777,74,14.00,1,0,'2020-12-23 18:01:00'),(778,75,14.00,1,0,'2020-12-23 18:01:00'),(779,77,14.00,1,0,'2020-12-23 18:08:00'),(780,75,22.00,2,1,'2020-12-23 18:08:00'),(781,76,14.00,1,0,'2020-12-23 18:09:00'),(782,78,14.00,1,0,'2020-12-23 18:09:00'),(783,80,14.00,1,0,'2020-12-23 18:10:00'),(784,89,15.00,1,0,'2020-12-23 18:11:00'),(785,51,0.00,3,1,'2020-12-30 21:28:00'),(786,104,8.00,1,0,'2020-12-30 21:30:00'),(787,104,10.00,3,0,'2020-12-30 21:31:00'),(788,105,10.00,1,0,'2020-12-30 21:31:00'),(789,104,10.00,1,0,'2020-12-30 21:32:00'),(790,104,0.00,3,1,'2020-12-30 21:32:00'),(791,20,125.00,2,1,'2021-01-05 14:59:00'),(792,21,95.00,1,0,'2021-01-05 15:00:00'),(793,165,85.00,1,0,'2021-01-05 15:00:00'),(794,166,85.00,1,0,'2021-01-05 15:01:00'),(795,167,85.00,1,0,'2021-01-05 15:01:00'),(796,181,85.00,1,0,'2021-01-31 20:41:58'),(797,181,125.00,2,1,'2021-01-31 20:42:51'),(798,181,0.00,3,1,'2021-01-31 20:43:10'),(799,203,0.00,3,1,'2021-01-31 20:44:57'),(800,203,95.00,1,0,'2021-01-31 20:45:10'),(801,203,135.00,2,1,'2021-01-31 20:45:24'),(802,204,135.00,2,1,'2021-01-31 20:48:22'),(803,204,95.00,1,0,'2021-01-31 20:48:36'),(804,204,0.00,3,1,'2021-01-31 20:48:49'),(805,205,0.00,3,1,'2021-01-31 20:49:15'),(806,205,95.00,1,0,'2021-01-31 20:49:32'),(807,205,135.00,2,1,'2021-01-31 20:49:47'),(808,206,95.00,1,0,'2021-01-31 20:50:08'),(809,206,135.00,2,1,'2021-01-31 20:50:20'),(810,206,0.00,3,1,'2021-01-31 20:50:31'),(811,207,0.00,3,1,'2021-01-31 20:50:50'),(812,207,85.00,1,0,'2021-01-31 20:51:05'),(813,207,135.00,2,1,'2021-01-31 20:51:17'),(814,208,125.00,2,1,'2021-01-31 20:53:10'),(815,208,85.00,1,0,'2021-01-31 20:53:22'),(816,208,0.00,3,1,'2021-01-31 20:53:37'),(817,209,0.00,3,1,'2021-01-31 20:53:55'),(818,209,85.00,1,0,'2021-01-31 20:54:10'),(819,209,125.00,2,1,'2021-01-31 20:54:23'),(820,210,125.00,2,1,'2021-01-31 20:54:56'),(821,210,85.00,1,0,'2021-01-31 20:55:10'),(822,210,0.00,3,1,'2021-01-31 20:55:23'),(823,211,0.00,3,1,'2021-01-31 20:55:40'),(824,211,135.00,2,1,'2021-01-31 20:55:58'),(825,211,95.00,1,0,'2021-01-31 20:56:10'),(826,212,95.00,1,0,'2021-01-31 20:56:28'),(827,212,135.00,2,1,'2021-01-31 20:56:44'),(828,212,0.00,3,1,'2021-01-31 20:56:56'),(829,213,0.00,3,1,'2021-01-31 20:57:20'),(830,213,95.00,1,0,'2021-01-31 20:57:37'),(831,213,135.00,2,1,'2021-01-31 20:57:53'),(832,214,135.00,2,0,'2021-01-31 20:58:10'),(833,214,95.00,1,0,'2021-01-31 20:58:23'),(834,214,0.00,3,1,'2021-01-31 20:58:35'),(835,215,0.00,3,1,'2021-01-31 20:58:53'),(836,215,95.00,1,0,'2021-01-31 20:59:09'),(837,215,135.00,2,1,'2021-01-31 20:59:23'),(838,216,135.00,2,1,'2021-01-31 20:59:45'),(839,216,95.00,1,0,'2021-01-31 20:59:57'),(840,216,0.00,3,1,'2021-01-31 21:00:09'),(841,217,0.00,3,1,'2021-01-31 21:00:24'),(842,217,95.00,1,0,'2021-01-31 21:00:35'),(843,217,135.00,2,1,'2021-01-31 21:00:49'),(844,218,125.00,2,1,'2021-01-31 21:01:08'),(845,218,85.00,1,0,'2021-01-31 21:01:23'),(846,218,0.00,3,1,'2021-01-31 21:01:34'),(847,219,85.00,1,0,'2021-01-31 21:01:54'),(848,219,125.00,2,1,'2021-01-31 21:02:07'),(849,219,0.00,3,1,'2021-01-31 21:02:18'),(850,220,0.00,3,1,'2021-01-31 21:04:09'),(851,220,85.00,1,0,'2021-01-31 21:04:20'),(852,220,125.00,2,1,'2021-01-31 21:04:32'),(853,221,125.00,2,1,'2021-01-31 21:04:47'),(854,221,85.00,1,0,'2021-01-31 21:04:59'),(855,221,0.00,3,1,'2021-01-31 21:05:12'),(856,222,0.00,3,1,'2021-01-31 21:05:28'),(857,222,85.00,1,0,'2021-01-31 21:05:39'),(858,222,125.00,2,1,'2021-01-31 21:05:51'),(859,223,125.00,2,1,'2021-01-31 21:06:07'),(860,223,85.00,1,0,'2021-01-31 21:06:18'),(861,223,0.00,3,1,'2021-01-31 21:06:31'),(862,224,0.00,3,1,'2021-01-31 21:06:56'),(863,224,85.00,1,0,'2021-01-31 21:07:08'),(864,224,125.00,2,1,'2021-01-31 21:07:20'),(865,225,125.00,2,1,'2021-01-31 21:07:34'),(866,225,85.00,1,0,'2021-01-31 21:07:46'),(867,225,0.00,3,1,'2021-01-31 21:07:59'),(868,226,0.00,3,1,'2021-01-31 21:08:15'),(869,226,85.00,1,0,'2021-01-31 21:08:27'),(870,226,125.00,2,1,'2021-01-31 21:08:38'),(871,227,125.00,2,1,'2021-01-31 21:09:00'),(872,227,0.00,3,1,'2021-01-31 21:09:14'),(873,227,85.00,1,0,'2021-01-31 21:09:29'),(874,182,65.00,1,0,'2021-01-31 21:10:05'),(875,182,85.00,2,1,'2021-01-31 21:10:15'),(876,182,0.00,3,1,'2021-01-31 21:10:26'),(877,183,0.00,3,1,'2021-01-31 21:10:44'),(878,183,65.00,1,0,'2021-01-31 21:10:55'),(879,183,85.00,2,1,'2021-01-31 21:11:05'),(880,184,54.00,2,1,'2021-01-31 21:11:23'),(881,184,35.00,1,0,'2021-01-31 21:11:36'),(882,184,0.00,3,1,'2021-01-31 21:11:48'),(883,185,0.00,3,1,'2021-01-31 21:12:03'),(884,185,35.00,1,0,'2021-01-31 21:12:17'),(885,185,54.00,2,1,'2021-01-31 21:12:27'),(886,186,38.00,2,1,'2021-01-31 21:12:43'),(887,186,25.00,1,0,'2021-01-31 21:12:53'),(888,186,0.00,3,1,'2021-01-31 21:13:03'),(889,187,35.00,1,0,'2021-01-31 21:13:20'),(890,187,54.00,2,1,'2021-01-31 21:13:30'),(891,187,0.00,3,1,'2021-01-31 21:13:39'),(892,188,0.00,3,1,'2021-01-31 21:13:56'),(893,188,35.00,1,0,'2021-01-31 21:14:06'),(894,188,54.00,2,1,'2021-01-31 21:14:17'),(895,189,38.00,2,0,'2021-01-31 21:14:34'),(896,189,25.00,1,0,'2021-01-31 21:14:44'),(897,189,0.00,3,1,'2021-01-31 21:14:55'),(898,190,0.00,3,1,'2021-01-31 21:15:10'),(899,190,25.00,1,0,'2021-01-31 21:15:21'),(900,190,38.00,2,1,'2021-01-31 21:15:39'),(901,191,38.00,2,1,'2021-01-31 21:15:53'),(902,191,25.00,1,0,'2021-01-31 21:16:05'),(903,191,0.00,3,1,'2021-01-31 21:16:16'),(904,192,0.00,3,1,'2021-01-31 21:16:51'),(905,192,25.00,1,0,'2021-01-31 21:17:02'),(906,192,38.00,2,1,'2021-01-31 21:17:13'),(907,194,38.00,2,1,'2021-01-31 21:17:29'),(908,194,25.00,1,0,'2021-01-31 21:17:40'),(909,194,0.00,3,1,'2021-01-31 21:17:51'),(910,195,38.00,2,1,'2021-01-31 21:18:30'),(911,195,30.00,1,0,'2021-01-31 21:18:41'),(912,195,0.00,3,1,'2021-01-31 21:18:54'),(913,196,0.00,3,1,'2021-01-31 21:19:09'),(914,196,25.00,1,0,'2021-01-31 21:19:20'),(915,196,38.00,2,1,'2021-01-31 21:19:31'),(916,197,38.00,2,1,'2021-01-31 21:19:42'),(917,197,25.00,1,0,'2021-01-31 21:20:14'),(918,197,0.00,3,1,'2021-01-31 21:20:25'),(919,199,0.00,3,1,'2021-01-31 21:20:39'),(920,199,25.00,1,0,'2021-01-31 21:20:49'),(921,199,38.00,2,1,'2021-01-31 21:21:00'),(922,200,38.00,2,1,'2021-01-31 21:21:12'),(923,200,25.00,1,0,'2021-01-31 21:21:23'),(924,200,0.00,3,1,'2021-01-31 21:21:37'),(925,201,0.00,3,1,'2021-01-31 21:21:53'),(926,201,25.00,1,0,'2021-01-31 21:22:04'),(927,201,38.00,2,1,'2021-01-31 21:22:38'),(928,228,85.00,2,1,'2021-01-31 21:23:10'),(929,228,65.00,1,0,'2021-01-31 21:23:22'),(930,228,0.00,3,1,'2021-01-31 21:23:33'),(931,229,0.00,3,1,'2021-01-31 21:23:49'),(932,229,85.00,2,1,'2021-01-31 21:24:00'),(933,229,65.00,1,0,'2021-01-31 21:24:12'),(934,230,65.00,1,0,'2021-01-31 21:24:27'),(935,230,85.00,2,1,'2021-01-31 21:24:38'),(936,230,0.00,3,1,'2021-01-31 21:24:51'),(937,231,0.00,3,1,'2021-01-31 21:25:07'),(938,231,65.00,1,0,'2021-01-31 21:25:18'),(939,231,85.00,2,1,'2021-01-31 21:25:29'),(940,232,85.00,2,1,'2021-01-31 21:25:46'),(941,232,65.00,1,0,'2021-01-31 21:25:58'),(942,232,0.00,3,1,'2021-01-31 21:26:12'),(943,233,0.00,3,1,'2021-01-31 21:26:38'),(944,233,70.00,1,0,'2021-01-31 21:26:51'),(945,233,100.00,2,1,'2021-01-31 21:27:05'),(946,234,95.00,2,1,'2021-01-31 21:27:24'),(947,234,65.00,1,0,'2021-01-31 21:27:37'),(948,234,0.00,3,1,'2021-01-31 21:27:49'),(949,235,85.00,2,1,'2021-01-31 21:28:07'),(950,235,65.00,1,0,'2021-01-31 21:28:19'),(951,235,0.00,3,1,'2021-01-31 21:28:34'),(952,236,0.00,3,1,'2021-01-31 21:28:52'),(953,236,65.00,1,0,'2021-01-31 21:29:03'),(954,236,85.00,2,1,'2021-01-31 21:29:15'),(955,237,85.00,2,1,'2021-01-31 21:29:32'),(956,237,65.00,1,0,'2021-01-31 21:29:43'),(957,237,0.00,3,1,'2021-01-31 21:29:56'),(958,238,0.00,3,1,'2021-01-31 21:30:11'),(959,238,65.00,1,0,'2021-01-31 21:30:22'),(960,238,85.00,2,1,'2021-01-31 21:30:34'),(961,239,65.00,1,0,'2021-01-31 20:28:32'),(962,239,85.00,2,1,'2021-01-31 20:28:46'),(963,239,0.00,3,1,'2021-01-31 20:28:59'),(964,240,55.00,1,0,'2021-01-31 20:29:17'),(965,240,75.00,2,1,'2021-01-31 20:29:34'),(966,240,0.00,3,1,'2021-01-31 20:29:48'),(967,241,35.00,1,0,'2021-01-31 20:30:08'),(968,241,64.00,2,0,'2021-01-31 20:30:23'),(969,241,0.00,3,1,'2021-01-31 20:30:34'),(970,241,54.00,2,1,'2021-01-31 20:30:54'),(971,242,54.00,2,1,'2021-01-31 20:31:09'),(972,242,35.00,1,0,'2021-01-31 20:31:23'),(973,242,0.00,3,1,'2021-01-31 20:31:34'),(974,243,35.00,1,0,'2021-01-31 20:31:51'),(975,243,54.00,2,1,'2021-01-31 20:32:04'),(976,243,0.00,3,1,'2021-01-31 20:32:14'),(977,244,35.00,1,0,'2021-01-31 20:32:32'),(978,245,54.00,2,1,'2021-01-31 20:32:48'),(979,244,54.00,2,1,'2021-01-31 20:33:02'),(980,244,0.00,3,1,'2021-01-31 20:33:13'),(981,245,35.00,1,0,'2021-01-31 20:33:28'),(982,245,0.00,3,1,'2021-01-31 20:33:40'),(983,246,35.00,1,0,'2021-01-31 20:33:57'),(984,246,54.00,2,1,'2021-01-31 20:34:08'),(985,247,54.00,2,1,'2021-01-31 20:34:34'),(986,246,0.00,3,1,'2021-01-31 20:34:47'),(987,247,35.00,1,0,'2021-01-31 20:35:00'),(988,247,0.00,3,1,'2021-01-31 20:35:11'),(989,248,35.00,1,0,'2021-01-31 20:35:35'),(990,248,54.00,2,1,'2021-01-31 20:35:48'),(991,248,0.00,3,1,'2021-01-31 20:36:07'),(992,249,40.00,1,0,'2021-01-31 20:36:25'),(993,249,60.00,2,0,'2021-01-31 20:36:45'),(994,249,40.00,1,0,'2021-01-31 20:37:03'),(995,249,0.00,3,1,'2021-01-31 20:37:15'),(996,250,35.00,1,0,'2021-01-31 20:37:37'),(997,250,54.00,2,1,'2021-01-31 20:37:48'),(998,250,0.00,3,1,'2021-01-31 20:37:59'),(999,251,35.00,1,0,'2021-01-31 20:38:16'),(1000,251,54.00,2,1,'2021-01-31 20:38:28'),(1001,251,0.00,3,1,'2021-01-31 20:38:40'),(1002,255,40.00,1,0,'2021-01-31 20:39:09'),(1003,255,60.00,2,1,'2021-01-31 20:39:21'),(1004,255,0.00,3,1,'2021-01-31 20:39:33'),(1005,256,35.00,1,0,'2021-01-31 20:39:51'),(1006,256,54.00,2,1,'2021-01-31 20:40:09'),(1007,256,0.00,3,1,'2021-01-31 20:40:25'),(1008,257,35.00,1,0,'2021-01-31 20:40:42'),(1009,257,54.00,2,1,'2021-01-31 20:40:57'),(1010,257,0.00,3,1,'2021-01-31 20:41:09'),(1011,258,35.00,1,0,'2021-01-31 20:41:26'),(1012,258,54.00,2,1,'2021-01-31 20:41:43'),(1013,258,0.00,3,1,'2021-01-31 20:41:55'),(1014,259,35.00,1,0,'2021-01-31 20:42:25'),(1015,259,54.00,2,1,'2021-01-31 20:42:36'),(1016,259,0.00,3,1,'2021-01-31 20:42:50'),(1017,260,35.00,1,0,'2021-01-31 20:43:08'),(1018,260,54.00,2,1,'2021-01-31 20:43:22'),(1019,260,0.00,3,1,'2021-01-31 20:43:37'),(1020,261,35.00,1,0,'2021-01-31 20:43:56'),(1021,261,54.00,2,0,'2021-01-31 20:44:09'),(1022,261,0.00,2,0,'2021-01-31 20:44:27'),(1023,261,54.00,2,1,'2021-01-31 20:44:46'),(1024,261,0.00,3,1,'2021-01-31 20:44:59'),(1025,262,25.00,1,0,'2021-01-31 20:45:18'),(1026,262,45.00,2,1,'2021-01-31 20:45:36'),(1027,262,0.00,3,1,'2021-01-31 20:45:48'),(1028,263,40.00,1,0,'2021-01-31 20:46:17'),(1029,263,60.00,2,1,'2021-01-31 20:46:29'),(1030,264,35.00,1,0,'2021-01-31 20:46:45'),(1031,264,54.00,2,1,'2021-01-31 20:46:56'),(1032,264,0.00,3,1,'2021-01-31 20:47:07'),(1033,265,35.00,1,0,'2021-01-31 20:47:26'),(1034,265,54.00,2,1,'2021-01-31 20:47:46'),(1035,265,0.00,3,1,'2021-01-31 20:48:00'),(1036,266,35.00,1,0,'2021-01-31 20:48:14'),(1037,266,54.00,2,1,'2021-01-31 20:48:25'),(1038,266,0.00,3,1,'2021-01-31 20:48:38'),(1039,267,35.00,1,0,'2021-01-31 20:48:58'),(1040,267,54.00,2,1,'2021-01-31 20:49:11'),(1041,267,0.00,3,1,'2021-01-31 20:49:26'),(1042,268,35.00,1,0,'2021-01-31 20:49:42'),(1043,268,54.00,2,1,'2021-01-31 20:49:54'),(1044,268,0.00,3,1,'2021-01-31 20:50:06'),(1045,109,110.00,1,0,'2021-01-31 20:51:33'),(1046,116,125.00,1,0,'2021-01-31 20:53:13'),(1047,109,0.00,3,1,'2021-01-31 20:55:37'),(1048,116,170.00,2,1,'2021-01-31 20:56:18'),(1049,109,160.00,1,0,'2021-01-31 20:57:15'),(1050,109,160.00,2,1,'2021-01-31 20:57:58'),(1051,109,110.00,1,0,'2021-01-31 20:58:24'),(1052,168,150.00,1,0,'2021-01-31 20:59:19'),(1053,168,180.00,2,0,'2021-01-31 21:00:00'),(1054,281,160.00,2,1,'2021-01-31 21:00:43'),(1055,281,110.00,1,0,'2021-01-31 21:01:03'),(1056,281,0.00,3,1,'2021-01-31 21:01:24'),(1057,282,200.00,1,0,'2021-01-31 21:01:59'),(1058,282,270.00,2,1,'2021-01-31 21:02:19'),(1059,282,0.00,3,1,'2021-01-31 21:02:38'),(1060,283,190.00,1,0,'2021-01-31 21:03:13'),(1061,283,260.00,2,1,'2021-01-31 21:03:30'),(1062,283,0.00,3,1,'2021-01-31 21:03:46'),(1063,284,180.00,1,0,'2021-01-31 21:04:20'),(1064,284,250.00,2,1,'2021-01-31 21:04:36'),(1065,284,0.00,3,1,'2021-01-31 21:04:48'),(1066,290,180.00,1,0,'2021-01-31 21:06:46'),(1067,290,250.00,2,1,'2021-01-31 21:07:17'),(1068,290,0.00,3,1,'2021-01-31 21:07:32'),(1069,285,360.00,1,0,'2021-01-31 21:07:59'),(1070,285,490.00,2,1,'2021-01-31 21:08:15'),(1071,285,0.00,3,1,'2021-01-31 21:08:31'),(1072,288,360.00,1,0,'2021-01-31 21:09:33'),(1073,288,490.00,2,1,'2021-01-31 21:09:48'),(1074,288,0.00,3,1,'2021-01-31 21:10:22'),(1075,287,380.00,1,0,'2021-01-31 21:11:03'),(1076,287,510.00,2,1,'2021-01-31 21:11:27'),(1077,287,0.00,3,1,'2021-01-31 21:11:51'),(1078,286,400.00,1,0,'2021-01-31 21:12:26'),(1079,286,530.00,2,1,'2021-01-31 21:12:41'),(1080,286,0.00,3,1,'2021-01-31 21:12:59'),(1081,112,220.00,2,1,'2021-01-31 21:14:14'),(1082,269,200.00,1,0,'2021-01-31 21:16:05'),(1083,269,275.00,2,1,'2021-01-31 21:16:18'),(1084,269,0.00,3,1,'2021-01-31 21:16:38'),(1085,270,280.00,1,0,'2021-01-31 21:17:07'),(1086,270,380.00,2,1,'2021-01-31 21:17:26'),(1087,270,0.00,3,1,'2021-01-31 21:17:45'),(1088,271,380.00,1,0,'2021-01-31 21:18:09'),(1089,271,520.00,2,1,'2021-01-31 21:18:26'),(1090,271,0.00,3,1,'2021-01-31 21:18:40'),(1091,15,14.00,1,0,'2021-02-07 18:13:17'),(1092,735,65.00,1,0,'2021-02-24 19:12:44'),(1093,735,65.00,1,1,'2021-02-24 19:12:59'),(1094,660,30.00,1,1,'2021-03-04 18:39:34'),(1095,911,30.00,1,1,'2021-03-24 19:22:23'),(1096,154,16.00,1,0,'2021-05-06 01:12:15'),(1097,5,16.00,1,0,'2021-05-06 01:22:33'),(1098,6,15.00,1,0,'2021-05-06 01:25:10'),(1099,8,15.00,1,0,'2021-05-06 01:25:36'),(1100,11,15.00,1,0,'2021-05-06 01:25:46'),(1101,9,15.00,1,0,'2021-05-06 01:26:03'),(1102,10,15.00,1,0,'2021-05-06 01:26:14'),(1103,12,15.00,1,0,'2021-05-06 01:26:41'),(1104,134,15.00,1,0,'2021-05-06 01:26:55'),(1105,13,15.00,1,0,'2021-05-06 01:27:09'),(1106,133,15.00,1,0,'2021-05-06 01:27:23'),(1107,135,15.00,1,0,'2021-05-06 01:27:42'),(1108,71,15.00,1,0,'2021-05-06 01:28:50'),(1109,73,15.00,1,0,'2021-05-06 01:29:04'),(1110,74,15.00,1,0,'2021-05-06 01:29:18'),(1111,75,15.00,1,0,'2021-05-06 01:29:29'),(1112,76,15.00,1,0,'2021-05-06 01:29:41'),(1113,77,15.00,1,0,'2021-05-06 01:29:54'),(1114,78,15.00,1,0,'2021-05-06 01:30:05'),(1115,80,15.00,1,0,'2021-05-06 01:30:23'),(1116,14,18.00,1,0,'2021-05-06 01:30:56'),(1117,15,15.00,1,0,'2021-05-06 01:31:09'),(1118,149,28.00,1,0,'2021-05-06 01:32:57'),(1119,156,35.00,1,0,'2021-05-06 01:33:55'),(1120,153,40.00,1,0,'2021-05-06 01:35:49'),(1121,157,35.00,1,0,'2021-05-06 01:36:10'),(1122,82,75.00,1,0,'2021-05-06 01:36:27'),(1123,81,70.00,1,0,'2021-05-06 01:36:42'),(1124,83,70.00,1,0,'2021-05-06 01:36:55'),(1125,180,75.00,1,0,'2021-05-06 01:37:42'),(1126,22,90.00,1,0,'2021-05-06 01:39:08'),(1127,21,100.00,1,0,'2021-05-06 01:39:28'),(1128,165,90.00,1,0,'2021-05-06 01:39:42'),(1129,18,100.00,1,0,'2021-05-06 01:39:55'),(1130,19,100.00,1,0,'2021-05-06 01:40:09'),(1131,20,90.00,3,0,'2021-05-06 01:40:21'),(1132,20,90.00,1,0,'2021-05-06 01:40:30'),(1133,20,0.00,3,1,'2021-05-06 01:40:46'),(1134,166,90.00,1,0,'2021-05-06 01:41:05'),(1135,167,90.00,1,0,'2021-05-06 01:41:29'),(1136,181,90.00,1,0,'2021-05-06 01:41:49'),(1137,208,90.00,1,0,'2021-05-06 01:42:09'),(1138,209,90.00,1,0,'2021-05-06 01:42:25'),(1139,210,90.00,1,0,'2021-05-06 01:42:37'),(1140,211,100.00,1,0,'2021-05-06 01:43:14'),(1141,23,90.00,1,0,'2021-05-06 01:43:30'),(1142,24,90.00,1,0,'2021-05-06 01:43:46'),(1143,203,100.00,1,0,'2021-05-06 01:44:06'),(1144,204,100.00,1,0,'2021-05-06 01:44:20'),(1145,205,100.00,1,0,'2021-05-06 01:44:38'),(1146,206,100.00,1,0,'2021-05-06 01:44:53'),(1147,207,90.00,1,0,'2021-05-06 01:45:07'),(1148,212,100.00,1,0,'2021-05-06 01:45:24'),(1149,214,100.00,1,0,'2021-05-06 01:45:37'),(1150,213,100.00,1,0,'2021-05-06 01:45:53'),(1151,215,100.00,1,0,'2021-05-06 01:46:19'),(1152,216,100.00,1,0,'2021-05-06 01:46:41'),(1153,217,100.00,1,0,'2021-05-06 01:47:00'),(1154,219,90.00,1,0,'2021-05-06 01:47:23'),(1155,220,90.00,1,0,'2021-05-06 01:47:40'),(1156,218,90.00,1,0,'2021-05-06 01:47:57'),(1157,221,90.00,1,0,'2021-05-06 01:48:13'),(1158,222,90.00,1,0,'2021-05-06 01:48:27'),(1159,224,90.00,1,0,'2021-05-06 01:48:44'),(1160,223,90.00,1,0,'2021-05-06 01:49:03'),(1161,225,90.00,1,0,'2021-05-06 01:49:18'),(1162,226,90.00,1,0,'2021-05-06 01:49:32'),(1163,227,90.00,1,0,'2021-05-06 01:49:47'),(1164,28,65.00,1,0,'2021-05-06 01:50:06'),(1165,29,75.00,1,0,'2021-05-06 01:50:19'),(1166,174,75.00,1,0,'2021-05-06 01:50:39'),(1167,174,80.00,1,0,'2021-05-06 01:50:57'),(1168,182,75.00,1,0,'2021-05-06 01:51:32'),(1169,183,75.00,1,0,'2021-05-06 01:51:47'),(1170,228,75.00,1,0,'2021-05-06 01:52:07'),(1171,240,65.00,1,0,'2021-05-06 01:52:24'),(1172,232,75.00,1,0,'2021-05-06 01:52:37'),(1173,229,75.00,1,0,'2021-05-06 01:53:03'),(1174,230,75.00,1,0,'2021-05-06 01:53:16'),(1175,228,65.00,1,0,'2021-05-06 01:53:40'),(1176,182,65.00,1,0,'2021-05-06 01:53:57'),(1177,183,65.00,1,0,'2021-05-06 01:54:09'),(1178,232,65.00,1,0,'2021-05-06 01:54:33'),(1179,234,75.00,1,0,'2021-05-06 01:55:11'),(1180,233,80.00,1,0,'2021-05-06 01:55:39'),(1181,236,75.00,1,0,'2021-05-06 01:56:00'),(1182,237,75.00,1,0,'2021-05-06 01:56:14'),(1183,54,40.00,1,0,'2021-05-06 01:57:07'),(1184,55,35.00,1,0,'2021-05-06 01:57:23'),(1185,51,20.00,1,0,'2021-05-06 01:57:48'),(1186,52,25.00,1,0,'2021-05-06 01:58:02'),(1187,46,23.00,1,0,'2021-05-06 01:58:31'),(1188,113,23.00,1,0,'2021-05-06 01:58:43'),(1189,91,28.00,1,0,'2021-05-06 01:59:18'),(1190,291,25.00,1,0,'2021-05-06 01:59:50'),(1191,92,32.00,1,0,'2021-05-06 02:00:24'),(1192,37,23.00,1,0,'2021-05-06 02:00:42'),(1193,95,32.00,1,0,'2021-05-06 02:01:04'),(1194,169,32.00,1,0,'2021-05-06 02:01:22'),(1195,38,85.00,1,0,'2021-05-06 02:01:49'),(1196,96,100.00,1,0,'2021-05-06 02:02:03'),(1197,170,100.00,1,0,'2021-05-06 02:02:13'),(1198,119,15.00,1,0,'2021-05-11 16:54:08'),(1199,120,15.00,1,0,'2021-05-11 16:54:27'),(1200,31,38.00,1,0,'2021-05-11 16:58:04'),(1201,30,42.00,1,0,'2021-05-11 16:58:21'),(1202,249,42.00,1,0,'2021-05-11 16:59:15'),(1203,251,38.00,1,0,'2021-05-11 16:59:36'),(1204,196,28.00,1,0,'2021-05-11 17:00:22'),(1205,33,32.00,1,0,'2021-05-11 17:00:39'),(1206,186,28.00,1,0,'2021-05-11 17:00:56'),(1207,189,28.00,2,0,'2021-05-11 17:01:09'),(1208,191,28.00,1,0,'2021-05-11 17:01:29'),(1209,186,25.00,1,0,'2021-05-11 17:02:10'),(1210,195,32.00,1,0,'2021-05-11 17:02:30'),(1211,197,28.00,1,0,'2021-05-11 17:02:55'),(1212,291,25.00,1,0,'2021-05-11 17:05:56'),(1213,291,0.00,3,1,'2021-05-11 17:06:16'),(1214,105,15.00,1,0,'2021-05-11 17:07:03'),(1215,104,15.00,1,0,'2021-05-11 17:07:18'),(1216,72,16.00,1,0,'2021-05-24 01:50:33'),(1217,7,16.00,1,0,'2021-05-24 01:50:47'),(1218,129,16.00,1,0,'2021-05-24 01:51:24'),(1219,126,20.00,1,0,'2021-05-24 01:51:54'),(1220,85,65.00,1,0,'2021-05-24 01:52:14'),(1221,86,70.00,1,0,'2021-05-24 01:52:41'),(1222,245,38.00,1,0,'2021-05-24 01:53:10'),(1223,161,65.00,1,0,'2021-05-28 15:13:24'),(1224,163,70.00,1,0,'2021-05-28 15:14:05'),(1225,153,35.00,1,0,'2021-05-28 15:15:13'),(1226,154,35.00,1,0,'2021-05-28 15:15:38'),(1227,155,35.00,1,0,'2021-05-28 15:15:57'),(1228,156,30.00,1,0,'2021-05-28 15:16:15'),(1229,186,28.00,1,0,'2021-05-28 15:17:32'),(1230,190,28.00,1,0,'2021-05-28 15:18:27'),(1231,192,28.00,1,0,'2021-05-28 15:18:45'),(1232,194,28.00,1,0,'2021-05-28 15:18:59'),(1233,199,28.00,1,0,'2021-05-28 15:19:41'),(1234,200,28.00,1,0,'2021-05-28 15:20:02'),(1235,201,28.00,1,0,'2021-05-28 15:20:20'),(1236,189,28.00,1,0,'2021-05-28 15:20:35'),(1237,189,38.00,2,1,'2021-05-28 15:20:51'),(1238,84,65.00,1,0,'2021-05-28 15:22:01'),(1239,164,65.00,1,0,'2021-05-28 15:22:16'),(1240,88,70.00,1,0,'2021-05-28 15:23:03'),(1241,185,38.00,1,0,'2021-05-28 15:23:42'),(1242,188,38.00,1,0,'2021-05-28 15:23:56'),(1243,244,38.00,1,0,'2021-05-28 15:24:11'),(1244,246,38.00,1,0,'2021-05-28 15:24:22'),(1245,247,38.00,1,0,'2021-05-28 15:24:50'),(1246,248,38.00,1,0,'2021-05-28 15:25:04'),(1247,264,38.00,1,0,'2021-05-28 15:25:21'),(1248,265,38.00,1,0,'2021-05-28 15:25:40'),(1249,266,38.00,1,0,'2021-05-28 15:25:52'),(1250,267,38.00,1,0,'2021-05-28 15:26:11'),(1251,268,38.00,1,0,'2021-05-28 15:26:24'),(1252,184,38.00,1,0,'2021-05-28 15:27:10'),(1253,187,38.00,1,0,'2021-05-28 15:27:29'),(1254,242,38.00,1,0,'2021-05-28 15:27:47'),(1255,243,38.00,1,0,'2021-05-28 15:28:01'),(1256,250,38.00,1,0,'2021-05-28 15:28:23'),(1257,256,38.00,1,0,'2021-05-28 15:28:35'),(1258,257,38.00,1,0,'2021-05-28 15:28:49'),(1259,259,38.00,1,0,'2021-05-28 15:29:07'),(1260,260,38.00,1,0,'2021-05-28 15:29:23'),(1261,261,38.00,1,0,'2021-05-28 15:29:39'),(1262,241,38.00,1,0,'2021-05-28 15:29:52'),(1263,182,75.00,1,0,'2021-05-28 15:31:11'),(1264,183,75.00,1,0,'2021-05-28 15:31:26'),(1265,228,75.00,1,0,'2021-05-28 15:31:43'),(1266,231,75.00,1,0,'2021-05-28 15:32:00'),(1267,232,75.00,1,0,'2021-05-28 15:32:15'),(1268,235,75.00,1,0,'2021-05-28 15:32:33'),(1269,238,75.00,1,0,'2021-05-28 15:33:03'),(1270,239,75.00,1,0,'2021-05-28 15:33:16'),(1271,112,170.00,1,1,'2021-05-28 15:37:25'),(1272,112,170.00,3,1,'2021-05-28 15:38:04'),(1273,270,300.00,1,1,'2021-05-28 15:38:25'),(1274,271,380.00,1,1,'2021-05-28 15:39:06'),(1275,292,360.00,1,0,'2021-05-28 15:39:59'),(1276,293,400.00,1,0,'2021-05-28 15:40:38'),(1277,293,400.00,1,0,'2021-05-28 15:41:04'),(1278,269,210.00,1,1,'2021-05-28 15:41:37'),(1279,294,89.90,1,0,'2021-05-28 15:42:42'),(1280,203,101.00,1,0,'2021-05-31 15:31:11'),(1281,203,100.00,1,0,'2021-05-31 15:31:32'),(1282,84,70.00,1,0,'2021-08-05 20:13:24'),(1283,164,70.00,1,0,'2021-08-05 20:13:42'),(1284,84,65.00,1,0,'2021-08-26 19:19:04'),(1285,33,35.00,1,0,'2021-12-17 02:41:24'),(1286,186,30.00,1,0,'2021-12-17 02:42:20'),(1287,189,30.00,1,0,'2021-12-17 02:42:53'),(1288,190,35.00,1,0,'2022-06-02 02:43:31'),(1289,191,30.00,1,0,'2021-12-17 02:44:07'),(1290,195,33.00,1,0,'2021-12-17 02:44:55'),(1291,196,30.00,1,0,'2021-12-17 02:45:28'),(1292,197,30.00,1,0,'2021-12-17 02:45:56'),(1293,34,28.00,1,0,'2021-12-17 02:47:06'),(1294,184,40.00,1,0,'2021-12-17 02:47:43'),(1295,187,40.00,1,0,'2021-12-17 02:47:56'),(1296,242,40.00,1,0,'2021-12-17 02:48:14'),(1297,249,45.00,1,0,'2021-12-17 02:48:37'),(1298,250,40.00,1,0,'2021-12-17 02:48:59'),(1299,251,40.00,1,0,'2021-12-17 02:49:12'),(1300,256,40.00,1,0,'2021-12-17 02:49:32'),(1301,257,40.00,1,0,'2021-12-17 02:49:48'),(1302,258,40.00,1,0,'2021-12-17 02:50:06'),(1303,262,28.00,1,0,'2021-12-17 02:50:34'),(1304,31,40.00,1,0,'2021-12-17 02:51:07'),(1305,14,20.00,1,0,'2021-12-17 02:52:21'),(1306,16,22.00,1,0,'2021-12-17 02:52:45'),(1307,17,20.00,1,0,'2021-12-17 02:53:00'),(1308,117,18.00,1,0,'2021-12-17 02:53:21'),(1309,117,16.00,1,0,'2021-12-17 02:53:48'),(1310,119,17.00,1,0,'2021-12-17 02:54:51'),(1311,120,17.00,1,0,'2021-12-17 02:55:06'),(1312,121,20.00,1,0,'2021-12-17 02:55:22'),(1313,122,20.00,1,0,'2021-12-17 02:55:37'),(1314,123,22.00,1,1,'2021-12-17 02:56:07'),(1315,124,22.00,1,1,'2021-12-17 02:56:30'),(1316,125,22.00,1,0,'2021-12-17 02:56:50'),(1317,126,22.00,1,0,'2021-12-17 02:57:12'),(1318,130,18.00,1,0,'2021-12-17 02:57:49'),(1319,131,18.00,1,0,'2021-12-17 02:58:18'),(1320,70,17.00,1,0,'2021-12-17 02:59:03'),(1321,71,16.00,1,0,'2021-12-17 02:59:19'),(1322,73,16.00,1,0,'2021-12-17 02:59:42'),(1323,74,16.00,1,0,'2021-12-17 03:00:01'),(1324,75,16.00,1,0,'2021-12-17 03:00:15'),(1325,76,16.00,1,0,'2021-12-17 03:00:30'),(1326,77,16.00,1,0,'2021-12-17 03:00:44'),(1327,78,16.00,1,0,'2021-12-17 03:00:58'),(1328,80,16.00,1,0,'2021-12-17 03:01:15'),(1329,20,95.00,1,0,'2021-12-17 03:02:13'),(1330,19,105.00,1,0,'2021-12-17 03:02:36'),(1331,18,105.00,1,0,'2021-12-17 03:02:51'),(1332,21,105.00,1,0,'2021-12-17 03:03:07'),(1333,22,95.00,1,0,'2021-12-17 03:03:23'),(1334,23,95.00,1,0,'2021-12-17 03:03:38'),(1335,24,95.00,1,0,'2021-12-17 03:03:52'),(1336,165,95.00,1,0,'2021-12-17 03:04:07'),(1337,166,95.00,1,0,'2021-12-17 03:04:20'),(1338,167,95.00,1,0,'2021-12-17 03:04:35'),(1339,181,95.00,1,0,'2021-12-17 03:04:56'),(1340,203,105.00,1,0,'2021-12-17 03:05:13'),(1341,204,105.00,1,0,'2021-12-17 03:05:28'),(1342,205,105.00,1,0,'2021-12-17 03:05:44'),(1343,206,105.00,1,0,'2021-12-17 03:05:59'),(1344,208,95.00,1,0,'2021-12-17 03:06:14'),(1345,207,95.00,1,0,'2021-12-17 03:06:35'),(1346,209,95.00,1,0,'2021-12-17 03:07:17'),(1347,210,95.00,1,0,'2021-12-17 03:07:30'),(1348,211,105.00,1,0,'2021-12-17 03:07:51'),(1349,212,105.00,1,0,'2021-12-17 03:08:06'),(1350,213,105.00,1,0,'2021-12-17 03:08:59'),(1351,214,105.00,1,0,'2021-12-17 03:09:12'),(1352,215,105.00,1,0,'2021-12-17 03:09:44'),(1353,227,95.00,1,0,'2021-12-17 03:09:58'),(1354,216,105.00,1,0,'2021-12-17 03:10:11'),(1355,218,95.00,1,0,'2021-12-17 03:10:26'),(1356,217,105.00,1,0,'2021-12-17 03:10:39'),(1357,219,95.00,1,0,'2021-12-17 03:11:04'),(1358,220,95.00,1,0,'2021-12-17 03:11:22'),(1359,221,95.00,1,0,'2021-12-17 03:11:41'),(1360,222,95.00,1,0,'2021-12-17 03:11:59'),(1361,223,95.00,1,0,'2021-12-17 03:12:14'),(1362,224,95.00,1,0,'2021-12-17 03:12:29'),(1363,225,95.00,1,0,'2021-12-17 03:12:43'),(1364,226,95.00,1,0,'2021-12-17 03:12:56'),(1365,161,70.00,1,0,'2021-12-17 03:13:29'),(1366,83,80.00,1,0,'2021-12-17 03:14:08'),(1367,82,80.00,1,0,'2021-12-17 03:14:21'),(1368,84,70.00,1,0,'2021-12-17 03:14:35'),(1369,85,70.00,1,0,'2021-12-17 03:14:48'),(1370,87,70.00,1,0,'2021-12-17 03:15:02'),(1371,163,80.00,1,0,'2021-12-17 03:15:26'),(1372,180,80.00,1,0,'2021-12-17 03:15:58'),(1373,241,40.00,1,0,'2021-12-30 17:45:06'),(1374,81,80.00,1,0,'2022-01-03 18:45:05'),(1375,185,40.00,1,0,'2022-01-21 16:30:58'),(1376,188,40.00,1,0,'2022-01-21 16:31:10'),(1377,244,40.00,1,0,'2022-01-21 16:31:21'),(1378,266,40.00,1,0,'2022-01-21 16:34:58'),(1379,245,40.00,1,0,'2022-01-21 16:35:11'),(1380,246,40.00,1,0,'2022-01-21 16:35:23'),(1381,247,40.00,1,0,'2022-01-21 16:35:34'),(1382,248,40.00,1,0,'2022-01-21 16:35:54'),(1383,265,40.00,1,0,'2022-01-21 16:36:09'),(1384,264,40.00,1,0,'2022-01-21 16:36:24'),(1385,267,40.00,1,0,'2022-01-21 16:36:37'),(1386,268,40.00,1,0,'2022-01-21 16:36:51'),(1387,292,23.00,1,0,'2022-01-25 20:10:33'),(1388,292,0.00,3,1,'2022-01-25 20:11:18'),(1389,293,25.00,1,0,'2022-01-25 20:13:39'),(1390,293,0.00,3,1,'2022-01-25 20:15:54'),(1391,293,25.00,1,0,'2022-01-25 20:16:34'),(1392,294,26.00,1,0,'2022-01-25 20:24:46'),(1393,294,0.00,3,1,'2022-01-25 20:25:10'),(1394,295,21.00,1,0,'2022-01-25 20:30:49'),(1395,295,20.00,3,0,'2022-01-25 20:31:07'),(1396,295,0.00,3,1,'2022-01-25 20:31:18'),(1397,30,45.00,1,0,'2022-04-19 01:28:09'),(1398,296,17.00,1,0,'2022-04-19 01:29:37'),(1399,139,16.00,1,0,'2022-04-19 01:31:13'),(1400,5,17.00,1,0,'2022-04-19 01:31:38'),(1401,138,17.00,1,0,'2022-04-19 01:32:13'),(1402,5,16.00,1,0,'2022-04-23 23:48:38'),(1403,145,16.00,2,1,'2022-05-15 01:08:52'),(1404,145,16.00,1,0,'2022-05-15 01:09:19'),(1405,65,28.00,1,0,'2022-05-15 01:12:04'),(1406,297,16.00,1,0,'2022-05-26 19:18:15'),(1407,5,17.00,1,0,'2022-06-02 13:38:46'),(1408,13,16.00,1,0,'2022-06-02 13:40:26'),(1409,6,16.00,1,0,'2022-06-02 13:41:57'),(1410,8,16.00,1,0,'2022-06-02 13:43:00'),(1411,12,16.00,1,0,'2022-06-02 13:43:26'),(1412,9,16.00,1,0,'2022-06-02 13:43:50'),(1413,10,16.00,1,0,'2022-06-02 13:44:21'),(1414,134,16.00,1,0,'2022-06-02 13:44:46'),(1415,135,16.00,1,0,'2022-06-02 13:45:31'),(1416,133,16.00,1,0,'2022-06-02 13:46:11'),(1417,135,16.00,1,0,'2022-06-02 13:46:56'),(1418,11,16.00,1,0,'2022-06-02 13:48:21'),(1419,136,18.00,1,0,'2022-06-02 13:50:33'),(1420,144,17.00,1,0,'2022-06-02 13:51:12'),(1421,137,17.00,1,0,'2022-06-02 13:51:35'),(1422,139,17.00,1,0,'2022-06-02 13:51:54'),(1423,143,17.00,1,0,'2022-06-02 13:52:11'),(1424,140,17.00,1,0,'2022-06-02 13:52:27'),(1425,141,17.00,1,0,'2022-06-02 13:52:53'),(1426,145,17.00,1,0,'2022-06-02 13:53:08'),(1427,146,17.00,1,0,'2022-06-02 13:53:21'),(1428,147,17.00,1,0,'2022-06-02 13:53:46'),(1429,142,17.00,1,0,'2022-06-02 13:53:58'),(1430,80,17.00,1,0,'2022-06-02 13:55:08'),(1431,297,17.00,1,0,'2022-06-02 13:55:31'),(1432,70,18.00,1,0,'2022-06-02 13:55:58'),(1433,72,17.00,1,0,'2022-06-02 13:56:18'),(1434,71,17.00,1,0,'2022-06-02 13:56:39'),(1435,73,17.00,1,0,'2022-06-02 13:57:04'),(1436,77,17.00,1,0,'2022-06-02 13:57:17'),(1437,74,17.00,1,0,'2022-06-02 13:57:41'),(1438,75,17.00,1,0,'2022-06-02 13:57:53'),(1439,78,17.00,1,0,'2022-06-02 13:58:07'),(1440,76,17.00,1,0,'2022-06-02 13:58:21'),(1441,117,17.00,1,0,'2022-06-02 13:59:16'),(1442,118,17.00,1,0,'2022-06-02 13:59:53'),(1443,15,16.00,1,0,'2022-06-02 14:00:10'),(1444,121,22.00,1,0,'2022-06-02 14:01:14'),(1445,122,22.00,1,1,'2022-06-02 14:01:32'),(1446,128,20.00,1,1,'2022-06-02 14:02:31'),(1447,129,17.00,1,0,'2022-06-02 14:02:50'),(1448,292,27.00,1,0,'2022-06-02 14:03:14'),(1449,293,28.00,1,0,'2022-06-02 14:03:31'),(1450,294,30.00,1,0,'2022-06-02 14:04:14'),(1451,214,105.00,1,0,'2022-06-02 14:09:15'),(1452,174,90.00,1,0,'2022-06-02 14:10:57'),(1453,29,80.00,1,0,'2022-06-02 14:11:41'),(1454,228,80.00,1,0,'2022-06-02 14:12:04'),(1455,229,80.00,1,0,'2022-06-02 14:12:38'),(1456,230,80.00,1,0,'2022-06-02 14:12:57'),(1457,232,80.00,1,0,'2022-06-02 14:13:21'),(1458,28,70.00,1,0,'2022-06-02 14:14:08'),(1459,233,90.00,1,0,'2022-06-02 14:14:50'),(1460,234,80.00,1,0,'2022-06-02 14:15:07'),(1461,235,80.00,1,0,'2022-06-02 14:15:20'),(1462,236,80.00,1,0,'2022-06-02 14:15:30'),(1463,237,80.00,1,0,'2022-06-02 14:15:46'),(1464,239,80.00,1,0,'2022-06-02 14:16:14'),(1465,240,70.00,1,0,'2022-06-02 14:16:36'),(1466,250,45.00,1,0,'2022-06-02 14:17:34'),(1467,251,45.00,1,0,'2022-06-02 14:17:56'),(1468,241,45.00,1,0,'2022-06-02 14:18:45'),(1469,242,45.00,1,0,'2022-06-02 14:19:05'),(1470,244,45.00,1,0,'2022-06-02 14:19:51'),(1471,245,45.00,1,0,'2022-06-02 14:20:03'),(1472,247,45.00,1,0,'2022-06-02 14:21:00'),(1473,243,45.00,1,0,'2022-06-02 14:21:22'),(1474,248,45.00,1,0,'2022-06-02 14:21:49'),(1475,31,40.00,1,0,'2022-06-02 14:22:03'),(1476,192,35.00,1,0,'2022-06-02 14:22:55'),(1477,255,45.00,1,0,'2022-06-02 14:23:31'),(1478,256,45.00,1,0,'2022-06-02 14:24:01'),(1479,257,45.00,1,0,'2022-06-02 14:24:16'),(1480,261,45.00,1,0,'2022-06-02 14:27:05'),(1481,259,45.00,1,0,'2022-06-02 14:27:47'),(1482,263,45.00,1,0,'2022-06-02 14:28:19'),(1483,264,45.00,1,0,'2022-06-02 14:29:12'),(1484,265,45.00,1,0,'2022-06-02 14:29:40'),(1485,266,45.00,1,0,'2022-06-02 14:30:10'),(1486,267,45.00,1,0,'2022-06-02 14:30:23'),(1487,268,45.00,1,0,'2022-06-02 14:30:40'),(1488,199,30.00,1,0,'2022-06-02 14:43:23'),(1489,200,30.00,1,0,'2022-06-02 14:52:08'),(1490,235,30.00,1,0,'2022-06-02 14:56:49'),(1491,201,30.00,1,0,'2022-06-02 15:00:33'),(1492,84,75.00,1,0,'2022-06-02 15:02:43'),(1493,83,85.00,1,0,'2022-06-02 15:04:11'),(1494,58,30.00,1,0,'2022-06-02 15:04:48'),(1495,68,32.00,1,0,'2022-06-02 15:05:03'),(1496,66,30.00,1,0,'2022-06-02 15:05:24'),(1497,148,30.00,1,0,'2022-06-02 15:05:36'),(1498,67,30.00,1,0,'2022-06-02 15:05:49'),(1499,149,35.00,1,0,'2022-06-02 15:06:08'),(1500,57,30.00,1,0,'2022-06-02 15:06:30'),(1501,59,30.00,1,0,'2022-06-02 15:06:44'),(1502,60,30.00,1,0,'2022-06-02 15:07:05'),(1503,61,30.00,1,0,'2022-06-02 15:07:42'),(1504,64,30.00,1,0,'2022-06-02 15:07:57'),(1505,151,30.00,1,0,'2022-06-02 15:08:08'),(1506,152,30.00,1,0,'2022-06-02 15:08:20'),(1507,62,30.00,1,0,'2022-06-02 15:08:35'),(1508,179,30.00,1,0,'2022-06-02 15:08:46'),(1509,65,30.00,1,0,'2022-06-02 15:08:59'),(1510,69,30.00,1,0,'2022-06-02 15:09:12'),(1511,153,40.00,1,0,'2022-06-02 15:09:39'),(1512,154,40.00,1,0,'2022-06-02 15:10:03'),(1513,156,35.00,1,0,'2022-06-02 15:10:18'),(1514,159,35.00,1,0,'2022-06-02 15:10:42'),(1515,160,35.00,1,0,'2022-06-02 15:10:53'),(1516,55,40.00,1,0,'2022-06-02 15:12:22'),(1517,95,35.00,1,0,'2022-06-02 15:13:47'),(1518,169,35.00,1,0,'2022-06-02 15:13:57'),(1519,37,25.00,1,0,'2022-06-02 15:14:12'),(1520,38,90.00,1,0,'2022-06-02 15:15:12'),(1521,113,25.00,1,0,'2022-06-02 15:15:26'),(1522,46,25.00,1,0,'2022-06-02 15:15:37'),(1523,89,20.00,1,0,'2022-06-02 15:16:06'),(1524,91,30.00,1,0,'2022-06-02 15:16:28'),(1525,92,30.00,1,0,'2022-06-02 15:17:39'),(1526,303,40.00,1,0,'2022-06-02 02:43:31'),(1527,304,45.00,1,0,'2022-06-02 02:43:31'),(1528,305,40.00,1,0,'2022-06-02 02:43:31'),(1529,306,50.00,1,0,'2022-06-02 02:43:31'),(1530,194,35.00,1,0,'2022-06-02 02:43:31'),(1531,260,45.00,1,0,'2022-06-02 02:43:31'),(1532,195,35.00,1,0,'2022-06-02 02:43:31'),(1533,196,35.00,1,0,'2022-06-02 02:43:31'),(1534,199,35.00,1,0,'2022-06-02 02:43:31'),(1535,173,30.00,1,0,'2022-06-02 02:43:31'),(1536,68,35.00,1,0,'2022-06-02 02:43:31'),(1537,66,35.00,1,0,'2022-06-02 02:43:31'),(1538,148,35.00,1,0,'2022-06-02 02:43:31'),(1539,307,27.00,1,0,'2022-07-04 19:05:54'),(1540,5,18.00,1,0,'2022-09-16 02:10:38'),(1541,136,19.00,1,0,'2022-09-16 02:11:17'),(1542,6,17.00,1,0,'2022-09-16 02:11:51'),(1543,7,17.00,1,0,'2022-09-16 02:12:11'),(1544,13,17.00,1,0,'2022-09-16 02:12:36'),(1545,8,17.00,1,0,'2022-09-16 02:12:53'),(1546,12,17.00,1,0,'2022-09-16 02:13:14'),(1547,9,17.00,1,0,'2022-09-16 02:13:25'),(1548,10,17.00,1,0,'2022-09-16 02:13:39'),(1549,133,17.00,1,0,'2022-09-16 02:13:51'),(1550,134,17.00,1,0,'2022-09-16 02:14:01'),(1551,135,17.00,1,0,'2022-09-16 02:14:14'),(1552,11,17.00,1,0,'2022-09-16 02:14:28'),(1553,138,18.00,1,0,'2022-09-16 02:15:08'),(1554,144,18.00,1,0,'2022-09-16 02:15:37'),(1555,137,18.00,1,0,'2022-09-16 02:15:57'),(1556,139,18.00,1,0,'2022-09-16 02:16:10'),(1557,143,18.00,1,0,'2022-09-16 02:16:21'),(1558,140,18.00,1,0,'2022-09-16 02:16:32'),(1559,141,18.00,1,0,'2022-09-16 02:16:42'),(1560,145,18.00,1,0,'2022-09-16 02:16:53'),(1561,146,18.00,1,0,'2022-09-16 02:17:08'),(1562,147,18.00,1,0,'2022-09-16 02:17:18'),(1563,142,18.00,1,0,'2022-09-16 02:17:28'),(1564,308,19.00,1,0,'2022-09-16 02:18:11'),(1565,308,0.00,3,1,'2022-09-16 02:19:01'),(1566,117,18.00,1,0,'2022-09-16 02:25:22'),(1567,15,17.00,1,0,'2022-09-16 02:25:48'),(1568,129,18.00,1,0,'2022-09-16 02:28:08'),(1569,127,19.00,1,0,'2022-09-16 02:28:36'),(1570,130,19.00,1,0,'2022-09-16 02:29:32'),(1571,131,19.00,1,0,'2022-09-16 02:29:53'),(1572,21,110.00,1,0,'2022-09-16 02:31:11'),(1573,214,110.00,1,0,'2022-09-16 02:31:29'),(1574,309,55.00,1,0,'2022-09-16 02:35:26'),(1575,30,50.00,1,0,'2022-09-16 02:35:53'),(1576,263,50.00,1,0,'2022-09-16 02:37:16'),(1577,249,50.00,1,0,'2022-09-16 02:44:12'),(1578,34,30.00,1,0,'2022-09-16 02:46:13'),(1579,262,30.00,1,0,'2022-09-16 02:46:36'),(1580,255,50.00,1,0,'2022-09-16 02:47:12'),(1581,54,45.00,1,0,'2022-09-16 02:48:38'),(1582,56,45.00,1,0,'2022-09-16 02:48:50'),(1583,55,45.00,1,0,'2022-09-16 02:49:00'),(1584,306,50.00,1,0,'2022-09-16 02:49:42'),(1585,83,90.00,1,0,'2022-09-16 02:55:48'),(1586,84,80.00,1,0,'2022-09-16 02:55:59'),(1587,91,35.00,1,0,'2022-09-18 00:36:29'),(1588,93,40.00,1,0,'2022-09-18 00:37:01'),(1589,292,26.00,1,0,'2022-09-18 00:53:17'),(1590,208,110.00,1,0,'2022-09-26 00:09:09'),(1591,222,110.00,1,0,'2022-09-26 00:09:38'),(1592,15,18.00,1,0,'2022-12-20 02:33:09'),(1593,5,19.00,1,0,'2022-12-20 02:48:05'),(1594,6,18.00,1,0,'2022-12-20 02:48:19'),(1595,7,18.00,1,0,'2022-12-20 02:48:46'),(1596,8,18.00,1,0,'2022-12-20 02:48:58'),(1597,9,18.00,1,0,'2022-12-20 02:49:08'),(1598,10,18.00,1,0,'2022-12-20 02:49:26'),(1599,11,18.00,1,0,'2022-12-20 02:49:36'),(1600,12,18.00,1,0,'2022-12-20 02:49:47'),(1601,13,18.00,1,0,'2022-12-20 02:50:00'),(1602,16,25.00,1,0,'2022-12-20 02:50:37'),(1603,17,22.00,1,0,'2022-12-20 02:50:58'),(1604,136,20.00,1,0,'2022-12-20 02:51:51'),(1605,137,19.00,1,0,'2022-12-20 02:52:06'),(1606,138,19.00,1,0,'2022-12-20 02:52:17'),(1607,139,19.00,1,0,'2022-12-20 02:52:28'),(1608,140,19.00,1,0,'2022-12-20 02:52:39'),(1609,141,19.00,1,0,'2022-12-20 02:52:51'),(1610,142,19.00,1,0,'2022-12-20 02:53:04'),(1611,143,19.00,1,0,'2022-12-20 02:53:17'),(1612,144,19.00,1,0,'2022-12-20 02:53:46'),(1613,145,19.00,1,0,'2022-12-20 02:54:06'),(1614,146,19.00,1,0,'2022-12-20 02:54:20'),(1615,147,19.00,1,0,'2022-12-20 02:54:32'),(1616,304,50.00,1,0,'2022-12-20 02:55:30'),(1617,305,45.00,1,0,'2022-12-20 02:56:09'),(1618,309,60.00,1,0,'2022-12-20 02:56:27'),(1619,303,0.00,2,1,'2022-12-20 02:57:01'),(1620,21,120.00,1,0,'2022-12-20 02:58:50'),(1621,214,120.00,2,1,'2022-12-20 02:59:13'),(1622,222,120.00,1,0,'2022-12-20 02:59:27'),(1623,28,80.00,1,0,'2022-12-20 03:00:31'),(1624,29,90.00,1,0,'2022-12-20 03:00:56'),(1625,174,100.00,1,0,'2022-12-20 03:01:14'),(1626,228,90.00,1,0,'2022-12-20 03:01:24'),(1627,229,90.00,1,0,'2022-12-20 03:01:36'),(1628,230,90.00,1,0,'2022-12-20 03:01:46'),(1629,234,90.00,1,0,'2022-12-20 03:02:10'),(1630,232,90.00,1,0,'2022-12-20 03:02:26'),(1631,235,90.00,1,0,'2022-12-20 03:02:45'),(1632,236,90.00,1,0,'2022-12-20 03:02:59'),(1633,237,90.00,1,0,'2022-12-20 03:03:12'),(1634,239,90.00,1,0,'2022-12-20 03:03:25'),(1635,240,80.00,1,0,'2022-12-20 03:03:40'),(1636,153,50.00,1,1,'2022-12-20 03:04:14'),(1637,156,40.00,1,0,'2022-12-20 03:05:03'),(1638,157,45.00,1,0,'2022-12-20 03:05:21'),(1639,159,40.00,1,0,'2022-12-20 03:05:42'),(1640,155,40.00,1,0,'2022-12-20 03:05:59'),(1641,160,40.00,1,0,'2022-12-20 03:06:24'),(1642,33,40.00,1,0,'2022-12-20 03:06:55'),(1643,190,40.00,1,0,'2022-12-20 03:07:16'),(1644,191,35.00,1,0,'2022-12-20 03:07:42'),(1645,195,40.00,1,0,'2022-12-20 03:08:12'),(1646,196,40.00,1,0,'2022-12-20 03:08:25'),(1647,200,35.00,1,0,'2022-12-20 03:08:54'),(1648,201,35.00,1,0,'2022-12-20 03:09:21'),(1649,197,35.00,1,0,'2022-12-20 03:09:48'),(1650,244,50.00,1,0,'2022-12-20 03:10:15'),(1651,245,50.00,1,0,'2022-12-20 03:10:26'),(1652,247,50.00,1,0,'2022-12-20 03:10:43'),(1653,248,50.00,1,0,'2022-12-20 03:10:55'),(1654,264,50.00,1,0,'2022-12-20 03:11:15'),(1655,265,50.00,1,0,'2022-12-20 03:11:33'),(1656,266,50.00,1,0,'2022-12-20 03:11:44'),(1657,267,50.00,1,0,'2022-12-20 03:11:58'),(1658,268,50.00,1,0,'2022-12-20 03:12:11'),(1659,241,50.00,1,0,'2022-12-20 03:13:25'),(1660,242,50.00,1,0,'2022-12-20 03:13:39'),(1661,243,50.00,1,0,'2022-12-20 03:13:49'),(1662,250,50.00,1,0,'2022-12-20 03:13:59'),(1663,251,50.00,1,0,'2022-12-20 03:14:12'),(1664,256,50.00,1,0,'2022-12-20 03:14:28'),(1665,257,50.00,1,0,'2022-12-20 03:14:44'),(1666,259,50.00,1,0,'2022-12-20 03:14:58'),(1667,260,50.00,1,0,'2022-12-20 03:15:13'),(1668,261,50.00,1,0,'2022-12-20 03:15:28'),(1669,133,18.00,1,0,'2022-12-20 03:16:46'),(1670,134,18.00,1,0,'2022-12-20 03:16:56'),(1671,135,18.00,1,0,'2022-12-20 03:17:22'),(1672,70,21.00,1,0,'2022-12-20 03:19:16'),(1673,71,20.00,1,0,'2022-12-20 03:19:29'),(1674,72,20.00,1,0,'2022-12-20 03:19:40'),(1675,73,20.00,1,0,'2022-12-20 03:19:50'),(1676,74,20.00,1,0,'2022-12-20 03:20:04'),(1677,75,20.00,1,0,'2022-12-20 03:20:12'),(1678,76,20.00,1,0,'2022-12-20 03:20:20'),(1679,77,20.00,1,0,'2022-12-20 03:20:29'),(1680,78,20.00,1,0,'2022-12-20 03:20:41'),(1681,80,20.00,1,0,'2022-12-20 03:20:54'),(1682,80,20.00,1,0,'2022-12-20 03:21:15'),(1683,295,22.00,1,0,'2022-12-20 03:21:28'),(1684,296,20.00,1,0,'2022-12-20 03:21:43'),(1685,297,20.00,1,0,'2022-12-20 03:21:57'),(1686,307,32.00,1,0,'2022-12-20 03:22:11'),(1687,118,18.00,1,0,'2022-12-20 03:22:54'),(1688,119,18.00,1,0,'2022-12-20 03:23:09'),(1689,120,18.00,1,0,'2022-12-20 03:23:22'),(1690,117,20.00,1,0,'2022-12-20 03:24:12'),(1691,118,20.00,1,0,'2022-12-20 03:24:32'),(1692,119,20.00,1,0,'2022-12-20 03:24:40'),(1693,120,20.00,1,0,'2022-12-20 03:24:50'),(1694,127,20.00,1,0,'2022-12-20 03:25:18'),(1695,129,20.00,1,0,'2022-12-20 03:25:40'),(1696,130,20.00,1,0,'2022-12-20 03:26:16'),(1697,131,20.00,1,0,'2022-12-20 03:26:33'),(1698,214,120.00,1,0,'2022-12-20 03:27:35'),(1699,192,40.00,1,1,'2022-12-20 03:28:24'),(1700,194,40.00,1,1,'2022-12-20 03:28:33'),(1701,199,40.00,1,1,'2022-12-20 03:28:55'),(1702,37,28.00,1,0,'2022-12-20 03:30:29'),(1703,46,28.00,1,0,'2022-12-20 03:30:43'),(1704,91,40.00,1,1,'2022-12-20 03:31:13'),(1705,92,40.00,1,0,'2022-12-20 03:31:22'),(1706,93,45.00,1,0,'2022-12-20 03:31:33'),(1707,113,28.00,1,0,'2022-12-20 03:32:07'),(1708,173,35.00,1,0,'2022-12-20 03:32:46'),(1709,57,35.00,1,0,'2022-12-20 03:33:22'),(1710,58,35.00,1,0,'2022-12-20 03:33:35'),(1711,59,35.00,1,0,'2022-12-20 03:33:47'),(1712,60,35.00,1,0,'2022-12-20 03:33:58'),(1713,61,35.00,1,0,'2022-12-20 03:34:09'),(1714,62,35.00,1,0,'2022-12-20 03:34:18'),(1715,64,35.00,1,0,'2022-12-20 03:34:27'),(1716,65,35.00,1,0,'2022-12-20 03:34:37'),(1717,67,35.00,1,0,'2022-12-20 03:35:00'),(1718,69,35.00,1,0,'2022-12-20 03:35:10'),(1719,151,35.00,1,0,'2022-12-20 03:35:36'),(1720,152,35.00,1,0,'2022-12-20 03:35:53'),(1721,179,35.00,1,0,'2022-12-20 03:36:49'),(1722,83,95.00,1,0,'2022-12-20 03:37:33'),(1723,84,85.00,1,1,'2022-12-20 03:37:42'),(1724,325,25.00,1,0,'2022-12-18 01:00:00'),(1725,315,25.00,1,1,'2022-12-18 01:00:00'),(1726,127,22.00,1,0,'2022-12-23 04:45:58'),(1727,316,26.00,1,0,'2023-01-14 15:58:35'),(1728,316,0.00,2,0,'2023-01-14 15:59:13'),(1729,317,28.00,1,1,'2023-01-14 16:08:48'),(1730,316,0.00,2,1,'2023-01-14 16:09:43'),(1731,316,26.00,1,1,'2023-01-14 16:10:51'),(1732,318,130.00,1,0,'2023-01-17 22:41:41'),(1733,233,100.00,1,1,'2023-02-20 02:09:41'),(1734,322,35.00,1,1,'2023-04-03 03:05:08'),(1735,92,30.00,1,0,'2023-04-10 01:50:50'),(1736,323,45.00,1,0,'2023-04-18 00:26:46'),(1737,323,45.00,1,1,'2023-04-18 00:27:39'),(1738,308,20.00,1,0,'2023-04-26 14:54:35'),(1739,318,160.00,1,0,'2023-05-02 01:55:29'),(1740,68,40.00,1,0,'2023-05-10 00:35:42'),(1741,324,32.00,1,1,'2023-10-14 19:37:00'),(1742,324,0.00,2,1,'2023-10-14 19:37:24'),(1743,325,32.00,1,0,'2023-11-26 21:04:21'),(1744,325,0.00,2,0,'2023-11-26 21:04:57'),(1745,325,0.00,2,0,'2023-11-26 21:05:42'),(1746,14,22.00,1,0,'2023-12-13 01:31:20'),(1747,117,22.00,2,1,'2023-12-13 01:31:32'),(1748,16,28.00,1,1,'2023-12-13 01:32:04'),(1749,121,28.00,1,1,'2023-12-13 01:32:26'),(1750,30,60.00,1,0,'2023-12-13 01:33:57'),(1751,244,60.00,1,0,'2023-12-13 01:34:11'),(1752,245,60.00,1,0,'2023-12-13 01:34:24'),(1753,247,60.00,1,0,'2023-12-13 01:34:36'),(1754,248,60.00,1,0,'2023-12-13 01:35:02'),(1755,263,60.00,1,0,'2023-12-13 01:35:19'),(1756,264,60.00,1,0,'2023-12-13 01:35:33'),(1757,265,60.00,1,0,'2023-12-13 01:35:45'),(1758,266,60.00,1,0,'2023-12-13 01:36:02'),(1759,267,60.00,1,0,'2023-12-13 01:36:14'),(1760,268,60.00,1,0,'2023-12-13 01:36:26'),(1761,309,65.00,1,0,'2023-12-13 01:36:36'),(1762,309,0.00,2,1,'2023-12-13 01:36:46'),(1763,191,40.00,1,1,'2023-12-13 01:37:19'),(1764,197,40.00,1,1,'2023-12-13 01:37:34'),(1765,200,40.00,1,1,'2023-12-13 01:37:47'),(1766,201,40.00,1,1,'2023-12-13 01:37:59'),(1767,241,60.00,1,0,'2023-12-13 01:38:34'),(1768,242,60.00,1,0,'2023-12-13 01:38:52'),(1769,243,60.00,1,0,'2023-12-13 01:39:05'),(1770,249,60.00,1,0,'2023-12-13 01:39:16'),(1771,250,60.00,1,0,'2023-12-13 01:39:27'),(1772,251,60.00,1,0,'2023-12-13 01:39:40'),(1773,255,60.00,1,0,'2023-12-13 01:39:59'),(1774,256,60.00,1,0,'2023-12-13 01:40:12'),(1775,257,60.00,1,0,'2023-12-13 01:40:26'),(1776,259,60.00,1,0,'2023-12-13 01:40:43'),(1777,260,60.00,1,0,'2023-12-13 01:40:56'),(1778,261,60.00,1,0,'2023-12-13 01:41:08'),(1779,21,125.00,1,0,'2024-01-02 01:49:44'),(1780,214,125.00,1,0,'2024-01-02 01:49:55'),(1781,117,22.00,1,0,'2024-01-03 04:47:25'),(1782,17,25.00,1,1,'2024-01-03 04:49:42'),(1783,292,28.00,1,0,'2024-01-03 05:13:21'),(1784,294,34.00,1,1,'2024-01-03 05:14:30'),(1785,129,22.00,1,0,'2024-01-03 05:16:19'),(1786,295,24.00,1,0,'2024-03-02 02:17:50'),(1787,326,20.00,1,0,'2024-03-13 00:22:40'),(1788,326,20.00,1,0,'2024-03-13 00:25:07'),(1789,327,25.00,1,0,'2024-03-13 00:25:50'),(1790,328,32.00,1,0,'2024-03-13 00:27:15'),(1791,329,60.00,1,0,'2024-03-13 00:29:01'),(1792,330,24.00,1,0,'2024-03-13 00:30:35'),(1793,331,60.00,1,0,'2024-03-13 00:32:20'),(1794,331,60.00,1,0,'2024-03-13 00:32:52'),(1795,332,40.00,1,0,'2024-03-13 00:34:04'),(1796,333,21.00,1,0,'2024-03-20 00:29:34'),(1797,334,28.00,1,0,'2024-03-20 00:33:58'),(1798,335,20.00,1,0,'2024-03-20 00:40:31'),(1799,129,20.00,1,0,'2024-04-26 02:05:31'),(1800,71,22.00,1,1,'2024-06-02 00:39:00'),(1801,72,22.00,1,1,'2024-06-02 00:39:17'),(1802,70,23.00,1,0,'2024-06-02 00:40:51'),(1803,293,30.00,1,0,'2024-06-02 00:41:17'),(1804,296,21.00,1,0,'2024-06-02 00:42:16'),(1805,297,21.00,1,0,'2024-06-02 00:42:28'),(1806,73,22.00,1,1,'2024-06-02 02:22:40'),(1807,74,22.00,1,1,'2024-06-02 02:22:51'),(1808,75,22.00,1,1,'2024-06-02 02:23:02'),(1809,76,22.00,1,1,'2024-06-02 02:23:15'),(1810,77,22.00,1,1,'2024-06-02 02:23:26'),(1811,78,22.00,1,1,'2024-06-02 02:23:37'),(1812,307,34.00,1,0,'2024-06-03 00:30:09'),(1813,80,22.00,1,1,'2024-06-03 00:30:27'),(1814,292,30.00,1,0,'2024-08-22 15:25:05'),(1815,293,32.00,1,1,'2024-08-22 15:25:24'),(1816,303,45.00,1,0,'2024-08-22 15:26:01'),(1817,304,55.00,1,1,'2024-08-22 15:26:16'),(1818,305,50.00,1,1,'2024-08-22 15:26:38'),(1819,307,36.00,1,0,'2024-08-22 15:27:02'),(1820,329,65.00,1,0,'2024-08-22 15:27:34'),(1821,331,65.00,1,0,'2024-08-22 15:27:49'),(1822,318,200.00,1,0,'2024-08-23 22:24:31'),(1823,336,250.00,1,0,'2024-08-23 22:25:39'),(1824,337,500.00,1,0,'2024-08-23 22:27:13'),(1825,36,3.00,1,1,'2024-09-12 15:34:47'),(1826,83,100.00,1,1,'2024-09-15 01:39:42'),(1827,92,35.00,1,1,'2024-10-26 01:07:30'),(1828,25,2.00,1,1,'2024-10-31 21:18:08'),(1829,106,3.00,1,1,'2024-10-31 21:19:33'),(1830,5,20.00,1,0,'2024-10-31 21:20:34'),(1831,6,20.00,1,1,'2024-10-31 21:21:03'),(1832,7,20.00,1,1,'2024-10-31 21:21:26'),(1833,8,20.00,1,1,'2024-10-31 21:21:39'),(1834,9,20.00,1,1,'2024-10-31 21:22:11'),(1835,10,20.00,1,1,'2024-10-31 21:22:24'),(1836,11,20.00,1,1,'2024-10-31 21:22:36'),(1837,12,20.00,1,1,'2024-10-31 21:22:48'),(1838,13,20.00,1,1,'2024-10-31 21:23:09'),(1839,133,20.00,1,1,'2024-10-31 21:23:25'),(1840,134,20.00,1,1,'2024-10-31 21:23:50'),(1841,135,20.00,1,1,'2024-10-31 21:24:04'),(1842,136,22.00,1,0,'2024-10-31 21:24:29'),(1843,137,22.00,1,1,'2024-10-31 21:24:53'),(1844,138,22.00,1,1,'2024-10-31 21:25:11'),(1845,139,22.00,1,1,'2024-10-31 21:26:03'),(1846,140,22.00,1,1,'2024-10-31 21:26:18'),(1847,141,22.00,1,1,'2024-10-31 21:26:34'),(1848,142,22.00,1,1,'2024-10-31 21:26:46'),(1849,143,22.00,1,1,'2024-10-31 21:27:03'),(1850,144,22.00,1,1,'2024-10-31 21:27:15'),(1851,145,22.00,1,1,'2024-10-31 21:27:28'),(1852,146,22.00,1,1,'2024-10-31 21:27:41'),(1853,147,22.00,1,1,'2024-10-31 21:27:55'),(1854,296,22.00,1,1,'2024-10-31 21:30:40'),(1855,295,26.00,1,1,'2024-10-31 21:31:26'),(1856,297,22.00,1,1,'2024-10-31 21:31:54'),(1857,307,32.00,1,1,'2024-10-31 21:32:23'),(1858,330,35.00,1,1,'2024-10-31 21:32:39'),(1859,335,22.00,1,0,'2024-10-31 21:33:10'),(1860,14,24.00,1,1,'2024-10-31 21:35:21'),(1861,126,26.00,2,1,'2024-10-31 21:36:28'),(1862,126,26.00,1,1,'2024-10-31 21:36:53'),(1863,15,20.00,1,1,'2024-10-31 21:40:02'),(1864,117,24.00,1,1,'2024-10-31 21:40:41'),(1865,118,24.00,1,1,'2024-10-31 21:41:23'),(1866,119,24.00,1,1,'2024-10-31 21:41:38'),(1867,125,25.00,1,1,'2024-10-31 21:42:15'),(1868,127,26.00,1,1,'2024-10-31 21:44:46'),(1869,128,26.00,2,1,'2024-10-31 21:45:02'),(1870,129,22.00,1,1,'2024-10-31 21:45:20'),(1871,130,22.00,1,1,'2024-10-31 21:45:35'),(1872,131,22.00,1,1,'2024-10-31 21:45:50'),(1873,292,32.00,1,0,'2024-10-31 21:46:18'),(1874,326,22.00,1,0,'2024-10-31 21:46:51'),(1875,333,22.00,1,1,'2024-10-31 21:47:31'),(1876,21,130.00,1,1,'2024-10-31 21:48:22'),(1877,214,130.00,1,1,'2024-10-31 21:48:35'),(1878,28,90.00,1,1,'2024-10-31 21:49:10'),(1879,29,100.00,1,1,'2024-10-31 21:49:47'),(1880,30,70.00,1,1,'2024-10-31 21:50:11'),(1881,31,50.00,1,1,'2024-10-31 21:50:28'),(1882,33,45.00,1,1,'2024-10-31 21:50:55'),(1883,34,40.00,1,1,'2024-10-31 21:51:14'),(1884,174,110.00,1,1,'2024-10-31 21:51:40'),(1885,190,45.00,1,1,'2024-10-31 21:51:51'),(1886,195,45.00,1,1,'2024-10-31 21:52:29'),(1887,196,45.00,1,1,'2024-10-31 21:52:41'),(1888,228,100.00,1,1,'2024-10-31 21:54:16'),(1889,234,100.00,1,1,'2024-10-31 21:54:44'),(1890,235,100.00,1,1,'2024-10-31 21:54:59'),(1891,229,100.00,1,1,'2024-10-31 21:55:16'),(1892,230,100.00,1,1,'2024-10-31 21:55:35'),(1893,232,100.00,1,1,'2024-10-31 21:55:48'),(1894,236,100.00,1,1,'2024-10-31 21:56:16'),(1895,237,100.00,1,1,'2024-10-31 21:56:33'),(1896,239,100.00,1,1,'2024-10-31 21:56:46'),(1897,240,90.00,1,1,'2024-10-31 21:57:00'),(1898,241,65.00,1,1,'2024-10-31 21:58:40'),(1899,303,50.00,1,0,'2024-10-31 21:59:33'),(1900,242,65.00,1,1,'2024-10-31 22:01:13'),(1901,332,50.00,1,0,'2024-10-31 22:03:34'),(1902,243,65.00,1,1,'2024-10-31 22:06:45'),(1903,249,70.00,2,1,'2024-10-31 22:07:04'),(1904,249,70.00,1,1,'2024-10-31 22:07:19'),(1905,250,70.00,1,1,'2024-10-31 22:07:34'),(1906,251,65.00,1,1,'2024-10-31 22:07:50'),(1907,257,65.00,1,1,'2024-10-31 22:08:17'),(1908,255,70.00,1,1,'2024-10-31 22:08:38'),(1909,256,70.00,1,1,'2024-10-31 22:08:55'),(1910,259,65.00,1,1,'2024-10-31 22:09:27'),(1911,260,65.00,1,1,'2024-10-31 22:09:41'),(1912,261,65.00,1,1,'2024-10-31 22:09:55'),(1913,262,40.00,1,1,'2024-10-31 22:11:23'),(1914,329,75.00,1,1,'2024-10-31 22:11:49'),(1915,331,75.00,1,0,'2024-10-31 22:12:00'),(1916,244,70.00,1,1,'2024-10-31 22:13:02'),(1917,247,65.00,1,1,'2024-10-31 22:13:24'),(1918,248,65.00,1,1,'2024-10-31 22:13:38'),(1919,263,70.00,1,1,'2024-10-31 22:13:56'),(1920,264,70.00,1,1,'2024-10-31 22:14:08'),(1921,265,65.00,1,1,'2024-10-31 22:16:02'),(1922,266,65.00,1,1,'2024-10-31 22:16:17'),(1923,267,65.00,1,1,'2024-10-31 22:16:32'),(1924,268,65.00,1,1,'2024-10-31 22:16:45'),(1925,309,75.00,1,1,'2024-10-31 22:21:20'),(1926,37,30.00,1,1,'2024-10-31 22:22:08'),(1927,38,100.00,1,1,'2024-10-31 22:22:21'),(1928,46,30.00,1,1,'2024-10-31 22:22:37'),(1929,51,25.00,1,1,'2024-10-31 22:22:49'),(1930,52,30.00,1,1,'2024-10-31 22:23:08'),(1931,89,25.00,1,1,'2024-10-31 22:23:27'),(1932,93,50.00,1,1,'2024-10-31 22:23:51'),(1933,95,40.00,1,1,'2024-10-31 22:24:02'),(1934,96,110.00,1,1,'2024-10-31 22:24:23'),(1935,104,20.00,1,1,'2024-10-31 22:24:40'),(1936,105,20.00,1,1,'2024-10-31 22:24:52'),(1937,113,30.00,1,1,'2024-10-31 22:25:06'),(1938,169,40.00,1,1,'2024-10-31 22:25:18'),(1939,54,60.00,1,1,'2024-10-31 22:29:04'),(1940,55,50.00,1,1,'2024-10-31 22:29:15'),(1941,56,50.00,1,1,'2024-10-31 22:29:39'),(1942,57,40.00,1,1,'2024-10-31 22:32:29'),(1943,58,40.00,1,0,'2024-10-31 22:32:43'),(1944,59,40.00,1,1,'2024-10-31 22:32:56'),(1945,60,40.00,1,1,'2024-10-31 22:33:07'),(1946,61,40.00,1,1,'2024-10-31 22:33:22'),(1947,62,40.00,1,1,'2024-10-31 22:33:34'),(1948,64,40.00,1,1,'2024-10-31 22:33:44'),(1949,65,40.00,1,1,'2024-10-31 22:33:56'),(1950,66,40.00,1,1,'2024-10-31 22:34:09'),(1951,67,40.00,1,1,'2024-10-31 22:34:20'),(1952,69,40.00,1,1,'2024-10-31 22:34:33'),(1953,148,40.00,1,1,'2024-10-31 22:34:45'),(1954,149,45.00,1,1,'2024-10-31 22:35:03'),(1955,151,40.00,1,1,'2024-10-31 22:35:26'),(1956,152,40.00,1,1,'2024-10-31 22:35:53'),(1957,154,45.00,1,0,'2024-10-31 22:37:45'),(1958,155,45.00,1,1,'2024-10-31 22:37:58'),(1959,156,45.00,1,1,'2024-10-31 22:38:11'),(1960,157,50.00,1,1,'2024-10-31 22:38:33'),(1961,159,45.00,1,1,'2024-10-31 22:38:46'),(1962,160,45.00,1,1,'2024-10-31 22:38:58'),(1963,179,40.00,1,1,'2024-10-31 22:39:33'),(1964,109,130.00,1,1,'2024-10-31 22:42:13'),(1965,168,140.00,1,0,'2024-10-31 22:42:49'),(1966,116,130.00,1,0,'2024-10-31 22:43:13'),(1967,281,130.00,1,1,'2024-10-31 22:44:51'),(1968,168,140.00,1,1,'2024-10-31 22:45:14'),(1969,282,225.00,1,0,'2024-10-31 22:45:34'),(1970,283,200.00,1,0,'2024-10-31 22:45:49'),(1971,284,200.00,1,1,'2024-10-31 22:46:06'),(1972,285,400.00,1,1,'2024-10-31 22:46:41'),(1973,286,450.00,1,1,'2024-10-31 22:47:24'),(1974,287,400.00,1,0,'2024-10-31 23:04:21'),(1975,288,400.00,1,1,'2024-10-31 23:04:42'),(1976,282,225.00,1,1,'2024-10-31 23:04:59'),(1977,290,200.00,1,1,'2024-10-31 23:05:21'),(1978,318,150.00,1,1,'2024-10-31 23:05:54'),(1979,336,250.00,1,0,'2024-10-31 23:06:15'),(1980,337,500.00,1,1,'2024-10-31 23:06:29'),(1981,292,30.00,1,1,'2024-11-01 19:47:54'),(1982,68,45.00,1,1,'2024-11-24 02:21:07'),(1983,245,65.00,1,1,'2024-11-24 02:22:40'),(1984,5,24.00,1,1,'2025-03-21 01:21:02'),(1985,292,0.00,2,1,'2025-03-21 01:21:51'),(1986,136,26.00,1,1,'2025-03-21 01:23:27'),(1987,58,45.00,1,1,'2025-03-21 01:24:02'),(1988,70,26.00,1,1,'2025-03-21 01:24:21'),(1989,154,50.00,1,1,'2025-03-21 01:25:34'),(1990,120,28.00,1,1,'2025-03-21 01:31:02'),(1991,325,110.00,1,1,'2025-03-21 01:32:45'),(1992,325,0.00,2,0,'2025-03-21 01:33:03'),(1993,116,150.00,1,1,'2025-03-21 01:34:17'),(1994,283,225.00,1,1,'2025-03-21 01:34:47'),(1995,287,450.00,1,1,'2025-03-21 01:35:12'),(1996,308,26.00,1,1,'2025-03-21 01:38:11'),(1997,325,0.00,2,1,'2025-03-21 01:38:46'),(1998,326,35.00,1,1,'2025-03-21 16:46:12'),(1999,327,35.00,1,1,'2025-03-21 16:47:03'),(2000,328,50.00,2,1,'2025-03-21 17:21:58'),(2001,303,50.00,1,1,'2025-03-21 17:25:15'),(2002,302,75.00,1,1,'2025-03-21 00:00:00'),(2003,173,40.00,1,1,'2024-10-31 00:00:00'),(2004,331,20.00,1,0,'2025-03-30 00:52:50'),(2005,332,26.00,1,1,'2025-03-30 00:54:55'),(2006,331,20.00,1,0,'2025-03-30 00:56:36'),(2007,334,55.00,1,1,'2025-03-30 01:14:23'),(2008,331,24.00,1,1,'2025-03-31 00:42:17'),(2009,335,250.00,1,1,'2025-03-31 18:50:13'),(2010,336,500.00,1,1,'2025-03-31 18:52:50'),(2011,170,110.00,1,1,'2025-04-03 00:46:01');
/*!40000 ALTER TABLE `tbl_precios_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prods_orden_opciones`
--

DROP TABLE IF EXISTS `tbl_prods_orden_opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prods_orden_opciones` (
  `id_prod_orden_opcion` int NOT NULL AUTO_INCREMENT,
  `id_prod_x_orden` int NOT NULL,
  `id_variante_platillo` int NOT NULL,
  PRIMARY KEY (`id_prod_orden_opcion`),
  KEY `id_prod_x_orden` (`id_prod_x_orden`),
  KEY `dasdfasdf` (`id_variante_platillo`) COMMENT 'edsafasdf',
  CONSTRAINT `tbl_prods_orden_opciones_ibfk_1` FOREIGN KEY (`id_prod_x_orden`) REFERENCES `tbl_prods_x_orden` (`id_prod_x_orden`),
  CONSTRAINT `tbl_prods_orden_opciones_ibfk_2` FOREIGN KEY (`id_variante_platillo`) REFERENCES `tbl_variantes_platillos` (`id_variante_pl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_orden_opciones`
--

LOCK TABLES `tbl_prods_orden_opciones` WRITE;
/*!40000 ALTER TABLE `tbl_prods_orden_opciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prods_orden_opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prods_variantes`
--

DROP TABLE IF EXISTS `tbl_prods_variantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prods_variantes` (
  `id_prods_variantes` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_variante` int NOT NULL,
  `int_activo` int DEFAULT '1',
  PRIMARY KEY (`id_prods_variantes`),
  KEY `dsff` (`id_producto`),
  KEY `id_variante` (`id_variante`),
  CONSTRAINT `tbl_prods_variantes_ibfk_1` FOREIGN KEY (`id_variante`) REFERENCES `tbl_variantes_platillos` (`id_variante_pl`),
  CONSTRAINT `tbl_prods_variantes_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_precios_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4041 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_variantes`
--

LOCK TABLES `tbl_prods_variantes` WRITE;
/*!40000 ALTER TABLE `tbl_prods_variantes` DISABLE KEYS */;
INSERT INTO `tbl_prods_variantes` VALUES (191,28,10,1),(192,29,10,1),(193,30,10,1),(194,31,10,1),(195,33,10,1),(196,34,10,1),(197,35,10,1),(210,51,10,1),(211,52,10,1),(213,54,10,1),(214,55,10,1),(263,63,1,1),(264,63,2,1),(265,63,3,1),(266,63,4,1),(267,63,5,1),(268,63,7,1),(269,63,8,1),(270,63,10,1),(319,70,3,1),(320,70,4,1),(321,70,5,1),(322,70,10,1),(323,71,3,1),(324,71,4,1),(325,71,5,1),(326,71,10,1),(327,72,3,1),(328,72,4,1),(329,72,5,1),(330,72,10,1),(331,73,3,1),(332,73,4,1),(333,73,5,1),(334,73,10,1),(335,74,3,1),(336,74,4,1),(337,74,5,1),(338,74,10,1),(339,75,3,1),(340,75,4,1),(341,75,5,1),(342,75,10,1),(343,76,3,1),(344,76,4,1),(345,76,5,1),(346,76,10,1),(347,77,3,1),(348,77,4,1),(349,77,5,1),(350,77,10,1),(351,78,3,1),(352,78,4,1),(353,78,5,1),(354,78,10,1),(355,79,3,1),(356,79,4,1),(357,79,5,1),(358,79,10,1),(359,80,3,1),(360,80,4,1),(361,80,5,1),(362,80,10,1),(412,91,10,1),(415,41,10,1),(417,46,10,1),(418,47,10,1),(419,48,10,1),(420,89,10,1),(442,45,10,1),(462,113,10,1),(463,113,17,1),(464,112,1,1),(465,112,2,1),(466,112,3,1),(467,112,4,1),(468,112,5,1),(469,112,6,1),(470,112,10,1),(471,112,15,1),(472,112,16,1),(473,112,17,1),(484,114,1,1),(485,114,2,1),(486,114,3,1),(487,114,4,1),(488,114,5,1),(489,114,6,1),(490,114,10,1),(491,114,15,1),(492,114,16,1),(493,114,17,1),(504,115,1,1),(505,115,2,1),(506,115,4,1),(507,115,5,1),(508,115,7,1),(509,115,10,1),(510,115,15,1),(511,115,16,1),(512,115,17,1),(557,22,4,1),(558,22,10,1),(559,22,17,1),(560,22,18,1),(561,22,19,1),(576,24,4,1),(577,24,10,1),(578,24,17,1),(579,24,18,1),(580,24,19,1),(583,37,10,1),(584,37,17,1),(587,38,10,1),(588,38,17,1),(589,25,10,1),(590,25,17,1),(591,36,10,1),(592,36,17,1),(593,106,10,1),(594,106,17,1),(782,109,10,1),(783,109,17,1),(784,109,18,1),(785,109,19,1),(786,116,10,1),(787,116,17,1),(788,116,18,1),(789,116,19,1),(792,107,10,1),(793,107,17,1),(822,117,1,0),(823,117,2,0),(824,117,3,0),(825,117,4,0),(826,117,5,0),(827,117,10,1),(828,117,17,1),(829,118,1,1),(830,118,2,1),(831,118,3,1),(832,118,4,1),(833,118,5,1),(834,118,10,1),(835,118,17,1),(853,16,3,1),(854,16,4,1),(855,16,5,1),(856,16,7,1),(857,16,10,1),(870,0,1,0),(871,0,2,0),(872,0,3,0),(873,0,4,0),(874,0,5,0),(875,0,7,0),(876,0,10,1),(877,0,17,1),(918,120,1,0),(919,120,2,0),(920,120,3,1),(921,120,4,1),(922,120,5,1),(923,120,7,1),(924,120,10,1),(925,120,17,1),(956,124,1,0),(957,124,2,0),(958,124,3,1),(959,124,4,1),(960,124,5,1),(961,124,7,1),(962,124,10,1),(963,124,17,1),(964,123,1,0),(965,123,2,0),(966,123,3,1),(967,123,4,1),(968,123,5,1),(969,123,7,1),(970,123,10,1),(971,123,17,1),(972,122,1,1),(973,122,2,1),(974,122,3,1),(975,122,4,1),(976,122,5,1),(977,122,7,1),(978,122,10,1),(979,122,17,1),(980,121,1,1),(981,121,2,1),(982,121,3,1),(983,121,4,1),(984,121,5,1),(985,121,7,1),(986,121,10,1),(987,121,17,1),(988,125,1,0),(989,125,2,0),(990,125,3,1),(991,125,4,1),(992,125,5,1),(993,125,7,1),(994,125,10,1),(995,125,17,1),(1036,127,1,1),(1037,127,2,1),(1038,127,3,1),(1039,127,4,1),(1040,127,5,1),(1041,127,7,1),(1042,127,10,1),(1043,127,17,1),(1044,126,1,0),(1045,126,2,0),(1046,126,3,1),(1047,126,4,1),(1048,126,5,1),(1049,126,7,1),(1050,126,10,1),(1051,126,17,1),(1052,17,1,1),(1053,17,2,1),(1054,17,3,1),(1055,17,4,1),(1056,17,5,1),(1057,17,7,1),(1058,17,10,1),(1059,17,17,1),(1060,14,1,0),(1061,14,2,0),(1062,14,3,0),(1063,14,4,0),(1064,14,5,0),(1065,14,7,0),(1066,14,10,1),(1067,14,17,1),(1068,15,1,1),(1069,15,2,1),(1070,15,3,1),(1071,15,4,1),(1072,15,5,1),(1073,15,6,1),(1074,15,7,1),(1075,15,10,1),(1076,15,17,1),(1102,130,1,0),(1103,130,2,0),(1104,130,3,1),(1105,130,4,1),(1106,130,5,1),(1107,130,7,1),(1108,130,10,1),(1109,130,17,1),(1110,128,1,1),(1111,128,2,1),(1112,128,3,1),(1113,128,4,1),(1114,128,5,1),(1115,128,7,1),(1116,128,10,1),(1117,128,17,1),(1118,129,1,1),(1119,129,2,1),(1120,129,3,1),(1121,129,4,1),(1122,129,5,1),(1123,129,7,1),(1124,129,10,1),(1125,129,17,1),(1126,131,1,0),(1127,131,2,0),(1128,131,3,1),(1129,131,4,1),(1130,131,5,1),(1131,131,7,1),(1132,131,10,1),(1133,131,17,1),(1142,108,10,1),(1143,108,17,1),(1151,13,1,1),(1152,13,2,1),(1153,13,3,1),(1154,13,4,1),(1155,13,5,1),(1156,13,7,1),(1157,13,10,1),(1222,5,1,0),(1223,5,2,0),(1224,5,3,0),(1225,5,4,0),(1226,5,5,0),(1227,5,7,0),(1228,5,10,1),(1229,5,17,1),(1230,5,18,0),(1231,5,19,0),(1240,6,1,1),(1241,6,2,1),(1242,6,3,1),(1243,6,4,1),(1244,6,5,1),(1245,6,10,1),(1246,6,17,1),(1247,6,18,1),(1248,6,19,1),(1257,136,1,1),(1258,136,2,1),(1259,136,3,1),(1260,136,4,1),(1261,136,5,1),(1262,136,7,1),(1263,136,10,1),(1264,136,17,1),(1281,7,1,1),(1282,7,2,1),(1283,7,3,1),(1284,7,4,1),(1285,7,5,1),(1286,7,7,1),(1287,7,10,1),(1288,7,17,1),(1289,138,1,1),(1290,138,2,1),(1291,138,3,1),(1292,138,4,1),(1293,138,5,1),(1294,138,7,1),(1295,138,10,1),(1296,138,17,1),(1297,137,1,1),(1298,137,2,1),(1299,137,3,1),(1300,137,4,1),(1301,137,5,1),(1302,137,7,1),(1303,137,10,1),(1304,137,17,1),(1305,8,1,1),(1306,8,2,1),(1307,8,3,1),(1308,8,4,1),(1309,8,5,1),(1310,8,7,1),(1311,8,10,1),(1312,8,17,1),(1313,8,18,1),(1314,8,19,1),(1315,139,1,1),(1316,139,2,1),(1317,139,3,1),(1318,139,4,1),(1319,139,5,1),(1320,139,7,1),(1321,139,10,1),(1322,139,17,1),(1331,9,1,1),(1332,9,2,1),(1333,9,3,1),(1334,9,4,1),(1335,9,5,1),(1336,9,7,1),(1337,9,10,1),(1338,9,17,1),(1355,140,1,1),(1356,140,2,1),(1357,140,3,1),(1358,140,4,1),(1359,140,5,1),(1360,140,7,1),(1361,140,10,1),(1362,140,17,1),(1363,10,1,1),(1364,10,2,1),(1365,10,3,1),(1366,10,4,1),(1367,10,5,1),(1368,10,7,1),(1369,10,10,1),(1370,10,17,1),(1371,10,18,1),(1372,10,19,1),(1389,141,1,1),(1390,141,2,1),(1391,141,3,1),(1392,141,4,1),(1393,141,5,1),(1394,141,7,1),(1395,141,10,1),(1396,141,17,1),(1397,11,1,1),(1398,11,2,1),(1399,11,3,1),(1400,11,4,1),(1401,11,5,1),(1402,11,7,1),(1403,11,10,1),(1404,11,17,1),(1405,11,18,1),(1406,11,19,1),(1407,142,1,1),(1408,142,2,1),(1409,142,3,1),(1410,142,4,1),(1411,142,5,1),(1412,142,7,1),(1413,142,10,1),(1414,142,17,1),(1415,12,1,1),(1416,12,2,1),(1417,12,3,1),(1418,12,4,1),(1419,12,5,1),(1420,12,7,1),(1421,12,10,1),(1422,12,17,1),(1423,12,18,1),(1424,12,19,1),(1425,143,1,1),(1426,143,2,1),(1427,143,3,1),(1428,143,4,1),(1429,143,5,1),(1430,143,7,1),(1431,143,10,1),(1432,143,17,1),(1433,132,1,1),(1434,132,2,1),(1435,132,3,1),(1436,132,4,1),(1437,132,5,1),(1438,132,7,1),(1439,132,10,1),(1440,132,17,1),(1441,144,1,1),(1442,144,2,1),(1443,144,3,1),(1444,144,4,1),(1445,144,5,1),(1446,144,7,1),(1447,144,10,1),(1448,144,17,1),(1449,133,1,1),(1450,133,2,1),(1451,133,3,1),(1452,133,4,1),(1453,133,5,1),(1454,133,7,1),(1455,133,10,1),(1456,133,17,1),(1481,145,1,1),(1482,145,2,1),(1483,145,3,1),(1484,145,4,1),(1485,145,5,1),(1486,145,7,1),(1487,145,10,1),(1488,145,17,1),(1489,134,1,1),(1490,134,2,1),(1491,134,3,1),(1492,134,4,1),(1493,134,5,1),(1494,134,7,1),(1495,134,10,1),(1496,134,17,1),(1497,146,1,1),(1498,146,2,1),(1499,146,3,1),(1500,146,4,1),(1501,146,5,1),(1502,146,7,1),(1503,146,10,1),(1504,146,17,1),(1505,135,1,1),(1506,135,2,1),(1507,135,3,1),(1508,135,4,1),(1509,135,5,1),(1510,135,7,1),(1511,135,10,1),(1512,135,17,1),(1513,147,1,1),(1514,147,2,1),(1515,147,3,1),(1516,147,4,1),(1517,147,5,1),(1518,147,7,1),(1519,147,10,1),(1520,147,17,1),(1548,68,1,0),(1549,68,2,0),(1550,68,3,0),(1551,68,4,0),(1552,68,5,0),(1553,68,7,0),(1554,68,8,0),(1555,68,10,1),(1556,68,17,1),(1565,58,1,1),(1566,58,2,1),(1567,58,3,1),(1568,58,4,1),(1569,58,5,1),(1570,58,7,1),(1571,58,8,1),(1572,58,10,1),(1589,66,1,1),(1590,66,2,1),(1591,66,3,1),(1592,66,4,1),(1593,66,5,1),(1594,66,7,1),(1595,66,10,1),(1596,66,17,1),(1597,148,1,1),(1598,148,2,1),(1599,148,3,1),(1600,148,4,1),(1601,148,5,1),(1602,148,7,1),(1603,148,10,1),(1604,148,17,1),(1629,67,1,1),(1630,67,2,1),(1631,67,3,1),(1632,67,4,1),(1633,67,5,1),(1634,67,7,1),(1635,67,10,1),(1636,67,17,1),(1637,149,1,1),(1638,149,2,1),(1639,149,3,1),(1640,149,4,1),(1641,149,5,1),(1642,149,7,1),(1643,149,10,1),(1644,149,17,1),(1645,150,1,1),(1646,150,2,1),(1647,150,3,1),(1648,150,4,1),(1649,150,5,1),(1650,150,7,1),(1651,150,10,1),(1652,150,17,1),(1661,57,1,1),(1662,57,2,1),(1663,57,3,1),(1664,57,4,1),(1665,57,5,1),(1666,57,7,1),(1667,57,8,1),(1668,57,10,1),(1693,59,1,1),(1694,59,2,1),(1695,59,3,1),(1696,59,4,1),(1697,59,5,1),(1698,59,7,1),(1699,59,8,1),(1700,59,10,1),(1725,61,1,1),(1726,61,2,1),(1727,61,3,1),(1728,61,4,1),(1729,61,5,1),(1730,61,7,1),(1731,61,8,0),(1732,61,10,1),(1757,152,1,0),(1758,152,2,0),(1759,152,3,0),(1760,152,4,0),(1761,152,5,0),(1762,152,7,0),(1763,152,10,0),(1764,152,17,0),(1773,69,1,1),(1774,69,2,1),(1775,69,3,1),(1776,69,4,1),(1777,69,5,1),(1778,69,7,1),(1779,69,8,1),(1780,69,10,1),(1807,65,1,1),(1808,65,2,1),(1809,65,3,1),(1810,65,4,1),(1811,65,5,1),(1812,65,7,1),(1813,65,8,1),(1814,65,10,1),(1815,65,17,1),(1825,62,1,1),(1826,62,2,1),(1827,62,3,1),(1828,62,4,1),(1829,62,5,1),(1830,62,7,1),(1831,62,8,1),(1832,62,10,1),(1833,62,17,1),(1842,153,1,1),(1843,153,2,1),(1844,153,3,1),(1845,153,4,1),(1846,153,5,1),(1847,153,7,1),(1848,153,10,1),(1849,153,17,1),(1900,156,1,1),(1901,156,2,1),(1902,156,3,1),(1903,156,4,1),(1904,156,5,1),(1905,156,6,1),(1906,156,7,1),(1907,156,10,1),(1908,156,17,1),(1917,157,1,1),(1918,157,2,1),(1919,157,3,1),(1920,157,4,1),(1921,157,5,1),(1922,157,7,1),(1923,157,10,1),(1924,157,17,1),(1933,158,1,1),(1934,158,2,1),(1935,158,3,1),(1936,158,4,1),(1937,158,5,1),(1938,158,7,1),(1939,158,10,1),(1940,158,17,1),(1949,159,1,1),(1950,159,2,1),(1951,159,3,1),(1952,159,4,1),(1953,159,5,1),(1954,159,7,1),(1955,159,10,1),(1956,159,17,1),(1957,160,1,1),(1958,160,2,1),(1959,160,3,1),(1960,160,4,1),(1961,160,5,1),(1962,160,7,1),(1963,160,10,1),(1964,160,17,1),(1977,87,4,1),(1978,87,5,1),(1979,87,7,1),(1980,87,8,1),(1981,87,9,1),(1982,87,10,1),(1983,87,17,1),(1984,85,4,1),(1985,85,5,1),(1986,85,7,1),(1987,85,8,1),(1988,85,9,1),(1989,85,10,1),(1990,85,17,1),(1991,86,4,1),(1992,86,5,1),(1993,86,7,1),(1994,86,8,1),(1995,86,9,1),(1996,86,10,1),(1997,86,17,1),(2005,88,4,1),(2006,88,5,1),(2007,88,7,1),(2008,88,8,1),(2009,88,9,1),(2010,88,10,1),(2011,88,17,1),(2032,162,1,1),(2033,162,2,1),(2034,162,3,1),(2035,162,4,1),(2036,162,5,1),(2037,162,8,1),(2038,162,9,1),(2039,162,10,1),(2040,162,17,1),(2047,82,3,1),(2048,82,4,1),(2049,82,5,1),(2050,82,7,1),(2051,82,8,1),(2052,82,9,1),(2053,82,10,1),(2054,82,17,1),(2062,81,3,1),(2063,81,4,1),(2064,81,7,1),(2065,81,8,1),(2066,81,9,1),(2067,81,10,1),(2068,81,17,1),(2076,83,4,1),(2077,83,5,1),(2078,83,7,1),(2079,83,8,1),(2080,83,9,1),(2081,83,10,1),(2082,83,17,1),(2091,84,3,1),(2092,84,4,1),(2093,84,5,1),(2094,84,7,1),(2095,84,8,1),(2096,84,9,1),(2097,84,10,1),(2098,84,17,1),(2099,161,1,1),(2100,161,2,1),(2101,161,3,1),(2102,161,4,1),(2103,161,5,1),(2104,161,7,1),(2105,161,8,1),(2106,161,9,1),(2107,161,10,1),(2108,161,17,1),(2140,164,3,1),(2141,164,4,1),(2142,164,5,1),(2143,164,8,1),(2144,164,9,1),(2145,164,10,1),(2146,164,17,1),(2147,18,4,1),(2148,18,10,1),(2149,18,15,1),(2150,18,17,1),(2151,18,18,1),(2152,18,19,1),(2153,18,20,1),(2154,19,4,1),(2155,19,10,1),(2156,19,15,1),(2157,19,17,1),(2158,19,18,1),(2159,19,19,1),(2160,19,20,1),(2161,21,4,0),(2162,21,10,1),(2163,21,17,1),(2164,21,18,0),(2165,21,19,0),(2181,165,4,1),(2182,165,10,1),(2183,165,17,1),(2184,165,18,1),(2185,165,19,1),(2186,166,4,1),(2187,166,10,1),(2188,166,17,1),(2189,166,18,1),(2190,166,19,1),(2191,23,10,1),(2192,23,15,1),(2193,23,17,1),(2194,23,18,1),(2195,23,19,1),(2196,23,20,1),(2203,20,4,1),(2204,20,10,1),(2205,20,15,0),(2206,20,17,1),(2207,20,18,1),(2208,20,19,1),(2209,20,20,0),(2210,166,24,1),(2211,165,21,1),(2212,166,22,0),(2213,167,4,1),(2214,167,10,1),(2215,167,17,1),(2216,167,22,1),(2217,167,18,1),(2218,167,19,1),(2219,163,8,1),(2220,163,9,1),(2221,163,10,1),(2222,163,17,1),(2223,163,1,1),(2224,163,2,1),(2225,163,3,1),(2226,163,4,1),(2227,163,5,1),(2228,163,7,1),(2229,54,17,1),(2230,55,17,1),(2231,56,10,1),(2232,56,17,1),(2233,109,1,1),(2234,109,2,1),(2235,109,3,1),(2236,109,4,1),(2237,109,5,1),(2238,109,15,1),(2239,109,16,1),(2240,109,11,1),(2241,109,12,1),(2242,109,13,1),(2243,109,27,1),(2244,109,14,1),(2245,109,20,1),(2246,116,1,1),(2247,116,2,1),(2248,116,3,1),(2249,116,4,1),(2250,116,5,1),(2251,116,11,1),(2252,116,12,1),(2253,116,13,1),(2254,116,27,1),(2255,116,14,1),(2256,116,15,1),(2257,116,16,1),(2258,116,20,1),(2259,168,18,1),(2260,168,19,1),(2261,168,1,1),(2262,168,2,1),(2263,168,3,1),(2264,168,7,1),(2265,168,11,1),(2266,168,12,1),(2267,168,13,1),(2268,168,27,1),(2269,168,14,1),(2270,168,15,1),(2271,168,16,1),(2272,168,20,1),(2273,168,10,1),(2274,168,17,1),(2275,28,18,1),(2276,28,19,1),(2277,28,15,0),(2278,28,20,0),(2279,28,21,0),(2280,28,22,0),(2281,28,24,0),(2282,28,25,0),(2283,28,26,0),(2284,28,17,1),(2285,29,18,1),(2286,29,19,1),(2287,29,15,1),(2288,29,20,1),(2289,29,21,0),(2290,29,22,1),(2291,29,24,1),(2292,29,25,1),(2293,29,26,1),(2294,29,17,1),(2295,30,4,1),(2296,30,5,1),(2297,30,6,1),(2298,30,15,1),(2299,30,20,1),(2300,30,21,1),(2301,30,22,1),(2302,30,24,1),(2303,30,25,1),(2304,30,26,1),(2305,30,17,1),(2306,31,17,1),(2307,33,15,1),(2308,33,16,1),(2309,33,20,1),(2310,33,21,1),(2311,33,22,1),(2312,33,24,1),(2313,33,25,1),(2314,33,26,1),(2315,33,17,1),(2316,30,18,1),(2317,30,19,1),(2318,33,18,1),(2319,33,19,1),(2320,31,18,1),(2321,31,19,1),(2322,34,18,1),(2323,34,19,1),(2324,34,17,1),(2325,35,18,1),(2326,35,19,1),(2327,35,27,1),(2328,35,15,1),(2329,35,16,1),(2330,35,20,1),(2331,35,21,1),(2332,35,22,1),(2333,35,24,1),(2334,35,25,1),(2335,35,26,1),(2336,35,17,1),(2337,57,17,1),(2338,58,17,1),(2339,59,17,1),(2340,60,1,1),(2341,60,2,1),(2342,60,3,1),(2343,60,4,1),(2344,60,5,1),(2345,60,7,1),(2346,60,10,1),(2347,60,17,1),(2348,61,17,1),(2349,64,1,1),(2350,64,2,1),(2351,64,3,1),(2352,64,4,1),(2353,64,5,1),(2354,64,7,1),(2355,64,10,1),(2356,64,17,1),(2357,69,17,1),(2358,151,1,1),(2359,151,2,1),(2360,151,3,1),(2361,151,4,1),(2362,151,5,1),(2363,151,7,1),(2364,151,10,1),(2365,151,17,1),(2366,154,1,1),(2367,154,2,1),(2368,154,3,1),(2369,154,4,1),(2370,154,5,1),(2371,154,7,1),(2372,154,10,1),(2373,154,17,1),(2374,155,1,1),(2375,155,2,1),(2376,155,3,1),(2377,155,4,1),(2378,155,5,1),(2379,155,7,1),(2380,155,10,1),(2381,155,17,1),(2382,84,11,1),(2383,84,12,1),(2384,84,13,1),(2385,84,27,1),(2386,84,14,1),(2387,39,10,1),(2388,39,17,1),(2389,95,10,1),(2390,95,17,1),(2391,96,10,1),(2392,96,17,1),(2393,169,10,1),(2394,169,17,1),(2395,170,10,1),(2396,170,17,1),(2397,171,10,1),(2398,171,17,1),(2399,172,10,1),(2400,172,17,1),(2401,52,17,1),(2402,51,17,1),(2403,173,10,1),(2404,173,17,1),(2405,46,17,1),(2406,47,17,1),(2407,48,17,1),(2408,49,10,1),(2409,49,17,1),(2410,50,10,1),(2411,50,17,1),(2412,97,10,1),(2413,97,17,1),(2414,20,11,0),(2415,20,12,0),(2416,20,13,0),(2417,20,27,0),(2418,20,14,0),(2419,20,16,0),(2420,20,22,0),(2421,20,24,0),(2422,20,25,0),(2423,20,26,0),(2424,29,11,1),(2425,29,12,1),(2426,29,13,1),(2427,29,27,1),(2428,29,14,1),(2429,29,16,1),(2430,174,18,1),(2431,174,19,1),(2432,174,11,1),(2433,174,12,1),(2434,174,13,1),(2435,174,27,1),(2436,174,14,1),(2437,174,15,1),(2438,174,16,1),(2439,174,20,1),(2440,174,22,1),(2441,174,24,1),(2442,174,25,1),(2443,174,26,1),(2444,174,10,1),(2445,174,17,1),(2446,175,10,0),(2447,175,17,0),(2448,176,10,0),(2449,176,17,0),(2450,177,10,0),(2451,177,17,0),(2452,178,10,1),(2453,178,17,1),(2454,179,1,1),(2455,179,2,1),(2456,179,3,1),(2457,179,4,1),(2458,179,5,1),(2459,179,10,1),(2460,179,17,1),(2461,180,3,1),(2462,180,4,1),(2463,180,5,1),(2464,180,7,1),(2465,180,9,1),(2466,180,11,1),(2467,180,12,1),(2468,180,13,1),(2469,180,27,1),(2470,180,14,1),(2471,180,15,1),(2472,180,16,1),(2473,180,22,1),(2474,180,10,1),(2475,180,17,1),(2476,91,17,1),(2477,92,10,1),(2478,92,17,1),(2479,93,10,1),(2480,93,17,1),(2481,74,17,1),(2482,75,17,1),(2483,77,17,1),(2484,76,17,1),(2485,78,17,1),(2486,80,6,1),(2487,80,17,1),(2488,89,17,1),(2489,104,10,1),(2490,104,17,1),(2491,105,10,1),(2492,105,17,1),(2493,181,10,1),(2494,181,17,1),(2495,203,10,1),(2496,203,17,1),(2497,204,10,1),(2498,204,17,1),(2499,205,10,1),(2500,205,17,1),(2501,206,10,1),(2502,206,17,1),(2503,207,10,1),(2504,207,17,1),(2505,208,10,1),(2506,208,17,1),(2507,209,10,1),(2508,209,17,1),(2509,210,10,1),(2510,210,17,1),(2511,211,10,1),(2512,211,17,1),(2513,212,10,1),(2514,212,17,1),(2515,213,10,1),(2516,213,17,1),(2517,214,10,1),(2518,214,17,1),(2519,215,10,1),(2520,215,17,1),(2521,216,10,1),(2522,216,17,1),(2523,217,10,1),(2524,217,17,1),(2525,218,10,1),(2526,218,17,1),(2527,219,10,1),(2528,219,17,1),(2529,220,10,1),(2530,220,17,1),(2531,221,10,1),(2532,221,17,1),(2533,222,10,1),(2534,222,17,1),(2535,223,10,1),(2536,223,17,1),(2537,224,10,1),(2538,224,17,1),(2539,225,10,1),(2540,225,17,1),(2541,226,10,1),(2542,226,17,1),(2543,227,10,1),(2544,227,17,1),(2545,182,10,1),(2546,182,17,1),(2547,183,10,1),(2548,183,17,1),(2549,184,10,1),(2550,184,17,1),(2551,185,10,1),(2552,185,17,1),(2553,186,10,1),(2554,186,17,1),(2555,187,10,1),(2556,187,17,1),(2557,188,10,1),(2558,188,17,1),(2559,189,10,1),(2560,189,17,1),(2561,190,10,1),(2562,190,17,1),(2563,191,10,1),(2564,191,17,1),(2565,192,10,1),(2566,192,17,1),(2567,194,10,1),(2568,194,17,1),(2569,195,10,1),(2570,195,17,1),(2571,196,10,1),(2572,196,17,1),(2573,197,10,1),(2574,197,17,1),(2575,199,10,1),(2576,199,17,1),(2577,200,10,1),(2578,200,17,1),(2579,201,10,1),(2580,201,17,1),(2581,228,10,1),(2582,228,17,1),(2583,229,10,1),(2584,229,17,1),(2585,230,10,1),(2586,230,17,1),(2587,231,10,1),(2588,231,17,1),(2589,232,10,1),(2590,232,17,1),(2591,233,10,1),(2592,233,17,1),(2593,234,10,1),(2594,234,17,1),(2595,235,10,1),(2596,235,17,1),(2597,236,10,1),(2598,236,17,1),(2599,237,10,1),(2600,237,17,1),(2601,238,10,1),(2602,238,17,1),(2603,239,10,1),(2604,239,17,1),(2605,240,10,1),(2606,240,17,1),(2607,241,10,1),(2608,241,17,1),(2609,242,10,1),(2610,242,17,1),(2611,243,10,1),(2612,243,17,1),(2613,244,10,1),(2614,244,17,1),(2615,245,10,1),(2616,245,17,1),(2617,246,10,1),(2618,246,17,1),(2619,247,10,1),(2620,247,17,1),(2621,248,10,1),(2622,248,17,1),(2623,249,10,1),(2624,249,17,1),(2625,250,10,1),(2626,250,17,1),(2627,251,10,1),(2628,251,17,1),(2629,255,10,1),(2630,255,17,1),(2631,256,10,1),(2632,256,17,1),(2633,257,10,1),(2634,257,17,1),(2635,258,10,1),(2636,258,17,1),(2637,259,10,1),(2638,259,17,1),(2639,260,10,1),(2640,260,17,1),(2641,261,10,1),(2642,261,17,1),(2643,262,10,1),(2644,262,17,1),(2645,263,10,1),(2646,263,17,1),(2647,264,10,1),(2648,264,17,1),(2649,265,10,1),(2650,265,17,1),(2651,266,10,1),(2652,266,17,1),(2653,267,10,1),(2654,267,17,1),(2655,268,10,1),(2656,268,17,1),(2657,281,18,1),(2658,281,19,1),(2659,281,1,1),(2660,281,2,1),(2661,281,3,1),(2662,281,4,1),(2663,281,5,1),(2664,281,10,1),(2665,281,17,1),(2666,282,18,1),(2667,282,19,1),(2668,282,1,1),(2669,282,2,1),(2670,282,3,1),(2671,282,4,1),(2672,282,5,1),(2673,282,7,1),(2674,282,10,1),(2675,282,17,1),(2676,283,18,1),(2677,283,19,1),(2678,283,7,1),(2679,283,10,1),(2680,283,17,1),(2681,284,18,1),(2682,284,19,1),(2683,284,7,1),(2684,284,10,1),(2685,284,17,1),(2686,290,18,1),(2687,290,19,1),(2688,290,7,1),(2689,290,10,1),(2690,290,17,1),(2691,285,18,1),(2692,285,19,1),(2693,285,7,1),(2694,285,10,1),(2695,285,17,1),(2696,288,18,1),(2697,288,19,1),(2698,288,7,1),(2699,288,10,1),(2700,288,17,1),(2701,287,18,1),(2702,287,19,1),(2703,287,7,1),(2704,287,10,1),(2705,287,17,1),(2706,286,18,1),(2707,286,19,1),(2708,286,7,1),(2709,286,10,1),(2710,286,17,1),(2711,269,18,1),(2712,269,19,1),(2713,269,10,1),(2714,269,17,1),(2715,270,18,1),(2716,270,19,1),(2717,270,10,1),(2718,270,17,1),(2719,271,18,1),(2720,271,19,1),(2721,271,10,1),(2722,271,17,1),(2723,735,18,1),(2724,735,19,1),(2725,735,10,1),(2726,735,17,1),(2727,911,10,1),(2728,911,17,1),(2729,119,1,0),(2730,119,2,0),(2731,119,3,1),(2732,119,4,1),(2733,119,5,1),(2734,119,7,1),(2735,119,10,1),(2736,119,17,1),(2737,291,10,1),(2738,291,17,1),(2739,72,18,1),(2740,72,19,1),(2741,72,17,1),(2742,33,18,1),(2743,33,19,1),(2744,33,15,1),(2745,33,16,1),(2746,33,20,1),(2747,33,21,1),(2748,33,22,1),(2749,33,24,1),(2750,33,25,1),(2751,33,26,1),(2752,33,10,1),(2753,33,17,1),(2754,186,1,1),(2755,186,2,1),(2756,186,3,1),(2757,186,4,1),(2758,186,5,1),(2759,186,7,1),(2760,186,10,1),(2761,186,17,1),(2762,189,1,1),(2763,189,2,1),(2764,189,3,1),(2765,189,4,1),(2766,189,5,1),(2767,189,7,1),(2768,189,10,1),(2769,189,17,1),(2770,190,1,1),(2771,190,2,1),(2772,190,3,1),(2773,190,4,1),(2774,190,5,1),(2775,190,6,1),(2776,190,7,1),(2777,190,10,1),(2778,190,17,1),(2779,191,1,0),(2780,191,2,0),(2781,191,3,0),(2782,191,4,0),(2783,191,5,0),(2784,191,7,0),(2785,191,10,1),(2786,191,17,1),(2787,195,1,1),(2788,195,2,1),(2789,195,3,1),(2790,195,4,1),(2791,195,5,1),(2792,195,7,1),(2793,195,10,1),(2794,195,17,1),(2795,196,1,1),(2796,196,2,1),(2797,196,3,1),(2798,196,4,1),(2799,196,5,1),(2800,196,6,1),(2801,196,7,1),(2802,196,10,1),(2803,196,17,1),(2804,197,1,0),(2805,197,2,0),(2806,197,3,0),(2807,197,4,0),(2808,197,5,0),(2809,197,7,0),(2810,197,10,1),(2811,197,17,1),(2812,34,18,1),(2813,34,19,1),(2814,34,10,1),(2815,34,17,1),(2816,184,10,1),(2817,184,17,1),(2818,187,10,1),(2819,187,17,1),(2820,242,10,1),(2821,242,17,1),(2822,249,10,1),(2823,249,17,1),(2824,250,10,1),(2825,250,17,1),(2826,251,10,1),(2827,251,17,1),(2828,256,10,1),(2829,256,17,1),(2830,257,10,1),(2831,257,17,1),(2832,258,10,1),(2833,258,17,1),(2834,262,10,1),(2835,262,17,1),(2836,31,18,1),(2837,31,19,1),(2838,31,10,1),(2839,31,17,1),(2840,14,1,1),(2841,14,2,1),(2842,14,3,1),(2843,14,4,1),(2844,14,5,1),(2845,14,7,1),(2846,14,10,1),(2847,14,17,1),(2848,16,3,1),(2849,16,4,1),(2850,16,5,1),(2851,16,7,1),(2852,16,10,1),(2853,17,1,1),(2854,17,2,1),(2855,17,3,1),(2856,17,4,1),(2857,17,5,1),(2858,17,7,1),(2859,17,10,1),(2860,17,17,1),(2861,117,1,1),(2862,117,2,1),(2863,117,3,1),(2864,117,4,1),(2865,117,5,1),(2866,117,10,1),(2867,117,17,1),(2868,117,1,1),(2869,117,2,1),(2870,117,3,1),(2871,117,4,1),(2872,117,5,1),(2873,117,10,1),(2874,117,17,1),(2875,119,3,1),(2876,119,4,1),(2877,119,5,1),(2878,119,7,1),(2879,119,10,1),(2880,119,17,1),(2881,120,3,1),(2882,120,4,1),(2883,120,5,1),(2884,120,7,1),(2885,120,10,1),(2886,120,17,1),(2887,121,1,1),(2888,121,2,1),(2889,121,3,1),(2890,121,4,1),(2891,121,5,1),(2892,121,7,1),(2893,121,10,1),(2894,121,17,1),(2895,122,1,1),(2896,122,2,1),(2897,122,3,1),(2898,122,4,1),(2899,122,5,1),(2900,122,7,1),(2901,122,10,1),(2902,122,17,1),(2903,123,3,1),(2904,123,4,1),(2905,123,5,1),(2906,123,7,1),(2907,123,10,1),(2908,123,17,1),(2909,124,3,1),(2910,124,4,1),(2911,124,5,1),(2912,124,7,1),(2913,124,10,1),(2914,124,17,1),(2915,125,3,1),(2916,125,4,1),(2917,125,5,1),(2918,125,7,1),(2919,125,10,1),(2920,125,17,1),(2921,126,3,1),(2922,126,4,1),(2923,126,5,1),(2924,126,7,1),(2925,126,10,1),(2926,126,17,1),(2927,130,3,1),(2928,130,4,1),(2929,130,5,1),(2930,130,7,1),(2931,130,10,1),(2932,130,17,1),(2933,131,3,1),(2934,131,4,1),(2935,131,5,1),(2936,131,7,1),(2937,131,10,1),(2938,131,17,1),(2939,70,3,1),(2940,70,4,1),(2941,70,5,1),(2942,70,8,1),(2943,70,9,1),(2944,70,10,1),(2945,70,17,1),(2946,71,3,1),(2947,71,4,1),(2948,71,5,1),(2949,71,8,1),(2950,71,9,1),(2951,71,10,1),(2952,71,17,1),(2953,73,3,1),(2954,73,4,1),(2955,73,5,1),(2956,73,8,1),(2957,73,9,1),(2958,73,10,1),(2959,73,17,1),(2960,74,3,1),(2961,74,4,1),(2962,74,5,1),(2963,74,8,1),(2964,74,9,1),(2965,74,10,1),(2966,74,17,1),(2967,75,3,1),(2968,75,4,1),(2969,75,5,1),(2970,75,8,1),(2971,75,9,1),(2972,75,10,1),(2973,75,17,1),(2974,76,3,1),(2975,76,4,1),(2976,76,5,1),(2977,76,8,1),(2978,76,9,1),(2979,76,10,1),(2980,76,17,1),(2981,77,3,1),(2982,77,4,1),(2983,77,5,1),(2984,77,8,1),(2985,77,9,1),(2986,77,10,1),(2987,77,17,1),(2988,78,3,1),(2989,78,4,1),(2990,78,5,1),(2991,78,8,1),(2992,78,9,1),(2993,78,10,1),(2994,78,17,1),(2995,80,3,1),(2996,80,4,1),(2997,80,5,1),(2998,80,6,1),(2999,80,8,1),(3000,80,9,1),(3001,80,10,1),(3002,80,17,1),(3003,20,18,1),(3004,20,19,1),(3005,20,3,1),(3006,20,4,1),(3007,20,5,1),(3008,20,7,1),(3009,20,10,1),(3010,20,17,1),(3011,19,18,1),(3012,19,19,1),(3013,19,4,1),(3014,19,15,1),(3015,19,20,1),(3016,19,10,1),(3017,19,17,1),(3018,18,18,1),(3019,18,19,1),(3020,18,4,1),(3021,18,15,1),(3022,18,20,1),(3023,18,10,1),(3024,18,17,1),(3025,21,18,1),(3026,21,19,1),(3027,21,4,1),(3028,21,10,1),(3029,21,17,1),(3030,22,18,1),(3031,22,19,1),(3032,22,4,1),(3033,22,10,1),(3034,22,17,1),(3035,23,18,1),(3036,23,19,1),(3037,23,15,1),(3038,23,20,1),(3039,23,10,1),(3040,23,17,1),(3041,24,18,1),(3042,24,19,1),(3043,24,4,1),(3044,24,10,1),(3045,24,17,1),(3046,165,18,1),(3047,165,19,1),(3048,165,4,1),(3049,165,21,1),(3050,165,10,1),(3051,165,17,1),(3052,166,18,1),(3053,166,19,1),(3054,166,4,1),(3055,166,24,1),(3056,166,10,1),(3057,166,17,1),(3058,167,18,1),(3059,167,19,1),(3060,167,4,1),(3061,167,22,1),(3062,167,10,1),(3063,167,17,1),(3064,181,10,1),(3065,181,17,1),(3066,203,10,1),(3067,203,17,1),(3068,204,10,1),(3069,204,17,1),(3070,205,10,1),(3071,205,17,1),(3072,206,10,1),(3073,206,17,1),(3074,208,10,1),(3075,208,17,1),(3076,207,10,1),(3077,207,17,1),(3078,209,10,1),(3079,209,17,1),(3080,210,10,1),(3081,210,17,1),(3082,211,10,1),(3083,211,17,1),(3084,212,10,1),(3085,212,17,1),(3086,213,10,1),(3087,213,17,1),(3088,214,10,1),(3089,214,17,1),(3090,215,10,1),(3091,215,17,1),(3092,227,10,1),(3093,227,17,1),(3094,216,10,1),(3095,216,17,1),(3096,218,10,1),(3097,218,17,1),(3098,217,10,1),(3099,217,17,1),(3100,219,10,1),(3101,219,17,1),(3102,220,10,1),(3103,220,17,1),(3104,221,10,1),(3105,221,17,1),(3106,222,10,1),(3107,222,17,1),(3108,223,10,1),(3109,223,17,1),(3110,224,10,1),(3111,224,17,1),(3112,225,10,1),(3113,225,17,1),(3114,226,10,1),(3115,226,17,1),(3116,161,1,1),(3117,161,2,1),(3118,161,3,1),(3119,161,4,1),(3120,161,5,1),(3121,161,7,1),(3122,161,8,1),(3123,161,9,1),(3124,161,10,1),(3125,161,17,1),(3126,83,4,1),(3127,83,5,1),(3128,83,7,1),(3129,83,8,1),(3130,83,9,1),(3131,83,10,1),(3132,83,17,1),(3133,82,3,1),(3134,82,4,1),(3135,82,5,1),(3136,82,7,1),(3137,82,8,1),(3138,82,9,1),(3139,82,10,1),(3140,82,17,1),(3141,84,3,1),(3142,84,4,1),(3143,84,5,1),(3144,84,7,1),(3145,84,8,1),(3146,84,9,1),(3147,84,11,1),(3148,84,12,1),(3149,84,13,1),(3150,84,27,1),(3151,84,14,1),(3152,84,10,1),(3153,84,17,1),(3154,85,4,1),(3155,85,5,1),(3156,85,7,1),(3157,85,8,1),(3158,85,9,1),(3159,85,10,1),(3160,85,17,1),(3161,87,4,1),(3162,87,5,1),(3163,87,7,1),(3164,87,8,1),(3165,87,9,1),(3166,87,10,1),(3167,87,17,1),(3168,163,1,1),(3169,163,2,1),(3170,163,3,1),(3171,163,4,1),(3172,163,5,1),(3173,163,7,1),(3174,163,8,1),(3175,163,9,1),(3176,163,10,1),(3177,163,17,1),(3178,180,3,1),(3179,180,4,1),(3180,180,5,1),(3181,180,7,1),(3182,180,9,1),(3183,180,11,1),(3184,180,12,1),(3185,180,13,1),(3186,180,27,1),(3187,180,14,1),(3188,180,15,1),(3189,180,16,1),(3190,180,22,1),(3191,180,10,1),(3192,180,17,1),(3193,241,10,1),(3194,241,17,1),(3195,81,3,1),(3196,81,4,1),(3197,81,7,1),(3198,81,8,1),(3199,81,9,1),(3200,81,10,1),(3201,81,17,1),(3202,145,1,1),(3203,145,2,1),(3204,145,3,1),(3205,145,4,1),(3206,145,5,1),(3207,145,7,1),(3208,145,10,1),(3209,145,17,1),(3210,145,1,1),(3211,145,2,1),(3212,145,3,1),(3213,145,4,1),(3214,145,5,1),(3215,145,7,1),(3216,145,10,1),(3217,145,17,1),(3218,65,1,1),(3219,65,2,1),(3220,65,3,1),(3221,65,4,1),(3222,65,5,1),(3223,65,7,1),(3224,65,8,1),(3225,65,10,1),(3226,65,17,1),(3227,0,18,0),(3228,0,19,0),(3229,5,18,1),(3230,5,19,1),(3231,5,1,1),(3232,5,2,1),(3233,5,3,1),(3234,5,4,1),(3235,5,5,1),(3236,5,7,1),(3237,13,1,1),(3238,13,2,1),(3239,13,3,1),(3240,13,4,1),(3241,13,5,1),(3242,13,7,1),(3243,6,18,1),(3244,6,19,1),(3245,6,1,1),(3246,6,2,1),(3247,6,3,1),(3248,6,4,1),(3249,6,5,1),(3250,8,18,1),(3251,8,19,1),(3252,8,1,1),(3253,8,2,1),(3254,8,3,1),(3255,8,4,1),(3256,8,5,1),(3257,8,7,1),(3258,12,18,1),(3259,12,19,1),(3260,12,1,1),(3261,12,2,1),(3262,12,3,1),(3263,12,4,1),(3264,12,5,1),(3265,12,7,1),(3266,9,1,1),(3267,9,2,1),(3268,9,3,1),(3269,9,4,1),(3270,9,5,1),(3271,9,7,1),(3272,10,18,1),(3273,10,19,1),(3274,10,1,1),(3275,10,2,1),(3276,10,3,1),(3277,10,4,1),(3278,10,5,1),(3279,10,7,1),(3280,134,1,1),(3281,134,2,1),(3282,134,3,1),(3283,134,4,1),(3284,134,5,1),(3285,134,7,1),(3286,135,1,1),(3287,135,2,1),(3288,135,3,1),(3289,135,4,1),(3290,135,5,1),(3291,135,7,1),(3292,133,1,1),(3293,133,2,1),(3294,133,3,1),(3295,133,4,1),(3296,133,5,1),(3297,133,7,1),(3298,135,1,1),(3299,135,2,1),(3300,135,3,1),(3301,135,4,1),(3302,135,5,1),(3303,135,7,1),(3304,11,18,1),(3305,11,19,1),(3306,11,1,1),(3307,11,2,1),(3308,11,3,1),(3309,11,4,1),(3310,11,5,1),(3311,11,7,1),(3312,136,1,1),(3313,136,2,1),(3314,136,3,1),(3315,136,4,1),(3316,136,5,1),(3317,136,7,1),(3318,144,1,1),(3319,144,2,1),(3320,144,3,1),(3321,144,4,1),(3322,144,5,1),(3323,144,7,1),(3324,137,1,1),(3325,137,2,1),(3326,137,3,1),(3327,137,4,1),(3328,137,5,1),(3329,137,7,1),(3330,139,1,1),(3331,139,2,1),(3332,139,3,1),(3333,139,4,1),(3334,139,5,1),(3335,139,7,1),(3336,143,1,1),(3337,143,2,1),(3338,143,3,1),(3339,143,4,1),(3340,143,5,1),(3341,143,7,1),(3342,140,1,1),(3343,140,2,1),(3344,140,3,1),(3345,140,4,1),(3346,140,5,1),(3347,140,7,1),(3348,141,1,1),(3349,141,2,1),(3350,141,3,1),(3351,141,4,1),(3352,141,5,1),(3353,141,7,1),(3354,145,1,1),(3355,145,2,1),(3356,145,3,1),(3357,145,4,1),(3358,145,5,1),(3359,145,7,1),(3360,146,1,1),(3361,146,2,1),(3362,146,3,1),(3363,146,4,1),(3364,146,5,1),(3365,146,7,1),(3366,147,1,1),(3367,147,2,1),(3368,147,3,1),(3369,147,4,1),(3370,147,5,1),(3371,147,7,1),(3372,142,1,1),(3373,142,2,1),(3374,142,3,1),(3375,142,4,1),(3376,142,5,1),(3377,142,7,1),(3378,80,3,1),(3379,80,4,1),(3380,80,5,1),(3381,80,6,1),(3382,80,8,1),(3383,80,9,1),(3384,70,3,1),(3385,70,4,1),(3386,70,5,1),(3387,70,8,1),(3388,70,9,1),(3389,72,18,1),(3390,72,19,1),(3391,72,3,1),(3392,72,4,1),(3393,72,5,1),(3394,71,3,1),(3395,71,4,1),(3396,71,5,1),(3397,71,8,1),(3398,71,9,1),(3399,73,3,1),(3400,73,4,1),(3401,73,5,1),(3402,73,8,1),(3403,73,9,1),(3404,77,3,1),(3405,77,4,1),(3406,77,5,1),(3407,77,8,1),(3408,77,9,1),(3409,74,3,1),(3410,74,4,1),(3411,74,5,1),(3412,74,8,1),(3413,74,9,1),(3414,75,3,1),(3415,75,4,1),(3416,75,5,1),(3417,75,8,1),(3418,75,9,1),(3419,78,3,1),(3420,78,4,1),(3421,78,5,1),(3422,78,8,1),(3423,78,9,1),(3424,76,3,1),(3425,76,4,1),(3426,76,5,1),(3427,76,8,1),(3428,76,9,1),(3429,117,1,1),(3430,117,2,1),(3431,117,3,1),(3432,117,4,1),(3433,117,5,1),(3434,118,1,1),(3435,118,2,1),(3436,118,3,1),(3437,118,4,1),(3438,118,5,1),(3439,15,1,1),(3440,15,2,1),(3441,15,3,1),(3442,15,4,1),(3443,15,5,1),(3444,15,6,1),(3445,15,7,1),(3446,121,1,1),(3447,121,2,1),(3448,121,3,1),(3449,121,4,1),(3450,121,5,1),(3451,121,7,1),(3452,122,1,1),(3453,122,2,1),(3454,122,3,1),(3455,122,4,1),(3456,122,5,1),(3457,122,7,1),(3458,128,1,1),(3459,128,2,1),(3460,128,3,1),(3461,128,4,1),(3462,128,5,1),(3463,128,7,1),(3464,129,1,1),(3465,129,2,1),(3466,129,3,1),(3467,129,4,1),(3468,129,5,1),(3469,129,7,1),(3470,174,18,1),(3471,174,19,1),(3472,174,11,1),(3473,174,12,1),(3474,174,13,1),(3475,174,27,1),(3476,29,18,1),(3477,29,19,1),(3478,29,11,1),(3479,29,12,1),(3480,29,13,1),(3481,29,27,1),(3482,28,18,1),(3483,28,19,1),(3484,31,18,1),(3485,31,19,1),(3486,84,3,1),(3487,84,4,1),(3488,84,5,1),(3489,84,7,1),(3490,84,8,1),(3491,84,9,1),(3492,84,11,1),(3493,84,12,1),(3494,84,13,1),(3495,84,27,1),(3496,83,4,1),(3497,83,5,1),(3498,83,7,1),(3499,83,8,1),(3500,83,9,1),(3501,83,4,1),(3502,83,5,1),(3503,83,7,1),(3504,83,8,1),(3505,83,9,1),(3506,58,1,1),(3507,58,2,1),(3508,58,3,1),(3509,58,4,1),(3510,58,5,1),(3511,58,7,1),(3512,58,8,1),(3513,68,1,1),(3514,68,2,1),(3515,68,3,1),(3516,68,4,1),(3517,68,5,1),(3518,68,7,1),(3519,68,8,1),(3520,66,1,1),(3521,66,2,1),(3522,66,3,1),(3523,66,4,1),(3524,66,5,1),(3525,66,7,1),(3526,148,1,1),(3527,148,2,1),(3528,148,3,1),(3529,148,4,1),(3530,148,5,1),(3531,148,7,1),(3532,67,1,1),(3533,67,2,1),(3534,67,3,1),(3535,67,4,1),(3536,67,5,1),(3537,67,7,1),(3538,149,1,1),(3539,149,2,1),(3540,149,3,1),(3541,149,4,1),(3542,149,5,1),(3543,149,7,1),(3544,57,1,1),(3545,57,2,1),(3546,57,3,1),(3547,57,4,1),(3548,57,5,1),(3549,57,7,1),(3550,57,8,1),(3551,59,1,1),(3552,59,2,1),(3553,59,3,1),(3554,59,4,1),(3555,59,5,1),(3556,59,7,1),(3557,59,8,1),(3558,60,1,1),(3559,60,2,1),(3560,60,3,1),(3561,60,4,1),(3562,60,5,1),(3563,60,7,1),(3564,61,1,1),(3565,61,2,1),(3566,61,3,1),(3567,61,4,1),(3568,61,5,1),(3569,61,7,1),(3570,64,1,1),(3571,64,2,1),(3572,64,3,1),(3573,64,4,1),(3574,64,5,1),(3575,64,7,1),(3576,151,1,1),(3577,151,2,1),(3578,151,3,1),(3579,151,4,1),(3580,151,5,1),(3581,151,7,1),(3582,62,1,1),(3583,62,2,1),(3584,62,3,1),(3585,62,4,1),(3586,62,5,1),(3587,62,7,1),(3588,62,8,1),(3589,179,1,1),(3590,179,2,1),(3591,179,3,1),(3592,179,4,1),(3593,179,5,1),(3594,65,1,1),(3595,65,2,1),(3596,65,3,1),(3597,65,4,1),(3598,65,5,1),(3599,65,7,1),(3600,65,8,1),(3601,69,1,1),(3602,69,2,1),(3603,69,3,1),(3604,69,4,1),(3605,69,5,1),(3606,69,7,1),(3607,69,8,1),(3608,153,1,1),(3609,153,2,1),(3610,153,3,1),(3611,153,4,1),(3612,153,5,1),(3613,153,7,1),(3614,154,1,1),(3615,154,2,1),(3616,154,3,1),(3617,154,4,1),(3618,154,5,1),(3619,154,7,1),(3620,156,1,1),(3621,156,2,1),(3622,156,3,1),(3623,156,4,1),(3624,156,5,1),(3625,156,6,1),(3626,156,7,1),(3627,159,1,1),(3628,159,2,1),(3629,159,3,1),(3630,159,4,1),(3631,159,5,1),(3632,159,7,1),(3633,160,1,1),(3634,160,2,1),(3635,160,3,1),(3636,160,4,1),(3637,160,5,1),(3638,160,7,1),(3639,31,18,1),(3640,31,19,1),(3641,68,1,1),(3642,68,2,1),(3643,68,3,1),(3644,68,4,1),(3645,68,5,1),(3646,68,7,1),(3647,68,8,1),(3648,5,18,1),(3649,5,19,1),(3650,5,1,1),(3651,5,2,1),(3652,5,3,1),(3653,5,4,1),(3654,5,5,1),(3655,5,7,1),(3656,136,1,1),(3657,136,2,1),(3658,136,3,1),(3659,136,4,1),(3660,136,5,1),(3661,136,7,1),(3662,6,18,1),(3663,6,19,1),(3664,6,1,1),(3665,6,2,1),(3666,6,3,1),(3667,6,4,1),(3668,6,5,1),(3669,7,1,1),(3670,7,2,1),(3671,7,3,1),(3672,7,4,1),(3673,7,5,1),(3674,7,7,1),(3675,13,1,1),(3676,13,2,1),(3677,13,3,1),(3678,13,4,1),(3679,13,5,1),(3680,13,7,1),(3681,8,18,1),(3682,8,19,1),(3683,8,1,1),(3684,8,2,1),(3685,8,3,1),(3686,8,4,1),(3687,8,5,1),(3688,8,7,1),(3689,12,18,1),(3690,12,19,1),(3691,12,1,1),(3692,12,2,1),(3693,12,3,1),(3694,12,4,1),(3695,12,5,1),(3696,12,7,1),(3697,9,1,1),(3698,9,2,1),(3699,9,3,1),(3700,9,4,1),(3701,9,5,1),(3702,9,7,1),(3703,10,18,1),(3704,10,19,1),(3705,10,1,1),(3706,10,2,1),(3707,10,3,1),(3708,10,4,1),(3709,10,5,1),(3710,10,7,1),(3711,133,1,1),(3712,133,2,1),(3713,133,3,1),(3714,133,4,1),(3715,133,5,1),(3716,133,7,1),(3717,134,1,1),(3718,134,2,1),(3719,134,3,1),(3720,134,4,1),(3721,134,5,1),(3722,134,7,1),(3723,135,1,1),(3724,135,2,1),(3725,135,3,1),(3726,135,4,1),(3727,135,5,1),(3728,135,7,1),(3729,11,18,1),(3730,11,19,1),(3731,11,1,1),(3732,11,2,1),(3733,11,3,1),(3734,11,4,1),(3735,11,5,1),(3736,11,7,1),(3737,138,1,1),(3738,138,2,1),(3739,138,3,1),(3740,138,4,1),(3741,138,5,1),(3742,138,7,1),(3743,144,1,1),(3744,144,2,1),(3745,144,3,1),(3746,144,4,1),(3747,144,5,1),(3748,144,7,1),(3749,137,1,1),(3750,137,2,1),(3751,137,3,1),(3752,137,4,1),(3753,137,5,1),(3754,137,7,1),(3755,139,1,1),(3756,139,2,1),(3757,139,3,1),(3758,139,4,1),(3759,139,5,1),(3760,139,7,1),(3761,143,1,1),(3762,143,2,1),(3763,143,3,1),(3764,143,4,1),(3765,143,5,1),(3766,143,7,1),(3767,140,1,1),(3768,140,2,1),(3769,140,3,1),(3770,140,4,1),(3771,140,5,1),(3772,140,7,1),(3773,141,1,1),(3774,141,2,1),(3775,141,3,1),(3776,141,4,1),(3777,141,5,1),(3778,141,7,1),(3779,145,1,1),(3780,145,2,1),(3781,145,3,1),(3782,145,4,1),(3783,145,5,1),(3784,145,7,1),(3785,146,1,1),(3786,146,2,1),(3787,146,3,1),(3788,146,4,1),(3789,146,5,1),(3790,146,7,1),(3791,147,1,1),(3792,147,2,1),(3793,147,3,1),(3794,147,4,1),(3795,147,5,1),(3796,147,7,1),(3797,142,1,1),(3798,142,2,1),(3799,142,3,1),(3800,142,4,1),(3801,142,5,1),(3802,142,7,1),(3803,136,1,1),(3804,136,2,1),(3805,136,3,1),(3806,136,4,1),(3807,136,5,1),(3808,136,7,1),(3809,308,1,1),(3810,308,2,1),(3811,308,3,1),(3812,308,4,1),(3813,308,5,1),(3814,308,7,1),(3815,117,1,1),(3816,117,2,1),(3817,117,3,1),(3818,117,4,1),(3819,117,5,1),(3820,15,1,1),(3821,15,2,1),(3822,15,3,1),(3823,15,4,1),(3824,15,5,1),(3825,15,6,1),(3826,15,7,1),(3827,129,1,1),(3828,129,2,1),(3829,129,3,1),(3830,129,4,1),(3831,129,5,1),(3832,129,6,1),(3833,129,7,1),(3834,127,1,1),(3835,127,2,1),(3836,127,3,1),(3837,127,4,1),(3838,127,5,1),(3839,127,7,1),(3840,130,3,1),(3841,130,4,1),(3842,130,5,1),(3843,130,7,1),(3844,131,3,1),(3845,131,4,1),(3846,131,5,1),(3847,131,7,1),(3848,21,18,1),(3849,21,19,1),(3850,21,4,1),(3851,30,18,1),(3852,30,19,1),(3853,30,4,1),(3854,30,5,1),(3855,30,6,1),(3856,30,18,1),(3857,30,19,1),(3858,30,4,1),(3859,30,5,1),(3860,30,6,1),(3861,34,18,1),(3862,34,19,1),(3863,83,4,1),(3864,83,5,1),(3865,83,7,1),(3866,83,8,1),(3867,83,9,1),(3868,84,3,1),(3869,84,4,1),(3870,84,5,1),(3871,84,7,1),(3872,84,8,1),(3873,84,9,1),(3874,84,11,1),(3875,84,12,1),(3876,84,13,1),(3877,84,27,1),(3878,117,1,1),(3879,117,2,1),(3880,117,3,1),(3881,117,4,1),(3882,117,5,1),(3883,16,3,1),(3884,16,4,1),(3885,16,5,1),(3886,16,7,1),(3887,121,1,1),(3888,121,2,1),(3889,121,3,1),(3890,121,4,1),(3891,121,5,1),(3892,121,7,1),(3893,30,18,1),(3894,30,19,1),(3895,30,4,1),(3896,30,5,1),(3897,30,6,1),(3898,191,1,1),(3899,191,2,1),(3900,191,3,1),(3901,191,4,1),(3902,191,5,1),(3903,191,7,1),(3904,197,1,1),(3905,197,2,1),(3906,197,3,1),(3907,197,4,1),(3908,197,5,1),(3909,197,7,1),(3910,17,1,1),(3911,17,2,1),(3912,17,3,1),(3913,17,4,1),(3914,17,5,1),(3915,17,7,1),(3916,129,1,1),(3917,129,2,1),(3918,129,3,1),(3919,129,4,1),(3920,129,5,1),(3921,129,6,1),(3922,129,7,1),(3923,5,18,1),(3924,5,19,1),(3925,5,1,1),(3926,5,2,1),(3927,5,3,1),(3928,5,4,1),(3929,5,5,1),(3930,5,7,1),(3931,5,18,1),(3932,5,19,1),(3933,5,1,1),(3934,5,2,1),(3935,5,3,1),(3936,5,4,1),(3937,5,5,1),(3938,5,7,1),(3939,136,1,1),(3940,136,2,1),(3941,136,3,1),(3942,136,4,1),(3943,136,5,1),(3944,136,7,1),(3945,137,1,1),(3946,137,2,1),(3947,137,3,1),(3948,137,4,1),(3949,137,5,1),(3950,137,7,1),(3951,137,1,1),(3952,137,2,1),(3953,137,3,1),(3954,137,4,1),(3955,137,5,1),(3956,137,7,1),(3957,138,1,1),(3958,138,2,1),(3959,138,3,1),(3960,138,4,1),(3961,138,5,1),(3962,138,7,1),(3963,139,1,1),(3964,139,2,1),(3965,139,3,1),(3966,139,4,1),(3967,139,5,1),(3968,139,7,1),(3969,14,1,1),(3970,14,2,1),(3971,14,3,1),(3972,14,4,1),(3973,14,5,1),(3974,14,7,1),(3975,21,18,1),(3976,21,19,1),(3977,21,4,1),(3978,21,18,1),(3979,21,19,1),(3980,21,4,1),(3981,140,1,1),(3982,140,2,1),(3983,140,3,1),(3984,140,4,1),(3985,140,5,1),(3986,140,7,1),(3987,83,4,1),(3988,83,5,1),(3989,83,7,1),(3990,83,8,1),(3991,83,9,1),(3992,83,4,1),(3993,83,5,1),(3994,83,7,1),(3995,83,8,1),(3996,83,9,1),(3997,58,1,1),(3998,58,2,1),(3999,58,3,1),(4000,58,4,1),(4001,58,5,1),(4002,58,7,1),(4003,58,8,1),(4004,70,3,1),(4005,70,4,1),(4006,70,5,1),(4007,70,8,1),(4008,70,9,1),(4009,82,3,1),(4010,82,4,1),(4011,82,5,1),(4012,82,7,1),(4013,82,8,1),(4014,82,9,1),(4015,116,18,1),(4016,116,19,1),(4017,116,1,1),(4018,116,2,1),(4019,116,3,1),(4020,116,4,1),(4021,116,5,1),(4022,116,11,1),(4023,116,12,1),(4024,116,13,1),(4025,116,27,1),(4026,283,18,1),(4027,283,19,1),(4028,283,7,1),(4029,287,18,1),(4030,287,19,1),(4031,287,7,1),(4032,308,1,1),(4033,308,2,1),(4034,308,3,1),(4035,308,4,1),(4036,308,5,1),(4037,308,7,1),(4038,287,18,1),(4039,287,19,1),(4040,287,7,1);
/*!40000 ALTER TABLE `tbl_prods_variantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prods_x_combo`
--

DROP TABLE IF EXISTS `tbl_prods_x_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prods_x_combo` (
  `id_prod_x_combo` int NOT NULL AUTO_INCREMENT,
  `id_combo` int NOT NULL,
  `id_producto` int NOT NULL,
  `int_cantidad` int NOT NULL,
  `bol_activo` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_prod_x_combo`),
  KEY `index2` (`id_producto`),
  KEY `index3` (`id_combo`),
  CONSTRAINT `fk_tbl_prods_x_combo_1` FOREIGN KEY (`id_combo`) REFERENCES `tbl_combos` (`id_combo`),
  CONSTRAINT `fk_tbl_prods_x_combo_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_x_combo`
--

LOCK TABLES `tbl_prods_x_combo` WRITE;
/*!40000 ALTER TABLE `tbl_prods_x_combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prods_x_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prods_x_orden`
--

DROP TABLE IF EXISTS `tbl_prods_x_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prods_x_orden` (
  `id_prod_x_orden` int NOT NULL AUTO_INCREMENT,
  `int_orden_id` int NOT NULL,
  `int_producto_id` int NOT NULL,
  `int_cantidad` int NOT NULL,
  `bool_activo` int DEFAULT NULL,
  `dt_horafecha_pedido` timestamp NULL DEFAULT NULL,
  `bool_impreso` int DEFAULT '0',
  `int_tipo_precio` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_prod_x_orden`),
  KEY `int_producto_id` (`int_producto_id`),
  KEY `index4` (`int_tipo_precio`),
  KEY `int_orden_id` (`int_orden_id`),
  CONSTRAINT `fk_tbl_prods_x_orden_1` FOREIGN KEY (`int_tipo_precio`) REFERENCES `tbl_tipos_precios` (`id_tipo_precio`),
  CONSTRAINT `fk_tbl_prods_x_orden_2` FOREIGN KEY (`int_producto_id`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_x_orden`
--

LOCK TABLES `tbl_prods_x_orden` WRITE;
/*!40000 ALTER TABLE `tbl_prods_x_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prods_x_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_productos`
--

DROP TABLE IF EXISTS `tbl_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_prod` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_desc_prod` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_pic_prod_path` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_categoria` int NOT NULL,
  `int_activo` int NOT NULL,
  `fl_ordenar` float DEFAULT NULL,
  `id_grupo_def` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `index3` (`id_grupo_def`),
  CONSTRAINT `fk_tbl_productos_1` FOREIGN KEY (`id_grupo_def`) REFERENCES `tbl_grupos_def` (`id_grupos_def`),
  CONSTRAINT `tbl_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productos`
--

LOCK TABLES `tbl_productos` WRITE;
/*!40000 ALTER TABLE `tbl_productos` DISABLE KEYS */;
INSERT INTO `tbl_productos` VALUES (5,'Taco Maciza de Res','Tacos de maciza de Res','5.jpg',2,1,7,5),(6,'Taco Maciza de Puerco','Tacos de maciza de puerco','6.jpg',2,1,6.01,1),(7,'Taco Lengua de cerdo','Tacos de lengua de cerdo al vapor','7.jpg',2,1,6.07,1),(8,'Taco de Carnitas','Tacos de carnitas','8.jpg',2,1,6.03,1),(9,'Taco de Buche','Tacos de buche','9.jpg',2,1,6.08,1),(10,'Taco de Oreja','Tacos de oreja de cerdo','10.jpg',2,1,6.06,1),(11,'Taco de Azadura','Tacos de azadura','11.jpg',2,1,6.1,1),(12,'Taco de Trompa','Tacos de trompa de cerdo','12.jpg',2,1,6.04,1),(13,'Taco de Pollo','Tacos de pollo','13.jpg',2,1,8,5),(14,'Bistec de res','Tacos de bistec de res','14.jpg',4,1,3,5),(15,'Taco de Pastor','Tacos al pastor','15.jpg',4,1,2,5),(16,'Taco de Bistec con queso','Taco de bistec de res con quesillo','16.jpg',4,1,11,5),(17,'Taco de Pastor con quesillo','Taco al pastor con quesillo','17.jpg',4,1,10,5),(18,'Mula Terca Bistec','Tocino/Jamón/Bistec de res','18.jpg',5,1,117.1,5),(19,'Plato Suizo de Bistec','Plato suizo con Bistec de res','19.jpg',5,1,116.02,5),(20,'Alambre de Bistec','Cebolla, Chile Morrón, Tocino, Bistec de Res y Quesillo','20.jpg',5,0,108,5),(21,'Alambre Especial','Cebolla, Chile morrón, Tocino, Bistec de Res, Jamón, Champiñones, Carne al pastor y Quesillo','21.jpg',5,1,115,5),(22,'Mata Hambre','Cebolla, Chile Morrón, Tocino, Bistec de Res, Jamón, Carne al pastor, Tomate y Quesillo','22.jpg',5,1,112,5),(23,'Plato Mixto Bistec','Tocino, Jamón, Carne al pastor, Salsa Mexicana y quesillo','23.jpg',5,1,113.1,5),(24,'Vegetariano','Cebolla, Chile Morrón, Tomate, Champiñones y quesillo','24.jpg',5,1,114,5),(25,'Tortilla adicional','Tortilla adicional','25.jpg',1,1,44,5),(26,'Pozole rojo','Plato de pozole rojo, grande','26.jpg',10,0,NULL,NULL),(27,'Pozole Rojo Chico','Pozole Rojo Chico','27.jpg',10,0,NULL,NULL),(28,'Queso Fundido Sencillo','Queso fundido normal','28.jpg',6,1,130,5),(29,'Queso Fundido Bistec','Queso fundido combinado con bistec','29.jpg',6,1,132,5),(30,'Gringa Bistec','Tortilla de harina con queso y bistec','30.jpg',20,1,154,5),(31,'Sincronizada','Tortilla de harina con queso y jamón','31.jpg',20,1,159,5),(32,'Tostada','Se prepara con la carne de su elección','32.jpg',6,0,NULL,NULL),(33,'Burrita de Bistec','Burrita de tortilla de harina con quesillo y bistec','33.jpg',20,1,161,5),(34,'Quesadilla Normal','Quesadilla Normal','34.jpg',20,1,146,5),(35,'Quesadilla Especial','Con Bistec de res, pastor o champiñones','35.jpg',6,0,NULL,NULL),(36,'Tostada adicional','Tostada adicional para cualquier alimento','36.jpg',1,1,46,5),(37,'Vaso Agua Fresca del Dia','Agua fresca del día, varios sabores.','37.jpg',7,1,209,5),(38,'Jarra de agua de sabor','Jarra de agua fresca de sabor del dia','38.jpg',7,1,210,5),(39,'Agua de Jamaica, Vaso','Vaso de agua de jamaica','39.jpg',7,0,NULL,NULL),(40,'Agua de Jamaica, Jarra','Jarra de agua de jamaica','40.jpg',7,0,NULL,NULL),(41,'Agua de Maracuya, Vaso','Vaso de agua de Maracuya','41.jpg',7,0,NULL,NULL),(42,'Agua de Maracuya, Jarra','Jarra de agua de Maracuya','42.jpg',7,0,NULL,NULL),(43,'Agua de Mandarina, Vaso','Vaso de agua de mandarina','43.jpg',7,0,NULL,NULL),(44,'Agua de Mandarina, Jarra','Jarra de agua de mandarina','44.jpg',7,0,NULL,NULL),(45,'R. Pepsi','Refresco marca Pepsi','45.jpg',7,0,NULL,NULL),(46,'Refresco de Sabor','Refresco de Sabor','46.jpg',7,1,200.1,5),(47,'Sangria','Refresco Sangría','47.jpg',7,0,NULL,NULL),(48,'Sprite','Refresco Sprite','48.jpg',7,0,NULL,NULL),(49,'Sidral','Refresco de manzana Sidral','49.jpg',7,0,NULL,NULL),(50,'Agua Mineral','Agua mineral embotellada','50.jpg',7,0,NULL,NULL),(51,'Café de olla','Tasa de café de olla calientito!','51.jpg',7,1,195,5),(52,'Atole','Atole','52.jpg',7,1,196,5),(53,'Agua SIN gas 1/2 Lt.','Agua embotellada SIN gas 1/2 Lt.','53.jpg',7,0,NULL,NULL),(54,'Panqué de elote','Panqué de elote','54.jpg',8,1,191,5),(55,'Flan','Flan','55.jpg',8,1,192,5),(56,'Cheesecake','Pastel de queso','56.jpg',8,1,193,5),(57,'Tostada Maciza de Puerco','Tostada Maciza de Puerco','57.jpg',9,1,53.03,4),(58,'Tostada Maciza de Res','Tostada Maciza de Res','58.jpg',9,1,54,5),(59,'Tostada Carnitas','Tostada de Carnitas','59.jpg',9,1,53.04,4),(60,'Tostada de Trompa','Tostada de Trompa','60.jpg',9,1,53.08,4),(61,'Tostada de Buche','Tostada de Buche','61.jpg',9,1,53.09,4),(62,'Tostada de Azadura','Tostada de Azadura','62.jpg',9,1,53.1,4),(63,'Tostada de Cabeza','Tostada de Cabeza','63.jpg',9,0,NULL,NULL),(64,'Tostada de Oreja','Tostada de Oreja','64.jpg',9,1,53.11,4),(65,'Tostada de Lengua','Tostada de Lengua','65.jpg',9,1,53.05,4),(66,'Tostada de Quesillo','Tostada de Quesillo','66.jpg',9,1,48,5),(67,'Tostada de Pastor','Tostada con carne al Pastor','67.jpg',9,1,49,5),(68,'Tostada de Bistec de Res','Tostada de Bistec de Res','68.jpg',9,1,50,5),(69,'Tostada de Chamorro','Tostada de Chamorro','69.jpg',9,1,53.06,4),(70,'T. Ahogado Maciza de Res','Taco ahogado en salsa y guacamole de Maciza de Res','70.jpg',3,1,23.01,5),(71,'T. Ahogado Maciza de Puerco','Taco ahogado de maciza de puerco','71.jpg',3,1,22.01,1),(72,'T. Ahogado Lengua de Puerco','Taco ahogado de lengua de puerco','72.jpg',3,1,22.08,1),(73,'T. Ahogado de Carnitas','Taco ahogado de carnitas mixtas','73.jpg',3,1,22.02,1),(74,'T. Ahogado de Buche','Taco ahogado de Buche','74.jpg',3,1,22.03,1),(75,'T. Ahogado de Oreja','Taco Ahogado de Oreja','75.jpg',3,1,22.04,1),(76,'T. Ahogado de Azadura','Taco ahogado de Azadura','76.jpg',3,1,22.05,1),(77,'T. Ahogado de Trompa','Taco ahogado de trompa','77.jpg',3,1,22.06,1),(78,'T. Ahogado de Cabeza','Taco ahogado de cabeza','78.jpg',3,1,22.07,1),(79,'T. Ahogado de Bistec de Res','Taco ahogado de bistec de Res','79.jpg',3,0,16,5),(80,'Taco ahogado al Pastor','Taco Ahogado al pastor','80.jpg',3,1,18,5),(81,'Poz. Maciza de Puerco','Pozole de maciza de puerco','81.jpg',10,0,75,5),(82,'Poz. Maciza de Res','Pozole de Maciza de Res','82.jpg',10,0,74,5),(83,'Pozole Grande','Pozole Grande','83.jpg',10,1,74,5),(84,'Pozole CHICO','Pozole CHICO ','84.jpg',10,0,68,5),(85,'Poz. Maciza de Puerco CHICO','Pozole de maciza de puerco, chico','85.jpg',10,0,69,5),(86,'Poz. Maciza de Res CHICO','Poz. Maciza de Res CHICO','86.jpg',10,0,68,5),(87,'Poz. Surtida de Puerco CHICO','Pozole con carne surtida de puerco, chico','87.jpg',10,0,70,5),(88,'Poz. Combinado CHICO','Pozole Mixto Chico','88.jpg',10,0,72,5),(89,'Agua Ciel SIN Gas 600 ml','Botella de Agua Ciel 600ml.','89.jpg',7,1,201,5),(91,'Cerveza Normal','Cerveza Precio Normal','91.jpg',7,1,203,5),(92,'Cerveza Barrilito','Cerveza Barrilito','92.jpg',7,1,204,5),(93,'Cerveza Premium','Cerveza Calidad Premium','93.jpg',7,1,206,5),(94,'Cerveza Bohemia','Cerveza Bohemia	','94.jpg',7,0,NULL,NULL),(95,'Vaso de Limonada','Vaso de limonada fresca','95.jpg',7,1,207,5),(96,'Jarra de Limonada','Jarra de Limonada fresca','96.jpg',7,1,208,5),(97,'Jugo del Valle','(Tamarindo, Guayaba, Fresa, Mango o Uva)','97.jpg',7,0,NULL,NULL),(98,'Cerveza Corona Light','Cerveza Corona Light','98.jpg',7,0,NULL,NULL),(99,'Cerveza Barrilito','Cerveza Barrilito','99.jpg',7,0,NULL,NULL),(100,'Cerveza Negra Modelo','Cerveza Negra Modelo','100.jpg',7,0,NULL,NULL),(101,'Cerveza Modelo Especial','Cerveza Modelo Especial','101.jpg',7,0,NULL,NULL),(102,'Lata Cerveza Modelo Especial','Cerveza Modelo Especial, LATA','102.jpg',7,0,NULL,NULL),(103,'Cerveza Victoria Lata','Cerveza Victoria Lata','103.jpg',7,0,NULL,NULL),(104,'Base Suero','Base Suero','104.jpg',7,1,202.1,5),(105,'Base Michelada','Base Michelada','105.jpg',7,1,202.2,5),(106,'Tortilla de Harina Extra','Tortilla de Harina Extra','106.jpg',1,1,45,5),(107,'Orden Guacamole','Orden Guacamole','107.jpg',1,1,188,5),(108,'Orden Zanahoria','Orden Zanahoria','108.jpg',1,1,189,5),(109,'300 grs. carne al pastor ','Orden Carne Pastor 300 gr','109.jpg',15,1,83,5),(110,'Promo Lunes','Promocion de Lunes','110.jpg',9,0,NULL,NULL),(111,'Promo Miercoles','Promo Miercoles','111.jpg',9,0,NULL,NULL),(112,'Paquete de todo un poco','2 tacos de al pastor o puerco,  2 tostadas al pastor o puerco,  1 pozole de puerco o pollo,  2 litros de agua de sabor o refresco de 2 litros','112.jpg',13,0,78,5),(113,'Coca-Cola vidrio','Refresco Coca-Cola de vidrio','113.jpg',7,1,199,5),(114,'2 tacos paquete 112 ','2 tacos para paquete \"De todo un poco\"','114.jpg',14,0,NULL,5),(115,'2 Tostadas Pollo o Puerco','2 Tostadas de Pollo o Puerco\npara paquete \"De todo un poco\"','',14,0,NULL,5),(116,'300 grs. carne de res ','Orden de Carne de Res 300 gr.','',15,1,88,5),(117,'Tacos de costilla enchilada','Tacos de costilla enchilada','',4,1,4,5),(118,'Taco de champiñones','Tacos de champiñones','',4,1,36,5),(119,'Taco de puerco con Queso','Taco de puerco con Queso','',4,1,14,5),(120,'Taco de res con Queso','Taco de res con Queso','',4,1,15,5),(121,'Taco de costilla con queso','Taco de costilla con queso','',4,1,12,5),(122,'Taco de Champiñones con queso','Taco de Champiñones con queso','',4,1,41.1,5),(123,'Taco Chuleta con Queso','Taco de chuleta de cerdo con queso','',4,1,41.2,5),(124,'Taco Chorizo con Queso','Taco de chorizo con queso','',4,1,41.3,5),(125,'Taco de Pollo con Queso','Taco de pollo con queso','',4,1,16,5),(126,'Taco Bisteck HARINA','Taco de bisteck con tortilla de harina','',17,1,28,5),(127,'Taco costilla HARINA','Taco de costilla de harina','',17,1,29,5),(128,'Taco Champiñones HARINA','Taco de champiñones con harina','',17,1,999,5),(129,'Taco pastor HARINA','Taco al pastor elaborado con tortilla de harina','',17,1,27,5),(130,'Tacho Chuleta HARINA','Taco de chuleta en tortilla de harina','',17,1,999,5),(131,'Taco chorizo HARINA','Taco de chorizo con tortilla de harina','',17,1,999,5),(132,'Taco de Pollo','Taco de pollo al vapor','',2,0,22,NULL),(133,'Taco de Cabeza de Puerco','Taco de cabeza de puerco','',2,1,6.05,1),(134,'Taco de Nana','Taco de nana de cerdo','',2,1,6.11,1),(135,'Taco de Surtida','Taco de carne surtida	','',2,1,6.02,1),(136,'Maciza de Res HARINA','Tacos de maciza de Res en Harina','',16,1,32,5),(137,'Maciza de Puerco HARINA','Tacos de maciza de puerco en tortilla de Harina','',16,1,31,3),(138,'Lengua de cerdo HARINA','Tacos de lengua de cerdo al vapor en tortilla de Harina','',16,1,31.06,3),(139,'Carnitas HARINA','Tacos de carnitas en tortilla de Harina','',16,1,31.02,3),(140,'Buche HARINA','Tacos de buche en tortilla de Harina','',16,1,31.07,3),(141,'Oreja HARINA','Tacos de oreja de cerdo en tortilla de harina','',16,1,31.04,3),(142,'Azadura HARINA','Tacos de azadura en tortilla de harina','',16,1,31.08,3),(143,'Trompa HARINA','Tacos de trompa de cerdo en tortilla de Harina','',16,1,31.05,3),(144,'Taco de Pollo HARINA','Taco de pollo al vapor en tortilla de Harina','',16,1,33,5),(145,'Cabeza de Puerco HARINA','Taco de cabeza de puerco en tortilla de Harina','',16,1,31.03,3),(146,'Nana en  HARINA','Taco de nana de cerdo en tortilla de Harina','',16,1,31.09,3),(147,'Surtida HARINA','Taco de carne surtida en tortilla de Harina','',16,1,31.01,3),(148,'Tostada de pollo','Tostada de pollo','',9,1,55,5),(149,'Tostada de Costilla','Tostada de Costilla','',9,1,51,5),(150,'Tostada de Chuleta','Tostada de Chuleta','',9,0,50,5),(151,'Tostada Cabeza de Puerco','Tostada Cabeza de puerco','',9,1,53.01,4),(152,'Tostada de Nana','Tosatada de Nana','',9,1,53.07,4),(153,'Volcan Bistec de Res','Tostada con bistec de res y quesillo fundido','',18,1,60,5),(154,'Volcan Maciza de Res','Tostada con maciza de res y quesillo fundido','',18,1,64,5),(155,'Volcan de pollo','Tostada con pollo y quesillo fundido','',18,1,65,5),(156,'Volcan de Pastor','Tostada con carne al pastor y quesillo fundido','',18,1,59,5),(157,'Volcan de Costilla','Tostada con costilla  y quesillo fundido','',18,1,61,5),(158,'Volcan de Chuleta','Tostada con chuleta y quesillo fundido','',9,0,65,5),(159,'Volcan de Puerco','Tostada con carne de puerco y quesillo fundido','',18,1,63,4),(160,'Volcan de Champiñones','Tostada con champiñones y quesillo fundido','',18,1,68,5),(161,'Poz. de pollo CHICO','Pozole de pollo Chico','',10,0,71,5),(162,'Poz. sin carne CHICO','Pozole CHICO sin carne','',10,0,NULL,NULL),(163,'Poz. de pollo','Pozole de pollo','',10,0,77,5),(164,'Pozole sin Carne','Pozole sin carne','',10,0,79,5),(165,'Alambre Costilla','Cebolla, Chile Morrón, Tocino, Costilla y Quesillo','',5,0,109,5),(166,'Alambre Chuleta','Cebolla, Chile Morrón, Tocino, Chuleta y Quesillo','',5,0,116.1,5),(167,'Alambre de Pollo','Cebolla, Chile morrón, Tocino, Pollo y Quesillo','',5,0,116.2,5),(168,'300 grs.  carne de bistec ','300 grs.  carne de bistec ','',15,1,84,5),(169,'Vaso de Naranjada','Vaso de Naranjada fresca','NA.jpg',7,1,207.1,5),(170,'Jarra de Naranjada','Jarra de Naranjada fresca','NA.jpg',5,1,208.1,5),(171,'Tizana Fria','Tizana Fria ','NA.jpg',7,0,208,5),(172,'Tizana Caliente','Tizana Caliente','NA.jpg',7,0,209,5),(173,'Té ','Té','NA.jpg',7,1,197,5),(174,'Queso Fundido Combinado','Queso fundido con dos ingredientes','NA.jpg',6,1,136,5),(175,'Servicio 1','Cargo extra por servicio 1','NA.jpg',11,1,221,5),(176,'Servicio 2','Corto Extra por servicio 2','NA.jpg',11,1,222,5),(177,'Servicio 3','Cargo por servicio 3','NA.jpg',11,1,223,5),(178,'Desechable','Cargo por contenedor desechable','NA.jpg',11,1,220,5),(179,'Tostada de Surtida','Tostada con carne surtida ','NA.jpg',9,1,53.02,4),(180,'Pozole Combinado','Pozole  combinado ','NA.jpg',10,0,78,5),(181,'Alambre Chuleta Harina','Cebolla, Chile Morrón, Tocino, Chuleta y Quesillo con T. de HARINA','NA.jpg',19,0,117.2,5),(182,'Queso Fundido Chuleta','Queso Fundido Chuleta','NA.jpg',14,0,133,5),(183,'Queso Fundido Chuleta HARINA','Queso Fundido Chuleta HARINA','NA.jpg',6,0,142,5),(184,'Quesadilla de chuleta','Quesadilla de chuleta','NA.jpg',6,0,149,5),(185,'Gringa de Chuleta','Gringa de Chuleta','NA.jpg',6,0,157,5),(186,'Burrita de Chuleta','Burrita de Chuleta','NA.jpg',6,0,165,5),(187,'Quesadilla Chuleta Maiz','Quesadilla Chuleta Maiz','NA.jpg',6,0,167,5),(188,'Gringa Chuleta Maiz','Gringa Chuleta Maiz','',6,0,180,5),(189,'Burrita Chuleta Maiz','Burrita Chuleta Maiz','NA.jpg',6,0,188,5),(190,'Burrita Costilla','Burrita Costilla','NA.jpg',20,1,162,5),(191,'Burrita Pastor','Burrita Pastor','NA.jpg',20,1,160,5),(192,'Burrita Champiñones','Burrita Champiñones','NA.jpg',20,1,165,5),(194,'Burrita de Pollo','Burrita de Pollo','NA.jpg',20,1,164,5),(195,'Burrita de Bisteck MAIZ','Burrita de Bisteck MAIZ','NA.jpg',21,1,182,5),(196,'Burrita de Costilla MAIZ','Burrita de Costilla MAIZ','NA.jpg',21,1,183,5),(197,'Burrita de Pastor MAIZ','Burrita de Pastor MAIZ','NA.jpg',21,1,181,5),(199,'Burrita de Champiñones MAIZ','Burrita de Champiñones MAIZ','NA.jpg',21,1,186,5),(200,'Burrita de Puerco MAIZ','Burrita de Puerco MAIZ','NA.jpg',21,1,187,1),(201,'Burrita de Pollo MAIZ','Burrita de Pollo MAIZ','NA.jpg',21,1,185,5),(202,'Taco de Corazon','Tacos de corazon','NA.jpg',2,1,6.09,1),(203,'Plato suizo al pastor','Plato suizo con carne al pastor','NA.jpg',5,1,116.01,5),(204,'Plato Suizo Combinado','Plato Suizo combinado con pastor y bistec de res','NA.jpg',5,1,116.03,5),(205,'Mula Terca Pastor','Mula terca con carne pastor','NA.jpg',5,1,117.2,5),(206,'Mula Terca Combinada','Mula terca combinada','NA.jpg',5,1,117.3,5),(207,'Plato mixto al pastor','plato mixto al pastor','NA.jpg',5,1,113.2,5),(208,'Alambre al pastor','alambre al pastor','NA.jpg',5,0,107,5),(209,'Alambre de puerco','alambre de puerco','NA.jpg',5,0,107.5,5),(210,'Alambre Combinado','Alambre Combinado','NA.jpg',5,0,114,5),(211,'alambre especial Harina','alambre especial harina ','',19,0,125,5),(212,'Plato Suizo Bistec Harina','Plato Suizo Bistec Harina','',19,1,127.02,5),(213,'plato suizo al pastor harina ','plato suizo al pastor harina ','NA.jpg',19,1,127.01,5),(214,'Alambre Especial Harina','Alambre Especial Harina','NA.jpg',19,1,126,5),(215,'mula terca de bistec harina ','mula terca de bistec harina ','NA.jpg',19,1,128.01,5),(216,'mula terca al pastor harina ','mula terca al pastor harina ','NA.jpg',19,1,128.02,5),(217,'mula terca combinada harina ','mula terca combinada harina ','NA.jpg',19,1,128.03,5),(218,'alambre bistec harina ','alambre bistec harina ','NA.jpg',19,0,119,5),(219,'plato mixto bistec harina ','plato mixto bistec harina ','NA.jpg',19,1,124.02,5),(220,'alambre de costilla harina ','alambre de costilla harina ','NA.jpg',19,0,120,5),(221,'plato mixto al pastor harina ','plato mixto al pastor harina ','NA.jpg',19,1,124.01,5),(222,'alambre al pastor harina ','alambre al pastor harina ','NA.jpg',19,0,118,5),(223,'alambre de pollo harina ','alambre de pollo harina ','NA.jpg',19,0,128,5),(224,'alambre de puerco harina ','alambre de puerco harina ','NA.jpg',19,0,128.1,5),(225,'alambre combinado harina ','alambre combinado harina ','NA.jpg',19,0,125.1,5),(226,'matahambre harina ','matahambre harina ','NA.jpg',19,1,123,5),(227,'vegetariano harina ','vegetariano harina ','NA.jpg',19,1,125,5),(228,'Queso Fundido Costilla','Queso Fundido Costilla','NA.jpg',6,1,133,5),(229,'Queso Fundido Champiñones','Queso Fundido Champiñones','NA.jpg',6,1,135,5),(230,'Queso Fundido Pastor','Queso Fundido Pastor','NA.jpg',6,1,131,5),(231,'Queso Fundido Chorizo','Queso Fundido Chorizo','NA.jpg',14,0,134,5),(232,'Queso Fundido Pollo','Queso Fundido Pollo','NA.jpg',6,1,134,5),(233,'Queso Fundido Combinado HARINA','Queso Fundido Combinado HARINA','NA.jpg',14,1,144,5),(234,'Queso Fundido Bistec HARINA','Queso Fundido Bistec HARINA','NA.jpg',14,1,140,5),(235,'Queso Fundido Costilla HARINA','Queso Fundido Costilla HARINA','NA.jpg',14,1,141,5),(236,'Queso Fundido Champ HARINA','Queso Fundido Champ HARINA','NA.jpg',14,1,143,5),(237,'Queso Fundido Pastor HARINA','Queso Fundido Pastor HARINA','NA.jpg',14,1,139,5),(238,'Queso Fundido Chorizo HARINA','Queso Fundido Chorizo HARINA','NA.jpg',6,0,143,5),(239,'Queso Fundido Pollo HARINA','Queso Fundido Pollo HARINA','NA.jpg',14,1,142,5),(240,'Queso Fundido Sencillo HARINA','Queso Fundido Sencillo HARINA','NA.jpg',14,1,138,5),(241,'quesadilla champiñónes ','quesadilla champiñónes ','NA.jpg',20,1,152,5),(242,'quesadilla de puerco HARINA','quesadilla de puerco en tortilla de harina','',20,1,149.01,3),(243,'quesadilla de pollo','quesadilla de pollo','',20,1,151,5),(244,'Gringa de Costilla','Gringa de Costilla','',20,1,155,5),(245,'Gringa de Pastor','Gringa de Pastor','',20,1,153,5),(246,'gringa  champiñónes ','gringa  champiñónes ','NA.jpg',6,0,158,5),(247,'gringa de puerco','gringa de puerco','NA.jpg',20,1,158,3),(248,'Gringa de Pollo','Gringa de Pollo','',20,1,157,5),(249,'quesadilla bistec','quesadilla bistec','NA.jpg',20,1,148,5),(250,'quesadilla costilla','quesadilla costilla','NA.jpg',20,1,149,5),(251,'quesadilla al pastor','quesadilla al pastor','NA.jpg',20,1,147,5),(255,'quesadilla bistec maiz ','quesadilla bistec maiz ','',21,1,169,5),(256,'quesadilla costilla maiz','quesadilla costilla maiz','',21,1,170,5),(257,'quesadilla al pastor maiz','quesadilla al pastor maiz','',21,1,168,5),(258,'quesadilla chuleta maiz','quesadilla chuleta maiz','',6,0,172,5),(259,'quesadilla champiñónes maiz','quesadilla champiñónes maiz','NA.jpg',21,1,173,5),(260,'quesadilla de pueco maiz','quesadilla de pueco maiz','',21,1,171,1),(261,'quesadilla de pollo maiz ','quesadilla de pollo maiz ','NA.jpg',21,1,172,5),(262,'quesadilla normal maiz','quesadilla normal maiz','',21,1,167,5),(263,'gringa bistec maiz','gringa bistec maiz','',21,1,175,5),(264,'gringa  costilla maiz','gringa  costilla maiz','',21,1,176,5),(265,'gringa al pastor maiz','gringa al pastor maiz','',21,1,174,5),(266,'gringa  champiñónes maiz ','gringa  champiñónes maiz ','',21,1,179,5),(267,'gringa puerco maiz','gringa puerco maiz','',21,1,178.1,1),(268,'gringa de pollo maiz','gringa de pollo maiz','',21,1,178,5),(269,'Paquete Pareja','paquete pareja','',13,0,193,5),(270,'Paquete Familiar','Paquete Familiar','',13,0,194,5),(271,'Paquete Empaches','Paquete Empaches','',13,0,195,5),(281,'300 grs. carne de puerco ','300 grs. carne de puerco ','',15,1,87,5),(282,'1/2.  kg bistec','1/2.  kg bistec','NA.jpg',15,1,92,5),(283,'1/2.  kg res','1/2.  kg res','NA.jpg',15,1,96,5),(284,'1/2.  kg pastor','1/2.  kg pastor','NA.jpg',15,1,91,5),(285,'1 kg puerco','1 kg puerco','',15,1,103,5),(286,'1 kg bistec de res','1 kg bistec de res','',15,1,100,5),(287,'1. kg carne de res','1. kg carne de res','NA.jpg',15,1,104,5),(288,'1. kg  carne al pastor','1. kg  carne al pastor','',15,1,99,5),(289,'1. kg  carne de puerco','1. kg  carne de puerco','NA.jpg',15,0,127,5),(290,'1/2.  kg carne puerco','1/2.  kg carne puerco','NA.jpg',15,1,95,5),(291,'Cerveza Barrilito','Cerveza Barrilito','NA.jpg',7,0,222,5),(292,'Taco Arrachera Maiz','Taco de Arrachera Maiz','NA.jpg',4,1,5,5),(293,'Taco Arrachera Harina','Taco de arrachera en tortilla de harina','NA.jpg',17,1,30,5),(294,'Taco Arrachera con Queso','Taco Arrachera con Queso','NA.jpg',4,1,13,5),(295,'Taco Ahogado de Bistec','Taco ahogado de bistec	','NA.jpg',3,1,19,5),(296,'Taco ahogado harina puerco','Taco harina','NA.jpg',3,1,39,3),(297,'Taco ahogado de pollo','Taco ahogado de pollo','NA.jpg',3,1,24,5),(298,'Burrita de Arrachera','Burrita de Arrachera','NA.jpg',20,1,163,5),(299,'Gringa de Arrachera','Gringa de Arrachera','NA.jpg',20,1,156,5),(300,'Tostada de Arrachera','Tostada de Arrachera','NA.jpg',9,1,52,5),(301,'Volcan de Arrachera','Volcan de Arrachera','NA.jpg',18,1,62,5),(302,'Quesadilla de Arrachera','Quesadilla de Arrachera','NA.jpg',20,1,150,5),(303,'Burrita de Arrachera','Burrita','NA.jpg',20,1,127,5),(304,'Volcan de Arrachera','Volcan de Arrachera','NA.jpg',18,1,70,5),(305,'Tostada de Arrachera','Tostada de Arrachera','NA.jpg',9,1,64,5),(306,'Gringa de Arrachera','Gringa de Arrachera','NA.jpg',6,1,1,5),(307,'Taco Ahogado de Arrachera','Taco Ahogado','NA.jpg',3,1,21,5),(308,'Cabeza de Res HARINA','Tacos de cabeza de Res en Harina','NA.jpg',16,1,32.1,5),(309,'Gringa Arrachera','Tortilla de harina con queso y arrachera','NA.jpg',6,1,155,5),(310,'Burrita Arrachera','Burrita Arracherra','NA.jpg',6,1,127,5),(311,'1 kg Arrachera','1 kg Arrachera','NA.jpg',15,1,102,5),(312,'Alambre de Arrachera','Alambre de Arrachera','NA.jpg',5,1,110,5),(313,'ALAMBRE ARRACHERA ','CAROOOOO','NA.jpg',5,0,87,5),(314,'Alambre de Arrachera','Alambre de Arrachera','NA.jpg',5,1,111,5),(315,'Ponche','Poche navideño de frutas','NA.jpg',7,0,17,5),(316,'Taco Lengua de Res','Taco Lengua de Res','NA.jpg',2,1,9,5),(317,'Taco Lengua de Res HARINA','Taco Lengua de Res HARINA','NA.jpg',16,1,34,5),(318,'300 Gr. Arrachera','300 gramos de Arrachera servida con tortillas','NA.jpg',15,1,86,5),(319,'1/2 kg. Arrachera','1/2 kg. Arrachera','NA.jpg',15,1,94,5),(320,'1 kg. Arrachera','1 kilo Arrachera','NA.jpg',15,1,102,5),(321,'Taco cabeza de RES','Taco cabeza de RES','NA.jpg',2,1,7.02,5),(322,'Coca-Cola light lata','Coca cola light de lata','NA.jpg',7,1,199.01,5),(323,'Sidral 500 ml','Sidral 500 ml	','NA.jpg',7,0,203,5),(324,'Refresco para llevar','Refresco para llevar','NA.jpg',7,1,200.2,5),(325,'Pozole de RES','Pozole con carne de Res','NA.jpg',10,1,74.5,5),(326,'Coca Cola Zero Lata','Coca Cola Zero Lata','NA.jpg',7,1,199.02,NULL),(327,'Coca-Cola Lata','Coca-Cola Lata','NA.jpg',7,1,199,NULL),(328,'Burrita de Arrachera MAIZ','Burrita de arrachera maiz','NA.jpg',21,1,164,5),(329,'Litro de Agua del dia','Un litro de agua del dia','NA.jpg',7,1,201.5,5),(330,'Agua Topochico','Agua Mineral Topochico','N/A',7,1,203.1,5),(331,'Taco Vegetariano','Taco vegetariano HARINA','NA.jpg',4,1,5.5,5),(332,'Taco Vegetariano con queso','Taco vegetariano','NA.jpg',4,1,13.5,5),(333,'Taco Vegetariano HARINA','Taco vegetariano harina','N/A.jpg',17,1,30.5,5),(334,'Agua 1 litro de agua del dia','1 Litro agua fresca','NA.jpg',7,1,210.5,NULL),(335,'1/2 Kg Arrachera','1/2 Kg Arrachera','NA.jpg',15,1,96.5,NULL),(336,'1. kg Arrachera','1. kg carne de arrachera','NA.jpg',15,1,104.5,NULL);
/*!40000 ALTER TABLE `tbl_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promociones`
--

DROP TABLE IF EXISTS `tbl_promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `fl_descuento` float NOT NULL,
  `dt_fecha_inicio` date NOT NULL,
  `dt_fecha_final` date NOT NULL,
  `chr_dias_valido` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `bit_activo` int NOT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `id_precio` (`fl_descuento`),
  KEY `id_precio_2` (`fl_descuento`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tbl_promociones_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promociones`
--

LOCK TABLES `tbl_promociones` WRITE;
/*!40000 ALTER TABLE `tbl_promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_propinas`
--

DROP TABLE IF EXISTS `tbl_propinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_propinas` (
  `id_orden_cerrada` int NOT NULL,
  `fl_propina` float DEFAULT NULL,
  `bit_activa` int DEFAULT NULL,
  KEY `fk_tbl_propinas_1_idx` (`id_orden_cerrada`),
  CONSTRAINT `fk_tbl_propinas_1` FOREIGN KEY (`id_orden_cerrada`) REFERENCES `tbl_ordenes` (`id_orden_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_propinas`
--

LOCK TABLES `tbl_propinas` WRITE;
/*!40000 ALTER TABLE `tbl_propinas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_propinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_puestos`
--

DROP TABLE IF EXISTS `tbl_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_puestos` (
  `id_puesto` int NOT NULL AUTO_INCREMENT,
  `chr_puesto` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_desc_puesto` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `bit_activo` int NOT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_recetas_productos` (
  `id_receta_prod` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_insumo` int NOT NULL,
  `int_cantidad` int NOT NULL,
  PRIMARY KEY (`id_receta_prod`),
  KEY `id_producto` (`id_producto`,`id_insumo`),
  KEY `id_insumo` (`id_insumo`),
  CONSTRAINT `tbl_recetas_productos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  CONSTRAINT `tbl_recetas_productos_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `tbl_insumos` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reportes` (
  `id_reporte` int NOT NULL AUTO_INCREMENT,
  `dt_fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `chr_reporte` text CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `int_tipo_reporte_id` int NOT NULL,
  PRIMARY KEY (`id_reporte`),
  KEY `int_tipo_reporte_id` (`int_tipo_reporte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `chr_status` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status`
--

LOCK TABLES `tbl_status` WRITE;
/*!40000 ALTER TABLE `tbl_status` DISABLE KEYS */;
INSERT INTO `tbl_status` VALUES (1,'Administrador'),(2,'Normal'),(3,'Mesero'),(4,'Superadmin');
/*!40000 ALTER TABLE `tbl_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ticket_cons`
--

DROP TABLE IF EXISTS `tbl_ticket_cons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ticket_cons` (
  `id_ticketNrConsecutivo` int NOT NULL AUTO_INCREMENT,
  `chr_ticketConsecutivo` int NOT NULL,
  PRIMARY KEY (`id_ticketNrConsecutivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ticket_cons`
--

LOCK TABLES `tbl_ticket_cons` WRITE;
/*!40000 ALTER TABLE `tbl_ticket_cons` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ticket_cons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_reporte`
--

DROP TABLE IF EXISTS `tbl_tipo_reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_reporte` (
  `id_tipo_reporte` int NOT NULL AUTO_INCREMENT,
  `chr_tipo_reporte` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_desc_tipo_reporte` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_reporte`),
  KEY `id_tipo_reporte` (`id_tipo_reporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_reporte`
--

LOCK TABLES `tbl_tipo_reporte` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_tipo_reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipos_precios`
--

DROP TABLE IF EXISTS `tbl_tipos_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipos_precios` (
  `id_tipo_precio` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_precio` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_tipo_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipos_precios`
--

LOCK TABLES `tbl_tipos_precios` WRITE;
/*!40000 ALTER TABLE `tbl_tipos_precios` DISABLE KEYS */;
INSERT INTO `tbl_tipos_precios` VALUES (1,'Normal',1),(2,'Plataforma',0),(3,'Personal',1),(4,'Otro',0);
/*!40000 ALTER TABLE `tbl_tipos_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `chr_login` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_password` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_salt` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `chr_pin` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `int_status` int NOT NULL,
  `bit_activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios`
--

LOCK TABLES `tbl_usuarios` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` VALUES (1,'admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918',NULL,NULL,1,1),(2,'Cajero','936400f151ba2146a86cfcc342279f57',NULL,NULL,2,1),(3,'mesero','85770ae9def3473f559e0dbe0609060a',NULL,NULL,3,1),(4,'SuperAdmin','$1$tacosroy$SmclA8WwJTC8i0uUirgCf1',NULL,NULL,1,1),(5,'usuario','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',NULL,NULL,2,1);
/*!40000 ALTER TABLE `tbl_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuarios_sistema`
--

DROP TABLE IF EXISTS `tbl_usuarios_sistema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_usuarios_sistema` (
  `id_usuario_sistema` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_personal` int NOT NULL,
  PRIMARY KEY (`id_usuario_sistema`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_personal` (`id_personal`),
  CONSTRAINT `tbl_usuarios_sistema_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuarios` (`id_usuario`),
  CONSTRAINT `tbl_usuarios_sistema_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `tbl_personal` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios_sistema`
--

LOCK TABLES `tbl_usuarios_sistema` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios_sistema` DISABLE KEYS */;
INSERT INTO `tbl_usuarios_sistema` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4);
/*!40000 ALTER TABLE `tbl_usuarios_sistema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_variantes_categorias`
--

DROP TABLE IF EXISTS `tbl_variantes_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_variantes_categorias` (
  `id_variante_categoria` int NOT NULL AUTO_INCREMENT,
  `id_catgoria` int NOT NULL,
  `id_variante_platillo` int NOT NULL,
  PRIMARY KEY (`id_variante_categoria`),
  KEY `gfsdger` (`id_catgoria`),
  KEY `fdvswzsd` (`id_variante_platillo`),
  CONSTRAINT `tbl_variantes_categorias_ibfk_1` FOREIGN KEY (`id_catgoria`) REFERENCES `tbl_categorias` (`id_categoria`),
  CONSTRAINT `tbl_variantes_categorias_ibfk_2` FOREIGN KEY (`id_variante_platillo`) REFERENCES `tbl_variantes_platillos` (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_variantes_platillos` (
  `id_variante_pl` int NOT NULL AUTO_INCREMENT,
  `chr_variante_nombre` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_variante_descripcion` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `chr_imprimir` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `fl_ordenar` float DEFAULT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
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
-- Temporary view structure for view `vw_combos_productos`
--

DROP TABLE IF EXISTS `vw_combos_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_combos_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_combos_productos` AS SELECT 
 1 AS `ID Combo`,
 1 AS `Nombre Combo`,
 1 AS `ID Producto`,
 1 AS `ID Prod Rel`,
 1 AS `Producto`,
 1 AS `Descripcion`,
 1 AS `Cant. x Combo`,
 1 AS `Activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_costos_extra_var_opciones`
--

DROP TABLE IF EXISTS `vw_costos_extra_var_opciones`;
/*!50001 DROP VIEW IF EXISTS `vw_costos_extra_var_opciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_costos_extra_var_opciones` AS SELECT 
 1 AS `ID Orden`,
 1 AS `ID Prod.`,
 1 AS `Cantidad`,
 1 AS `Precio`,
 1 AS `IDPOp`,
 1 AS `Prod. x Orden`,
 1 AS `ID Fecha`,
 1 AS `Extra`,
 1 AS `Tipo Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_datos_personal_logins`
--

DROP TABLE IF EXISTS `vw_datos_personal_logins`;
/*!50001 DROP VIEW IF EXISTS `vw_datos_personal_logins`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_datos_personal_logins` AS SELECT 
 1 AS `ID`,
 1 AS `Nombre`,
 1 AS `Apellidos`,
 1 AS `CURP`,
 1 AS `Telefono`,
 1 AS `Puesto`,
 1 AS `Login`,
 1 AS `IDS`,
 1 AS `PData`,
 1 AS `Tipo`,
 1 AS `Activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_info_ordenes_tickets`
--

DROP TABLE IF EXISTS `vw_info_ordenes_tickets`;
/*!50001 DROP VIEW IF EXISTS `vw_info_ordenes_tickets`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_info_ordenes_tickets` AS SELECT 
 1 AS `id_orden_id`,
 1 AS `id_orden_cerrada`,
 1 AS `dt_horafecha_cierre_orden`,
 1 AS `total`,
 1 AS `IDTicket`,
 1 AS `chr_consecutivo`,
 1 AS `int_lvl_report`,
 1 AS `chr_status_orden`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_insumos_usados_x_orden`
--

DROP TABLE IF EXISTS `vw_insumos_usados_x_orden`;
/*!50001 DROP VIEW IF EXISTS `vw_insumos_usados_x_orden`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_insumos_usados_x_orden` AS SELECT 
 1 AS `ID`,
 1 AS `Orden`,
 1 AS `HoraFecha`,
 1 AS `Control Fecha`,
 1 AS `InsumoID`,
 1 AS `Insumo`,
 1 AS `Usado`,
 1 AS `Estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_insumos_x_platillo`
--

DROP TABLE IF EXISTS `vw_insumos_x_platillo`;
/*!50001 DROP VIEW IF EXISTS `vw_insumos_x_platillo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_insumos_x_platillo` AS SELECT 
 1 AS `ID`,
 1 AS `Producto`,
 1 AS `Insumo`,
 1 AS `Cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_inventarios_fecha`
--

DROP TABLE IF EXISTS `vw_inventarios_fecha`;
/*!50001 DROP VIEW IF EXISTS `vw_inventarios_fecha`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_inventarios_fecha` AS SELECT 
 1 AS `InvID`,
 1 AS `Insumo`,
 1 AS `Cantidad`,
 1 AS `Fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_opciones_platillos_ticket`
--

DROP TABLE IF EXISTS `vw_opciones_platillos_ticket`;
/*!50001 DROP VIEW IF EXISTS `vw_opciones_platillos_ticket`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_opciones_platillos_ticket` AS SELECT 
 1 AS `ID`,
 1 AS `IDPO`,
 1 AS `TxtTicket`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_orconcentrado`
--

DROP TABLE IF EXISTS `vw_orconcentrado`;
/*!50001 DROP VIEW IF EXISTS `vw_orconcentrado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_orconcentrado` AS SELECT 
 1 AS `Orcon`,
 1 AS `ID Orden`,
 1 AS `ID ORC`,
 1 AS `ID Cons`,
 1 AS `Consecutivo`,
 1 AS `Comanda`,
 1 AS `Fecha Hora`,
 1 AS `Total`,
 1 AS `Referencia`,
 1 AS `Status`,
 1 AS `Control Fecha`,
 1 AS `Forma Pago`,
 1 AS `ID Pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_orden_prods_precio`
--

DROP TABLE IF EXISTS `vw_orden_prods_precio`;
/*!50001 DROP VIEW IF EXISTS `vw_orden_prods_precio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_orden_prods_precio` AS SELECT 
 1 AS `Orden`,
 1 AS `IDPO`,
 1 AS `Producto`,
 1 AS `IDPR`,
 1 AS `Cantidad`,
 1 AS `Precio`,
 1 AS `Tipo Precio`,
 1 AS `OrdenNR`,
 1 AS `HoraFecha`,
 1 AS `Control Fecha`,
 1 AS `Activo`,
 1 AS `Impreso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ordenes_x_mesero`
--

DROP TABLE IF EXISTS `vw_ordenes_x_mesero`;
/*!50001 DROP VIEW IF EXISTS `vw_ordenes_x_mesero`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ordenes_x_mesero` AS SELECT 
 1 AS `ID Orden`,
 1 AS `TicketNR`,
 1 AS `Comanda`,
 1 AS `Fecha y Hora`,
 1 AS `Total`,
 1 AS `Mesa`,
 1 AS `Estado`,
 1 AS `Referencia`,
 1 AS `Control Fecha`,
 1 AS `Indexed`,
 1 AS `Tipo Pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_precios_productos`
--

DROP TABLE IF EXISTS `vw_precios_productos`;
/*!50001 DROP VIEW IF EXISTS `vw_precios_productos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_precios_productos` AS SELECT 
 1 AS `IDPXO`,
 1 AS `ID Orden`,
 1 AS `ID Prod`,
 1 AS `Producto`,
 1 AS `Precio`,
 1 AS `Tipo Precio`,
 1 AS `Fecha Validez`,
 1 AS `Activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_prods_x_orden`
--

DROP TABLE IF EXISTS `vw_prods_x_orden`;
/*!50001 DROP VIEW IF EXISTS `vw_prods_x_orden`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_prods_x_orden` AS SELECT 
 1 AS `Orden`,
 1 AS `IDPO`,
 1 AS `Comanda`,
 1 AS `Consecutivo`,
 1 AS `Mesa`,
 1 AS `ID Prod`,
 1 AS `Producto`,
 1 AS `Cantidad`,
 1 AS `Tipo Precio`,
 1 AS `CHRTipoPrecio`,
 1 AS `HoraFecha`,
 1 AS `Control Fecha`,
 1 AS `Activo`,
 1 AS `Impreso`,
 1 AS `Ordenar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_categoria`
--

DROP TABLE IF EXISTS `vw_productos_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_categoria` AS SELECT 
 1 AS `id_producto`,
 1 AS `Producto`,
 1 AS `Categoria`,
 1 AS `Activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_con_precio`
--

DROP TABLE IF EXISTS `vw_productos_con_precio`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_con_precio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_con_precio` AS SELECT 
 1 AS `id_producto`,
 1 AS `chr_nombre_prod`,
 1 AS `chr_desc_prod`,
 1 AS `chr_pic_prod_path`,
 1 AS `id_categoria`,
 1 AS `int_activo`,
 1 AS `fl_ordenar`,
 1 AS `id_grupo_def`,
 1 AS `precio_actual`,
 1 AS `tipo_precio`,
 1 AS `dat_fecha_precio_activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_products_catprecio`
--

DROP TABLE IF EXISTS `vw_products_catprecio`;
/*!50001 DROP VIEW IF EXISTS `vw_products_catprecio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_products_catprecio` AS SELECT 
 1 AS `ID Precio`,
 1 AS `ID`,
 1 AS `Producto`,
 1 AS `Desc`,
 1 AS `Categoria`,
 1 AS `OrdCat`,
 1 AS `Tooltip`,
 1 AS `CatID`,
 1 AS `Precio`,
 1 AS `Tipo`,
 1 AS `IDTipo`,
 1 AS `Activo`,
 1 AS `Ordenar`,
 1 AS `Agrupar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_products_infoCat`
--

DROP TABLE IF EXISTS `vw_products_infoCat`;
/*!50001 DROP VIEW IF EXISTS `vw_products_infoCat`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_products_infoCat` AS SELECT 
 1 AS `ID`,
 1 AS `Producto`,
 1 AS `Descripcion`,
 1 AS `Categoria`,
 1 AS `Tooltip`,
 1 AS `Activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_variantes_platillos_x_orden`
--

DROP TABLE IF EXISTS `vw_variantes_platillos_x_orden`;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_platillos_x_orden`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_variantes_platillos_x_orden` AS SELECT 
 1 AS `ID Orden`,
 1 AS `ID Producto`,
 1 AS `Producto`,
 1 AS `Variante`,
 1 AS `Activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_variantes_x_categoria`
--

DROP TABLE IF EXISTS `vw_variantes_x_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_x_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_variantes_x_categoria` AS SELECT 
 1 AS `ID`,
 1 AS `IDCAT`,
 1 AS `Categoria`,
 1 AS `IDVAR`,
 1 AS `Variante`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_variantes_x_platillo`
--

DROP TABLE IF EXISTS `vw_variantes_x_platillo`;
/*!50001 DROP VIEW IF EXISTS `vw_variantes_x_platillo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_variantes_x_platillo` AS SELECT 
 1 AS `ID Producto`,
 1 AS `Producto`,
 1 AS `Variante`,
 1 AS `Desc`,
 1 AS `ID Variante`,
 1 AS `IDProdVar`,
 1 AS `ID Cat`,
 1 AS `Costo Extra`,
 1 AS `Tipo Precio`,
 1 AS `Ordenar`,
 1 AS `Activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_combos_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_combos_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_combos_productos` AS select `tbl_combos`.`id_combo` AS `ID Combo`,`tbl_combos`.`chr_nombre_combo` AS `Nombre Combo`,`tbl_prods_x_combo`.`id_producto` AS `ID Producto`,`tbl_combos`.`id_producto_relacionado` AS `ID Prod Rel`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Descripcion`,`tbl_prods_x_combo`.`int_cantidad` AS `Cant. x Combo`,`tbl_combos`.`bit_activo` AS `Activo` from ((`tbl_prods_x_combo` join `tbl_combos` on((`tbl_combos`.`id_combo` = `tbl_prods_x_combo`.`id_combo`))) left join `tbl_productos` on((`tbl_productos`.`id_producto` = `tbl_prods_x_combo`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_costos_extra_var_opciones`
--

/*!50001 DROP VIEW IF EXISTS `vw_costos_extra_var_opciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_costos_extra_var_opciones` AS select `tbl_prods_x_orden`.`int_orden_id` AS `ID Orden`,`tbl_prods_x_orden`.`int_producto_id` AS `ID Prod.`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_prods_x_orden`.`int_tipo_precio` AS `Precio`,`tbl_prods_orden_opciones`.`id_prod_orden_opcion` AS `IDPOp`,`tbl_prods_orden_opciones`.`id_prod_x_orden` AS `Prod. x Orden`,`tbl_costos_extra_var_prod`.`id_fecha_control` AS `ID Fecha`,coalesce(`tbl_costos_extra_var_prod`.`fl_costo_extra`,'0') AS `Extra`,`tbl_costos_extra_var_prod`.`id_tipo_precio` AS `Tipo Precio` from (((`tbl_prods_x_orden` left join `tbl_prods_orden_opciones` on((`tbl_prods_orden_opciones`.`id_prod_x_orden` = `tbl_prods_x_orden`.`id_prod_x_orden`))) left join `tbl_prods_variantes` on(((`tbl_prods_variantes`.`id_producto` = `tbl_prods_x_orden`.`int_producto_id`) and (`tbl_prods_variantes`.`id_variante` = `tbl_prods_orden_opciones`.`id_variante_platillo`)))) left join `tbl_costos_extra_var_prod` on((`tbl_prods_variantes`.`id_prods_variantes` = `tbl_costos_extra_var_prod`.`id_producto_variante`))) where (`tbl_prods_x_orden`.`bool_activo` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_datos_personal_logins`
--

/*!50001 DROP VIEW IF EXISTS `vw_datos_personal_logins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_datos_personal_logins` AS select `tbl_personal`.`id_personal` AS `ID`,`tbl_personal`.`chr_nombre_persona` AS `Nombre`,`tbl_personal`.`chr_apellidos` AS `Apellidos`,`tbl_personal`.`chr_CURP` AS `CURP`,`tbl_personal`.`chr_telefono` AS `Telefono`,`tbl_puestos`.`chr_puesto` AS `Puesto`,`tbl_usuarios`.`chr_login` AS `Login`,`tbl_usuarios`.`id_usuario` AS `IDS`,`tbl_usuarios`.`chr_password` AS `PData`,`tbl_status`.`chr_status` AS `Tipo`,`tbl_personal`.`bit_activo` AS `Activo` from ((((`tbl_personal` left join `tbl_puestos` on((`tbl_personal`.`int_puesto` = `tbl_puestos`.`id_puesto`))) left join `tbl_usuarios_sistema` on((`tbl_personal`.`id_personal` = `tbl_usuarios_sistema`.`id_personal`))) left join `tbl_usuarios` on((`tbl_usuarios`.`id_usuario` = `tbl_usuarios_sistema`.`id_usuario`))) left join `tbl_status` on((`tbl_usuarios`.`int_status` = `tbl_status`.`id_status`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_ordenes_tickets`
--

/*!50001 DROP VIEW IF EXISTS `vw_info_ordenes_tickets`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_ordenes_tickets` AS select `tbl_ordenes`.`id_orden_id` AS `id_orden_id`,`tbl_ordenes_cerradas`.`id_orden_cerrada` AS `id_orden_cerrada`,`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden` AS `dt_horafecha_cierre_orden`,`tbl_ordenes_cerradas`.`fl_total` AS `total`,`tbl_ticket_cons`.`id_ticketNrConsecutivo` AS `IDTicket`,`tbl_ticket_cons`.`chr_ticketConsecutivo` AS `chr_consecutivo`,`tbl_ordenes_cerradas`.`int_lvl_report` AS `int_lvl_report`,`tbl_ordenes`.`chr_status_orden` AS `chr_status_orden` from (((`tbl_ordenes` left join `tbl_ordenes_cerradas` on((`tbl_ordenes`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`))) left join `tbl_consecutivo` on((`tbl_ordenes`.`int_consecutivo` = `tbl_consecutivo`.`id_consecutivo`))) left join `tbl_ticket_cons` on((`tbl_ticket_cons`.`id_ticketNrConsecutivo` = `tbl_ordenes_cerradas`.`id_ticket_IDNr`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_insumos_usados_x_orden`
--

/*!50001 DROP VIEW IF EXISTS `vw_insumos_usados_x_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_insumos_usados_x_orden` AS select any_value(`tbl_ordenes`.`id_orden_id`) AS `ID`,any_value(`tbl_ordenes`.`int_consecutivo`) AS `Orden`,any_value(`tbl_ordenes`.`dt_horafecha_orden`) AS `HoraFecha`,any_value(`tbl_ordenes`.`id_control_fecha`) AS `Control Fecha`,any_value(`tbl_insumos`.`id_insumo`) AS `InsumoID`,any_value(`tbl_insumos`.`chr_nombre_insumo`) AS `Insumo`,any_value((`tbl_prods_x_orden`.`int_cantidad` * `tbl_insumos_x_platillo`.`int_cantidad`)) AS `Usado`,any_value(`tbl_ordenes`.`chr_status_orden`) AS `Estado` from ((((`tbl_ordenes` left join `tbl_prods_x_orden` on((`tbl_prods_x_orden`.`int_orden_id` = `tbl_ordenes`.`id_orden_id`))) left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_insumos_x_platillo` on((`tbl_insumos_x_platillo`.`id_producto` = `tbl_productos`.`id_producto`))) left join `tbl_insumos` on((`tbl_insumos`.`id_insumo` = `tbl_insumos_x_platillo`.`id_insumo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_insumos_x_platillo`
--

/*!50001 DROP VIEW IF EXISTS `vw_insumos_x_platillo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_insumos_x_platillo` AS select `tbl_insumos_x_platillo`.`id_insumo_x_platillo` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,`tbl_insumos_x_platillo`.`int_cantidad` AS `Cantidad` from ((`tbl_productos` left join `tbl_insumos_x_platillo` on((`tbl_insumos_x_platillo`.`id_producto` = `tbl_productos`.`id_producto`))) left join `tbl_insumos` on((`tbl_insumos_x_platillo`.`id_insumo` = `tbl_insumos`.`id_insumo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_inventarios_fecha`
--

/*!50001 DROP VIEW IF EXISTS `vw_inventarios_fecha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inventarios_fecha` AS select `tbl_inventario`.`id_inventario_id` AS `InvID`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,`tbl_inventario`.`int_cantidad` AS `Cantidad`,`tbl_control_fechas`.`dt_fecha_calendario` AS `Fecha` from ((`tbl_inventario` left join `tbl_insumos` on((`tbl_inventario`.`id_insumo_id` = `tbl_insumos`.`id_insumo`))) left join `tbl_control_fechas` on((`tbl_inventario`.`id_control_fecha` = `tbl_control_fechas`.`id_control_fechas`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_opciones_platillos_ticket`
--

/*!50001 DROP VIEW IF EXISTS `vw_opciones_platillos_ticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_opciones_platillos_ticket` AS select `tbl_prods_orden_opciones`.`id_prod_orden_opcion` AS `ID`,`tbl_prods_orden_opciones`.`id_prod_x_orden` AS `IDPO`,`tbl_variantes_platillos`.`chr_imprimir` AS `TxtTicket` from (`tbl_prods_orden_opciones` left join `tbl_variantes_platillos` on((`tbl_prods_orden_opciones`.`id_variante_platillo` = `tbl_variantes_platillos`.`id_variante_pl`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_orconcentrado`
--

/*!50001 DROP VIEW IF EXISTS `vw_orconcentrado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orconcentrado` AS select `tbl_orcon`.`id_orcon` AS `Orcon`,`tbl_orcon`.`id_orden` AS `ID Orden`,`tbl_ordenes_cerradas`.`id_orden_cerrada` AS `ID ORC`,`tbl_orcon`.`id_cons` AS `ID Cons`,`tbl_consecutivo`.`chr_consecutivo` AS `Consecutivo`,`tbl_ordenes`.`int_nr_comanda` AS `Comanda`,`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden` AS `Fecha Hora`,`tbl_ordenes_cerradas`.`fl_total` AS `Total`,`tbl_ordenes_cerradas`.`chr_referencia_notas` AS `Referencia`,`tbl_ordenes`.`chr_status_orden` AS `Status`,`tbl_ordenes_cerradas`.`id_control_fecha` AS `Control Fecha`,`tbl_formas_pago`.`chr_forma_pago` AS `Forma Pago`,`tbl_formas_pago`.`id_forma_pago` AS `ID Pago` from ((((`tbl_orcon` left join `tbl_ordenes_cerradas` on((`tbl_orcon`.`id_orden` = `tbl_ordenes_cerradas`.`id_orden_cerrada`))) left join `tbl_ordenes` on((`tbl_ordenes`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`))) left join `tbl_consecutivo` on((`tbl_consecutivo`.`id_consecutivo` = `tbl_orcon`.`id_cons`))) left join `tbl_formas_pago` on((`tbl_formas_pago`.`id_forma_pago` = `tbl_ordenes_cerradas`.`int_forma_pago`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_orden_prods_precio`
--

/*!50001 DROP VIEW IF EXISTS `vw_orden_prods_precio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_orden_prods_precio` AS select `tbl_prods_x_orden`.`int_orden_id` AS `Orden`,`tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPO`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`id_producto` AS `IDPR`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_prods_x_orden`.`int_tipo_precio` AS `Tipo Precio`,`tbl_consecutivo`.`chr_consecutivo` AS `OrdenNR`,`tbl_ordenes`.`dt_horafecha_orden` AS `HoraFecha`,`tbl_ordenes`.`id_control_fecha` AS `Control Fecha`,`tbl_prods_x_orden`.`bool_activo` AS `Activo`,`tbl_prods_x_orden`.`bool_impreso` AS `Impreso` from ((((`tbl_prods_x_orden` left join `tbl_ordenes` on((`tbl_ordenes`.`id_orden_id` = `tbl_prods_x_orden`.`int_orden_id`))) left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_precios_productos` on(((`tbl_prods_x_orden`.`int_producto_id` = `tbl_precios_productos`.`id_producto`) and (`tbl_prods_x_orden`.`int_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`)))) left join `tbl_consecutivo` on((`tbl_ordenes`.`int_consecutivo` = `tbl_consecutivo`.`id_consecutivo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ordenes_x_mesero`
--

/*!50001 DROP VIEW IF EXISTS `vw_ordenes_x_mesero`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ordenes_x_mesero` AS select `tbl_ordenes_cerradas`.`id_orden_id` AS `ID Orden`,`tbl_ticket_cons`.`chr_ticketConsecutivo` AS `TicketNR`,`tbl_ordenes`.`int_nr_comanda` AS `Comanda`,`tbl_ordenes`.`dt_horafecha_orden` AS `Fecha y Hora`,`tbl_ordenes_cerradas`.`fl_total` AS `Total`,`tbl_mesas`.`chr_mesa` AS `Mesa`,`tbl_ordenes`.`chr_status_orden` AS `Estado`,`tbl_ordenes_cerradas`.`chr_referencia_notas` AS `Referencia`,`tbl_ordenes`.`id_control_fecha` AS `Control Fecha`,`tbl_ordenes_cerradas`.`int_lvl_report` AS `Indexed`,`tbl_formas_pago`.`chr_forma_pago` AS `Tipo Pago` from (((((`tbl_ordenes_cerradas` left join `tbl_ordenes` on((`tbl_ordenes`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`))) left join `tbl_ordenes_personal` on((`tbl_ordenes_personal`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`))) left join `tbl_ticket_cons` on((`tbl_ordenes_cerradas`.`id_ticket_IDNr` = `tbl_ticket_cons`.`id_ticketNrConsecutivo`))) left join `tbl_mesas` on((`tbl_ordenes`.`int_mesa` = `tbl_mesas`.`id_mesa_id`))) left join `tbl_formas_pago` on((`tbl_ordenes_cerradas`.`int_forma_pago` = `tbl_formas_pago`.`id_forma_pago`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_precios_productos`
--

/*!50001 DROP VIEW IF EXISTS `vw_precios_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_precios_productos` AS select `tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPXO`,`tbl_prods_x_orden`.`int_orden_id` AS `ID Orden`,`tbl_productos`.`id_producto` AS `ID Prod`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_prods_x_orden`.`int_tipo_precio` AS `Tipo Precio`,`tbl_precios_productos`.`dat_fecha_precio_activo` AS `Fecha Validez`,`tbl_precios_productos`.`bit_activo` AS `Activo` from ((`tbl_prods_x_orden` left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_precios_productos` on(((`tbl_prods_x_orden`.`int_producto_id` = `tbl_precios_productos`.`id_producto`) and (`tbl_prods_x_orden`.`int_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_prods_x_orden`
--

/*!50001 DROP VIEW IF EXISTS `vw_prods_x_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_prods_x_orden` AS select `tbl_prods_x_orden`.`int_orden_id` AS `Orden`,`tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPO`,`tbl_ordenes`.`int_nr_comanda` AS `Comanda`,`tbl_ticket_cons`.`chr_ticketConsecutivo` AS `Consecutivo`,`tbl_mesas`.`chr_mesa` AS `Mesa`,`tbl_productos`.`id_producto` AS `ID Prod`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_tipos_precios`.`id_tipo_precio` AS `Tipo Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `CHRTipoPrecio`,`tbl_ordenes`.`dt_horafecha_orden` AS `HoraFecha`,`tbl_ordenes`.`id_control_fecha` AS `Control Fecha`,`tbl_prods_x_orden`.`bool_activo` AS `Activo`,`tbl_prods_x_orden`.`bool_impreso` AS `Impreso`,`tbl_productos`.`fl_ordenar` AS `Ordenar` from ((((((`tbl_prods_x_orden` left join `tbl_ordenes` on((`tbl_ordenes`.`id_orden_id` = `tbl_prods_x_orden`.`int_orden_id`))) left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_precio_tipo_ordenes` on((`tbl_prods_x_orden`.`int_orden_id` = `tbl_precio_tipo_ordenes`.`id_orden`))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precio_tipo_ordenes`.`id_tipo_precio`))) left join `tbl_ticket_cons` on((`tbl_ordenes`.`int_consecutivo` = `tbl_ticket_cons`.`id_ticketNrConsecutivo`))) left join `tbl_mesas` on((`tbl_mesas`.`id_mesa_id` = `tbl_ordenes`.`int_mesa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_categoria` AS select `tbl_productos`.`id_producto` AS `id_producto`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_productos`.`int_activo` AS `Activo` from (`tbl_productos` left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_con_precio`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_con_precio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_con_precio` AS select `p`.`id_producto` AS `id_producto`,`p`.`chr_nombre_prod` AS `chr_nombre_prod`,`p`.`chr_desc_prod` AS `chr_desc_prod`,`p`.`chr_pic_prod_path` AS `chr_pic_prod_path`,`p`.`id_categoria` AS `id_categoria`,`p`.`int_activo` AS `int_activo`,`p`.`fl_ordenar` AS `fl_ordenar`,`p`.`id_grupo_def` AS `id_grupo_def`,`pp`.`dbl_precio` AS `precio_actual`,`tp`.`chr_nombre_precio` AS `tipo_precio`,`pp`.`dat_fecha_precio_activo` AS `dat_fecha_precio_activo` from (((`tbl_productos` `p` join (select `tbl_precios_productos`.`id_producto` AS `id_producto`,max(`tbl_precios_productos`.`dat_fecha_precio_activo`) AS `max_fecha` from `tbl_precios_productos` where (`tbl_precios_productos`.`bit_activo` = 1) group by `tbl_precios_productos`.`id_producto`) `subquery` on((`p`.`id_producto` = `subquery`.`id_producto`))) join `tbl_precios_productos` `pp` on(((`p`.`id_producto` = `pp`.`id_producto`) and (`pp`.`dat_fecha_precio_activo` = `subquery`.`max_fecha`)))) left join `tbl_tipos_precios` `tp` on((`pp`.`int_tipo_precio` = `tp`.`id_tipo_precio`))) where ((`p`.`int_activo` = 1) and (`pp`.`bit_activo` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_catprecio`
--

/*!50001 DROP VIEW IF EXISTS `vw_products_catprecio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_catprecio` AS select `tbl_precios_productos`.`id_precio` AS `ID Precio`,`tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Desc`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`fl_orden` AS `OrdCat`,`tbl_categorias`.`chr_desc_cat` AS `Tooltip`,`tbl_categorias`.`id_categoria` AS `CatID`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `Tipo`,`tbl_tipos_precios`.`id_tipo_precio` AS `IDTipo`,`tbl_productos`.`int_activo` AS `Activo`,`tbl_productos`.`fl_ordenar` AS `Ordenar`,`tbl_grupos_def`.`chr_nombre_grupo` AS `Agrupar` from ((((`tbl_productos` left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`))) left join `tbl_precios_productos` on((`tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`))) left join `tbl_grupos_def` on((`tbl_productos`.`id_grupo_def` = `tbl_grupos_def`.`id_grupos_def`))) where ((`tbl_productos`.`int_activo` = 1) and (`tbl_precios_productos`.`bit_activo` = 1) and (`tbl_tipos_precios`.`bit_activo` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_infoCat`
--

/*!50001 DROP VIEW IF EXISTS `vw_products_infoCat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_infoCat` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Descripcion`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`chr_desc_cat` AS `Tooltip`,`tbl_productos`.`int_activo` AS `Activo` from (`tbl_productos` left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_variantes_platillos_x_orden`
--

/*!50001 DROP VIEW IF EXISTS `vw_variantes_platillos_x_orden`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_variantes_platillos_x_orden` AS select `tbl_ordenes`.`id_orden_id` AS `ID Orden`,`tbl_productos`.`id_producto` AS `ID Producto`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_variantes_platillos`.`chr_variante_nombre` AS `Variante`,`tbl_prods_x_orden`.`bool_activo` AS `Activo` from ((((`tbl_ordenes` left join `tbl_prods_x_orden` on((`tbl_prods_x_orden`.`int_orden_id` = `tbl_ordenes`.`id_orden_id`))) left join `tbl_productos` on((`tbl_productos`.`id_producto` = `tbl_prods_x_orden`.`int_producto_id`))) left join `tbl_prods_orden_opciones` on((`tbl_prods_orden_opciones`.`id_prod_x_orden` = `tbl_prods_x_orden`.`id_prod_x_orden`))) left join `tbl_variantes_platillos` on((`tbl_variantes_platillos`.`id_variante_pl` = `tbl_prods_orden_opciones`.`id_variante_platillo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_variantes_x_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vw_variantes_x_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_variantes_x_categoria` AS select `tbl_variantes_categorias`.`id_variante_categoria` AS `ID`,`tbl_variantes_categorias`.`id_catgoria` AS `IDCAT`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_variantes_platillos`.`id_variante_pl` AS `IDVAR`,`tbl_variantes_platillos`.`chr_variante_nombre` AS `Variante` from ((`tbl_variantes_categorias` left join `tbl_categorias` on((`tbl_variantes_categorias`.`id_catgoria` = `tbl_categorias`.`id_categoria`))) left join `tbl_variantes_platillos` on((`tbl_variantes_platillos`.`id_variante_pl` = `tbl_variantes_categorias`.`id_variante_platillo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_variantes_x_platillo`
--

/*!50001 DROP VIEW IF EXISTS `vw_variantes_x_platillo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_variantes_x_platillo` AS select any_value(`tbl_prods_variantes`.`id_producto`) AS `ID Producto`,any_value(`tbl_productos`.`chr_nombre_prod`) AS `Producto`,any_value(`tbl_variantes_platillos`.`chr_variante_nombre`) AS `Variante`,any_value(`tbl_variantes_platillos`.`chr_variante_descripcion`) AS `Desc`,any_value(`tbl_prods_variantes`.`id_variante`) AS `ID Variante`,any_value(`tbl_prods_variantes`.`id_prods_variantes`) AS `IDProdVar`,any_value(`tbl_categorias`.`id_categoria`) AS `ID Cat`,any_value(ifnull(`tbl_costos_extra_var_prod`.`fl_costo_extra`,'0')) AS `Costo Extra`,any_value(ifnull(`tbl_precios_productos`.`int_tipo_precio`,'1')) AS `Tipo Precio`,any_value(`tbl_variantes_platillos`.`fl_ordenar`) AS `Ordenar`,any_value(`tbl_prods_variantes`.`int_activo`) AS `Activo` from (((((`tbl_productos` left join `tbl_prods_variantes` on((`tbl_prods_variantes`.`id_producto` = `tbl_productos`.`id_producto`))) left join `tbl_variantes_platillos` on((`tbl_prods_variantes`.`id_variante` = `tbl_variantes_platillos`.`id_variante_pl`))) left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`))) left join `tbl_precios_productos` on((`tbl_prods_variantes`.`id_producto` = `tbl_precios_productos`.`id_producto`))) left join `tbl_costos_extra_var_prod` on((`tbl_costos_extra_var_prod`.`id_producto_variante` = `tbl_prods_variantes`.`id_prods_variantes`))) where ((`tbl_prods_variantes`.`int_activo` = 1) and (`tbl_precios_productos`.`bit_activo` = 1)) */;
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

-- Dump completed on 2025-06-24  1:31:43
