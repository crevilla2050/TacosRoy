-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db_tacosroy_trujano
-- ------------------------------------------------------
-- Server version	8.0.27

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
  `chr_nombre_cat` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_cat` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fl_orden` float NOT NULL,
  `bit_visible` int NOT NULL DEFAULT '1',
  `bit_activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_categorias`
--

LOCK TABLES `tbl_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_categorias` DISABLE KEYS */;
INSERT INTO `tbl_categorias` VALUES (1,'Sin Categoria','Para productos sin categoria',1,1,1),
(2,'Tacos al Vapor','Tacos al vapor',2,1,1),
(3,'Tacos Ahogados','Tacos ahogados en salsa',3,1,1),
(4,'Tacos a la plancha','Tacos preparados a la plancha',4,1,1),
(5,'A la Plancha','Productos elaborados en plancha',5,1,1),
(6,'Preparados','Productos preparados varios (Pozole, Queso fundido, etc).',6,1,1),
(7,'Bebidas','Bebidas frías o calientes',7,1,1),
(8,'Postres','Postres y alimentos dulces',8,1,1),
(9,'Tostadas','Tostadas con diferentes carnes e ingredientes',4.5,1,1),
(10,'Pozole','Pozoles con diferentes tipos de carne',6.5,1,1),
(11,'Para llevar','Costos extra ordenes para llevar',9,1,1),
(12,'A Domicilio','Costos extra ordenes a domicilio',10,1,1),
(13,'Combos','Combos disponibles',8.5,1,1),
(14,'Producto Combo','Productos pertenecientes a un combo',11,0,1),
(15,'Ordenes de Carne','Ordenes de carne de res, cerdo o combinada, 1kg, 1/2 kg o 300 gr.',6.5,1,1);
/*!40000 ALTER TABLE `tbl_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_clientes`
--

DROP TABLE IF EXISTS `tbl_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `chr_nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_apellidos` varchar(145) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_telefono` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_email` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_direccion1` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_num_ext` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_num_int` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_direccion2` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_colonia` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_CP` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_municipio` varchar(145) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_ciudad` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_referencia` varchar(1024) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_longitud` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_latitud` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `chr_telefono_UNIQUE` (`chr_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_clientes`
--

LOCK TABLES `tbl_clientes` WRITE;
/*!40000 ALTER TABLE `tbl_clientes` DISABLE KEYS */;
/* INSERT INTO `tbl_clientes` VALUES (1,'Carlos','Revilla Maldonado','951-2987896','carlos.revilla.m@gmail.com','Morelos','1402','Altos','N/A','Centro','68000','Oaxaca de Juarez','Oaxaca','a 2 cuadras mercado merced casa blanca con azul','-96.717564','17.061454'),
(2,'Pedrito','Fernandez','951-1234567','feloaxaca@gmail.com','Calle Principal','201','N/A','N/A','Centro','68000','Oaxaca de Juarez','Oaxaca','Entre la casa blanca y la verde','-96.717564','17.061454'),
(3,'Doctor','Chunga','951-5555555',NULL,'Abasolo','420','N/A','N/A','Centro','68000','Oaxaca de Juarez','Oaxaca','Casa con perro echado al frente',NULL,NULL);*/
/*!40000 ALTER TABLE `tbl_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_combos`
--

DROP TABLE IF EXISTS `tbl_combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_combos` (
  `id_combo` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_combo` varchar(128) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_producto_relacionado` int NOT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_combo`),
  KEY `index2` (`id_producto_relacionado`),
  CONSTRAINT `fk_tbl_combos_1` FOREIGN KEY (`id_producto_relacionado`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_combos`
--

LOCK TABLES `tbl_combos` WRITE;
/*!40000 ALTER TABLE `tbl_combos` DISABLE KEYS */;
INSERT INTO `tbl_combos` VALUES (1,'Paquete de Todo un Poco',112,1),
(2,NULL,168,1),
(3,NULL,290,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_combos_ordenes`
--

LOCK TABLES `tbl_combos_ordenes` WRITE;
/*!40000 ALTER TABLE `tbl_combos_ordenes` DISABLE KEYS */;
INSERT INTO `tbl_combos_ordenes` VALUES (1,103,112,114,487),
(2,103,112,115,488),
(3,86,112,114,490),
(4,86,112,115,491),
(5,90,112,114,493),
(6,90,112,115,494),
(9,108,112,498,499),
(10,108,112,498,500);
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
  `chr_var_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_var_value` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_configs`
--

LOCK TABLES `tbl_configs` WRITE;
/*!40000 ALTER TABLE `tbl_configs` DISABLE KEYS */;
INSERT INTO `tbl_configs` VALUES (1,'CombosCategory','13'),
(2,'personal_index','3'),
(3,'email_host','smtpout.secureserver.net'),
(4,'email_user','pedidos@tacosroy.com'),
(5,'email_password','.tacos1965.');
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consecutivo`
--

LOCK TABLES `tbl_consecutivo` WRITE;
/*!40000 ALTER TABLE `tbl_consecutivo` DISABLE KEYS */;
INSERT INTO `tbl_consecutivo` VALUES (1,1);
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
  `chr_control` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_control_fechas`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_costos_extra_var_prod`
--

LOCK TABLES `tbl_costos_extra_var_prod` WRITE;
/*!40000 ALTER TABLE `tbl_costos_extra_var_prod` DISABLE KEYS */;
INSERT INTO `tbl_costos_extra_var_prod` VALUES (1,2217,17,10,1),
(2,2190,18,10,2),
(3,2214,18,5,1),
(4,2148,18,5,2),
(5,2150,18,5,1),
(6,2152,18,10,2),
(7,2155,18,5,2),
(8,2157,18,5,1),
(9,2159,18,10,2),
(10,876,18,5,1),
(11,877,18,5,1),
(12,876,18,5,2),
(13,877,18,5,2),
(14,1228,18,0,1),
(15,1228,18,0,2),
(16,1229,18,0,1),
(17,1229,18,0,2),
(18,1231,18,0,1),
(19,1231,18,0,2),
(20,1245,18,0,1),
(21,1245,18,0,2),
(22,1246,18,0,1),
(23,1246,18,0,2),
(24,1248,18,0,1),
(25,1248,18,0,2),
(26,1287,18,0,1),
(27,1287,18,0,2),
(28,1288,18,0,1),
(29,1288,18,0,2),
(30,1311,18,0,1),
(31,1311,18,0,2),
(32,1312,18,0,1),
(33,1312,18,0,2),
(34,1314,18,0,1),
(35,1314,18,0,2),
(36,1337,18,0,1),
(37,1337,18,0,2),
(38,1338,18,0,1),
(39,1338,18,0,2),
(40,1369,18,0,1),
(41,1369,18,0,2),
(42,1370,18,0,1),
(43,1370,18,0,2),
(44,1372,18,0,1),
(45,1372,18,0,2),
(46,1403,18,0,1),
(47,1403,18,0,2),
(48,1404,18,0,1),
(49,1404,18,0,2),
(50,1406,18,0,1),
(51,1406,18,0,2),
(52,1421,18,0,1),
(53,1421,18,0,2),
(54,1422,18,0,1),
(55,1422,18,0,2),
(56,1424,18,0,1),
(57,1424,18,0,2),
(58,1157,18,0,1),
(59,1157,18,0,2),
(60,1066,18,5,1),
(61,1066,18,5,2),
(62,1067,18,5,1),
(63,1067,18,5,2),
(64,1075,18,5,1),
(65,1075,18,5,2),
(66,1076,18,5,1),
(67,1076,18,5,2),
(68,857,18,5,1),
(69,857,18,5,2),
(70,1058,18,5,1),
(71,1058,18,5,2),
(72,1059,18,5,1),
(73,1059,18,5,2),
(74,2148,18,5,1),
(75,191,25,5,1),
(76,191,25,5,2),
(77,192,25,5,1),
(78,192,25,5,2),
(79,193,25,5,1),
(80,193,25,5,2),
(81,194,25,5,1),
(82,194,25,5,2),
(83,195,25,0,1),
(84,195,25,0,2),
(85,196,18,5,1),
(86,196,18,5,2),
(87,197,25,0,1),
(88,197,25,0,2),
(89,210,18,5,1),
(90,210,18,5,2),
(91,211,18,5,1),
(92,211,18,5,2),
(93,213,18,5,1),
(94,213,18,5,2),
(95,214,18,5,1),
(96,214,18,5,2),
(97,270,18,5,1),
(98,270,18,5,2),
(99,322,18,5,1),
(100,322,18,5,2),
(101,326,18,5,1),
(102,326,18,5,2),
(103,330,18,5,1),
(104,330,18,5,2),
(105,334,18,5,1),
(106,334,18,5,2),
(107,338,18,5,1),
(108,338,18,5,2),
(109,342,18,5,1),
(110,342,18,5,2),
(111,346,18,5,1),
(112,346,18,5,2),
(113,350,18,5,1),
(114,350,18,5,2),
(115,354,18,5,1),
(116,354,18,5,2),
(117,358,18,5,1),
(118,358,18,5,2),
(119,362,18,5,1),
(120,362,18,5,2),
(121,412,18,5,1),
(122,412,18,5,2),
(123,415,18,5,1),
(124,415,18,5,2),
(125,417,18,5,1),
(126,417,18,5,2),
(127,418,18,5,1),
(128,418,18,5,2),
(129,419,18,5,1),
(130,419,18,5,2),
(131,420,35,0,1),
(132,420,18,5,2),
(133,442,18,5,1),
(134,442,18,5,2),
(135,462,18,5,1),
(136,462,18,5,2),
(137,463,18,5,1),
(138,463,18,5,2),
(139,470,18,5,1),
(140,470,18,5,2),
(141,473,18,5,1),
(142,473,18,5,2),
(143,490,18,5,1),
(144,490,18,5,2),
(145,493,18,5,1),
(146,493,18,5,2),
(147,509,18,5,1),
(148,509,18,5,2),
(149,512,18,5,1),
(150,512,18,5,2),
(151,558,18,5,1),
(152,558,18,5,2),
(153,559,18,5,1),
(154,559,18,5,2),
(155,561,18,10,1),
(156,561,18,10,2),
(157,577,18,5,1),
(158,577,18,5,2),
(159,578,18,5,1),
(160,578,18,5,2),
(161,580,18,10,1),
(162,580,18,10,2),
(163,583,18,5,1),
(164,583,18,5,2),
(165,584,18,5,1),
(166,584,18,5,2),
(167,587,18,5,1),
(168,587,18,5,2),
(169,588,18,5,1),
(170,588,18,5,2),
(171,589,18,5,1),
(172,589,18,5,2),
(173,590,18,5,1),
(174,590,18,5,2),
(175,591,18,5,1),
(176,591,18,5,2),
(177,592,18,5,1),
(178,592,18,5,2),
(179,593,18,5,1),
(180,593,18,5,2),
(181,594,18,5,1),
(182,594,18,5,2),
(183,782,18,5,1),
(184,782,18,5,2),
(185,783,18,5,1),
(186,783,18,5,2),
(187,785,18,10,1),
(188,785,18,10,2),
(189,786,24,5,1),
(190,786,18,5,2),
(191,787,24,5,1),
(192,787,18,5,2),
(193,789,24,10,1),
(194,789,18,10,2),
(195,792,18,5,1),
(196,792,18,5,2),
(197,793,18,5,1),
(198,793,18,5,2),
(199,827,18,5,1),
(200,827,18,5,2),
(201,828,18,5,1),
(202,828,18,5,2),
(203,834,18,5,1),
(204,834,18,5,2),
(205,835,18,5,1),
(206,835,18,5,2),
(207,924,18,5,1),
(208,924,18,5,2),
(209,925,18,5,1),
(210,925,18,5,2),
(211,962,18,5,1),
(212,962,18,5,2),
(213,963,18,5,1),
(214,963,18,5,2),
(215,970,18,5,1),
(216,970,18,5,2),
(217,971,18,5,1),
(218,971,18,5,2),
(219,978,18,5,1),
(220,978,18,5,2),
(221,979,18,5,1),
(222,979,18,5,2),
(223,986,18,5,1),
(224,986,18,5,2),
(225,987,18,5,1),
(226,987,18,5,2),
(227,994,18,5,1),
(228,994,18,5,2),
(229,995,18,5,1),
(230,995,18,5,2),
(231,1042,18,5,1),
(232,1042,18,5,2),
(233,1043,18,5,1),
(234,1043,18,5,2),
(235,1050,18,5,1),
(236,1050,18,5,2),
(237,1051,18,5,1),
(238,1051,18,5,2),
(239,1108,18,5,1),
(240,1108,18,5,2),
(241,1109,18,5,1),
(242,1109,18,5,2),
(243,1116,18,5,1),
(244,1116,18,5,2),
(245,1117,18,5,1),
(246,1117,18,5,2),
(247,1124,18,5,1),
(248,1124,18,5,2),
(249,1125,18,5,1),
(250,1125,18,5,2),
(251,1132,18,5,1),
(252,1132,18,5,2),
(253,1133,18,5,1),
(254,1133,18,5,2),
(255,1142,18,0,1),
(256,1142,18,0,2),
(257,1143,18,0,1),
(258,1143,18,0,2),
(259,1263,18,0,1),
(260,1263,18,0,2),
(261,1264,18,0,1),
(262,1264,18,0,2),
(263,1295,18,0,1),
(264,1295,18,0,2),
(265,1296,18,0,1),
(266,1296,18,0,2),
(267,1303,18,0,1),
(268,1303,18,0,2),
(269,1304,18,0,1),
(270,1304,18,0,2),
(271,1321,18,0,1),
(272,1321,18,0,2),
(273,1322,18,0,1),
(274,1322,18,0,2),
(275,1361,18,0,1),
(276,1361,18,0,2),
(277,1362,18,0,1),
(278,1362,18,0,2),
(279,1395,18,0,1),
(280,1395,18,0,2),
(281,1396,18,0,1),
(282,1396,18,0,2),
(283,1413,18,0,1),
(284,1413,18,0,2),
(285,1414,18,0,1),
(286,1414,18,0,2),
(287,1431,18,0,1),
(288,1431,18,0,2),
(289,1432,18,0,1),
(290,1432,18,0,2),
(291,1439,18,0,1),
(292,1439,18,0,2),
(293,1440,18,0,1),
(294,1440,18,0,2),
(295,1447,18,0,1),
(296,1447,18,0,2),
(297,1448,18,0,1),
(298,1448,18,0,2),
(299,1455,18,0,1),
(300,1455,18,0,2),
(301,1456,18,0,1),
(302,1456,18,0,2),
(303,1487,18,0,1),
(304,1487,18,0,2),
(305,1488,18,0,1),
(306,1488,18,0,2),
(307,1495,18,0,1),
(308,1495,18,0,2),
(309,1496,18,0,1),
(310,1496,18,0,2),
(311,1503,18,0,1),
(312,1503,18,0,2),
(313,1504,18,0,1),
(314,1504,18,0,2),
(315,1511,18,0,1),
(316,1511,18,0,2),
(317,1512,18,0,1),
(318,1512,18,0,2),
(319,1519,18,0,1),
(320,1519,18,0,2),
(321,1520,18,0,1),
(322,1520,18,0,2),
(323,1555,18,5,1),
(324,1555,18,5,2),
(325,1556,18,5,1),
(326,1556,18,5,2),
(327,1572,18,5,1),
(328,1572,18,5,2),
(329,1595,18,5,1),
(330,1595,18,5,2),
(331,1596,18,5,1),
(332,1596,18,5,2),
(333,1603,18,5,1),
(334,1603,18,5,2),
(335,1604,18,5,1),
(336,1604,18,5,2),
(337,1635,18,5,1),
(338,1635,18,5,2),
(339,1636,18,5,1),
(340,1636,18,5,2),
(341,1643,18,5,1),
(342,1643,18,5,2),
(343,1644,18,5,1),
(344,1644,18,5,2),
(345,1651,18,5,1),
(346,1651,18,5,2),
(347,1652,18,5,1),
(348,1652,18,5,2),
(349,1668,18,5,1),
(350,1668,18,5,2),
(351,1700,18,5,1),
(352,1700,18,5,2),
(353,1732,18,5,1),
(354,1732,18,5,2),
(355,1763,18,5,1),
(356,1763,18,5,2),
(357,1764,18,5,1),
(358,1764,18,5,2),
(359,1780,18,5,1),
(360,1780,18,5,2),
(361,1814,18,5,1),
(362,1814,18,5,2),
(363,1815,18,5,1),
(364,1815,18,5,2),
(365,1832,18,5,1),
(366,1832,18,5,2),
(367,1833,18,5,1),
(368,1833,18,5,2),
(369,1848,18,5,1),
(370,1848,18,5,2),
(371,1849,18,5,1),
(372,1849,18,5,2),
(373,1907,23,5,1),
(374,1907,23,5,2),
(375,1908,23,5,1),
(376,1908,23,5,2),
(377,1923,18,5,1),
(378,1923,18,5,2),
(379,1924,18,5,1),
(380,1924,18,5,2),
(381,1939,18,5,1),
(382,1939,18,5,2),
(383,1940,18,5,1),
(384,1940,18,5,2),
(385,1955,18,5,1),
(386,1955,18,5,2),
(387,1956,18,5,1),
(388,1956,18,5,2),
(389,1963,18,5,1),
(390,1963,18,5,2),
(391,1964,18,5,1),
(392,1964,18,5,2),
(393,1982,18,5,1),
(394,1982,18,5,2),
(395,1983,18,5,1),
(396,1983,18,5,2),
(397,1989,18,5,1),
(398,1989,18,5,2),
(399,1990,18,5,1),
(400,1990,18,5,2),
(401,1996,18,5,1),
(402,1996,18,5,2),
(403,1997,18,5,1),
(404,1997,18,5,2),
(405,2010,18,5,1),
(406,2010,18,5,2),
(407,2011,18,5,1),
(408,2011,18,5,2),
(409,2039,18,5,1),
(410,2039,18,5,2),
(411,2040,18,5,1),
(412,2040,18,5,2),
(413,2053,18,5,1),
(414,2053,18,5,2),
(415,2054,18,5,1),
(416,2054,18,5,2),
(417,2067,28,5,1),
(418,2067,18,5,2),
(419,2068,28,5,1),
(420,2068,18,5,2),
(421,2081,18,5,1),
(422,2081,18,5,2),
(423,2082,18,5,1),
(424,2082,18,5,2),
(425,2097,18,5,1),
(426,2097,18,5,2),
(427,2098,18,5,1),
(428,2098,18,5,2),
(429,2107,18,5,1),
(430,2107,18,5,2),
(431,2108,18,5,1),
(432,2108,18,5,2),
(433,2145,18,5,1),
(434,2145,18,5,2),
(435,2146,18,5,1),
(436,2146,18,5,2),
(437,2150,18,5,2),
(438,2152,18,10,1),
(439,2155,18,5,1),
(440,2157,18,5,2),
(441,2159,18,10,1),
(442,2162,23,5,1),
(443,2162,18,5,2),
(444,2163,23,5,1),
(445,2163,18,5,2),
(446,2165,23,0,1),
(447,2165,18,10,2),
(448,2182,23,5,1),
(449,2182,18,5,2),
(450,2183,23,5,1),
(451,2183,18,5,2),
(452,2185,23,0,1),
(453,2185,18,10,2),
(454,2187,23,5,1),
(455,2187,18,5,2),
(456,2188,23,5,1),
(457,2188,18,5,2),
(458,2190,18,10,1),
(459,2191,18,5,1),
(460,2191,18,5,2),
(461,2193,18,5,1),
(462,2193,18,5,2),
(463,2195,18,10,1),
(464,2195,18,10,2),
(465,2204,23,5,1),
(466,2204,18,5,2),
(467,2206,23,5,1),
(468,2206,18,5,2),
(469,2208,23,0,1),
(470,2208,18,10,2),
(471,2214,18,5,2),
(472,2215,18,5,1),
(473,2215,18,5,2),
(474,2218,18,10,1),
(475,2218,18,10,2),
(478,2221,22,5,2),
(479,2228,22,5,1),
(480,2228,22,5,2),
(481,2244,23,20,1),
(482,2244,23,20,2),
(483,2244,23,40,1),
(484,2244,23,40,2),
(485,2238,23,20,3),
(486,2238,23,20,2),
(487,2236,23,20,1),
(488,2236,23,20,2),
(489,2244,23,40,1),
(490,2244,23,40,2),
(491,2245,23,40,1),
(492,2245,23,40,2),
(493,2249,24,10,1),
(494,2249,23,10,2),
(495,2251,24,0,1),
(496,2251,23,10,2),
(497,2257,23,20,2),
(498,2257,24,20,1),
(499,2258,24,20,1),
(500,2258,23,20,2),
(501,2254,24,10,1),
(502,2254,23,10,2),
(503,2272,24,20,1),
(505,2260,24,10,1),
(506,2266,24,10,1),
(507,2268,24,10,1),
(508,2269,24,10,1),
(509,2252,24,10,1),
(510,2255,24,10,1),
(511,2275,24,0,1),
(512,2276,25,0,1),
(513,2277,25,0,1),
(514,2278,25,0,1),
(515,2279,25,0,1),
(516,2280,25,0,1),
(517,2281,25,0,1),
(518,2282,25,0,1),
(519,2283,25,0,1),
(520,2284,25,5,1),
(521,2288,25,10,1),
(522,2294,25,5,1),
(523,2288,25,10,2),
(524,2294,25,5,2),
(525,2284,25,5,2),
(526,2299,25,5,1),
(527,2305,25,5,1),
(528,2299,25,6,2),
(529,2305,25,5,2),
(530,2306,25,5,1),
(531,2306,25,5,2),
(532,2309,25,5,1),
(533,2315,25,5,1),
(534,2309,25,7,2),
(535,2315,25,5,2),
(536,2330,25,5,1),
(537,2335,25,0,1),
(538,2336,25,0,1),
(539,2330,25,6,2),
(540,2474,28,5,1),
(541,2475,28,5,1),
(542,2474,28,5,2),
(543,2475,28,5,2),
(544,2419,23,0,1),
(545,2209,23,0,1),
(546,2420,23,0,1),
(547,2421,23,0,1),
(548,2422,23,0,1),
(549,2423,23,0,1);
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
  `chr_nombre` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir1` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir2` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir3` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono1` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono2` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario_encargado` int NOT NULL,
  `dt_inicio_operaciones` date DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_datos_sucursal`
--

LOCK TABLES `tbl_datos_sucursal` WRITE;
/*!40000 ALTER TABLE `tbl_datos_sucursal` DISABLE KEYS */;
INSERT INTO `tbl_datos_sucursal` VALUES (1,'Tacos Roy Azucenas','Calle Azucenas 200','Col. Reforma','CP. 68050, Oaxaca, Oaxaca.','9511722708','000000000',0,'2021-04-01'),
(2,'asdfasd','asdfasdf','asdfasd','asdfasdf','3216545','321654',1,NULL);
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
  `chr_nr_factura` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_realizada` int DEFAULT '0',
  PRIMARY KEY (`id_factura`),
  KEY `index2` (`id_orden`),
  CONSTRAINT `fk_tbl_facturas_1` FOREIGN KEY (`id_orden`) REFERENCES `tbl_ordenes_cerradas` (`id_orden_cerrada`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_forma_pago` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `fl_comision_extra` float DEFAULT '0',
  `int_activo` int DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_formas_pago`
--

LOCK TABLES `tbl_formas_pago` WRITE;
/*!40000 ALTER TABLE `tbl_formas_pago` DISABLE KEYS */;
INSERT INTO `tbl_formas_pago` VALUES (1,'Efectivo',0,1),
(2,'Descuento',0,1),
(3,'Empleado/Cortesia',0,1),
(4,'Tarjeta Deb/Cred',0,1);
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
  `chr_concepto_gasto` varchar(1024) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario_auth` int NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `id_usuario_auth` (`id_usuario_auth`),
  CONSTRAINT `tbl_gastos_ibfk_1` FOREIGN KEY (`id_usuario_auth`) REFERENCES `tbl_usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_nombre_grupo` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_grupos_def`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_grupos_def`
--

LOCK TABLES `tbl_grupos_def` WRITE;
/*!40000 ALTER TABLE `tbl_grupos_def` DISABLE KEYS */;
INSERT INTO `tbl_grupos_def` VALUES (1,'Tacos de cerdo Maiz',1),
(3,'Tacos de cerdo HARINA',2),
(4,'Tostadas de cerdo',3);
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
  `chr_nombre_insumo` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_descripcion` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `bit_activo` int DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_insumos`
--

LOCK TABLES `tbl_insumos` WRITE;
/*!40000 ALTER TABLE `tbl_insumos` DISABLE KEYS */;
INSERT INTO `tbl_insumos` VALUES (1,'Tortilla','Tortilla de Maiz',1),
(2,'Tortilla de harina','Tortilla de harina de trigo',1),
(3,'Tostada','Tostada frita para acompañar alimentos',1),
(4,'Pepsi','Refresco Pepsi',0),
(5,'Squirt','Refresco Squirt',0),
(6,'Mirinda','Refresco Mirinda',0),
(7,'Sangría','Refresco Sangría',0),
(8,'Cerveza Normal','Cerveza normal',1),
(9,'Cerveza Victoria','Cerveza Victoria',0),
(10,'Cerveza Corona Light','Cerveza Corona Ligh',0),
(11,'Cerveza León','Cerveza León',0),
(12,'Cerveza Pacífico','Cerveza Pacífico',0),
(13,'Cerveza Montejo','Cerveza Montejo',0),
(14,'Cerveza Modelo Especial','Cerveza Modelo Especial',0),
(15,'Cerveza Barrilito','Cerveza Barrilito',0),
(16,'Cerveza Superior','Cerveza Superior',1),
(17,'Cerveza Premium','Cerveza Premium',1),
(18,'Panqué de Elote, Rebanada','Rebanada de Panqué de elote',1),
(19,'Flan','Flan',1),
(20,'Pastel de Queso','Pastel de Queso',1),
(21,'Agua Emb. 1/2 Litro','Botella de agua de Medio litro',0),
(22,'Agua Emb. 1 Litro','Botella de agua embotellada de 1 litro',0),
(23,'Jugo Boing','Jugos boing de varios sabores',0),
(24,'Cerveza Stella Artois','Cerveza Stella Artois',0),
(25,'7 Up','Refresco 7 Up',0),
(26,'Agua Mineral','Agua Mineral',0),
(27,'Manzanita Sol','Refresco Manzanita Sol',0),
(28,'Boing','Boing',0),
(29,'Cerveza Negra Modelo','Cerveza Negra Modelo',0),
(30,'Cerveza Bohemia','Cerveza Bohemia',0),
(31,'Cerveza Modelo Especial (Lata)','Cerveza Modelo Especial (Lata)',0),
(32,'Refresco Coca Cola','Refresco Coca Cola',1),
(33,'Refresco Sabor','Refresco de sabor',1),
(34,'Sidral','Sidral',0),
(35,'Sprite','Sprite',0),
(36,'Fresca','Fresca',0),
(37,'Sangria','Sangria',0),
(38,'Jugo del Valle','Jugo del Valle',0),
(39,'Agua Ciel 600 ml','Agua Ciel 600 ml',1),
(40,'Cerveza Negra Modelo','Cerveza Negra Modelo',0),
(41,'Cerveza Cucapa','Cerveza Cucapa',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_insumos_x_platillo`
--

LOCK TABLES `tbl_insumos_x_platillo` WRITE;
/*!40000 ALTER TABLE `tbl_insumos_x_platillo` DISABLE KEYS */;
INSERT INTO `tbl_insumos_x_platillo` VALUES (1,48,25,1),
(2,50,26,1),
(3,89,22,1),
(4,53,21,1),
(5,11,1,1),
(6,16,1,1),
(7,14,1,1),
(8,9,1,1),
(9,33,2,1),
(10,8,1,1),
(11,91,24,1),
(12,13,1,1),
(13,30,2,1),
(14,7,1,1),
(15,6,1,1),
(16,5,1,1),
(17,49,27,1),
(18,46,6,1),
(19,10,1,1),
(20,15,1,1),
(21,17,1,1),
(22,34,1,1),
(23,35,1,1),
(24,45,4,1),
(25,31,2,1),
(26,76,1,1),
(27,79,1,1),
(28,74,1,1),
(29,73,1,1),
(30,78,1,1),
(31,75,1,1),
(32,77,1,1),
(33,72,1,1),
(34,71,1,1),
(35,70,1,1),
(36,80,1,1),
(37,25,1,1),
(38,32,3,1),
(39,36,3,1),
(40,59,3,1),
(41,62,3,1),
(42,68,3,1),
(43,61,3,1),
(44,63,3,1),
(45,69,3,1),
(46,65,3,1),
(47,64,3,1),
(48,67,3,1),
(49,66,3,1),
(50,60,3,1),
(51,57,3,1),
(52,58,3,1),
(53,12,1,1),
(54,54,18,1),
(55,56,20,1),
(56,47,7,1),
(57,55,19,1),
(58,97,28,1),
(59,99,15,1),
(60,100,29,1),
(61,94,30,1),
(62,92,8,1),
(63,98,10,1),
(64,101,14,1),
(65,93,9,1),
(66,103,16,1),
(67,102,31,1),
(68,106,2,1),
(69,20,1,6),
(70,21,1,6),
(71,166,1,6),
(72,18,1,6),
(73,19,1,6),
(74,22,1,6),
(75,23,1,6),
(76,24,1,6),
(77,165,1,6),
(78,166,1,6),
(79,167,1,6),
(80,70,1,1),
(81,71,1,1),
(82,72,1,1),
(83,73,1,1),
(84,74,1,1),
(85,75,1,1),
(86,76,1,1),
(87,77,1,1),
(88,78,1,1),
(89,80,1,1),
(90,117,1,1),
(91,118,1,1),
(92,119,1,1),
(93,120,1,1),
(94,121,1,1),
(95,122,1,1),
(96,123,1,1),
(97,124,1,1),
(98,125,1,1),
(99,126,2,1),
(100,127,2,1),
(101,128,2,1),
(102,129,2,1),
(103,130,2,1),
(104,131,2,1),
(105,59,3,1),
(106,148,3,1),
(107,149,3,1),
(108,150,3,1),
(109,151,3,1),
(110,152,3,1),
(111,153,3,1),
(112,154,3,1),
(113,155,3,1),
(114,156,3,1),
(115,157,3,1),
(116,158,3,1),
(117,159,3,1),
(118,160,3,1),
(119,179,3,1),
(120,28,1,4),
(121,29,1,4),
(122,30,2,2),
(123,31,2,2),
(124,33,2,1),
(125,34,2,2),
(126,35,2,2),
(127,174,1,4),
(128,81,3,2),
(129,82,3,2),
(130,83,3,2),
(131,84,3,2),
(132,85,3,2),
(133,86,3,2),
(134,87,3,2),
(135,88,3,2),
(136,161,3,2),
(137,162,3,2),
(138,163,3,2),
(139,164,3,2),
(140,180,3,2),
(141,109,1,24),
(142,116,1,12),
(143,168,1,6),
(144,46,33,1),
(145,53,39,1),
(146,91,8,1),
(147,92,16,1),
(148,93,17,1),
(149,113,32,1),
(150,13,1,2),
(151,13,20,2),
(152,34,20,2),
(153,34,20,2),
(154,36,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_mesa` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `int_nr_personas` int NOT NULL,
  `bit_mesa_activa` tinyint NOT NULL,
  `bit_domicilio` int DEFAULT '0',
  PRIMARY KEY (`id_mesa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mesas`
--

LOCK TABLES `tbl_mesas` WRITE;
/*!40000 ALTER TABLE `tbl_mesas` DISABLE KEYS */;
INSERT INTO `tbl_mesas` VALUES (1,'1',4,1,0),
(2,'2',4,1,0),
(3,'3',5,1,0),
(4,'4',4,1,0),
(5,'5',6,1,0),
(6,'6',4,1,0),
(7,'7',6,1,0),
(8,'8',5,1,0),
(9,'9',4,1,0),
(10,'10',5,1,0),
(11,'11',1,1,0),
(12,'12',1,1,0),
(13,'13',6,1,0),
(14,'14',6,1,0),
(15,'15',6,1,0),
(16,'Para llevar',1,1,0),
(17,'A domicilio',1,1,1),
(18,'Temporal',1,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_status_orden` varchar(25) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_control_fecha` int NOT NULL,
  PRIMARY KEY (`id_orden_id`),
  KEY `int_mesa` (`int_mesa`),
  KEY `int_consecutivo` (`int_consecutivo`),
  KEY `index4` (`id_control_fecha`),
  CONSTRAINT `fk_tbl_ordenes_1` FOREIGN KEY (`int_mesa`) REFERENCES `tbl_mesas` (`id_mesa_id`),
  CONSTRAINT `fk_tbl_ordenes_2` FOREIGN KEY (`int_consecutivo`) REFERENCES `tbl_consecutivo` (`id_consecutivo`),
  CONSTRAINT `fk_tbl_ordenes_3` FOREIGN KEY (`id_control_fecha`) REFERENCES `tbl_control_fechas` (`id_control_fechas`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_referencia_notas` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_nombre_persona` varchar(32) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_apellidos` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_CURP` varchar(18) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `int_puesto` int NOT NULL,
  `bit_activo` int NOT NULL,
  PRIMARY KEY (`id_personal`),
  KEY `int_puesto` (`int_puesto`),
  CONSTRAINT `tbl_personal_ibfk_1` FOREIGN KEY (`int_puesto`) REFERENCES `tbl_puestos` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_personal`
--

LOCK TABLES `tbl_personal` WRITE;
/*!40000 ALTER TABLE `tbl_personal` DISABLE KEYS */;
INSERT INTO `tbl_personal` VALUES (1,'Administrador','De la sucursal','ABCDUFIDUSOAISDUFO','1234567890',1,1),
(2,'Cajero principal','De la sucursal','CAJEROJDKFJSLDFJLA','9876543210',2,1),
(3,'Mesero','De la sucursal','MESERO34238947J','1234567890',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=1375 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_precios_productos`
--

LOCK TABLES `tbl_precios_productos` WRITE;
/*!40000 ALTER TABLE `tbl_precios_productos` DISABLE KEYS */;
INSERT INTO `tbl_precios_productos` VALUES (1,5,11.00,1,0,'2020-09-15 00:00:00'),
(2,6,10.00,1,0,'2020-09-15 00:00:00'),
(3,0,10.00,1,1,'2020-09-15 00:00:00'),
(4,7,10.00,1,0,'2020-09-15 00:00:00'),
(5,8,10.00,1,0,'2020-09-15 00:00:00'),
(6,9,10.00,1,0,'2020-09-15 00:00:00'),
(7,10,10.00,1,0,'2020-09-15 00:00:00'),
(8,11,10.00,1,0,'2020-09-15 00:00:00'),
(9,12,10.00,1,0,'2020-09-15 00:00:00'),
(10,13,10.00,1,0,'2020-09-15 00:00:00'),
(11,14,12.00,1,0,'2020-09-15 00:00:00'),
(12,15,10.00,1,0,'2020-09-15 00:00:00'),
(13,16,15.00,1,0,'2020-09-15 00:00:00'),
(14,17,15.00,1,0,'2020-09-15 00:00:00'),
(15,18,80.00,1,0,'2020-09-15 00:00:00'),
(16,19,80.00,1,0,'2020-09-15 00:00:00'),
(17,20,75.00,1,0,'2020-09-15 00:00:00'),
(18,21,80.00,1,0,'2020-09-15 00:00:00'),
(19,22,75.00,1,0,'2020-09-15 00:00:00'),
(20,23,75.00,1,0,'2020-09-15 00:00:00'),
(21,24,75.00,1,0,'2020-09-15 00:00:00'),
(22,25,1.00,1,1,'2020-09-15 00:00:00'),
(23,26,45.00,1,1,'2020-09-15 00:00:00'),
(24,27,40.00,1,1,'2020-09-15 00:00:00'),
(25,28,40.00,1,0,'2020-09-15 00:00:00'),
(26,29,45.00,1,0,'2020-09-15 00:00:00'),
(27,30,27.00,1,0,'2020-09-15 00:00:00'),
(28,31,27.00,1,0,'2020-09-15 00:00:00'),
(29,32,24.00,1,1,'2020-09-15 00:00:00'),
(30,33,22.00,1,0,'2020-09-15 00:00:00'),
(31,34,22.00,1,0,'2020-09-15 00:00:00'),
(32,35,27.00,1,0,'2020-09-15 00:00:00'),
(33,36,2.00,1,1,'2020-09-15 00:00:00'),
(34,37,17.00,1,0,'2020-09-15 00:00:00'),
(35,38,50.00,1,0,'2020-09-15 00:00:00'),
(36,39,17.00,1,0,'2020-09-15 00:00:00'),
(37,40,50.00,1,1,'2020-09-15 00:00:00'),
(38,41,17.00,1,1,'2020-09-15 00:00:00'),
(39,42,50.00,1,1,'2020-09-15 00:00:00'),
(40,43,17.00,1,1,'2020-09-15 00:00:00'),
(41,44,50.00,1,1,'2020-09-15 00:00:00'),
(42,45,17.00,1,0,'2020-09-15 00:00:00'),
(43,46,17.00,1,0,'2020-09-15 00:00:00'),
(44,47,17.00,1,0,'2020-09-15 00:00:00'),
(45,48,17.00,1,0,'2020-09-15 00:00:00'),
(46,49,17.00,1,0,'2020-09-15 00:00:00'),
(47,50,17.00,1,0,'2020-09-15 00:00:00'),
(48,51,15.00,1,0,'2020-09-15 00:00:00'),
(49,52,15.00,1,0,'2020-09-15 00:00:00'),
(50,53,12.00,1,1,'2020-09-15 00:00:00'),
(51,54,25.00,1,0,'2020-09-15 00:00:00'),
(52,55,25.00,1,0,'2020-09-15 00:00:00'),
(53,56,30.00,1,0,'2020-09-15 00:00:00'),
(54,57,24.00,1,0,'2020-09-15 00:00:00'),
(55,58,24.00,1,0,'2020-09-15 00:00:00'),
(56,59,24.00,1,0,'2020-09-15 00:00:00'),
(57,60,24.00,1,0,'2020-09-15 00:00:00'),
(58,61,24.00,1,0,'2020-09-15 00:00:00'),
(59,62,24.00,1,0,'2020-09-15 00:00:00'),
(60,63,24.00,1,1,'2020-09-15 00:00:00'),
(61,64,24.00,1,0,'2020-09-15 00:00:00'),
(62,65,24.00,1,0,'2020-09-15 00:00:00'),
(63,66,24.00,1,0,'2020-09-15 00:00:00'),
(64,67,24.00,1,0,'2020-09-15 00:00:00'),
(65,68,24.00,1,0,'2020-09-15 00:00:00'),
(66,69,24.00,1,0,'2020-09-15 00:00:00'),
(68,71,10.00,1,0,'2020-09-15 00:00:00'),
(69,72,10.00,1,0,'2020-09-15 00:00:00'),
(70,73,10.00,1,0,'2020-09-15 00:00:00'),
(71,74,10.00,1,0,'2020-09-15 00:00:00'),
(72,75,10.00,1,0,'2020-09-15 00:00:00'),
(73,76,10.00,1,0,'2020-09-15 00:00:00'),
(74,77,10.00,1,0,'2020-09-15 00:00:00'),
(75,78,10.00,1,0,'2020-09-15 00:00:00'),
(76,79,12.00,1,1,'2020-09-15 00:00:00'),
(77,80,10.00,1,0,'2020-09-15 00:00:00'),
(78,70,10.00,1,0,'2020-09-15 00:00:00'),
(79,81,45.00,1,0,'2020-09-15 00:00:00'),
(80,82,45.00,1,0,'2020-09-15 00:00:00'),
(81,83,45.00,1,0,'2020-09-15 00:00:00'),
(82,84,45.00,1,0,'2020-09-15 00:00:00'),
(83,85,40.00,1,0,'2020-09-15 00:00:00'),
(84,86,40.00,1,0,'2020-09-15 00:00:00'),
(85,87,40.00,1,0,'2020-09-15 00:00:00'),
(86,88,40.00,1,0,'2020-09-15 00:00:00'),
(87,89,15.00,1,0,'2020-09-15 00:00:00'),
(88,90,20.00,1,1,'2020-09-15 00:00:00'),
(89,91,28.00,1,0,'2020-09-15 00:00:00'),
(90,92,22.00,1,0,'2020-09-15 00:00:00'),
(91,93,22.00,1,0,'2020-09-15 00:00:00'),
(92,94,35.00,1,1,'2020-09-15 00:00:00'),
(93,95,17.00,1,0,'2020-09-15 00:00:00'),
(94,96,50.00,1,0,'2020-09-15 00:00:00'),
(95,97,18.00,1,0,'2020-09-15 00:00:00'),
(96,98,22.00,1,1,'2020-09-15 00:00:00'),
(97,99,22.00,1,1,'2020-09-15 00:00:00'),
(98,100,27.00,1,1,'2020-09-15 00:00:00'),
(99,101,27.00,1,1,'2020-09-15 00:00:00'),
(100,102,25.00,1,1,'2020-09-15 00:00:00'),
(101,103,25.00,1,1,'2020-09-15 00:00:00'),
(102,104,8.00,1,0,'2020-09-15 00:00:00'),
(103,105,8.00,1,0,'2020-09-15 00:00:00'),
(104,106,2.00,1,1,'2020-09-15 00:00:00'),
(105,107,8.00,1,0,'2020-09-15 00:00:00'),
(106,108,8.00,1,0,'2020-09-15 00:00:00'),
(107,109,90.00,1,0,'2020-09-15 00:00:00'),
(108,110,-24.00,1,1,'2020-09-15 00:00:00'),
(109,111,-24.00,1,1,'2020-09-15 00:00:00'),
(110,112,155.00,1,0,'2020-09-15 00:00:00'),
(111,18,85.00,1,0,'2020-09-16 19:05:00'),
(112,18,135.00,2,0,'2020-09-16 19:06:00'),
(113,20,135.00,2,0,'2020-09-16 21:30:00'),
(114,19,85.00,1,0,'2020-09-16 21:30:00'),
(115,19,135.00,2,0,'2020-09-16 21:31:00'),
(116,21,95.00,1,0,'2020-09-17 01:55:00'),
(117,21,140.00,2,0,'2020-09-17 01:55:00'),
(118,22,85.00,1,0,'2020-09-17 02:07:00'),
(119,22,125.00,2,1,'2020-09-17 02:08:00'),
(120,45,22.00,1,1,'2020-09-17 02:09:00'),
(121,113,22.00,1,0,'2020-09-17 02:11:00'),
(122,113,32.00,2,1,'2020-09-17 02:12:00'),
(123,112,155.00,1,0,'2020-09-17 20:27:00'),
(124,112,155.00,1,0,'2020-09-17 20:30:00'),
(125,113,32.00,1,0,'2020-09-17 20:33:00'),
(126,112,155.00,1,0,'2020-09-17 21:12:00'),
(127,114,0.00,1,0,'2020-09-18 16:51:00'),
(128,114,0.00,1,1,'2020-09-18 16:57:00'),
(129,115,0.00,1,0,'2020-09-19 17:41:00'),
(130,115,0.00,1,1,'2020-09-19 17:45:00'),
(131,81,60.00,1,0,'2020-09-21 22:15:00'),
(132,23,85.00,1,0,'2020-09-23 20:20:00'),
(133,23,140.00,2,0,'2020-09-23 20:20:00'),
(134,6,20.00,2,1,'2020-10-04 19:25:00'),
(135,6,12.00,1,0,'2020-10-08 20:05:00'),
(136,18,85.00,1,0,'2020-10-17 02:46:00'),
(137,19,85.00,1,0,'2020-10-17 03:00:00'),
(138,20,75.00,1,0,'2020-10-17 03:01:00'),
(139,21,95.00,1,0,'2020-10-17 03:01:00'),
(140,22,85.00,1,0,'2020-10-17 03:02:00'),
(141,23,85.00,1,0,'2020-10-17 03:03:00'),
(142,24,85.00,1,0,'2020-10-17 03:04:00'),
(143,24,125.00,2,1,'2020-10-17 03:04:00'),
(144,37,22.00,1,0,'2020-10-17 03:05:00'),
(145,37,30.00,2,0,'2020-10-17 03:05:00'),
(146,38,80.00,1,0,'2020-10-17 03:05:00'),
(147,38,110.00,2,1,'2020-10-17 03:06:00'),
(148,25,2.00,2,1,'2020-10-17 03:06:00'),
(149,36,3.00,2,0,'2020-10-17 03:07:00'),
(150,106,3.00,2,0,'2020-10-17 03:07:00'),
(151,107,8.00,1,0,'2020-10-17 03:08:00'),
(152,5,15.00,1,0,'2020-10-17 03:08:00'),
(153,5,22.00,1,0,'2020-10-17 03:09:00'),
(154,5,15.00,1,0,'2020-10-17 03:09:00'),
(155,5,22.00,2,1,'2020-10-17 03:09:00'),
(156,6,14.00,1,0,'2020-10-17 03:10:00'),
(157,7,15.00,1,0,'2020-10-17 03:11:00'),
(158,7,22.00,2,1,'2020-10-17 03:11:00'),
(159,8,14.00,1,0,'2020-10-17 03:12:00'),
(160,8,20.00,2,1,'2020-10-17 03:12:00'),
(161,9,14.00,1,0,'2020-10-17 03:19:00'),
(162,9,20.00,2,1,'2020-10-17 03:19:00'),
(163,10,14.00,1,0,'2020-10-17 03:21:00'),
(164,10,20.00,2,1,'2020-10-17 03:21:00'),
(165,11,14.00,1,0,'2020-10-17 03:22:00'),
(166,11,20.00,2,1,'2020-10-17 03:22:00'),
(167,12,14.00,1,0,'2020-10-17 03:22:00'),
(168,12,20.00,2,1,'2020-10-17 03:23:00'),
(169,109,360.00,1,0,'2020-10-17 03:24:00'),
(170,109,490.00,2,0,'2020-10-17 03:26:00'),
(171,116,180.00,1,0,'2020-10-17 03:28:00'),
(172,116,250.00,2,0,'2020-10-17 03:28:00'),
(173,109,360.00,1,0,'2020-10-17 03:32:00'),
(174,116,180.00,1,0,'2020-10-17 03:32:00'),
(175,107,8.00,2,0,'2020-11-10 14:55:00'),
(176,13,14.00,1,0,'2020-11-10 14:55:00'),
(177,13,20.00,2,1,'2020-11-10 14:56:00'),
(178,108,8.00,2,0,'2020-11-10 14:56:00'),
(179,14,17.00,1,0,'2020-11-10 14:57:00'),
(180,14,22.00,2,0,'2020-11-10 14:57:00'),
(181,117,15.00,1,0,'2020-11-10 14:58:00'),
(182,117,22.00,2,1,'2020-11-10 14:58:00'),
(183,118,15.00,1,1,'2020-11-10 15:08:00'),
(184,118,22.00,2,1,'2020-11-10 15:09:00'),
(185,15,14.00,1,0,'2020-11-10 15:10:00'),
(186,15,20.00,2,1,'2020-11-10 15:10:00'),
(187,16,20.00,1,0,'2020-11-10 15:10:00'),
(188,16,30.00,2,1,'2020-11-10 15:10:00'),
(189,17,18.00,1,0,'2020-11-10 15:11:00'),
(190,17,26.00,2,1,'2020-11-10 15:11:00'),
(191,119,14.00,1,0,'2020-11-10 15:13:00'),
(192,119,22.00,1,0,'2020-11-10 15:14:00'),
(193,119,14.00,1,0,'2020-11-10 15:14:00'),
(194,119,22.00,2,0,'2020-11-10 15:14:00'),
(195,120,20.00,2,1,'2020-11-10 15:15:00'),
(196,120,14.00,1,0,'2020-11-10 15:15:00'),
(197,121,18.00,1,0,'2020-11-10 15:22:00'),
(198,121,26.00,2,1,'2020-11-10 15:22:00'),
(199,122,18.00,1,0,'2020-11-10 15:33:00'),
(200,122,26.00,2,1,'2020-11-10 15:33:00'),
(201,123,18.00,1,0,'2020-11-10 15:34:00'),
(202,123,26.00,2,1,'2020-11-10 15:34:00'),
(203,124,18.00,1,0,'2020-11-10 15:35:00'),
(204,124,26.00,2,1,'2020-11-10 15:36:00'),
(205,123,26.00,1,0,'2020-11-10 15:36:00'),
(206,122,18.00,1,0,'2020-11-10 15:36:00'),
(207,121,18.00,1,0,'2020-11-10 15:37:00'),
(208,125,18.00,1,0,'2020-11-10 15:38:00'),
(209,125,26.00,2,1,'2020-11-10 15:38:00'),
(210,126,18.00,1,0,'2020-11-10 15:40:00'),
(211,126,26.00,2,1,'2020-11-10 15:41:00'),
(212,127,16.00,1,0,'2020-11-10 15:42:00'),
(213,127,23.00,1,0,'2020-11-10 15:42:00'),
(214,127,23.00,2,0,'2020-11-10 15:42:00'),
(215,127,18.00,1,1,'2020-11-10 15:43:00'),
(216,128,23.00,2,0,'2020-11-10 15:43:00'),
(217,128,16.00,1,1,'2020-11-10 15:44:00'),
(218,127,23.00,2,1,'2020-11-10 15:44:00'),
(219,126,26.00,1,0,'2020-11-10 15:44:00'),
(220,17,18.00,1,0,'2020-11-10 15:45:00'),
(221,14,22.00,1,0,'2020-11-10 15:45:00'),
(222,15,20.00,1,0,'2020-11-10 15:45:00'),
(223,129,15.00,1,0,'2020-11-10 16:07:00'),
(224,129,22.00,2,1,'2020-11-10 16:08:00'),
(225,130,15.00,1,0,'2020-11-10 16:08:00'),
(226,130,22.00,1,0,'2020-11-10 16:09:00'),
(227,130,15.00,1,0,'2020-11-10 16:09:00'),
(228,130,22.00,2,1,'2020-11-10 16:09:00'),
(229,128,23.00,2,1,'2020-11-10 16:11:00'),
(230,129,15.00,1,0,'2020-11-10 16:12:00'),
(231,131,15.00,1,0,'2020-11-10 16:13:00'),
(232,131,22.00,2,1,'2020-11-10 16:13:00'),
(233,132,14.00,1,1,'2020-11-10 16:16:00'),
(234,132,22.00,2,0,'2020-11-10 16:17:00'),
(235,108,8.00,1,0,'2020-11-10 16:17:00'),
(236,13,22.00,1,0,'2020-11-10 16:24:00'),
(237,13,14.00,1,0,'2020-11-10 16:25:00'),
(238,133,14.00,1,0,'2020-11-10 16:26:00'),
(239,133,20.00,1,0,'2020-11-10 16:26:00'),
(240,133,14.00,1,0,'2020-11-10 16:27:00'),
(241,133,20.00,2,1,'2020-11-10 16:27:00'),
(242,134,14.00,1,0,'2020-11-10 16:28:00'),
(243,134,20.00,2,1,'2020-11-10 16:28:00'),
(244,135,14.00,1,0,'2020-11-10 16:29:00'),
(245,135,20.00,1,0,'2020-11-10 16:29:00'),
(246,135,20.00,2,1,'2020-11-10 16:29:00'),
(247,135,14.00,1,0,'2020-11-10 16:29:00'),
(248,136,16.00,1,1,'2020-11-10 16:41:00'),
(249,136,22.00,2,0,'2020-11-10 16:41:00'),
(250,137,16.00,1,0,'2020-11-10 16:42:00'),
(251,137,22.00,2,1,'2020-11-10 16:42:00'),
(252,136,22.00,2,0,'2020-11-10 16:43:00'),
(253,7,22.00,1,0,'2020-11-10 16:43:00'),
(254,7,15.00,1,0,'2020-11-10 16:44:00'),
(255,138,16.00,1,1,'2020-11-10 16:45:00'),
(256,138,23.00,2,1,'2020-11-10 16:45:00'),
(257,137,15.00,1,1,'2020-11-10 16:46:00'),
(258,139,15.00,1,1,'2020-11-10 16:47:00'),
(259,139,22.00,2,1,'2020-11-10 16:48:00'),
(260,9,14.00,1,0,'2020-11-10 16:48:00'),
(261,140,22.00,2,0,'2020-11-10 16:49:00'),
(262,140,15.00,2,0,'2020-11-10 16:49:00'),
(263,140,15.00,1,1,'2020-11-10 16:49:00'),
(264,140,22.00,2,1,'2020-11-10 16:50:00'),
(265,141,15.00,1,0,'2020-11-10 16:51:00'),
(266,141,22.00,1,0,'2020-11-10 16:51:00'),
(267,141,22.00,2,1,'2020-11-10 16:51:00'),
(268,141,15.00,1,1,'2020-11-10 16:52:00'),
(269,142,15.00,1,1,'2020-11-10 16:52:00'),
(270,142,22.00,2,1,'2020-11-10 16:53:00'),
(271,143,15.00,1,1,'2020-11-10 21:18:47'),
(272,143,22.00,2,1,'2020-11-10 21:19:00'),
(273,144,15.00,1,1,'2020-11-10 21:20:19'),
(274,144,22.00,2,1,'2020-11-10 21:20:00'),
(275,145,15.00,1,0,'2020-11-10 21:22:23'),
(276,133,14.00,1,0,'2020-11-10 21:22:00'),
(277,145,22.00,1,0,'2020-11-10 21:22:00'),
(278,145,22.00,2,1,'2020-11-10 21:23:00'),
(279,145,15.00,1,1,'2020-11-10 21:23:00'),
(280,146,15.00,1,1,'2020-11-10 21:24:10'),
(281,146,22.00,2,1,'2020-11-10 21:24:00'),
(282,147,15.00,1,1,'2020-11-10 21:25:06'),
(283,147,22.00,2,1,'2020-11-10 21:25:00'),
(284,68,30.00,1,0,'2020-11-10 21:26:00'),
(285,68,40.00,2,0,'2020-11-10 21:27:00'),
(286,68,30.00,1,1,'2020-11-10 21:28:00'),
(287,68,40.00,2,1,'2020-11-10 21:34:00'),
(288,58,28.00,1,1,'2020-11-10 21:35:00'),
(289,58,38.00,2,1,'2020-11-10 21:35:00'),
(290,66,26.00,1,1,'2020-11-10 21:36:00'),
(291,66,36.00,2,1,'2020-11-10 21:36:00'),
(292,148,26.00,1,1,'2020-11-10 21:39:48'),
(293,148,36.00,2,1,'2020-11-10 21:40:00'),
(294,67,26.00,1,1,'2020-11-10 21:40:00'),
(295,67,36.00,2,1,'2020-11-10 21:40:00'),
(296,149,26.00,1,0,'2020-11-10 21:42:09'),
(297,149,36.00,2,1,'2020-11-10 21:42:00'),
(298,150,26.00,1,1,'2020-11-10 21:43:18'),
(299,150,36.00,2,1,'2020-11-10 21:43:00'),
(300,57,26.00,1,1,'2020-11-10 21:44:00'),
(301,57,36.00,2,0,'2020-11-10 21:44:00'),
(302,59,26.00,1,0,'2020-11-10 21:44:00'),
(303,59,36.00,1,0,'2020-11-10 21:45:00'),
(304,59,36.00,2,1,'2020-11-10 21:45:00'),
(305,59,26.00,1,0,'2020-11-10 21:45:00'),
(306,60,26.00,1,0,'2020-11-10 21:45:00'),
(307,60,36.00,2,1,'2020-11-10 21:45:00'),
(308,61,26.00,1,1,'2020-11-10 21:46:00'),
(309,61,36.00,2,0,'2020-11-10 21:46:00'),
(310,64,26.00,1,1,'2020-11-10 21:46:00'),
(311,64,36.00,2,0,'2020-11-10 21:46:00'),
(312,151,26.00,1,0,'2020-11-10 21:47:24'),
(313,151,36.00,2,1,'2020-11-10 21:47:00'),
(314,152,26.00,1,1,'2020-11-10 21:48:09'),
(315,152,36.00,2,1,'2020-11-10 21:48:00'),
(316,69,26.00,1,1,'2020-11-10 21:48:00'),
(317,69,36.00,2,0,'2020-11-10 21:49:00'),
(318,65,26.00,1,0,'2020-11-10 21:49:00'),
(319,65,36.00,1,0,'2020-11-10 21:49:00'),
(320,65,36.00,2,1,'2020-11-10 21:49:00'),
(321,65,26.00,1,1,'2020-11-10 21:49:00'),
(322,62,26.00,1,1,'2020-11-10 21:50:00'),
(323,62,36.00,2,1,'2020-11-10 21:50:00'),
(324,153,35.00,1,0,'2020-11-10 21:52:47'),
(325,153,45.00,2,1,'2020-11-10 21:53:00'),
(326,154,32.00,1,0,'2020-11-10 21:53:51'),
(327,154,42.00,2,0,'2020-11-10 21:54:00'),
(328,155,30.00,1,0,'2020-11-10 21:55:02'),
(329,155,40.00,1,0,'2020-11-10 21:55:00'),
(330,155,40.00,2,1,'2020-11-10 21:55:00'),
(331,155,30.00,1,0,'2020-11-10 21:55:00'),
(332,156,30.00,1,0,'2020-11-10 21:56:35'),
(333,156,40.00,2,0,'2020-11-10 21:56:00'),
(334,156,40.00,1,0,'2020-11-10 21:57:00'),
(335,157,30.00,1,0,'2020-11-10 21:57:40'),
(336,157,40.00,2,1,'2020-11-10 21:58:00'),
(337,158,30.00,1,1,'2020-11-10 21:58:23'),
(338,158,40.00,2,1,'2020-11-10 21:58:00'),
(339,159,30.00,1,1,'2020-11-10 21:59:09'),
(340,159,40.00,2,1,'2020-11-10 21:59:00'),
(341,160,30.00,1,1,'2020-11-10 21:59:59'),
(342,160,40.00,2,1,'2020-11-10 22:00:00'),
(343,86,65.00,1,0,'2020-11-10 22:01:00'),
(344,85,60.00,1,0,'2020-11-10 22:01:00'),
(345,87,60.00,1,0,'2020-11-10 22:01:00'),
(346,85,60.00,1,0,'2020-11-10 22:01:00'),
(347,86,65.00,1,0,'2020-11-10 22:02:00'),
(348,88,60.00,1,0,'2020-11-10 22:02:00'),
(349,161,60.00,1,0,'2020-11-10 22:02:53'),
(350,161,60.00,1,0,'2020-11-10 22:03:00'),
(351,162,50.00,1,0,'2020-11-10 22:03:53'),
(352,162,50.00,1,1,'2020-11-10 22:04:00'),
(353,82,70.00,1,0,'2020-11-10 22:04:00'),
(354,82,90.00,2,1,'2020-11-10 22:04:00'),
(355,81,65.00,1,0,'2020-11-10 22:05:00'),
(356,81,90.00,2,0,'2020-11-10 22:05:00'),
(357,83,65.00,1,0,'2020-11-10 22:05:00'),
(358,83,90.00,2,1,'2020-11-10 22:06:00'),
(359,84,65.00,1,0,'2020-11-10 22:06:00'),
(360,84,90.00,2,0,'2020-11-10 22:06:00'),
(361,163,65.00,1,0,'2020-11-10 22:12:28'),
(362,163,90.00,1,0,'2020-11-10 22:12:00'),
(363,163,90.00,2,0,'2020-11-10 22:13:00'),
(364,163,65.00,1,0,'2020-11-10 22:13:00'),
(365,164,55.00,1,0,'2020-11-10 22:13:41'),
(366,164,80.00,2,1,'2020-11-10 22:14:00'),
(367,18,95.00,1,0,'2020-11-10 22:15:00'),
(368,19,95.00,1,0,'2020-11-10 22:15:00'),
(369,21,135.00,2,0,'2020-11-12 16:16:00'),
(370,23,140.00,2,0,'2020-11-12 16:17:00'),
(371,165,125.00,2,0,'2020-11-12 16:18:38'),
(372,165,85.00,1,0,'2020-11-12 16:19:00'),
(373,166,85.00,1,0,'2020-11-12 16:19:55'),
(374,166,125.00,2,0,'2020-11-12 16:20:00'),
(375,23,125.00,1,0,'2020-11-12 16:20:00'),
(376,20,135.00,2,0,'2020-11-12 16:21:00'),
(377,20,75.00,1,0,'2020-11-12 16:21:00'),
(378,165,125.00,2,0,'2020-11-13 22:15:00'),
(379,166,85.00,1,0,'2020-11-13 22:17:00'),
(380,166,85.00,2,0,'2020-11-13 22:18:00'),
(381,166,85.00,1,0,'2020-11-13 22:20:00'),
(382,166,125.00,2,0,'2020-11-13 22:23:00'),
(383,166,125.00,2,0,'2020-11-13 22:25:00'),
(384,166,125.00,2,0,'2020-11-13 22:26:00'),
(385,166,125.00,2,0,'2020-11-13 22:27:00'),
(386,166,125.00,2,0,'2020-11-13 22:30:00'),
(387,166,85.00,1,0,'2020-11-13 22:32:00'),
(388,166,85.00,2,0,'2020-11-13 22:33:00'),
(389,166,85.00,1,0,'2020-11-13 22:36:00'),
(390,166,125.00,2,0,'2020-11-13 22:38:00'),
(391,166,85.00,1,0,'2020-11-13 22:39:00'),
(392,166,85.00,1,0,'2020-11-13 22:42:00'),
(393,166,85.00,1,0,'2020-11-13 22:43:00'),
(394,165,125.00,2,0,'2020-11-13 22:47:00'),
(395,167,85.00,1,0,'2020-11-13 22:54:55'),
(396,167,125.00,2,0,'2020-11-13 22:55:00'),
(397,166,125.00,2,0,'2020-11-13 22:55:00'),
(398,166,125.00,2,0,'2020-11-13 22:57:00'),
(399,166,125.00,2,0,'2020-11-13 22:59:00'),
(400,166,125.00,2,0,'2020-11-13 23:00:00'),
(401,165,85.00,1,0,'2020-11-14 02:28:00'),
(402,165,125.00,2,0,'2020-11-14 02:29:00'),
(403,165,85.00,1,0,'2020-11-14 02:30:00'),
(404,165,85.00,2,0,'2020-11-14 02:35:00'),
(405,167,125.00,2,0,'2020-11-14 02:36:00'),
(406,167,125.00,1,0,'2020-11-14 02:37:00'),
(407,167,125.00,2,0,'2020-11-14 02:41:00'),
(408,167,125.00,2,0,'2020-11-14 02:44:00'),
(409,167,85.00,1,0,'2020-11-14 02:50:00'),
(410,167,125.00,2,0,'2020-11-14 18:23:00'),
(411,167,125.00,2,1,'2020-11-14 18:27:00'),
(412,167,85.00,1,0,'2020-11-14 18:29:00'),
(413,166,125.00,2,1,'2020-11-15 19:02:00'),
(414,167,85.00,1,0,'2020-11-15 19:03:00'),
(415,18,135.00,2,0,'2020-11-15 19:03:00'),
(416,18,95.00,1,0,'2020-11-15 19:04:00'),
(417,18,135.00,2,1,'2020-11-15 19:04:00'),
(418,19,135.00,2,0,'2020-11-15 19:26:00'),
(419,19,95.00,1,0,'2020-11-15 19:27:00'),
(420,19,135.00,2,1,'2020-11-15 19:27:00'),
(421,5,0.00,3,1,'2020-11-18 23:22:42'),
(422,6,0.00,3,1,'2020-11-18 23:22:46'),
(423,7,0.00,3,1,'2020-11-18 23:23:06'),
(424,8,0.00,3,1,'2020-11-18 23:23:06'),
(425,9,0.00,3,1,'2020-11-18 23:23:06'),
(426,10,0.00,3,1,'2020-11-18 23:23:06'),
(427,11,0.00,3,1,'2020-11-18 23:23:06'),
(428,12,0.00,3,1,'2020-11-18 23:23:06'),
(429,13,0.00,3,1,'2020-11-18 23:23:06'),
(430,14,0.00,3,1,'2020-11-18 23:23:07'),
(431,15,0.00,3,1,'2020-11-18 23:23:07'),
(432,16,0.00,3,1,'2020-11-18 23:23:07'),
(433,17,0.00,3,1,'2020-11-18 23:23:07'),
(434,18,0.00,3,1,'2020-11-18 23:23:07'),
(435,19,0.00,3,1,'2020-11-18 23:23:07'),
(436,20,0.00,3,0,'2020-11-18 23:23:07'),
(437,21,0.00,3,1,'2020-11-18 23:23:07'),
(438,22,0.00,3,1,'2020-11-18 23:23:07'),
(439,23,0.00,3,1,'2020-11-18 23:23:07'),
(440,24,0.00,3,1,'2020-11-18 23:23:07'),
(441,25,0.00,3,1,'2020-11-18 23:23:07'),
(442,28,0.00,3,0,'2020-11-18 23:23:07'),
(443,29,0.00,3,0,'2020-11-18 23:23:07'),
(444,30,0.00,3,0,'2020-11-18 23:23:07'),
(445,31,0.00,3,0,'2020-11-18 23:23:07'),
(446,32,0.00,3,1,'2020-11-18 23:23:07'),
(447,33,0.00,3,0,'2020-11-18 23:23:07'),
(448,34,0.00,3,1,'2020-11-18 23:23:07'),
(449,35,0.00,3,1,'2020-11-18 23:23:07'),
(450,36,0.00,3,1,'2020-11-18 23:23:07'),
(451,37,0.00,3,1,'2020-11-18 23:23:07'),
(452,38,0.00,3,1,'2020-11-18 23:23:07'),
(453,39,0.00,3,1,'2020-11-18 23:23:07'),
(454,40,0.00,3,1,'2020-11-18 23:23:07'),
(455,41,0.00,3,1,'2020-11-18 23:23:07'),
(456,42,0.00,3,1,'2020-11-18 23:23:07'),
(457,43,0.00,3,1,'2020-11-18 23:23:07'),
(458,44,0.00,3,1,'2020-11-18 23:23:07'),
(459,46,0.00,3,1,'2020-11-18 23:23:07'),
(460,47,0.00,3,1,'2020-11-18 23:23:07'),
(461,48,0.00,3,1,'2020-11-18 23:23:08'),
(462,49,0.00,3,1,'2020-11-18 23:23:08'),
(463,50,0.00,3,1,'2020-11-18 23:23:08'),
(464,51,0.00,3,0,'2020-11-18 23:23:08'),
(465,52,0.00,3,1,'2020-11-18 23:23:08'),
(466,53,0.00,3,1,'2020-11-18 23:23:08'),
(467,54,0.00,3,1,'2020-11-18 23:23:08'),
(468,55,0.00,3,1,'2020-11-18 23:23:08'),
(469,56,0.00,3,1,'2020-11-18 23:23:08'),
(470,57,0.00,3,1,'2020-11-18 23:23:08'),
(471,58,0.00,3,0,'2020-11-18 23:23:08'),
(472,59,0.00,3,1,'2020-11-18 23:23:08'),
(473,60,0.00,3,1,'2020-11-18 23:23:08'),
(474,61,0.00,3,1,'2020-11-18 23:23:08'),
(475,62,0.00,3,1,'2020-11-18 23:23:08'),
(476,64,0.00,3,1,'2020-11-18 23:23:08'),
(477,65,0.00,3,1,'2020-11-18 23:23:08'),
(478,66,0.00,3,1,'2020-11-18 23:23:08'),
(479,67,0.00,3,1,'2020-11-18 23:23:08'),
(480,68,0.00,3,1,'2020-11-18 23:23:08'),
(481,69,0.00,3,1,'2020-11-18 23:23:08'),
(482,70,0.00,3,1,'2020-11-18 23:23:08'),
(483,71,0.00,3,1,'2020-11-18 23:23:08'),
(484,72,0.00,3,1,'2020-11-18 23:23:09'),
(485,73,0.00,3,1,'2020-11-18 23:23:09'),
(486,74,0.00,3,1,'2020-11-18 23:23:09'),
(487,75,0.00,3,1,'2020-11-18 23:23:09'),
(488,76,0.00,3,1,'2020-11-18 23:23:09'),
(489,77,0.00,3,1,'2020-11-18 23:23:09'),
(490,78,0.00,3,1,'2020-11-18 23:23:09'),
(491,79,0.00,3,1,'2020-11-18 23:23:09'),
(492,80,0.00,3,1,'2020-11-18 23:23:09'),
(493,81,0.00,3,1,'2020-11-18 23:23:09'),
(494,82,0.00,3,1,'2020-11-18 23:23:09'),
(495,83,0.00,3,1,'2020-11-18 23:23:09'),
(496,84,0.00,3,1,'2020-11-18 23:23:09'),
(497,85,0.00,3,1,'2020-11-18 23:23:09'),
(498,86,0.00,3,1,'2020-11-18 23:23:09'),
(499,87,0.00,3,1,'2020-11-18 23:23:09'),
(500,88,0.00,3,1,'2020-11-18 23:23:09'),
(501,89,0.00,3,1,'2020-11-18 23:23:09'),
(502,91,0.00,3,1,'2020-11-18 23:23:09'),
(503,92,0.00,3,1,'2020-11-18 23:23:09'),
(504,93,0.00,3,1,'2020-11-18 23:23:09'),
(505,94,0.00,3,1,'2020-11-18 23:23:09'),
(506,95,0.00,3,1,'2020-11-18 23:23:09'),
(507,96,0.00,3,1,'2020-11-18 23:23:10'),
(508,97,0.00,3,1,'2020-11-18 23:23:10'),
(509,98,0.00,3,1,'2020-11-18 23:23:10'),
(510,99,0.00,3,1,'2020-11-18 23:23:10'),
(511,100,0.00,3,1,'2020-11-18 23:23:10'),
(512,101,0.00,3,1,'2020-11-18 23:23:10'),
(513,102,0.00,3,1,'2020-11-18 23:23:10'),
(514,103,0.00,3,1,'2020-11-18 23:23:10'),
(515,104,0.00,3,0,'2020-11-18 23:23:10'),
(516,105,0.00,3,1,'2020-11-18 23:23:10'),
(517,106,0.00,3,1,'2020-11-18 23:23:10'),
(518,107,0.00,3,1,'2020-11-18 23:23:10'),
(519,108,0.00,3,1,'2020-11-18 23:23:10'),
(520,109,0.00,3,0,'2020-11-18 23:23:10'),
(521,112,0.00,3,0,'2020-11-18 23:23:10'),
(522,113,0.00,3,1,'2020-11-18 23:23:10'),
(523,114,0.00,3,1,'2020-11-18 23:23:10'),
(524,115,0.00,3,1,'2020-11-18 23:23:10'),
(525,116,0.00,3,0,'2020-11-18 23:23:10'),
(526,117,0.00,3,1,'2020-11-18 23:23:10'),
(527,118,0.00,3,1,'2020-11-18 23:23:10'),
(528,119,0.00,3,1,'2020-11-18 23:23:10'),
(529,120,0.00,3,1,'2020-11-18 23:23:10'),
(530,121,0.00,3,1,'2020-11-18 23:23:11'),
(531,122,0.00,3,1,'2020-11-18 23:23:11'),
(532,123,0.00,3,1,'2020-11-18 23:23:11'),
(533,124,0.00,3,1,'2020-11-18 23:23:11'),
(534,125,0.00,3,1,'2020-11-18 23:23:11'),
(535,126,0.00,3,1,'2020-11-18 23:23:11'),
(536,127,0.00,3,1,'2020-11-18 23:23:11'),
(537,128,0.00,3,1,'2020-11-18 23:23:11'),
(538,129,0.00,3,1,'2020-11-18 23:23:11'),
(539,130,0.00,3,1,'2020-11-18 23:23:11'),
(540,131,0.00,3,1,'2020-11-18 23:23:11'),
(541,132,0.00,3,1,'2020-11-18 23:23:11'),
(542,133,0.00,3,1,'2020-11-18 23:23:11'),
(543,134,0.00,3,1,'2020-11-18 23:23:11'),
(544,135,0.00,3,1,'2020-11-18 23:23:11'),
(545,136,0.00,3,1,'2020-11-18 23:23:11'),
(546,137,0.00,3,1,'2020-11-18 23:23:11'),
(547,138,0.00,3,1,'2020-11-18 23:23:11'),
(548,139,0.00,3,1,'2020-11-18 23:23:11'),
(549,140,0.00,3,1,'2020-11-18 23:23:11'),
(550,141,0.00,3,1,'2020-11-18 23:23:11'),
(551,142,0.00,3,1,'2020-11-18 23:23:11'),
(552,143,0.00,3,1,'2020-11-18 23:23:11'),
(553,144,0.00,3,1,'2020-11-18 23:23:11'),
(554,145,0.00,3,1,'2020-11-18 23:23:11'),
(555,146,0.00,3,1,'2020-11-18 23:23:11'),
(556,147,0.00,3,1,'2020-11-18 23:23:11'),
(557,148,0.00,3,1,'2020-11-18 23:23:11'),
(558,149,0.00,3,1,'2020-11-18 23:23:11'),
(559,150,0.00,3,1,'2020-11-18 23:23:11'),
(560,151,0.00,3,1,'2020-11-18 23:23:12'),
(561,152,0.00,3,1,'2020-11-18 23:23:12'),
(562,153,0.00,3,1,'2020-11-18 23:23:12'),
(563,154,0.00,3,1,'2020-11-18 23:23:12'),
(564,155,0.00,3,1,'2020-11-18 23:23:12'),
(565,156,0.00,3,0,'2020-11-18 23:23:12'),
(566,157,0.00,3,1,'2020-11-18 23:23:12'),
(567,158,0.00,3,1,'2020-11-18 23:23:12'),
(568,159,0.00,3,1,'2020-11-18 23:23:12'),
(569,160,0.00,3,1,'2020-11-18 23:23:12'),
(570,161,0.00,3,1,'2020-11-18 23:23:12'),
(571,162,0.00,3,1,'2020-11-18 23:23:12'),
(572,163,0.00,3,0,'2020-11-18 23:23:12'),
(573,164,0.00,3,1,'2020-11-18 23:23:12'),
(574,165,0.00,3,1,'2020-11-18 23:23:12'),
(575,166,0.00,3,1,'2020-11-18 23:23:12'),
(576,167,0.00,3,1,'2020-11-18 23:23:12'),
(577,163,90.00,2,0,'2020-11-19 19:26:00'),
(578,163,0.00,3,0,'2020-11-19 19:26:00'),
(579,163,0.00,3,1,'2020-11-19 19:27:00'),
(580,163,65.00,1,0,'2020-11-19 19:31:00'),
(581,163,90.00,2,1,'2020-11-19 19:34:00'),
(582,163,65.00,1,0,'2020-11-19 19:35:00'),
(583,163,65.00,1,0,'2020-11-19 19:37:00'),
(584,54,35.00,1,0,'2020-11-20 00:54:00'),
(585,54,50.00,2,1,'2020-11-20 00:54:00'),
(586,55,30.00,1,0,'2020-11-20 00:54:00'),
(587,55,40.00,2,1,'2020-11-20 00:54:00'),
(588,56,40.00,1,1,'2020-11-20 00:55:00'),
(589,56,60.00,2,1,'2020-11-20 00:55:00'),
(590,109,490.00,2,0,'2020-11-20 01:13:00'),
(591,109,0.00,3,0,'2020-11-20 01:15:00'),
(592,109,360.00,1,0,'2020-11-20 01:16:00'),
(593,109,490.00,2,0,'2020-11-20 01:16:00'),
(594,109,360.00,1,0,'2020-11-20 01:17:00'),
(595,109,490.00,2,0,'2020-11-20 01:18:00'),
(596,109,360.00,1,0,'2020-11-20 01:19:00'),
(597,109,490.00,2,0,'2020-11-20 01:19:00'),
(598,109,360.00,1,0,'2020-11-20 01:20:00'),
(599,109,490.00,2,0,'2020-11-20 01:20:00'),
(600,109,360.00,1,0,'2020-11-20 01:48:00'),
(601,109,490.00,2,0,'2020-11-20 01:49:00'),
(602,116,250.00,2,0,'2020-11-20 02:15:00'),
(603,116,180.00,1,0,'2020-11-20 02:15:00'),
(604,116,250.00,2,0,'2020-11-20 02:16:00'),
(605,116,180.00,1,0,'2020-11-20 02:18:00'),
(606,116,250.00,2,0,'2020-11-20 02:18:00'),
(607,116,250.00,2,0,'2020-11-20 02:19:00'),
(608,116,180.00,1,0,'2020-11-20 02:20:00'),
(609,116,180.00,1,0,'2020-11-20 02:22:00'),
(610,168,110.00,1,0,'2020-11-20 18:09:48'),
(611,168,160.00,1,0,'2020-11-20 18:10:00'),
(612,168,160.00,2,0,'2020-11-20 18:12:00'),
(613,168,110.00,1,0,'2020-11-20 19:17:00'),
(614,168,0.00,3,0,'2020-11-20 19:20:00'),
(615,168,110.00,1,0,'2020-11-20 19:22:00'),
(616,156,0.00,3,0,'2020-11-22 22:01:28'),
(617,156,35.00,1,0,'2020-11-22 22:01:28'),
(618,156,45.00,2,0,'2020-11-22 22:01:28'),
(619,156,0.00,3,0,'2020-11-22 22:14:36'),
(620,156,0.00,3,0,'2020-11-22 22:59:17'),
(621,156,0.00,3,0,'2020-11-22 23:03:54'),
(622,156,30.00,1,0,'2020-11-22 23:28:52'),
(623,156,40.00,2,1,'2020-11-22 23:29:52'),
(624,156,0.00,3,1,'2020-11-22 23:30:21'),
(625,168,110.00,1,0,'2020-11-22 23:49:28'),
(626,168,160.00,2,0,'2020-11-22 23:49:28'),
(627,168,0.00,3,0,'2020-11-22 23:49:28'),
(628,168,110.00,1,0,'2020-11-22 23:55:50'),
(629,168,160.00,2,1,'2020-11-22 23:55:50'),
(630,168,0.00,3,1,'2020-11-22 23:55:50'),
(631,168,0.00,1,0,'2020-11-22 23:55:00'),
(632,116,180.00,1,0,'2020-11-22 23:56:49'),
(633,116,250.00,2,0,'2020-11-22 23:56:49'),
(634,116,0.00,3,0,'2020-11-22 23:56:49'),
(635,116,180.00,3,0,'2020-11-22 23:57:00'),
(636,116,0.00,3,1,'2020-11-22 23:58:00'),
(637,168,110.00,1,0,'2020-11-22 23:58:00'),
(638,28,40.00,1,0,'2020-11-23 00:02:00'),
(639,28,40.00,1,0,'2020-11-23 00:03:25'),
(640,28,0.00,3,0,'2020-11-23 00:03:25'),
(641,28,40.00,1,0,'2020-11-23 00:40:00'),
(642,28,55.00,1,0,'2020-11-23 01:20:00'),
(643,28,75.00,2,0,'2020-11-23 01:20:00'),
(644,29,65.00,1,0,'2020-11-23 01:32:00'),
(645,29,85.00,2,1,'2020-11-23 02:24:00'),
(646,29,0.00,3,1,'2020-11-23 02:26:00'),
(647,28,75.00,2,0,'2020-11-23 02:27:00'),
(648,28,0.00,3,1,'2020-11-23 02:31:00'),
(649,30,40.00,1,0,'2020-11-23 02:45:00'),
(650,30,54.00,2,0,'2020-11-23 02:45:00'),
(651,30,0.00,3,1,'2020-11-23 02:46:00'),
(652,30,40.00,1,0,'2020-11-23 02:47:00'),
(653,31,35.00,1,0,'2020-11-23 02:48:00'),
(654,31,54.00,2,0,'2020-11-23 02:48:00'),
(655,31,0.00,3,1,'2020-11-23 02:49:00'),
(656,33,30.00,1,0,'2020-11-23 17:56:00'),
(657,33,38.00,2,1,'2020-11-23 17:56:00'),
(658,33,0.00,3,1,'2020-11-23 17:58:00'),
(659,30,54.00,2,1,'2020-11-23 17:59:00'),
(660,33,30.00,1,0,'2020-11-23 18:00:00'),
(661,31,54.00,2,1,'2020-11-23 18:00:00'),
(662,34,25.00,1,0,'2020-11-23 18:02:00'),
(663,34,45.00,2,1,'2020-11-23 18:02:00'),
(664,35,35.00,1,1,'2020-11-23 18:03:00'),
(665,35,54.00,2,0,'2020-11-23 18:04:00'),
(666,35,54.00,2,1,'2020-11-23 18:09:00'),
(667,57,36.00,2,1,'2020-11-23 18:11:00'),
(668,58,0.00,3,1,'2020-11-23 18:11:00'),
(669,59,26.00,1,1,'2020-11-23 18:11:00'),
(670,60,26.00,1,1,'2020-11-23 18:12:00'),
(671,61,36.00,2,1,'2020-11-23 18:13:00'),
(672,64,36.00,2,1,'2020-11-23 18:13:00'),
(673,69,36.00,2,1,'2020-11-23 18:13:00'),
(674,151,26.00,1,1,'2020-11-23 18:14:00'),
(675,154,42.00,2,1,'2020-11-23 18:19:00'),
(676,155,30.00,1,0,'2020-11-23 18:20:00'),
(677,84,50.00,1,0,'2020-11-23 18:22:00'),
(678,84,50.00,2,0,'2020-11-23 18:24:00'),
(679,39,22.00,1,1,'2020-11-23 18:29:00'),
(680,37,30.00,2,0,'2020-11-23 18:30:00'),
(681,38,80.00,1,0,'2020-11-23 18:31:00'),
(682,95,30.00,1,0,'2020-11-23 18:36:00'),
(683,95,45.00,2,1,'2020-11-23 18:36:00'),
(684,96,90.00,1,0,'2020-11-23 18:37:00'),
(685,96,120.00,2,1,'2020-11-23 18:38:00'),
(686,169,30.00,1,0,'2020-11-23 18:41:11'),
(687,169,45.00,2,1,'2020-11-23 18:41:00'),
(688,169,0.00,3,1,'2020-11-23 18:42:00'),
(689,170,90.00,1,0,'2020-11-23 18:42:39'),
(690,170,120.00,2,1,'2020-11-23 18:42:00'),
(691,170,0.00,3,1,'2020-11-23 18:43:00'),
(692,171,35.00,1,1,'2020-11-23 18:44:06'),
(693,171,50.00,2,1,'2020-11-23 18:44:00'),
(694,171,0.00,3,1,'2020-11-23 18:44:00'),
(695,172,30.00,1,1,'2020-11-23 18:45:30'),
(696,172,40.00,2,1,'2020-11-23 18:45:00'),
(697,172,0.00,3,1,'2020-11-23 18:46:00'),
(698,52,20.00,1,0,'2020-11-23 18:46:00'),
(699,52,28.00,2,1,'2020-11-23 18:46:00'),
(700,51,15.00,1,0,'2020-11-23 18:47:00'),
(701,51,25.00,2,1,'2020-11-23 18:47:00'),
(702,173,15.00,2,0,'2020-11-23 18:48:30'),
(703,173,25.00,2,0,'2020-11-23 18:48:00'),
(704,173,15.00,2,0,'2020-11-23 18:49:00'),
(705,173,15.00,1,1,'2020-11-23 18:49:00'),
(706,173,25.00,2,1,'2020-11-23 18:49:00'),
(707,173,0.00,3,1,'2020-11-23 18:49:00'),
(708,46,22.00,1,0,'2020-11-23 18:50:00'),
(709,46,32.00,2,1,'2020-11-23 18:50:00'),
(710,47,22.00,1,1,'2020-11-23 18:51:00'),
(711,47,32.00,2,1,'2020-11-23 18:51:00'),
(712,48,22.00,1,1,'2020-11-23 18:51:00'),
(713,48,32.00,2,1,'2020-11-23 18:51:00'),
(714,49,22.00,1,1,'2020-11-23 18:52:00'),
(715,49,32.00,2,1,'2020-11-23 18:52:00'),
(716,50,22.00,1,1,'2020-11-23 18:53:00'),
(717,50,32.00,2,1,'2020-11-23 18:53:00'),
(718,97,22.00,1,1,'2020-11-23 18:54:00'),
(719,97,32.00,2,1,'2020-11-23 18:54:00'),
(720,108,8.00,2,0,'2020-11-28 18:48:00'),
(721,14,25.00,2,1,'2020-11-29 01:35:00'),
(722,14,17.00,1,0,'2020-11-29 01:35:00'),
(723,126,18.00,1,0,'2020-11-29 01:36:00'),
(724,132,20.00,2,1,'2020-11-29 01:40:00'),
(725,136,23.00,2,1,'2020-11-29 01:41:00'),
(726,15,14.00,1,0,'2020-11-29 01:43:00'),
(727,119,20.00,2,1,'2020-11-29 01:44:00'),
(728,123,18.00,1,0,'2020-11-29 01:45:00'),
(729,20,85.00,1,0,'2020-11-29 01:48:00'),
(730,20,125.00,2,0,'2020-11-29 01:49:00'),
(731,21,135.00,2,1,'2020-11-29 01:51:00'),
(732,23,85.00,1,0,'2020-11-29 01:51:00'),
(733,23,125.00,2,1,'2020-11-29 01:52:00'),
(734,165,125.00,2,1,'2020-11-29 01:52:00'),
(735,174,65.00,1,0,'2020-11-29 01:54:36'),
(736,174,100.00,2,1,'2020-11-29 01:55:00'),
(737,174,0.00,3,1,'2020-11-29 01:55:00'),
(738,28,75.00,2,1,'2020-11-29 01:56:00'),
(739,107,15.00,1,1,'2020-11-29 01:59:00'),
(740,107,22.00,2,1,'2020-11-29 01:59:00'),
(741,108,15.00,1,1,'2020-11-29 02:00:00'),
(742,108,22.00,2,1,'2020-11-29 02:00:00'),
(743,175,10.00,1,1,'2020-11-29 02:01:25'),
(744,175,10.00,2,1,'2020-11-29 02:01:00'),
(745,176,15.00,2,1,'2020-11-29 02:02:01'),
(746,176,15.00,1,1,'2020-11-29 02:02:00'),
(747,177,20.00,1,1,'2020-11-29 02:02:35'),
(748,177,20.00,2,1,'2020-11-29 02:02:00'),
(749,178,5.00,1,1,'2020-11-29 02:03:18'),
(750,178,5.00,2,1,'2020-11-29 02:03:00'),
(751,36,2.00,2,1,'2020-11-29 02:04:00'),
(752,106,2.00,2,1,'2020-11-29 02:04:00'),
(753,179,26.00,1,1,'2020-11-29 18:02:22'),
(754,179,36.00,2,1,'2020-11-29 18:02:00'),
(755,179,0.00,3,1,'2020-11-29 18:03:00'),
(756,81,90.00,2,1,'2020-11-29 18:06:00'),
(757,180,65.00,1,0,'2020-11-29 18:09:22'),
(758,180,90.00,2,1,'2020-11-29 18:10:00'),
(759,180,0.00,3,0,'2020-11-29 18:10:00'),
(760,180,0.00,3,1,'2020-11-29 18:10:00'),
(761,46,22.00,1,0,'2020-11-29 23:29:00'),
(762,91,20.00,1,0,'2020-11-29 23:31:00'),
(763,91,35.00,2,0,'2020-11-29 23:32:00'),
(764,92,30.00,1,0,'2020-11-29 23:33:00'),
(765,92,48.00,2,1,'2020-11-29 23:33:00'),
(766,91,25.00,1,0,'2020-11-29 23:33:00'),
(767,91,42.00,2,1,'2020-11-29 23:34:00'),
(768,93,35.00,1,1,'2020-11-29 23:34:00'),
(769,93,55.00,2,1,'2020-11-29 23:35:00'),
(770,113,22.00,1,0,'2020-11-29 23:36:00'),
(771,37,32.00,2,1,'2020-11-29 23:37:00'),
(772,70,15.00,1,0,'2020-12-23 17:59:00'),
(773,70,22.00,2,1,'2020-12-23 17:59:00'),
(774,71,14.00,1,0,'2020-12-23 18:00:00'),
(775,72,15.00,1,0,'2020-12-23 18:00:00'),
(776,73,14.00,1,0,'2020-12-23 18:00:00'),
(777,74,14.00,1,0,'2020-12-23 18:01:00'),
(778,75,14.00,1,0,'2020-12-23 18:01:00'),
(779,77,14.00,1,0,'2020-12-23 18:08:00'),
(780,75,22.00,2,1,'2020-12-23 18:08:00'),
(781,76,14.00,1,0,'2020-12-23 18:09:00'),
(782,78,14.00,1,0,'2020-12-23 18:09:00'),
(783,80,14.00,1,0,'2020-12-23 18:10:00'),
(784,89,15.00,1,1,'2020-12-23 18:11:00'),
(785,51,0.00,3,1,'2020-12-30 21:28:00'),
(786,104,8.00,1,0,'2020-12-30 21:30:00'),
(787,104,10.00,3,0,'2020-12-30 21:31:00'),
(788,105,10.00,1,0,'2020-12-30 21:31:00'),
(789,104,10.00,1,0,'2020-12-30 21:32:00'),
(790,104,0.00,3,1,'2020-12-30 21:32:00'),
(791,20,125.00,2,1,'2021-01-05 14:59:00'),
(792,21,95.00,1,0,'2021-01-05 15:00:00'),
(793,165,85.00,1,0,'2021-01-05 15:00:00'),
(794,166,85.00,1,0,'2021-01-05 15:01:00'),
(795,167,85.00,1,0,'2021-01-05 15:01:00'),
(796,181,85.00,1,0,'2021-01-31 20:41:58'),
(797,181,125.00,2,1,'2021-01-31 20:42:51'),
(798,181,0.00,3,1,'2021-01-31 20:43:10'),
(799,203,0.00,3,1,'2021-01-31 20:44:57'),
(800,203,95.00,1,0,'2021-01-31 20:45:10'),
(801,203,135.00,2,1,'2021-01-31 20:45:24'),
(802,204,135.00,2,1,'2021-01-31 20:48:22'),
(803,204,95.00,1,0,'2021-01-31 20:48:36'),
(804,204,0.00,3,1,'2021-01-31 20:48:49'),
(805,205,0.00,3,1,'2021-01-31 20:49:15'),
(806,205,95.00,1,0,'2021-01-31 20:49:32'),
(807,205,135.00,2,1,'2021-01-31 20:49:47'),
(808,206,95.00,1,0,'2021-01-31 20:50:08'),
(809,206,135.00,2,1,'2021-01-31 20:50:20'),
(810,206,0.00,3,1,'2021-01-31 20:50:31'),
(811,207,0.00,3,1,'2021-01-31 20:50:50'),
(812,207,85.00,1,0,'2021-01-31 20:51:05'),
(813,207,135.00,2,1,'2021-01-31 20:51:17'),
(814,208,125.00,2,1,'2021-01-31 20:53:10'),
(815,208,85.00,1,0,'2021-01-31 20:53:22'),
(816,208,0.00,3,1,'2021-01-31 20:53:37'),
(817,209,0.00,3,1,'2021-01-31 20:53:55'),
(818,209,85.00,1,0,'2021-01-31 20:54:10'),
(819,209,125.00,2,1,'2021-01-31 20:54:23'),
(820,210,125.00,2,1,'2021-01-31 20:54:56'),
(821,210,85.00,1,0,'2021-01-31 20:55:10'),
(822,210,0.00,3,1,'2021-01-31 20:55:23'),
(823,211,0.00,3,1,'2021-01-31 20:55:40'),
(824,211,135.00,2,1,'2021-01-31 20:55:58'),
(825,211,95.00,1,0,'2021-01-31 20:56:10'),
(826,212,95.00,1,0,'2021-01-31 20:56:28'),
(827,212,135.00,2,1,'2021-01-31 20:56:44'),
(828,212,0.00,3,1,'2021-01-31 20:56:56'),
(829,213,0.00,3,1,'2021-01-31 20:57:20'),
(830,213,95.00,1,0,'2021-01-31 20:57:37'),
(831,213,135.00,2,1,'2021-01-31 20:57:53'),
(832,214,135.00,2,1,'2021-01-31 20:58:10'),
(833,214,95.00,1,0,'2021-01-31 20:58:23'),
(834,214,0.00,3,1,'2021-01-31 20:58:35'),
(835,215,0.00,3,1,'2021-01-31 20:58:53'),
(836,215,95.00,1,0,'2021-01-31 20:59:09'),
(837,215,135.00,2,1,'2021-01-31 20:59:23'),
(838,216,135.00,2,1,'2021-01-31 20:59:45'),
(839,216,95.00,1,0,'2021-01-31 20:59:57'),
(840,216,0.00,3,1,'2021-01-31 21:00:09'),
(841,217,0.00,3,1,'2021-01-31 21:00:24'),
(842,217,95.00,1,0,'2021-01-31 21:00:35'),
(843,217,135.00,2,1,'2021-01-31 21:00:49'),
(844,218,125.00,2,1,'2021-01-31 21:01:08'),
(845,218,85.00,1,0,'2021-01-31 21:01:23'),
(846,218,0.00,3,1,'2021-01-31 21:01:34'),
(847,219,85.00,1,0,'2021-01-31 21:01:54'),
(848,219,125.00,2,1,'2021-01-31 21:02:07'),
(849,219,0.00,3,1,'2021-01-31 21:02:18'),
(850,220,0.00,3,1,'2021-01-31 21:04:09'),
(851,220,85.00,1,0,'2021-01-31 21:04:20'),
(852,220,125.00,2,1,'2021-01-31 21:04:32'),
(853,221,125.00,2,1,'2021-01-31 21:04:47'),
(854,221,85.00,1,0,'2021-01-31 21:04:59'),
(855,221,0.00,3,1,'2021-01-31 21:05:12'),
(856,222,0.00,3,1,'2021-01-31 21:05:28'),
(857,222,85.00,1,0,'2021-01-31 21:05:39'),
(858,222,125.00,2,1,'2021-01-31 21:05:51'),
(859,223,125.00,2,1,'2021-01-31 21:06:07'),
(860,223,85.00,1,0,'2021-01-31 21:06:18'),
(861,223,0.00,3,1,'2021-01-31 21:06:31'),
(862,224,0.00,3,1,'2021-01-31 21:06:56'),
(863,224,85.00,1,0,'2021-01-31 21:07:08'),
(864,224,125.00,2,1,'2021-01-31 21:07:20'),
(865,225,125.00,2,1,'2021-01-31 21:07:34'),
(866,225,85.00,1,0,'2021-01-31 21:07:46'),
(867,225,0.00,3,1,'2021-01-31 21:07:59'),
(868,226,0.00,3,1,'2021-01-31 21:08:15'),
(869,226,85.00,1,0,'2021-01-31 21:08:27'),
(870,226,125.00,2,1,'2021-01-31 21:08:38'),
(871,227,125.00,2,1,'2021-01-31 21:09:00'),
(872,227,0.00,3,1,'2021-01-31 21:09:14'),
(873,227,85.00,1,0,'2021-01-31 21:09:29'),
(874,182,65.00,1,0,'2021-01-31 21:10:05'),
(875,182,85.00,2,1,'2021-01-31 21:10:15'),
(876,182,0.00,3,1,'2021-01-31 21:10:26'),
(877,183,0.00,3,1,'2021-01-31 21:10:44'),
(878,183,65.00,1,0,'2021-01-31 21:10:55'),
(879,183,85.00,2,1,'2021-01-31 21:11:05'),
(880,184,54.00,2,1,'2021-01-31 21:11:23'),
(881,184,35.00,1,0,'2021-01-31 21:11:36'),
(882,184,0.00,3,1,'2021-01-31 21:11:48'),
(883,185,0.00,3,1,'2021-01-31 21:12:03'),
(884,185,35.00,1,0,'2021-01-31 21:12:17'),
(885,185,54.00,2,1,'2021-01-31 21:12:27'),
(886,186,38.00,2,1,'2021-01-31 21:12:43'),
(887,186,25.00,1,0,'2021-01-31 21:12:53'),
(888,186,0.00,3,1,'2021-01-31 21:13:03'),
(889,187,35.00,1,0,'2021-01-31 21:13:20'),
(890,187,54.00,2,1,'2021-01-31 21:13:30'),
(891,187,0.00,3,1,'2021-01-31 21:13:39'),
(892,188,0.00,3,1,'2021-01-31 21:13:56'),
(893,188,35.00,1,0,'2021-01-31 21:14:06'),
(894,188,54.00,2,1,'2021-01-31 21:14:17'),
(895,189,38.00,2,0,'2021-01-31 21:14:34'),
(896,189,25.00,1,0,'2021-01-31 21:14:44'),
(897,189,0.00,3,1,'2021-01-31 21:14:55'),
(898,190,0.00,3,1,'2021-01-31 21:15:10'),
(899,190,25.00,1,0,'2021-01-31 21:15:21'),
(900,190,38.00,2,1,'2021-01-31 21:15:39'),
(901,191,38.00,2,1,'2021-01-31 21:15:53'),
(902,191,25.00,1,0,'2021-01-31 21:16:05'),
(903,191,0.00,3,1,'2021-01-31 21:16:16'),
(904,192,0.00,3,1,'2021-01-31 21:16:51'),
(905,192,25.00,1,0,'2021-01-31 21:17:02'),
(906,192,38.00,2,1,'2021-01-31 21:17:13'),
(907,194,38.00,2,1,'2021-01-31 21:17:29'),
(908,194,25.00,1,0,'2021-01-31 21:17:40'),
(909,194,0.00,3,1,'2021-01-31 21:17:51'),
(910,195,38.00,2,1,'2021-01-31 21:18:30'),
(911,195,30.00,1,0,'2021-01-31 21:18:41'),
(912,195,0.00,3,1,'2021-01-31 21:18:54'),
(913,196,0.00,3,1,'2021-01-31 21:19:09'),
(914,196,25.00,1,0,'2021-01-31 21:19:20'),
(915,196,38.00,2,1,'2021-01-31 21:19:31'),
(916,197,38.00,2,1,'2021-01-31 21:19:42'),
(917,197,25.00,1,0,'2021-01-31 21:20:14'),
(918,197,0.00,3,1,'2021-01-31 21:20:25'),
(919,199,0.00,3,1,'2021-01-31 21:20:39'),
(920,199,25.00,1,0,'2021-01-31 21:20:49'),
(921,199,38.00,2,1,'2021-01-31 21:21:00'),
(922,200,38.00,2,1,'2021-01-31 21:21:12'),
(923,200,25.00,1,0,'2021-01-31 21:21:23'),
(924,200,0.00,3,1,'2021-01-31 21:21:37'),
(925,201,0.00,3,1,'2021-01-31 21:21:53'),
(926,201,25.00,1,0,'2021-01-31 21:22:04'),
(927,201,38.00,2,1,'2021-01-31 21:22:38'),
(928,228,85.00,2,1,'2021-01-31 21:23:10'),
(929,228,65.00,1,0,'2021-01-31 21:23:22'),
(930,228,0.00,3,1,'2021-01-31 21:23:33'),
(931,229,0.00,3,1,'2021-01-31 21:23:49'),
(932,229,85.00,2,1,'2021-01-31 21:24:00'),
(933,229,65.00,1,0,'2021-01-31 21:24:12'),
(934,230,65.00,1,0,'2021-01-31 21:24:27'),
(935,230,85.00,2,1,'2021-01-31 21:24:38'),
(936,230,0.00,3,1,'2021-01-31 21:24:51'),
(937,231,0.00,3,1,'2021-01-31 21:25:07'),
(938,231,65.00,1,0,'2021-01-31 21:25:18'),
(939,231,85.00,2,1,'2021-01-31 21:25:29'),
(940,232,85.00,2,1,'2021-01-31 21:25:46'),
(941,232,65.00,1,0,'2021-01-31 21:25:58'),
(942,232,0.00,3,1,'2021-01-31 21:26:12'),
(943,233,0.00,3,1,'2021-01-31 21:26:38'),
(944,233,70.00,1,0,'2021-01-31 21:26:51'),
(945,233,100.00,2,1,'2021-01-31 21:27:05'),
(946,234,95.00,2,1,'2021-01-31 21:27:24'),
(947,234,65.00,1,0,'2021-01-31 21:27:37'),
(948,234,0.00,3,1,'2021-01-31 21:27:49'),
(949,235,85.00,2,1,'2021-01-31 21:28:07'),
(950,235,65.00,1,0,'2021-01-31 21:28:19'),
(951,235,0.00,3,1,'2021-01-31 21:28:34'),
(952,236,0.00,3,1,'2021-01-31 21:28:52'),
(953,236,65.00,1,0,'2021-01-31 21:29:03'),
(954,236,85.00,2,1,'2021-01-31 21:29:15'),
(955,237,85.00,2,1,'2021-01-31 21:29:32'),
(956,237,65.00,1,0,'2021-01-31 21:29:43'),
(957,237,0.00,3,1,'2021-01-31 21:29:56'),
(958,238,0.00,3,1,'2021-01-31 21:30:11'),
(959,238,65.00,1,0,'2021-01-31 21:30:22'),
(960,238,85.00,2,1,'2021-01-31 21:30:34'),
(961,239,65.00,1,0,'2021-01-31 20:28:32'),
(962,239,85.00,2,1,'2021-01-31 20:28:46'),
(963,239,0.00,3,1,'2021-01-31 20:28:59'),
(964,240,55.00,1,0,'2021-01-31 20:29:17'),
(965,240,75.00,2,1,'2021-01-31 20:29:34'),
(966,240,0.00,3,1,'2021-01-31 20:29:48'),
(967,241,35.00,1,0,'2021-01-31 20:30:08'),
(968,241,64.00,2,0,'2021-01-31 20:30:23'),
(969,241,0.00,3,1,'2021-01-31 20:30:34'),
(970,241,54.00,2,1,'2021-01-31 20:30:54'),
(971,242,54.00,2,1,'2021-01-31 20:31:09'),
(972,242,35.00,1,0,'2021-01-31 20:31:23'),
(973,242,0.00,3,1,'2021-01-31 20:31:34'),
(974,243,35.00,1,0,'2021-01-31 20:31:51'),
(975,243,54.00,2,1,'2021-01-31 20:32:04'),
(976,243,0.00,3,1,'2021-01-31 20:32:14'),
(977,244,35.00,1,0,'2021-01-31 20:32:32'),
(978,245,54.00,2,1,'2021-01-31 20:32:48'),
(979,244,54.00,2,1,'2021-01-31 20:33:02'),
(980,244,0.00,3,1,'2021-01-31 20:33:13'),
(981,245,35.00,1,0,'2021-01-31 20:33:28'),
(982,245,0.00,3,1,'2021-01-31 20:33:40'),
(983,246,35.00,1,0,'2021-01-31 20:33:57'),
(984,246,54.00,2,1,'2021-01-31 20:34:08'),
(985,247,54.00,2,1,'2021-01-31 20:34:34'),
(986,246,0.00,3,1,'2021-01-31 20:34:47'),
(987,247,35.00,1,0,'2021-01-31 20:35:00'),
(988,247,0.00,3,1,'2021-01-31 20:35:11'),
(989,248,35.00,1,0,'2021-01-31 20:35:35'),
(990,248,54.00,2,1,'2021-01-31 20:35:48'),
(991,248,0.00,3,1,'2021-01-31 20:36:07'),
(992,249,40.00,1,0,'2021-01-31 20:36:25'),
(993,249,60.00,2,1,'2021-01-31 20:36:45'),
(994,249,40.00,1,0,'2021-01-31 20:37:03'),
(995,249,0.00,3,1,'2021-01-31 20:37:15'),
(996,250,35.00,1,0,'2021-01-31 20:37:37'),
(997,250,54.00,2,1,'2021-01-31 20:37:48'),
(998,250,0.00,3,1,'2021-01-31 20:37:59'),
(999,251,35.00,1,0,'2021-01-31 20:38:16'),
(1000,251,54.00,2,1,'2021-01-31 20:38:28'),
(1001,251,0.00,3,1,'2021-01-31 20:38:40'),
(1002,255,40.00,1,1,'2021-01-31 20:39:09'),
(1003,255,60.00,2,1,'2021-01-31 20:39:21'),
(1004,255,0.00,3,1,'2021-01-31 20:39:33'),
(1005,256,35.00,1,0,'2021-01-31 20:39:51'),
(1006,256,54.00,2,1,'2021-01-31 20:40:09'),
(1007,256,0.00,3,1,'2021-01-31 20:40:25'),
(1008,257,35.00,1,0,'2021-01-31 20:40:42'),
(1009,257,54.00,2,1,'2021-01-31 20:40:57'),
(1010,257,0.00,3,1,'2021-01-31 20:41:09'),
(1011,258,35.00,1,0,'2021-01-31 20:41:26'),
(1012,258,54.00,2,1,'2021-01-31 20:41:43'),
(1013,258,0.00,3,1,'2021-01-31 20:41:55'),
(1014,259,35.00,1,0,'2021-01-31 20:42:25'),
(1015,259,54.00,2,1,'2021-01-31 20:42:36'),
(1016,259,0.00,3,1,'2021-01-31 20:42:50'),
(1017,260,35.00,1,0,'2021-01-31 20:43:08'),
(1018,260,54.00,2,1,'2021-01-31 20:43:22'),
(1019,260,0.00,3,1,'2021-01-31 20:43:37'),
(1020,261,35.00,1,0,'2021-01-31 20:43:56'),
(1021,261,54.00,2,0,'2021-01-31 20:44:09'),
(1022,261,0.00,2,0,'2021-01-31 20:44:27'),
(1023,261,54.00,2,1,'2021-01-31 20:44:46'),
(1024,261,0.00,3,1,'2021-01-31 20:44:59'),
(1025,262,25.00,1,0,'2021-01-31 20:45:18'),
(1026,262,45.00,2,1,'2021-01-31 20:45:36'),
(1027,262,0.00,3,1,'2021-01-31 20:45:48'),
(1028,263,40.00,1,1,'2021-01-31 20:46:17'),
(1029,263,60.00,2,1,'2021-01-31 20:46:29'),
(1030,264,35.00,1,0,'2021-01-31 20:46:45'),
(1031,264,54.00,2,1,'2021-01-31 20:46:56'),
(1032,264,0.00,3,1,'2021-01-31 20:47:07'),
(1033,265,35.00,1,0,'2021-01-31 20:47:26'),
(1034,265,54.00,2,1,'2021-01-31 20:47:46'),
(1035,265,0.00,3,1,'2021-01-31 20:48:00'),
(1036,266,35.00,1,0,'2021-01-31 20:48:14'),
(1037,266,54.00,2,1,'2021-01-31 20:48:25'),
(1038,266,0.00,3,1,'2021-01-31 20:48:38'),
(1039,267,35.00,1,0,'2021-01-31 20:48:58'),
(1040,267,54.00,2,1,'2021-01-31 20:49:11'),
(1041,267,0.00,3,1,'2021-01-31 20:49:26'),
(1042,268,35.00,1,0,'2021-01-31 20:49:42'),
(1043,268,54.00,2,1,'2021-01-31 20:49:54'),
(1044,268,0.00,3,1,'2021-01-31 20:50:06'),
(1045,109,110.00,1,0,'2021-01-31 20:51:33'),
(1046,116,125.00,1,1,'2021-01-31 20:53:13'),
(1047,109,0.00,3,1,'2021-01-31 20:55:37'),
(1048,116,170.00,2,1,'2021-01-31 20:56:18'),
(1049,109,160.00,1,0,'2021-01-31 20:57:15'),
(1050,109,160.00,2,1,'2021-01-31 20:57:58'),
(1051,109,110.00,1,1,'2021-01-31 20:58:24'),
(1052,168,150.00,1,1,'2021-01-31 20:59:19'),
(1053,168,180.00,2,0,'2021-01-31 21:00:00'),
(1054,281,160.00,2,1,'2021-01-31 21:00:43'),
(1055,281,110.00,1,1,'2021-01-31 21:01:03'),
(1056,281,0.00,3,1,'2021-01-31 21:01:24'),
(1057,282,200.00,1,1,'2021-01-31 21:01:59'),
(1058,282,270.00,2,1,'2021-01-31 21:02:19'),
(1059,282,0.00,3,1,'2021-01-31 21:02:38'),
(1060,283,190.00,1,1,'2021-01-31 21:03:13'),
(1061,283,260.00,2,1,'2021-01-31 21:03:30'),
(1062,283,0.00,3,1,'2021-01-31 21:03:46'),
(1063,284,180.00,1,1,'2021-01-31 21:04:20'),
(1064,284,250.00,2,1,'2021-01-31 21:04:36'),
(1065,284,0.00,3,1,'2021-01-31 21:04:48'),
(1066,290,180.00,1,1,'2021-01-31 21:06:46'),
(1067,290,250.00,2,1,'2021-01-31 21:07:17'),
(1068,290,0.00,3,1,'2021-01-31 21:07:32'),
(1069,285,360.00,1,1,'2021-01-31 21:07:59'),
(1070,285,490.00,2,1,'2021-01-31 21:08:15'),
(1071,285,0.00,3,1,'2021-01-31 21:08:31'),
(1072,288,360.00,1,1,'2021-01-31 21:09:33'),
(1073,288,490.00,2,1,'2021-01-31 21:09:48'),
(1074,288,0.00,3,1,'2021-01-31 21:10:22'),
(1075,287,380.00,1,1,'2021-01-31 21:11:03'),
(1076,287,510.00,2,1,'2021-01-31 21:11:27'),
(1077,287,0.00,3,1,'2021-01-31 21:11:51'),
(1078,286,400.00,1,1,'2021-01-31 21:12:26'),
(1079,286,530.00,2,1,'2021-01-31 21:12:41'),
(1080,286,0.00,3,1,'2021-01-31 21:12:59'),
(1081,112,220.00,2,1,'2021-01-31 21:14:14'),
(1082,269,200.00,1,0,'2021-01-31 21:16:05'),
(1083,269,275.00,2,1,'2021-01-31 21:16:18'),
(1084,269,0.00,3,1,'2021-01-31 21:16:38'),
(1085,270,280.00,1,0,'2021-01-31 21:17:07'),
(1086,270,380.00,2,1,'2021-01-31 21:17:26'),
(1087,270,0.00,3,1,'2021-01-31 21:17:45'),
(1088,271,380.00,1,0,'2021-01-31 21:18:09'),
(1089,271,520.00,2,1,'2021-01-31 21:18:26'),
(1090,271,0.00,3,1,'2021-01-31 21:18:40'),
(1091,15,14.00,1,0,'2021-02-07 18:13:17'),
(1092,735,65.00,1,0,'2021-02-24 19:12:44'),
(1093,735,65.00,1,1,'2021-02-24 19:12:59'),
(1094,660,30.00,1,1,'2021-03-04 18:39:34'),
(1095,911,30.00,1,1,'2021-03-24 19:22:23'),
(1096,154,16.00,1,0,'2021-05-06 01:12:15'),
(1097,5,16.00,1,1,'2021-05-06 01:22:33'),
(1098,6,15.00,1,1,'2021-05-06 01:25:10'),
(1099,8,15.00,1,1,'2021-05-06 01:25:36'),
(1100,11,15.00,1,1,'2021-05-06 01:25:46'),
(1101,9,15.00,1,1,'2021-05-06 01:26:03'),
(1102,10,15.00,1,1,'2021-05-06 01:26:14'),
(1103,12,15.00,1,1,'2021-05-06 01:26:41'),
(1104,134,15.00,1,1,'2021-05-06 01:26:55'),
(1105,13,15.00,1,1,'2021-05-06 01:27:09'),
(1106,133,15.00,1,1,'2021-05-06 01:27:23'),
(1107,135,15.00,1,1,'2021-05-06 01:27:42'),
(1108,71,15.00,1,0,'2021-05-06 01:28:50'),
(1109,73,15.00,1,0,'2021-05-06 01:29:04'),
(1110,74,15.00,1,0,'2021-05-06 01:29:18'),
(1111,75,15.00,1,0,'2021-05-06 01:29:29'),
(1112,76,15.00,1,0,'2021-05-06 01:29:41'),
(1113,77,15.00,1,0,'2021-05-06 01:29:54'),
(1114,78,15.00,1,0,'2021-05-06 01:30:05'),
(1115,80,15.00,1,0,'2021-05-06 01:30:23'),
(1116,14,18.00,1,0,'2021-05-06 01:30:56'),
(1117,15,15.00,1,1,'2021-05-06 01:31:09'),
(1118,149,28.00,1,1,'2021-05-06 01:32:57'),
(1119,156,35.00,1,0,'2021-05-06 01:33:55'),
(1120,153,40.00,1,0,'2021-05-06 01:35:49'),
(1121,157,35.00,1,1,'2021-05-06 01:36:10'),
(1122,82,75.00,1,0,'2021-05-06 01:36:27'),
(1123,81,70.00,1,0,'2021-05-06 01:36:42'),
(1124,83,70.00,1,0,'2021-05-06 01:36:55'),
(1125,180,75.00,1,0,'2021-05-06 01:37:42'),
(1126,22,90.00,1,0,'2021-05-06 01:39:08'),
(1127,21,100.00,1,0,'2021-05-06 01:39:28'),
(1128,165,90.00,1,0,'2021-05-06 01:39:42'),
(1129,18,100.00,1,0,'2021-05-06 01:39:55'),
(1130,19,100.00,1,0,'2021-05-06 01:40:09'),
(1131,20,90.00,3,0,'2021-05-06 01:40:21'),
(1132,20,90.00,1,0,'2021-05-06 01:40:30'),
(1133,20,0.00,3,1,'2021-05-06 01:40:46'),
(1134,166,90.00,1,0,'2021-05-06 01:41:05'),
(1135,167,90.00,1,0,'2021-05-06 01:41:29'),
(1136,181,90.00,1,0,'2021-05-06 01:41:49'),
(1137,208,90.00,1,0,'2021-05-06 01:42:09'),
(1138,209,90.00,1,0,'2021-05-06 01:42:25'),
(1139,210,90.00,1,0,'2021-05-06 01:42:37'),
(1140,211,100.00,1,0,'2021-05-06 01:43:14'),
(1141,23,90.00,1,0,'2021-05-06 01:43:30'),
(1142,24,90.00,1,0,'2021-05-06 01:43:46'),
(1143,203,100.00,1,0,'2021-05-06 01:44:06'),
(1144,204,100.00,1,0,'2021-05-06 01:44:20'),
(1145,205,100.00,1,0,'2021-05-06 01:44:38'),
(1146,206,100.00,1,0,'2021-05-06 01:44:53'),
(1147,207,90.00,1,0,'2021-05-06 01:45:07'),
(1148,212,100.00,1,0,'2021-05-06 01:45:24'),
(1149,214,100.00,1,0,'2021-05-06 01:45:37'),
(1150,213,100.00,1,0,'2021-05-06 01:45:53'),
(1151,215,100.00,1,0,'2021-05-06 01:46:19'),
(1152,216,100.00,1,0,'2021-05-06 01:46:41'),
(1153,217,100.00,1,0,'2021-05-06 01:47:00'),
(1154,219,90.00,1,0,'2021-05-06 01:47:23'),
(1155,220,90.00,1,0,'2021-05-06 01:47:40'),
(1156,218,90.00,1,0,'2021-05-06 01:47:57'),
(1157,221,90.00,1,0,'2021-05-06 01:48:13'),
(1158,222,90.00,1,0,'2021-05-06 01:48:27'),
(1159,224,90.00,1,0,'2021-05-06 01:48:44'),
(1160,223,90.00,1,0,'2021-05-06 01:49:03'),
(1161,225,90.00,1,0,'2021-05-06 01:49:18'),
(1162,226,90.00,1,0,'2021-05-06 01:49:32'),
(1163,227,90.00,1,0,'2021-05-06 01:49:47'),
(1164,28,65.00,1,1,'2021-05-06 01:50:06'),
(1165,29,75.00,1,1,'2021-05-06 01:50:19'),
(1166,174,75.00,1,0,'2021-05-06 01:50:39'),
(1167,174,80.00,1,1,'2021-05-06 01:50:57'),
(1168,182,75.00,1,0,'2021-05-06 01:51:32'),
(1169,183,75.00,1,0,'2021-05-06 01:51:47'),
(1170,228,75.00,1,0,'2021-05-06 01:52:07'),
(1171,240,65.00,1,1,'2021-05-06 01:52:24'),
(1172,232,75.00,1,0,'2021-05-06 01:52:37'),
(1173,229,75.00,1,1,'2021-05-06 01:53:03'),
(1174,230,75.00,1,1,'2021-05-06 01:53:16'),
(1175,228,65.00,1,0,'2021-05-06 01:53:40'),
(1176,182,65.00,1,0,'2021-05-06 01:53:57'),
(1177,183,65.00,1,0,'2021-05-06 01:54:09'),
(1178,232,65.00,1,0,'2021-05-06 01:54:33'),
(1179,234,75.00,1,1,'2021-05-06 01:55:11'),
(1180,233,80.00,1,1,'2021-05-06 01:55:39'),
(1181,236,75.00,1,1,'2021-05-06 01:56:00'),
(1182,237,75.00,1,1,'2021-05-06 01:56:14'),
(1183,54,40.00,1,1,'2021-05-06 01:57:07'),
(1184,55,35.00,1,1,'2021-05-06 01:57:23'),
(1185,51,20.00,1,1,'2021-05-06 01:57:48'),
(1186,52,25.00,1,1,'2021-05-06 01:58:02'),
(1187,46,23.00,1,1,'2021-05-06 01:58:31'),
(1188,113,23.00,1,1,'2021-05-06 01:58:43'),
(1189,91,28.00,1,1,'2021-05-06 01:59:18'),
(1190,291,25.00,1,1,'2021-05-06 01:59:50'),
(1191,92,32.00,1,1,'2021-05-06 02:00:24'),
(1192,37,23.00,1,1,'2021-05-06 02:00:42'),
(1193,95,32.00,1,1,'2021-05-06 02:01:04'),
(1194,169,32.00,1,1,'2021-05-06 02:01:22'),
(1195,38,85.00,1,1,'2021-05-06 02:01:49'),
(1196,96,100.00,1,1,'2021-05-06 02:02:03'),
(1197,170,100.00,1,1,'2021-05-06 02:02:13'),
(1198,119,15.00,1,0,'2021-05-11 16:54:08'),
(1199,120,15.00,1,0,'2021-05-11 16:54:27'),
(1200,31,38.00,1,0,'2021-05-11 16:58:04'),
(1201,30,42.00,1,1,'2021-05-11 16:58:21'),
(1202,249,42.00,1,0,'2021-05-11 16:59:15'),
(1203,251,38.00,1,0,'2021-05-11 16:59:36'),
(1204,196,28.00,1,0,'2021-05-11 17:00:22'),
(1205,33,32.00,1,0,'2021-05-11 17:00:39'),
(1206,186,28.00,1,0,'2021-05-11 17:00:56'),
(1207,189,28.00,2,0,'2021-05-11 17:01:09'),
(1208,191,28.00,1,0,'2021-05-11 17:01:29'),
(1209,186,25.00,1,0,'2021-05-11 17:02:10'),
(1210,195,32.00,1,0,'2021-05-11 17:02:30'),
(1211,197,28.00,1,0,'2021-05-11 17:02:55'),
(1212,291,25.00,1,1,'2021-05-11 17:05:56'),
(1213,291,0.00,3,1,'2021-05-11 17:06:16'),
(1214,105,15.00,1,1,'2021-05-11 17:07:03'),
(1215,104,15.00,1,1,'2021-05-11 17:07:18'),
(1216,72,16.00,1,1,'2021-05-24 01:50:33'),
(1217,7,16.00,1,1,'2021-05-24 01:50:47'),
(1218,129,16.00,1,1,'2021-05-24 01:51:24'),
(1219,126,20.00,1,0,'2021-05-24 01:51:54'),
(1220,85,65.00,1,0,'2021-05-24 01:52:14'),
(1221,86,70.00,1,1,'2021-05-24 01:52:41'),
(1222,245,38.00,1,1,'2021-05-24 01:53:10'),
(1223,161,65.00,1,0,'2021-05-28 15:13:24'),
(1224,163,70.00,1,0,'2021-05-28 15:14:05'),
(1225,153,35.00,1,1,'2021-05-28 15:15:13'),
(1226,154,35.00,1,1,'2021-05-28 15:15:38'),
(1227,155,35.00,1,1,'2021-05-28 15:15:57'),
(1228,156,30.00,1,1,'2021-05-28 15:16:15'),
(1229,186,28.00,1,0,'2021-05-28 15:17:32'),
(1230,190,28.00,1,0,'2021-05-28 15:18:27'),
(1231,192,28.00,1,1,'2021-05-28 15:18:45'),
(1232,194,28.00,1,1,'2021-05-28 15:18:59'),
(1233,199,28.00,1,1,'2021-05-28 15:19:41'),
(1234,200,28.00,1,1,'2021-05-28 15:20:02'),
(1235,201,28.00,1,1,'2021-05-28 15:20:20'),
(1236,189,28.00,1,0,'2021-05-28 15:20:35'),
(1237,189,38.00,2,1,'2021-05-28 15:20:51'),
(1238,84,65.00,1,0,'2021-05-28 15:22:01'),
(1239,164,65.00,1,0,'2021-05-28 15:22:16'),
(1240,88,70.00,1,1,'2021-05-28 15:23:03'),
(1241,185,38.00,1,1,'2021-05-28 15:23:42'),
(1242,188,38.00,1,1,'2021-05-28 15:23:56'),
(1243,244,38.00,1,1,'2021-05-28 15:24:11'),
(1244,246,38.00,1,1,'2021-05-28 15:24:22'),
(1245,247,38.00,1,1,'2021-05-28 15:24:50'),
(1246,248,38.00,1,1,'2021-05-28 15:25:04'),
(1247,264,38.00,1,1,'2021-05-28 15:25:21'),
(1248,265,38.00,1,1,'2021-05-28 15:25:40'),
(1249,266,38.00,1,1,'2021-05-28 15:25:52'),
(1250,267,38.00,1,1,'2021-05-28 15:26:11'),
(1251,268,38.00,1,1,'2021-05-28 15:26:24'),
(1252,184,38.00,1,0,'2021-05-28 15:27:10'),
(1253,187,38.00,1,0,'2021-05-28 15:27:29'),
(1254,242,38.00,1,0,'2021-05-28 15:27:47'),
(1255,243,38.00,1,1,'2021-05-28 15:28:01'),
(1256,250,38.00,1,0,'2021-05-28 15:28:23'),
(1257,256,38.00,1,0,'2021-05-28 15:28:35'),
(1258,257,38.00,1,0,'2021-05-28 15:28:49'),
(1259,259,38.00,1,1,'2021-05-28 15:29:07'),
(1260,260,38.00,1,1,'2021-05-28 15:29:23'),
(1261,261,38.00,1,1,'2021-05-28 15:29:39'),
(1262,241,38.00,1,0,'2021-05-28 15:29:52'),
(1263,182,75.00,1,1,'2021-05-28 15:31:11'),
(1264,183,75.00,1,1,'2021-05-28 15:31:26'),
(1265,228,75.00,1,1,'2021-05-28 15:31:43'),
(1266,231,75.00,1,1,'2021-05-28 15:32:00'),
(1267,232,75.00,1,1,'2021-05-28 15:32:15'),
(1268,235,75.00,1,1,'2021-05-28 15:32:33'),
(1269,238,75.00,1,1,'2021-05-28 15:33:03'),
(1270,239,75.00,1,1,'2021-05-28 15:33:16'),
(1271,112,170.00,1,1,'2021-05-28 15:37:25'),
(1272,112,170.00,3,1,'2021-05-28 15:38:04'),
(1273,270,300.00,1,1,'2021-05-28 15:38:25'),
(1274,271,380.00,1,1,'2021-05-28 15:39:06'),
(1275,292,360.00,1,1,'2021-05-28 15:39:59'),
(1276,293,400.00,1,0,'2021-05-28 15:40:38'),
(1277,293,400.00,1,1,'2021-05-28 15:41:04'),
(1278,269,210.00,1,1,'2021-05-28 15:41:37'),
(1279,294,89.90,1,1,'2021-05-28 15:42:42'),
(1280,203,101.00,1,0,'2021-05-31 15:31:11'),
(1281,203,100.00,1,0,'2021-05-31 15:31:32'),
(1282,84,70.00,1,0,'2021-08-05 20:13:24'),
(1283,164,70.00,1,1,'2021-08-05 20:13:42'),
(1284,84,65.00,1,0,'2021-08-26 19:19:04'),
(1285,33,33.00,1,1,'2021-12-17 02:41:24'),
(1286,186,30.00,1,1,'2021-12-17 02:42:20'),
(1287,189,30.00,1,1,'2021-12-17 02:42:53'),
(1288,190,30.00,1,1,'2021-12-17 02:43:31'),
(1289,191,30.00,1,1,'2021-12-17 02:44:07'),
(1290,195,33.00,1,1,'2021-12-17 02:44:55'),
(1291,196,30.00,1,1,'2021-12-17 02:45:28'),
(1292,197,30.00,1,1,'2021-12-17 02:45:56'),
(1293,34,28.00,1,1,'2021-12-17 02:47:06'),
(1294,184,40.00,1,1,'2021-12-17 02:47:43'),
(1295,187,40.00,1,1,'2021-12-17 02:47:56'),
(1296,242,40.00,1,1,'2021-12-17 02:48:14'),
(1297,249,45.00,1,1,'2021-12-17 02:48:37'),
(1298,250,40.00,1,1,'2021-12-17 02:48:59'),
(1299,251,40.00,1,1,'2021-12-17 02:49:12'),
(1300,256,40.00,1,1,'2021-12-17 02:49:32'),
(1301,257,40.00,1,1,'2021-12-17 02:49:48'),
(1302,258,40.00,1,1,'2021-12-17 02:50:06'),
(1303,262,28.00,1,1,'2021-12-17 02:50:34'),
(1304,31,40.00,1,1,'2021-12-17 02:51:07'),
(1305,14,20.00,1,1,'2021-12-17 02:52:21'),
(1306,16,22.00,1,1,'2021-12-17 02:52:45'),
(1307,17,20.00,1,1,'2021-12-17 02:53:00'),
(1308,117,18.00,1,0,'2021-12-17 02:53:21'),
(1309,117,16.00,1,1,'2021-12-17 02:53:48'),
(1310,119,16.00,1,1,'2021-12-17 02:54:51'),
(1311,120,16.00,1,1,'2021-12-17 02:55:06'),
(1312,121,20.00,1,1,'2021-12-17 02:55:22'),
(1313,122,20.00,1,1,'2021-12-17 02:55:37'),
(1314,123,20.00,1,1,'2021-12-17 02:56:07'),
(1315,124,20.00,1,1,'2021-12-17 02:56:30'),
(1316,125,20.00,1,1,'2021-12-17 02:56:50'),
(1317,126,22.00,1,1,'2021-12-17 02:57:12'),
(1318,130,18.00,1,1,'2021-12-17 02:57:49'),
(1319,131,18.00,1,1,'2021-12-17 02:58:18'),
(1320,70,17.00,1,1,'2021-12-17 02:59:03'),
(1321,71,16.00,1,1,'2021-12-17 02:59:19'),
(1322,73,16.00,1,1,'2021-12-17 02:59:42'),
(1323,74,16.00,1,1,'2021-12-17 03:00:01'),
(1324,75,16.00,1,1,'2021-12-17 03:00:15'),
(1325,76,16.00,1,1,'2021-12-17 03:00:30'),
(1326,77,16.00,1,1,'2021-12-17 03:00:44'),
(1327,78,16.00,1,1,'2021-12-17 03:00:58'),
(1328,80,16.00,1,1,'2021-12-17 03:01:15'),
(1329,20,95.00,1,1,'2021-12-17 03:02:13'),
(1330,19,105.00,1,1,'2021-12-17 03:02:36'),
(1331,18,105.00,1,1,'2021-12-17 03:02:51'),
(1332,21,105.00,1,1,'2021-12-17 03:03:07'),
(1333,22,95.00,1,1,'2021-12-17 03:03:23'),
(1334,23,95.00,1,1,'2021-12-17 03:03:38'),
(1335,24,95.00,1,1,'2021-12-17 03:03:52'),
(1336,165,95.00,1,1,'2021-12-17 03:04:07'),
(1337,166,95.00,1,1,'2021-12-17 03:04:20'),
(1338,167,95.00,1,1,'2021-12-17 03:04:35'),
(1339,181,95.00,1,1,'2021-12-17 03:04:56'),
(1340,203,105.00,1,1,'2021-12-17 03:05:13'),
(1341,204,105.00,1,1,'2021-12-17 03:05:28'),
(1342,205,105.00,1,1,'2021-12-17 03:05:44'),
(1343,206,105.00,1,1,'2021-12-17 03:05:59'),
(1344,208,95.00,1,1,'2021-12-17 03:06:14'),
(1345,207,95.00,1,1,'2021-12-17 03:06:35'),
(1346,209,95.00,1,1,'2021-12-17 03:07:17'),
(1347,210,95.00,1,1,'2021-12-17 03:07:30'),
(1348,211,105.00,1,1,'2021-12-17 03:07:51'),
(1349,212,105.00,1,1,'2021-12-17 03:08:06'),
(1350,213,105.00,1,1,'2021-12-17 03:08:59'),
(1351,214,105.00,1,1,'2021-12-17 03:09:12'),
(1352,215,105.00,1,1,'2021-12-17 03:09:44'),
(1353,227,95.00,1,1,'2021-12-17 03:09:58'),
(1354,216,105.00,1,1,'2021-12-17 03:10:11'),
(1355,218,95.00,1,1,'2021-12-17 03:10:26'),
(1356,217,105.00,1,1,'2021-12-17 03:10:39'),
(1357,219,95.00,1,1,'2021-12-17 03:11:04'),
(1358,220,95.00,1,1,'2021-12-17 03:11:22'),
(1359,221,95.00,1,1,'2021-12-17 03:11:41'),
(1360,222,95.00,1,1,'2021-12-17 03:11:59'),
(1361,223,95.00,1,1,'2021-12-17 03:12:14'),
(1362,224,95.00,1,1,'2021-12-17 03:12:29'),
(1363,225,95.00,1,1,'2021-12-17 03:12:43'),
(1364,226,95.00,1,1,'2021-12-17 03:12:56'),
(1365,161,70.00,1,1,'2021-12-17 03:13:29'),
(1366,83,80.00,1,1,'2021-12-17 03:14:08'),
(1367,82,80.00,1,1,'2021-12-17 03:14:21'),
(1368,84,70.00,1,1,'2021-12-17 03:14:35'),
(1369,85,70.00,1,1,'2021-12-17 03:14:48'),
(1370,87,70.00,1,1,'2021-12-17 03:15:02'),
(1371,163,80.00,1,1,'2021-12-17 03:15:26'),
(1372,180,80.00,1,1,'2021-12-17 03:15:58'),
(1373,241,40.00,1,1,'2021-12-30 17:45:06'),
(1374,81,80.00,1,1,'2022-01-03 18:45:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3202 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_variantes`
--

LOCK TABLES `tbl_prods_variantes` WRITE;
/*!40000 ALTER TABLE `tbl_prods_variantes` DISABLE KEYS */;
INSERT INTO `tbl_prods_variantes` VALUES (191,28,10,1),
(192,29,10,1),
(193,30,10,1),
(194,31,10,1),
(195,33,10,1),
(196,34,10,1),
(197,35,10,1),
(210,51,10,1),
(211,52,10,1),
(213,54,10,1),
(214,55,10,1),
(263,63,1,1),
(264,63,2,1),
(265,63,3,1),
(266,63,4,1),
(267,63,5,1),
(268,63,7,1),
(269,63,8,1),
(270,63,10,1),
(319,70,3,1),
(320,70,4,1),
(321,70,5,1),
(322,70,10,1),
(323,71,3,1),
(324,71,4,1),
(325,71,5,1),
(326,71,10,1),
(327,72,3,1),
(328,72,4,1),
(329,72,5,1),
(330,72,10,1),
(331,73,3,1),
(332,73,4,1),
(333,73,5,1),
(334,73,10,1),
(335,74,3,1),
(336,74,4,1),
(337,74,5,1),
(338,74,10,1),
(339,75,3,1),
(340,75,4,1),
(341,75,5,1),
(342,75,10,1),
(343,76,3,1),
(344,76,4,1),
(345,76,5,1),
(346,76,10,1),
(347,77,3,1),
(348,77,4,1),
(349,77,5,1),
(350,77,10,1),
(351,78,3,1),
(352,78,4,1),
(353,78,5,1),
(354,78,10,1),
(355,79,3,1),
(356,79,4,1),
(357,79,5,1),
(358,79,10,1),
(359,80,3,1),
(360,80,4,1),
(361,80,5,1),
(362,80,10,1),
(412,91,10,1),
(415,41,10,1),
(417,46,10,1),
(418,47,10,1),
(419,48,10,1),
(420,89,10,1),
(442,45,10,1),
(462,113,10,1),
(463,113,17,1),
(464,112,1,1),
(465,112,2,1),
(466,112,3,1),
(467,112,4,1),
(468,112,5,1),
(469,112,6,1),
(470,112,10,1),
(471,112,15,1),
(472,112,16,1),
(473,112,17,1),
(484,114,1,1),
(485,114,2,1),
(486,114,3,1),
(487,114,4,1),
(488,114,5,1),
(489,114,6,1),
(490,114,10,1),
(491,114,15,1),
(492,114,16,1),
(493,114,17,1),
(504,115,1,1),
(505,115,2,1),
(506,115,4,1),
(507,115,5,1),
(508,115,7,1),
(509,115,10,1),
(510,115,15,1),
(511,115,16,1),
(512,115,17,1),
(557,22,4,1),
(558,22,10,1),
(559,22,17,1),
(560,22,18,1),
(561,22,19,1),
(576,24,4,1),
(577,24,10,1),
(578,24,17,1),
(579,24,18,1),
(580,24,19,1),
(583,37,10,1),
(584,37,17,1),
(587,38,10,1),
(588,38,17,1),
(589,25,10,1),
(590,25,17,1),
(591,36,10,1),
(592,36,17,1),
(593,106,10,1),
(594,106,17,1),
(782,109,10,1),
(783,109,17,1),
(784,109,18,1),
(785,109,19,1),
(786,116,10,1),
(787,116,17,1),
(788,116,18,1),
(789,116,19,1),
(792,107,10,1),
(793,107,17,1),
(822,117,1,1),
(823,117,2,1),
(824,117,3,1),
(825,117,4,1),
(826,117,5,1),
(827,117,10,1),
(828,117,17,1),
(829,118,1,1),
(830,118,2,1),
(831,118,3,1),
(832,118,4,1),
(833,118,5,1),
(834,118,10,1),
(835,118,17,1),
(853,16,3,1),
(854,16,4,1),
(855,16,5,1),
(856,16,7,1),
(857,16,10,1),
(870,0,1,1),
(871,0,2,1),
(872,0,3,1),
(873,0,4,1),
(874,0,5,1),
(875,0,7,1),
(876,0,10,1),
(877,0,17,1),
(918,120,1,0),
(919,120,2,0),
(920,120,3,1),
(921,120,4,1),
(922,120,5,1),
(923,120,7,1),
(924,120,10,1),
(925,120,17,1),
(956,124,1,0),
(957,124,2,0),
(958,124,3,1),
(959,124,4,1),
(960,124,5,1),
(961,124,7,1),
(962,124,10,1),
(963,124,17,1),
(964,123,1,0),
(965,123,2,0),
(966,123,3,1),
(967,123,4,1),
(968,123,5,1),
(969,123,7,1),
(970,123,10,1),
(971,123,17,1),
(972,122,1,1),
(973,122,2,1),
(974,122,3,1),
(975,122,4,1),
(976,122,5,1),
(977,122,7,1),
(978,122,10,1),
(979,122,17,1),
(980,121,1,1),
(981,121,2,1),
(982,121,3,1),
(983,121,4,1),
(984,121,5,1),
(985,121,7,1),
(986,121,10,1),
(987,121,17,1),
(988,125,1,0),
(989,125,2,0),
(990,125,3,1),
(991,125,4,1),
(992,125,5,1),
(993,125,7,1),
(994,125,10,1),
(995,125,17,1),
(1036,127,1,1),
(1037,127,2,1),
(1038,127,3,1),
(1039,127,4,1),
(1040,127,5,1),
(1041,127,7,1),
(1042,127,10,1),
(1043,127,17,1),
(1044,126,1,0),
(1045,126,2,0),
(1046,126,3,1),
(1047,126,4,1),
(1048,126,5,1),
(1049,126,7,1),
(1050,126,10,1),
(1051,126,17,1),
(1052,17,1,1),
(1053,17,2,1),
(1054,17,3,1),
(1055,17,4,1),
(1056,17,5,1),
(1057,17,7,1),
(1058,17,10,1),
(1059,17,17,1),
(1060,14,1,1),
(1061,14,2,1),
(1062,14,3,1),
(1063,14,4,1),
(1064,14,5,1),
(1065,14,7,1),
(1066,14,10,1),
(1067,14,17,1),
(1068,15,1,1),
(1069,15,2,1),
(1070,15,3,1),
(1071,15,4,1),
(1072,15,5,1),
(1073,15,6,1),
(1074,15,7,1),
(1075,15,10,1),
(1076,15,17,1),
(1102,130,1,0),
(1103,130,2,0),
(1104,130,3,1),
(1105,130,4,1),
(1106,130,5,1),
(1107,130,7,1),
(1108,130,10,1),
(1109,130,17,1),
(1110,128,1,1),
(1111,128,2,1),
(1112,128,3,1),
(1113,128,4,1),
(1114,128,5,1),
(1115,128,7,1),
(1116,128,10,1),
(1117,128,17,1),
(1118,129,1,1),
(1119,129,2,1),
(1120,129,3,1),
(1121,129,4,1),
(1122,129,5,1),
(1123,129,7,1),
(1124,129,10,1),
(1125,129,17,1),
(1126,131,1,0),
(1127,131,2,0),
(1128,131,3,1),
(1129,131,4,1),
(1130,131,5,1),
(1131,131,7,1),
(1132,131,10,1),
(1133,131,17,1),
(1142,108,10,1),
(1143,108,17,1),
(1151,13,1,1),
(1152,13,2,1),
(1153,13,3,1),
(1154,13,4,1),
(1155,13,5,1),
(1156,13,7,1),
(1157,13,10,1),
(1222,5,1,1),
(1223,5,2,1),
(1224,5,3,1),
(1225,5,4,1),
(1226,5,5,1),
(1227,5,7,1),
(1228,5,10,1),
(1229,5,17,1),
(1230,5,18,1),
(1231,5,19,1),
(1240,6,1,1),
(1241,6,2,1),
(1242,6,3,1),
(1243,6,4,1),
(1244,6,5,1),
(1245,6,10,1),
(1246,6,17,1),
(1247,6,18,1),
(1248,6,19,1),
(1257,136,1,1),
(1258,136,2,1),
(1259,136,3,1),
(1260,136,4,1),
(1261,136,5,1),
(1262,136,7,1),
(1263,136,10,1),
(1264,136,17,1),
(1281,7,1,1),
(1282,7,2,1),
(1283,7,3,1),
(1284,7,4,1),
(1285,7,5,1),
(1286,7,7,1),
(1287,7,10,1),
(1288,7,17,1),
(1289,138,1,1),
(1290,138,2,1),
(1291,138,3,1),
(1292,138,4,1),
(1293,138,5,1),
(1294,138,7,1),
(1295,138,10,1),
(1296,138,17,1),
(1297,137,1,1),
(1298,137,2,1),
(1299,137,3,1),
(1300,137,4,1),
(1301,137,5,1),
(1302,137,7,1),
(1303,137,10,1),
(1304,137,17,1),
(1305,8,1,1),
(1306,8,2,1),
(1307,8,3,1),
(1308,8,4,1),
(1309,8,5,1),
(1310,8,7,1),
(1311,8,10,1),
(1312,8,17,1),
(1313,8,18,1),
(1314,8,19,1),
(1315,139,1,1),
(1316,139,2,1),
(1317,139,3,1),
(1318,139,4,1),
(1319,139,5,1),
(1320,139,7,1),
(1321,139,10,1),
(1322,139,17,1),
(1331,9,1,1),
(1332,9,2,1),
(1333,9,3,1),
(1334,9,4,1),
(1335,9,5,1),
(1336,9,7,1),
(1337,9,10,1),
(1338,9,17,1),
(1355,140,1,1),
(1356,140,2,1),
(1357,140,3,1),
(1358,140,4,1),
(1359,140,5,1),
(1360,140,7,1),
(1361,140,10,1),
(1362,140,17,1),
(1363,10,1,1),
(1364,10,2,1),
(1365,10,3,1),
(1366,10,4,1),
(1367,10,5,1),
(1368,10,7,1),
(1369,10,10,1),
(1370,10,17,1),
(1371,10,18,1),
(1372,10,19,1),
(1389,141,1,1),
(1390,141,2,1),
(1391,141,3,1),
(1392,141,4,1),
(1393,141,5,1),
(1394,141,7,1),
(1395,141,10,1),
(1396,141,17,1),
(1397,11,1,1),
(1398,11,2,1),
(1399,11,3,1),
(1400,11,4,1),
(1401,11,5,1),
(1402,11,7,1),
(1403,11,10,1),
(1404,11,17,1),
(1405,11,18,1),
(1406,11,19,1),
(1407,142,1,1),
(1408,142,2,1),
(1409,142,3,1),
(1410,142,4,1),
(1411,142,5,1),
(1412,142,7,1),
(1413,142,10,1),
(1414,142,17,1),
(1415,12,1,1),
(1416,12,2,1),
(1417,12,3,1),
(1418,12,4,1),
(1419,12,5,1),
(1420,12,7,1),
(1421,12,10,1),
(1422,12,17,1),
(1423,12,18,1),
(1424,12,19,1),
(1425,143,1,1),
(1426,143,2,1),
(1427,143,3,1),
(1428,143,4,1),
(1429,143,5,1),
(1430,143,7,1),
(1431,143,10,1),
(1432,143,17,1),
(1433,132,1,1),
(1434,132,2,1),
(1435,132,3,1),
(1436,132,4,1),
(1437,132,5,1),
(1438,132,7,1),
(1439,132,10,1),
(1440,132,17,1),
(1441,144,1,1),
(1442,144,2,1),
(1443,144,3,1),
(1444,144,4,1),
(1445,144,5,1),
(1446,144,7,1),
(1447,144,10,1),
(1448,144,17,1),
(1449,133,1,1),
(1450,133,2,1),
(1451,133,3,1),
(1452,133,4,1),
(1453,133,5,1),
(1454,133,7,1),
(1455,133,10,1),
(1456,133,17,1),
(1481,145,1,1),
(1482,145,2,1),
(1483,145,3,1),
(1484,145,4,1),
(1485,145,5,1),
(1486,145,7,1),
(1487,145,10,1),
(1488,145,17,1),
(1489,134,1,1),
(1490,134,2,1),
(1491,134,3,1),
(1492,134,4,1),
(1493,134,5,1),
(1494,134,7,1),
(1495,134,10,1),
(1496,134,17,1),
(1497,146,1,1),
(1498,146,2,1),
(1499,146,3,1),
(1500,146,4,1),
(1501,146,5,1),
(1502,146,7,1),
(1503,146,10,1),
(1504,146,17,1),
(1505,135,1,1),
(1506,135,2,1),
(1507,135,3,1),
(1508,135,4,1),
(1509,135,5,1),
(1510,135,7,1),
(1511,135,10,1),
(1512,135,17,1),
(1513,147,1,1),
(1514,147,2,1),
(1515,147,3,1),
(1516,147,4,1),
(1517,147,5,1),
(1518,147,7,1),
(1519,147,10,1),
(1520,147,17,1),
(1548,68,1,1),
(1549,68,2,1),
(1550,68,3,1),
(1551,68,4,1),
(1552,68,5,1),
(1553,68,7,1),
(1554,68,8,1),
(1555,68,10,1),
(1556,68,17,1),
(1565,58,1,1),
(1566,58,2,1),
(1567,58,3,1),
(1568,58,4,1),
(1569,58,5,1),
(1570,58,7,1),
(1571,58,8,1),
(1572,58,10,1),
(1589,66,1,1),
(1590,66,2,1),
(1591,66,3,1),
(1592,66,4,1),
(1593,66,5,1),
(1594,66,7,1),
(1595,66,10,1),
(1596,66,17,1),
(1597,148,1,1),
(1598,148,2,1),
(1599,148,3,1),
(1600,148,4,1),
(1601,148,5,1),
(1602,148,7,1),
(1603,148,10,1),
(1604,148,17,1),
(1629,67,1,1),
(1630,67,2,1),
(1631,67,3,1),
(1632,67,4,1),
(1633,67,5,1),
(1634,67,7,1),
(1635,67,10,1),
(1636,67,17,1),
(1637,149,1,1),
(1638,149,2,1),
(1639,149,3,1),
(1640,149,4,1),
(1641,149,5,1),
(1642,149,7,1),
(1643,149,10,1),
(1644,149,17,1),
(1645,150,1,1),
(1646,150,2,1),
(1647,150,3,1),
(1648,150,4,1),
(1649,150,5,1),
(1650,150,7,1),
(1651,150,10,1),
(1652,150,17,1),
(1661,57,1,1),
(1662,57,2,1),
(1663,57,3,1),
(1664,57,4,1),
(1665,57,5,1),
(1666,57,7,1),
(1667,57,8,1),
(1668,57,10,1),
(1693,59,1,1),
(1694,59,2,1),
(1695,59,3,1),
(1696,59,4,1),
(1697,59,5,1),
(1698,59,7,1),
(1699,59,8,1),
(1700,59,10,1),
(1725,61,1,1),
(1726,61,2,1),
(1727,61,3,1),
(1728,61,4,1),
(1729,61,5,1),
(1730,61,7,1),
(1731,61,8,0),
(1732,61,10,1),
(1757,152,1,0),
(1758,152,2,0),
(1759,152,3,0),
(1760,152,4,0),
(1761,152,5,0),
(1762,152,7,0),
(1763,152,10,0),
(1764,152,17,0),
(1773,69,1,1),
(1774,69,2,1),
(1775,69,3,1),
(1776,69,4,1),
(1777,69,5,1),
(1778,69,7,1),
(1779,69,8,1),
(1780,69,10,1),
(1807,65,1,1),
(1808,65,2,1),
(1809,65,3,1),
(1810,65,4,1),
(1811,65,5,1),
(1812,65,7,1),
(1813,65,8,1),
(1814,65,10,1),
(1815,65,17,1),
(1825,62,1,1),
(1826,62,2,1),
(1827,62,3,1),
(1828,62,4,1),
(1829,62,5,1),
(1830,62,7,1),
(1831,62,8,1),
(1832,62,10,1),
(1833,62,17,1),
(1842,153,1,1),
(1843,153,2,1),
(1844,153,3,1),
(1845,153,4,1),
(1846,153,5,1),
(1847,153,7,1),
(1848,153,10,1),
(1849,153,17,1),
(1900,156,1,1),
(1901,156,2,1),
(1902,156,3,1),
(1903,156,4,1),
(1904,156,5,1),
(1905,156,6,1),
(1906,156,7,1),
(1907,156,10,1),
(1908,156,17,1),
(1917,157,1,1),
(1918,157,2,1),
(1919,157,3,1),
(1920,157,4,1),
(1921,157,5,1),
(1922,157,7,1),
(1923,157,10,1),
(1924,157,17,1),
(1933,158,1,1),
(1934,158,2,1),
(1935,158,3,1),
(1936,158,4,1),
(1937,158,5,1),
(1938,158,7,1),
(1939,158,10,1),
(1940,158,17,1),
(1949,159,1,1),
(1950,159,2,1),
(1951,159,3,1),
(1952,159,4,1),
(1953,159,5,1),
(1954,159,7,1),
(1955,159,10,1),
(1956,159,17,1),
(1957,160,1,1),
(1958,160,2,1),
(1959,160,3,1),
(1960,160,4,1),
(1961,160,5,1),
(1962,160,7,1),
(1963,160,10,1),
(1964,160,17,1),
(1977,87,4,1),
(1978,87,5,1),
(1979,87,7,1),
(1980,87,8,1),
(1981,87,9,1),
(1982,87,10,1),
(1983,87,17,1),
(1984,85,4,1),
(1985,85,5,1),
(1986,85,7,1),
(1987,85,8,1),
(1988,85,9,1),
(1989,85,10,1),
(1990,85,17,1),
(1991,86,4,1),
(1992,86,5,1),
(1993,86,7,1),
(1994,86,8,1),
(1995,86,9,1),
(1996,86,10,1),
(1997,86,17,1),
(2005,88,4,1),
(2006,88,5,1),
(2007,88,7,1),
(2008,88,8,1),
(2009,88,9,1),
(2010,88,10,1),
(2011,88,17,1),
(2032,162,1,1),
(2033,162,2,1),
(2034,162,3,1),
(2035,162,4,1),
(2036,162,5,1),
(2037,162,8,1),
(2038,162,9,1),
(2039,162,10,1),
(2040,162,17,1),
(2047,82,3,1),
(2048,82,4,1),
(2049,82,5,1),
(2050,82,7,1),
(2051,82,8,1),
(2052,82,9,1),
(2053,82,10,1),
(2054,82,17,1),
(2062,81,3,1),
(2063,81,4,1),
(2064,81,7,1),
(2065,81,8,1),
(2066,81,9,1),
(2067,81,10,1),
(2068,81,17,1),
(2076,83,4,1),
(2077,83,5,1),
(2078,83,7,1),
(2079,83,8,1),
(2080,83,9,1),
(2081,83,10,1),
(2082,83,17,1),
(2091,84,3,1),
(2092,84,4,1),
(2093,84,5,1),
(2094,84,7,1),
(2095,84,8,1),
(2096,84,9,1),
(2097,84,10,1),
(2098,84,17,1),
(2099,161,1,1),
(2100,161,2,1),
(2101,161,3,1),
(2102,161,4,1),
(2103,161,5,1),
(2104,161,7,1),
(2105,161,8,1),
(2106,161,9,1),
(2107,161,10,1),
(2108,161,17,1),
(2140,164,3,1),
(2141,164,4,1),
(2142,164,5,1),
(2143,164,8,1),
(2144,164,9,1),
(2145,164,10,1),
(2146,164,17,1),
(2147,18,4,1),
(2148,18,10,1),
(2149,18,15,1),
(2150,18,17,1),
(2151,18,18,1),
(2152,18,19,1),
(2153,18,20,1),
(2154,19,4,1),
(2155,19,10,1),
(2156,19,15,1),
(2157,19,17,1),
(2158,19,18,1),
(2159,19,19,1),
(2160,19,20,1),
(2161,21,4,1),
(2162,21,10,1),
(2163,21,17,1),
(2164,21,18,1),
(2165,21,19,1),
(2181,165,4,1),
(2182,165,10,1),
(2183,165,17,1),
(2184,165,18,1),
(2185,165,19,1),
(2186,166,4,1),
(2187,166,10,1),
(2188,166,17,1),
(2189,166,18,1),
(2190,166,19,1),
(2191,23,10,1),
(2192,23,15,1),
(2193,23,17,1),
(2194,23,18,1),
(2195,23,19,1),
(2196,23,20,1),
(2203,20,4,1),
(2204,20,10,1),
(2205,20,15,0),
(2206,20,17,1),
(2207,20,18,1),
(2208,20,19,1),
(2209,20,20,0),
(2210,166,24,1),
(2211,165,21,1),
(2212,166,22,0),
(2213,167,4,1),
(2214,167,10,1),
(2215,167,17,1),
(2216,167,22,1),
(2217,167,18,1),
(2218,167,19,1),
(2219,163,8,1),
(2220,163,9,1),
(2221,163,10,1),
(2222,163,17,1),
(2223,163,1,1),
(2224,163,2,1),
(2225,163,3,1),
(2226,163,4,1),
(2227,163,5,1),
(2228,163,7,1),
(2229,54,17,1),
(2230,55,17,1),
(2231,56,10,1),
(2232,56,17,1),
(2233,109,1,1),
(2234,109,2,1),
(2235,109,3,1),
(2236,109,4,1),
(2237,109,5,1),
(2238,109,15,1),
(2239,109,16,1),
(2240,109,11,1),
(2241,109,12,1),
(2242,109,13,1),
(2243,109,27,1),
(2244,109,14,1),
(2245,109,20,1),
(2246,116,1,1),
(2247,116,2,1),
(2248,116,3,1),
(2249,116,4,1),
(2250,116,5,1),
(2251,116,11,1),
(2252,116,12,1),
(2253,116,13,1),
(2254,116,27,1),
(2255,116,14,1),
(2256,116,15,1),
(2257,116,16,1),
(2258,116,20,1),
(2259,168,18,1),
(2260,168,19,1),
(2261,168,1,1),
(2262,168,2,1),
(2263,168,3,1),
(2264,168,7,1),
(2265,168,11,1),
(2266,168,12,1),
(2267,168,13,1),
(2268,168,27,1),
(2269,168,14,1),
(2270,168,15,1),
(2271,168,16,1),
(2272,168,20,1),
(2273,168,10,1),
(2274,168,17,1),
(2275,28,18,1),
(2276,28,19,1),
(2277,28,15,0),
(2278,28,20,0),
(2279,28,21,0),
(2280,28,22,0),
(2281,28,24,0),
(2282,28,25,0),
(2283,28,26,0),
(2284,28,17,1),
(2285,29,18,1),
(2286,29,19,1),
(2287,29,15,1),
(2288,29,20,1),
(2289,29,21,0),
(2290,29,22,1),
(2291,29,24,1),
(2292,29,25,1),
(2293,29,26,1),
(2294,29,17,1),
(2295,30,4,1),
(2296,30,5,1),
(2297,30,6,1),
(2298,30,15,1),
(2299,30,20,1),
(2300,30,21,1),
(2301,30,22,1),
(2302,30,24,1),
(2303,30,25,1),
(2304,30,26,1),
(2305,30,17,1),
(2306,31,17,1),
(2307,33,15,1),
(2308,33,16,1),
(2309,33,20,1),
(2310,33,21,1),
(2311,33,22,1),
(2312,33,24,1),
(2313,33,25,1),
(2314,33,26,1),
(2315,33,17,1),
(2316,30,18,1),
(2317,30,19,1),
(2318,33,18,1),
(2319,33,19,1),
(2320,31,18,1),
(2321,31,19,1),
(2322,34,18,1),
(2323,34,19,1),
(2324,34,17,1),
(2325,35,18,1),
(2326,35,19,1),
(2327,35,27,1),
(2328,35,15,1),
(2329,35,16,1),
(2330,35,20,1),
(2331,35,21,1),
(2332,35,22,1),
(2333,35,24,1),
(2334,35,25,1),
(2335,35,26,1),
(2336,35,17,1),
(2337,57,17,1),
(2338,58,17,1),
(2339,59,17,1),
(2340,60,1,1),
(2341,60,2,1),
(2342,60,3,1),
(2343,60,4,1),
(2344,60,5,1),
(2345,60,7,1),
(2346,60,10,1),
(2347,60,17,1),
(2348,61,17,1),
(2349,64,1,1),
(2350,64,2,1),
(2351,64,3,1),
(2352,64,4,1),
(2353,64,5,1),
(2354,64,7,1),
(2355,64,10,1),
(2356,64,17,1),
(2357,69,17,1),
(2358,151,1,1),
(2359,151,2,1),
(2360,151,3,1),
(2361,151,4,1),
(2362,151,5,1),
(2363,151,7,1),
(2364,151,10,1),
(2365,151,17,1),
(2366,154,1,1),
(2367,154,2,1),
(2368,154,3,1),
(2369,154,4,1),
(2370,154,5,1),
(2371,154,7,1),
(2372,154,10,1),
(2373,154,17,1),
(2374,155,1,1),
(2375,155,2,1),
(2376,155,3,1),
(2377,155,4,1),
(2378,155,5,1),
(2379,155,7,1),
(2380,155,10,1),
(2381,155,17,1),
(2382,84,11,1),
(2383,84,12,1),
(2384,84,13,1),
(2385,84,27,1),
(2386,84,14,1),
(2387,39,10,1),
(2388,39,17,1),
(2389,95,10,1),
(2390,95,17,1),
(2391,96,10,1),
(2392,96,17,1),
(2393,169,10,1),
(2394,169,17,1),
(2395,170,10,1),
(2396,170,17,1),
(2397,171,10,1),
(2398,171,17,1),
(2399,172,10,1),
(2400,172,17,1),
(2401,52,17,1),
(2402,51,17,1),
(2403,173,10,1),
(2404,173,17,1),
(2405,46,17,1),
(2406,47,17,1),
(2407,48,17,1),
(2408,49,10,1),
(2409,49,17,1),
(2410,50,10,1),
(2411,50,17,1),
(2412,97,10,1),
(2413,97,17,1),
(2414,20,11,0),
(2415,20,12,0),
(2416,20,13,0),
(2417,20,27,0),
(2418,20,14,0),
(2419,20,16,0),
(2420,20,22,0),
(2421,20,24,0),
(2422,20,25,0),
(2423,20,26,0),
(2424,29,11,1),
(2425,29,12,1),
(2426,29,13,1),
(2427,29,27,1),
(2428,29,14,1),
(2429,29,16,1),
(2430,174,18,1),
(2431,174,19,1),
(2432,174,11,1),
(2433,174,12,1),
(2434,174,13,1),
(2435,174,27,1),
(2436,174,14,1),
(2437,174,15,1),
(2438,174,16,1),
(2439,174,20,1),
(2440,174,22,1),
(2441,174,24,1),
(2442,174,25,1),
(2443,174,26,1),
(2444,174,10,1),
(2445,174,17,1),
(2446,175,10,0),
(2447,175,17,0),
(2448,176,10,0),
(2449,176,17,0),
(2450,177,10,0),
(2451,177,17,0),
(2452,178,10,1),
(2453,178,17,1),
(2454,179,1,1),
(2455,179,2,1),
(2456,179,3,1),
(2457,179,4,1),
(2458,179,5,1),
(2459,179,10,1),
(2460,179,17,1),
(2461,180,3,1),
(2462,180,4,1),
(2463,180,5,1),
(2464,180,7,1),
(2465,180,9,1),
(2466,180,11,1),
(2467,180,12,1),
(2468,180,13,1),
(2469,180,27,1),
(2470,180,14,1),
(2471,180,15,1),
(2472,180,16,1),
(2473,180,22,1),
(2474,180,10,1),
(2475,180,17,1),
(2476,91,17,1),
(2477,92,10,1),
(2478,92,17,1),
(2479,93,10,1),
(2480,93,17,1),
(2481,74,17,1),
(2482,75,17,1),
(2483,77,17,1),
(2484,76,17,1),
(2485,78,17,1),
(2486,80,6,1),
(2487,80,17,1),
(2488,89,17,1),
(2489,104,10,1),
(2490,104,17,1),
(2491,105,10,1),
(2492,105,17,1),
(2493,181,10,1),
(2494,181,17,1),
(2495,203,10,1),
(2496,203,17,1),
(2497,204,10,1),
(2498,204,17,1),
(2499,205,10,1),
(2500,205,17,1),
(2501,206,10,1),
(2502,206,17,1),
(2503,207,10,1),
(2504,207,17,1),
(2505,208,10,1),
(2506,208,17,1),
(2507,209,10,1),
(2508,209,17,1),
(2509,210,10,1),
(2510,210,17,1),
(2511,211,10,1),
(2512,211,17,1),
(2513,212,10,1),
(2514,212,17,1),
(2515,213,10,1),
(2516,213,17,1),
(2517,214,10,1),
(2518,214,17,1),
(2519,215,10,1),
(2520,215,17,1),
(2521,216,10,1),
(2522,216,17,1),
(2523,217,10,1),
(2524,217,17,1),
(2525,218,10,1),
(2526,218,17,1),
(2527,219,10,1),
(2528,219,17,1),
(2529,220,10,1),
(2530,220,17,1),
(2531,221,10,1),
(2532,221,17,1),
(2533,222,10,1),
(2534,222,17,1),
(2535,223,10,1),
(2536,223,17,1),
(2537,224,10,1),
(2538,224,17,1),
(2539,225,10,1),
(2540,225,17,1),
(2541,226,10,1),
(2542,226,17,1),
(2543,227,10,1),
(2544,227,17,1),
(2545,182,10,1),
(2546,182,17,1),
(2547,183,10,1),
(2548,183,17,1),
(2549,184,10,1),
(2550,184,17,1),
(2551,185,10,1),
(2552,185,17,1),
(2553,186,10,1),
(2554,186,17,1),
(2555,187,10,1),
(2556,187,17,1),
(2557,188,10,1),
(2558,188,17,1),
(2559,189,10,1),
(2560,189,17,1),
(2561,190,10,1),
(2562,190,17,1),
(2563,191,10,1),
(2564,191,17,1),
(2565,192,10,1),
(2566,192,17,1),
(2567,194,10,1),
(2568,194,17,1),
(2569,195,10,1),
(2570,195,17,1),
(2571,196,10,1),
(2572,196,17,1),
(2573,197,10,1),
(2574,197,17,1),
(2575,199,10,1),
(2576,199,17,1),
(2577,200,10,1),
(2578,200,17,1),
(2579,201,10,1),
(2580,201,17,1),
(2581,228,10,1),
(2582,228,17,1),
(2583,229,10,1),
(2584,229,17,1),
(2585,230,10,1),
(2586,230,17,1),
(2587,231,10,1),
(2588,231,17,1),
(2589,232,10,1),
(2590,232,17,1),
(2591,233,10,1),
(2592,233,17,1),
(2593,234,10,1),
(2594,234,17,1),
(2595,235,10,1),
(2596,235,17,1),
(2597,236,10,1),
(2598,236,17,1),
(2599,237,10,1),
(2600,237,17,1),
(2601,238,10,1),
(2602,238,17,1),
(2603,239,10,1),
(2604,239,17,1),
(2605,240,10,1),
(2606,240,17,1),
(2607,241,10,1),
(2608,241,17,1),
(2609,242,10,1),
(2610,242,17,1),
(2611,243,10,1),
(2612,243,17,1),
(2613,244,10,1),
(2614,244,17,1),
(2615,245,10,1),
(2616,245,17,1),
(2617,246,10,1),
(2618,246,17,1),
(2619,247,10,1),
(2620,247,17,1),
(2621,248,10,1),
(2622,248,17,1),
(2623,249,10,1),
(2624,249,17,1),
(2625,250,10,1),
(2626,250,17,1),
(2627,251,10,1),
(2628,251,17,1),
(2629,255,10,1),
(2630,255,17,1),
(2631,256,10,1),
(2632,256,17,1),
(2633,257,10,1),
(2634,257,17,1),
(2635,258,10,1),
(2636,258,17,1),
(2637,259,10,1),
(2638,259,17,1),
(2639,260,10,1),
(2640,260,17,1),
(2641,261,10,1),
(2642,261,17,1),
(2643,262,10,1),
(2644,262,17,1),
(2645,263,10,1),
(2646,263,17,1),
(2647,264,10,1),
(2648,264,17,1),
(2649,265,10,1),
(2650,265,17,1),
(2651,266,10,1),
(2652,266,17,1),
(2653,267,10,1),
(2654,267,17,1),
(2655,268,10,1),
(2656,268,17,1),
(2657,281,18,1),
(2658,281,19,1),
(2659,281,1,1),
(2660,281,2,1),
(2661,281,3,1),
(2662,281,4,1),
(2663,281,5,1),
(2664,281,10,1),
(2665,281,17,1),
(2666,282,18,1),
(2667,282,19,1),
(2668,282,1,1),
(2669,282,2,1),
(2670,282,3,1),
(2671,282,4,1),
(2672,282,5,1),
(2673,282,7,1),
(2674,282,10,1),
(2675,282,17,1),
(2676,283,18,1),
(2677,283,19,1),
(2678,283,7,1),
(2679,283,10,1),
(2680,283,17,1),
(2681,284,18,1),
(2682,284,19,1),
(2683,284,7,1),
(2684,284,10,1),
(2685,284,17,1),
(2686,290,18,1),
(2687,290,19,1),
(2688,290,7,1),
(2689,290,10,1),
(2690,290,17,1),
(2691,285,18,1),
(2692,285,19,1),
(2693,285,7,1),
(2694,285,10,1),
(2695,285,17,1),
(2696,288,18,1),
(2697,288,19,1),
(2698,288,7,1),
(2699,288,10,1),
(2700,288,17,1),
(2701,287,18,1),
(2702,287,19,1),
(2703,287,7,1),
(2704,287,10,1),
(2705,287,17,1),
(2706,286,18,1),
(2707,286,19,1),
(2708,286,7,1),
(2709,286,10,1),
(2710,286,17,1),
(2711,269,18,1),
(2712,269,19,1),
(2713,269,10,1),
(2714,269,17,1),
(2715,270,18,1),
(2716,270,19,1),
(2717,270,10,1),
(2718,270,17,1),
(2719,271,18,1),
(2720,271,19,1),
(2721,271,10,1),
(2722,271,17,1),
(2723,735,18,1),
(2724,735,19,1),
(2725,735,10,1),
(2726,735,17,1),
(2727,911,10,1),
(2728,911,17,1),
(2729,119,1,0),
(2730,119,2,0),
(2731,119,3,1),
(2732,119,4,1),
(2733,119,5,1),
(2734,119,7,1),
(2735,119,10,1),
(2736,119,17,1),
(2737,291,10,1),
(2738,291,17,1),
(2739,72,18,1),
(2740,72,19,1),
(2741,72,17,1),
(2742,33,18,1),
(2743,33,19,1),
(2744,33,15,1),
(2745,33,16,1),
(2746,33,20,1),
(2747,33,21,1),
(2748,33,22,1),
(2749,33,24,1),
(2750,33,25,1),
(2751,33,26,1),
(2752,33,10,1),
(2753,33,17,1),
(2754,186,1,1),
(2755,186,2,1),
(2756,186,3,1),
(2757,186,4,1),
(2758,186,5,1),
(2759,186,7,1),
(2760,186,10,1),
(2761,186,17,1),
(2762,189,1,1),
(2763,189,2,1),
(2764,189,3,1),
(2765,189,4,1),
(2766,189,5,1),
(2767,189,7,1),
(2768,189,10,1),
(2769,189,17,1),
(2770,190,1,1),
(2771,190,2,1),
(2772,190,3,1),
(2773,190,4,1),
(2774,190,5,1),
(2775,190,6,1),
(2776,190,7,1),
(2777,190,10,1),
(2778,190,17,1),
(2779,191,1,1),
(2780,191,2,1),
(2781,191,3,1),
(2782,191,4,1),
(2783,191,5,1),
(2784,191,7,1),
(2785,191,10,1),
(2786,191,17,1),
(2787,195,1,1),
(2788,195,2,1),
(2789,195,3,1),
(2790,195,4,1),
(2791,195,5,1),
(2792,195,7,1),
(2793,195,10,1),
(2794,195,17,1),
(2795,196,1,1),
(2796,196,2,1),
(2797,196,3,1),
(2798,196,4,1),
(2799,196,5,1),
(2800,196,6,1),
(2801,196,7,1),
(2802,196,10,1),
(2803,196,17,1),
(2804,197,1,1),
(2805,197,2,1),
(2806,197,3,1),
(2807,197,4,1),
(2808,197,5,1),
(2809,197,7,1),
(2810,197,10,1),
(2811,197,17,1),
(2812,34,18,1),
(2813,34,19,1),
(2814,34,10,1),
(2815,34,17,1),
(2816,184,10,1),
(2817,184,17,1),
(2818,187,10,1),
(2819,187,17,1),
(2820,242,10,1),
(2821,242,17,1),
(2822,249,10,1),
(2823,249,17,1),
(2824,250,10,1),
(2825,250,17,1),
(2826,251,10,1),
(2827,251,17,1),
(2828,256,10,1),
(2829,256,17,1),
(2830,257,10,1),
(2831,257,17,1),
(2832,258,10,1),
(2833,258,17,1),
(2834,262,10,1),
(2835,262,17,1),
(2836,31,18,1),
(2837,31,19,1),
(2838,31,10,1),
(2839,31,17,1),
(2840,14,1,1),
(2841,14,2,1),
(2842,14,3,1),
(2843,14,4,1),
(2844,14,5,1),
(2845,14,7,1),
(2846,14,10,1),
(2847,14,17,1),
(2848,16,3,1),
(2849,16,4,1),
(2850,16,5,1),
(2851,16,7,1),
(2852,16,10,1),
(2853,17,1,1),
(2854,17,2,1),
(2855,17,3,1),
(2856,17,4,1),
(2857,17,5,1),
(2858,17,7,1),
(2859,17,10,1),
(2860,17,17,1),
(2861,117,1,1),
(2862,117,2,1),
(2863,117,3,1),
(2864,117,4,1),
(2865,117,5,1),
(2866,117,10,1),
(2867,117,17,1),
(2868,117,1,1),
(2869,117,2,1),
(2870,117,3,1),
(2871,117,4,1),
(2872,117,5,1),
(2873,117,10,1),
(2874,117,17,1),
(2875,119,3,1),
(2876,119,4,1),
(2877,119,5,1),
(2878,119,7,1),
(2879,119,10,1),
(2880,119,17,1),
(2881,120,3,1),
(2882,120,4,1),
(2883,120,5,1),
(2884,120,7,1),
(2885,120,10,1),
(2886,120,17,1),
(2887,121,1,1),
(2888,121,2,1),
(2889,121,3,1),
(2890,121,4,1),
(2891,121,5,1),
(2892,121,7,1),
(2893,121,10,1),
(2894,121,17,1),
(2895,122,1,1),
(2896,122,2,1),
(2897,122,3,1),
(2898,122,4,1),
(2899,122,5,1),
(2900,122,7,1),
(2901,122,10,1),
(2902,122,17,1),
(2903,123,3,1),
(2904,123,4,1),
(2905,123,5,1),
(2906,123,7,1),
(2907,123,10,1),
(2908,123,17,1),
(2909,124,3,1),
(2910,124,4,1),
(2911,124,5,1),
(2912,124,7,1),
(2913,124,10,1),
(2914,124,17,1),
(2915,125,3,1),
(2916,125,4,1),
(2917,125,5,1),
(2918,125,7,1),
(2919,125,10,1),
(2920,125,17,1),
(2921,126,3,1),
(2922,126,4,1),
(2923,126,5,1),
(2924,126,7,1),
(2925,126,10,1),
(2926,126,17,1),
(2927,130,3,1),
(2928,130,4,1),
(2929,130,5,1),
(2930,130,7,1),
(2931,130,10,1),
(2932,130,17,1),
(2933,131,3,1),
(2934,131,4,1),
(2935,131,5,1),
(2936,131,7,1),
(2937,131,10,1),
(2938,131,17,1),
(2939,70,3,1),
(2940,70,4,1),
(2941,70,5,1),
(2942,70,8,1),
(2943,70,9,1),
(2944,70,10,1),
(2945,70,17,1),
(2946,71,3,1),
(2947,71,4,1),
(2948,71,5,1),
(2949,71,8,1),
(2950,71,9,1),
(2951,71,10,1),
(2952,71,17,1),
(2953,73,3,1),
(2954,73,4,1),
(2955,73,5,1),
(2956,73,8,1),
(2957,73,9,1),
(2958,73,10,1),
(2959,73,17,1),
(2960,74,3,1),
(2961,74,4,1),
(2962,74,5,1),
(2963,74,8,1),
(2964,74,9,1),
(2965,74,10,1),
(2966,74,17,1),
(2967,75,3,1),
(2968,75,4,1),
(2969,75,5,1),
(2970,75,8,1),
(2971,75,9,1),
(2972,75,10,1),
(2973,75,17,1),
(2974,76,3,1),
(2975,76,4,1),
(2976,76,5,1),
(2977,76,8,1),
(2978,76,9,1),
(2979,76,10,1),
(2980,76,17,1),
(2981,77,3,1),
(2982,77,4,1),
(2983,77,5,1),
(2984,77,8,1),
(2985,77,9,1),
(2986,77,10,1),
(2987,77,17,1),
(2988,78,3,1),
(2989,78,4,1),
(2990,78,5,1),
(2991,78,8,1),
(2992,78,9,1),
(2993,78,10,1),
(2994,78,17,1),
(2995,80,3,1),
(2996,80,4,1),
(2997,80,5,1),
(2998,80,6,1),
(2999,80,8,1),
(3000,80,9,1),
(3001,80,10,1),
(3002,80,17,1),
(3003,20,18,1),
(3004,20,19,1),
(3005,20,3,1),
(3006,20,4,1),
(3007,20,5,1),
(3008,20,7,1),
(3009,20,10,1),
(3010,20,17,1),
(3011,19,18,1),
(3012,19,19,1),
(3013,19,4,1),
(3014,19,15,1),
(3015,19,20,1),
(3016,19,10,1),
(3017,19,17,1),
(3018,18,18,1),
(3019,18,19,1),
(3020,18,4,1),
(3021,18,15,1),
(3022,18,20,1),
(3023,18,10,1),
(3024,18,17,1),
(3025,21,18,1),
(3026,21,19,1),
(3027,21,4,1),
(3028,21,10,1),
(3029,21,17,1),
(3030,22,18,1),
(3031,22,19,1),
(3032,22,4,1),
(3033,22,10,1),
(3034,22,17,1),
(3035,23,18,1),
(3036,23,19,1),
(3037,23,15,1),
(3038,23,20,1),
(3039,23,10,1),
(3040,23,17,1),
(3041,24,18,1),
(3042,24,19,1),
(3043,24,4,1),
(3044,24,10,1),
(3045,24,17,1),
(3046,165,18,1),
(3047,165,19,1),
(3048,165,4,1),
(3049,165,21,1),
(3050,165,10,1),
(3051,165,17,1),
(3052,166,18,1),
(3053,166,19,1),
(3054,166,4,1),
(3055,166,24,1),
(3056,166,10,1),
(3057,166,17,1),
(3058,167,18,1),
(3059,167,19,1),
(3060,167,4,1),
(3061,167,22,1),
(3062,167,10,1),
(3063,167,17,1),
(3064,181,10,1),
(3065,181,17,1),
(3066,203,10,1),
(3067,203,17,1),
(3068,204,10,1),
(3069,204,17,1),
(3070,205,10,1),
(3071,205,17,1),
(3072,206,10,1),
(3073,206,17,1),
(3074,208,10,1),
(3075,208,17,1),
(3076,207,10,1),
(3077,207,17,1),
(3078,209,10,1),
(3079,209,17,1),
(3080,210,10,1),
(3081,210,17,1),
(3082,211,10,1),
(3083,211,17,1),
(3084,212,10,1),
(3085,212,17,1),
(3086,213,10,1),
(3087,213,17,1),
(3088,214,10,1),
(3089,214,17,1),
(3090,215,10,1),
(3091,215,17,1),
(3092,227,10,1),
(3093,227,17,1),
(3094,216,10,1),
(3095,216,17,1),
(3096,218,10,1),
(3097,218,17,1),
(3098,217,10,1),
(3099,217,17,1),
(3100,219,10,1),
(3101,219,17,1),
(3102,220,10,1),
(3103,220,17,1),
(3104,221,10,1),
(3105,221,17,1),
(3106,222,10,1),
(3107,222,17,1),
(3108,223,10,1),
(3109,223,17,1),
(3110,224,10,1),
(3111,224,17,1),
(3112,225,10,1),
(3113,225,17,1),
(3114,226,10,1),
(3115,226,17,1),
(3116,161,1,1),
(3117,161,2,1),
(3118,161,3,1),
(3119,161,4,1),
(3120,161,5,1),
(3121,161,7,1),
(3122,161,8,1),
(3123,161,9,1),
(3124,161,10,1),
(3125,161,17,1),
(3126,83,4,1),
(3127,83,5,1),
(3128,83,7,1),
(3129,83,8,1),
(3130,83,9,1),
(3131,83,10,1),
(3132,83,17,1),
(3133,82,3,1),
(3134,82,4,1),
(3135,82,5,1),
(3136,82,7,1),
(3137,82,8,1),
(3138,82,9,1),
(3139,82,10,1),
(3140,82,17,1),
(3141,84,3,1),
(3142,84,4,1),
(3143,84,5,1),
(3144,84,7,1),
(3145,84,8,1),
(3146,84,9,1),
(3147,84,11,1),
(3148,84,12,1),
(3149,84,13,1),
(3150,84,27,1),
(3151,84,14,1),
(3152,84,10,1),
(3153,84,17,1),
(3154,85,4,1),
(3155,85,5,1),
(3156,85,7,1),
(3157,85,8,1),
(3158,85,9,1),
(3159,85,10,1),
(3160,85,17,1),
(3161,87,4,1),
(3162,87,5,1),
(3163,87,7,1),
(3164,87,8,1),
(3165,87,9,1),
(3166,87,10,1),
(3167,87,17,1),
(3168,163,1,1),
(3169,163,2,1),
(3170,163,3,1),
(3171,163,4,1),
(3172,163,5,1),
(3173,163,7,1),
(3174,163,8,1),
(3175,163,9,1),
(3176,163,10,1),
(3177,163,17,1),
(3178,180,3,1),
(3179,180,4,1),
(3180,180,5,1),
(3181,180,7,1),
(3182,180,9,1),
(3183,180,11,1),
(3184,180,12,1),
(3185,180,13,1),
(3186,180,27,1),
(3187,180,14,1),
(3188,180,15,1),
(3189,180,16,1),
(3190,180,22,1),
(3191,180,10,1),
(3192,180,17,1),
(3193,241,10,1),
(3194,241,17,1),
(3195,81,3,1),
(3196,81,4,1),
(3197,81,7,1),
(3198,81,8,1),
(3199,81,9,1),
(3200,81,10,1),
(3201,81,17,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prods_x_combo`
--

LOCK TABLES `tbl_prods_x_combo` WRITE;
/*!40000 ALTER TABLE `tbl_prods_x_combo` DISABLE KEYS */;
INSERT INTO `tbl_prods_x_combo` VALUES (1,1,114,1,1),
(2,1,115,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_nombre_prod` varchar(128) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_prod` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_pic_prod_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `id_categoria` int NOT NULL,
  `int_activo` int NOT NULL,
  `fl_ordenar` float DEFAULT NULL,
  `id_grupo_producto` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `tbl_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_productos`
--

LOCK TABLES `tbl_productos` WRITE;
/*!40000 ALTER TABLE `tbl_productos` DISABLE KEYS */;
INSERT INTO `tbl_productos` VALUES (5,'Taco Maciza de Res','Tacos de maciza de Res','5.jpg',2,1,20,NULL),
(6,'Taco Maciza de Puerco','Tacos de maciza de puerco','6.jpg',2,1,23,'1'),
(7,'Taco Lengua de cerdo','Tacos de lengua de cerdo al vapor','7.jpg',2,1,21,''),
(8,'Taco de Carnitas','Tacos de carnitas','8.jpg',2,1,24,'1'),
(9,'Taco de Buche','Tacos de buche','9.jpg',2,1,26,'1'),
(10,'Taco de Oreja','Tacos de oreja de cerdo','10.jpg',2,1,27,'1'),
(11,'Taco de Azadura','Tacos de azadura','11.jpg',2,1,31,'1'),
(12,'Taco de Trompa','Tacos de trompa de cerdo','12.jpg',2,1,25,'1'),
(13,'Tac de Pollo','Tacos de pollo','13.jpg',2,1,22,NULL),
(14,'Bistec de res','Tacos de bistec de res','14.jpg',4,1,1,NULL),
(15,'Taco de Pastor','Tacos al pastor','15.jpg',4,1,4,NULL),
(16,'Taco de Bistec con queso','Taco de bistec de res con quesillo','16.jpg',4,1,7,NULL),
(17,'Taco de Pastor con quesillo','Taco al pastor con quesillo','17.jpg',4,1,10,NULL),
(18,'Mula Terca Bistec','Tocino/Jamón/Bistec de res','18.jpg',5,1,84,NULL),
(19,'Plato Suizo de Bistec','Plato suizo con Bistec de res','19.jpg',5,1,81,NULL),
(20,'Alambre de Bistec','Cebolla, Chile Morrón, Tocino, Bistec de Res y Quesillo','20.jpg',5,1,87,NULL),
(21,'Alambre Especial','Cebolla, Chile morrón, Tocino, Bistec de Res, Jamón, Champiñones, Carne al pastor y Quesillo','21.jpg',5,1,80,NULL),
(22,'Mata Hambre','Cebolla, Chile Morrón, Tocino, Bistec de Res, Jamón, Carne al pastor, Tomate y Quesillo','22.jpg',5,1,96,NULL),
(23,'Plato Mixto Bistec','Tocino, Jamón, Carne al pastor, Salsa Mexicana y quesillo','23.jpg',5,1,88,NULL),
(24,'Vegetariano','Cebolla, Chile Morrón, Tomate, Champiñones y quesillo','24.jpg',5,1,97,NULL),
(25,'Tortilla adicional','Tortilla adicional','25.jpg',1,1,199,NULL),
(26,'Pozole rojo','Plato de pozole rojo, grande','26.jpg',10,0,NULL,NULL),
(27,'Pozole Rojo Chico','Pozole Rojo Chico','27.jpg',10,0,NULL,NULL),
(28,'Queso Fundido Sencillo','Queso fundido normal','28.jpg',6,1,136,NULL),
(29,'Queso Fundido Bistec','Queso fundido combinado con bistec','29.jpg',6,1,129,NULL),
(30,'Gringa Bistec','Tortilla de harina con queso y bistec','30.jpg',6,1,154,NULL),
(31,'Sincronizada','Tortilla de harina con queso y jamón','31.jpg',6,1,161,NULL),
(32,'Tostada','Se prepara con la carne de su elección','32.jpg',6,0,NULL,NULL),
(33,'Burrita de Bistec','Burrita de tortilla de harina con quesillo y bistec','33.jpg',6,1,162,NULL),
(34,'Quesadilla Normal','Quesadilla Normal','34.jpg',6,1,153,NULL),
(35,'Quesadilla Especial','Con Bistec de res, pastor o champiñones','35.jpg',6,0,NULL,NULL),
(36,'Tostada adicional','Tostada adicional para cualquier alimento','36.jpg',1,1,201,NULL),
(37,'Vaso Agua Fresca del Dia','Agua fresca del día, varios sabores.','37.jpg',7,1,215,NULL),
(38,'Jarra de agua de sabor','Jarra de agua fresca de sabor del dia','38.jpg',7,1,218,NULL),
(39,'Agua de Jamaica, Vaso','Vaso de agua de jamaica','39.jpg',7,0,NULL,NULL),
(40,'Agua de Jamaica, Jarra','Jarra de agua de jamaica','40.jpg',7,0,NULL,NULL),
(41,'Agua de Maracuya, Vaso','Vaso de agua de Maracuya','41.jpg',7,0,NULL,NULL),
(42,'Agua de Maracuya, Jarra','Jarra de agua de Maracuya','42.jpg',7,0,NULL,NULL),
(43,'Agua de Mandarina, Vaso','Vaso de agua de mandarina','43.jpg',7,0,NULL,NULL),
(44,'Agua de Mandarina, Jarra','Jarra de agua de mandarina','44.jpg',7,0,NULL,NULL),
(45,'R. Pepsi','Refresco marca Pepsi','45.jpg',7,0,NULL,''),
(46,'Refresco de Sabor','Refresco de Sabor','46.jpg',7,1,220,''),
(47,'Sangria','Refresco Sangría','47.jpg',7,0,NULL,NULL),
(48,'Sprite','Refresco Sprite','48.jpg',7,0,NULL,NULL),
(49,'Sidral','Refresco de manzana Sidral','49.jpg',7,0,NULL,NULL),
(50,'Agua Mineral','Agua mineral embotellada','50.jpg',7,0,NULL,NULL),
(51,'Café de olla','Tasa de café de olla calientito!','51.jpg',7,1,211,NULL),
(52,'Atole','Atole','52.jpg',7,1,210,NULL),
(53,'Agua SIN gas 1/2 Lt.','Agua embotellada SIN gas 1/2 Lt.','53.jpg',7,0,NULL,NULL),
(54,'Panqué de elote','Panqué de elote','54.jpg',8,1,196,NULL),
(55,'Flan','Flan','55.jpg',8,1,198,NULL),
(56,'Cheesecake','Pastel de queso','56.jpg',8,1,197,NULL),
(57,'Tostada Maciza de Puerco','Tostada Maciza de Puerco','57.jpg',9,1,51,'4'),
(58,'Tostada Maciza de Res','Tostada Maciza de Res','58.jpg',9,1,45,NULL),
(59,'Tostada Carnitas','Tostada de Carnitas','59.jpg',9,1,52,'4'),
(60,'Tostada de Trompa','Tostada de Trompa','60.jpg',9,1,53,'4'),
(61,'Tostada de Buche','Tostada de Buche','61.jpg',9,1,54,'4'),
(62,'Tostada de Azadura','Tostada de Azadura','62.jpg',9,1,59,'4'),
(63,'Tostada de Cabeza','Tostada de Cabeza','63.jpg',9,0,NULL,'4'),
(64,'Tostada de Oreja','Tostada de Oreja','64.jpg',9,1,55,'4'),
(65,'Tostada de Lengua','Tostada de Lengua','65.jpg',9,1,59.5,''),
(66,'Tostada de Quesillo','Tostada de Quesillo','66.jpg',9,1,46,NULL),
(67,'Tostada de Pastor','Tostada con carne al Pastor','67.jpg',9,1,48,NULL),
(68,'Tostada de Bistec de Res','Tostada de Bistec de Res','68.jpg',9,1,44,NULL),
(69,'Tostada de Chamorro','Tostada de Chamorro','69.jpg',9,1,59.6,NULL),
(70,'T. Ahogado Maciza de Res','Taco ahogado en salsa y guacamole de Maciza de Res','70.jpg',3,1,31.01,NULL),
(71,'T. Ahogado Maciza de Puerco','Taco ahogado de maciza de puerco','71.jpg',3,1,31.03,'1'),
(72,'T. Ahogado Lengua de Puerco','Taco ahogado de lengua de puerco','72.jpg',3,1,31.02,''),
(73,'T. Ahogado de Carnitas','Taco ahogado de carnitas mixtas','73.jpg',3,1,31.04,'1'),
(74,'T. Ahogado de Buche','Taco ahogado de Buche','74.jpg',3,1,31.07,'1'),
(75,'T. Ahogado de Oreja','Taco Ahogado de Oreja','75.jpg',3,1,31.08,'1'),
(76,'T. Ahogado de Azadura','Taco ahogado de Azadura','76.jpg',3,1,31.12,'1'),
(77,'T. Ahogado de Trompa','Taco ahogado de trompa','77.jpg',3,1,31.05,'1'),
(78,'T. Ahogado de Cabeza','Taco ahogado de cabeza','78.jpg',3,1,31.09,'1'),
(79,'T. Ahogado de Bistec de Res','Taco ahogado de bistec de Res','79.jpg',3,0,NULL,NULL),
(80,'Taco ahogado al Pastor','Taco Ahogado al pastor','80.jpg',3,1,NULL,NULL),
(81,'Poz. Maciza de Puerco','Pozole de maciza de puerco','81.jpg',10,1,75,NULL),
(82,'Poz. Maciza de Res','Pozole de Maciza de Res','82.jpg',10,1,74,NULL),
(83,'Poz. de Surtido Puerco','Pozole de carne surtida de puerco','83.jpg',10,1,76,NULL),
(84,'Pozole CHICO','Pozole CHICO con o sin carne ','84.jpg',10,1,73,NULL),
(85,'Poz. Maciza de Puerco CHICO','Pozole de maciza de puerco, chico','85.jpg',10,1,69,NULL),
(86,'Poz. Maciza de Res CHICO','Poz. Maciza de Res CHICO','86.jpg',10,1,68,NULL),
(87,'Poz. Surtida de Puerco CHICO','Pozole con carne surtida de puerco, chico','87.jpg',10,1,70,NULL),
(88,'Poz. Combinado CHICO','Pozole Mixto Chico','88.jpg',10,1,72,NULL),
(89,'Agua Ciel SIN Gas 600 ml','Botella de Agua Ciel 600ml.','89.jpg',7,1,221,NULL),
(91,'Cerveza Normal','Cerveza Precio Normal','91.jpg',7,1,222,NULL),
(92,'Cerveza Superior','Cerveza calidad lujo','92.jpg',7,1,223,NULL),
(93,'Cerveza Premium','Cerveza Calidad Premium','93.jpg',7,1,224,NULL),
(94,'Cerveza Bohemia','Cerveza Bohemia	','94.jpg',7,0,NULL,NULL),
(95,'Vaso de Limonada','Vaso de limonada fresca','95.jpg',7,1,213,NULL),
(96,'Jarra de Limonada','Jarra de Limonada fresca','96.jpg',7,1,216,NULL),
(97,'Jugo del Valle','(Tamarindo, Guayaba, Fresa, Mango o Uva)','97.jpg',7,0,NULL,NULL),
(98,'Cerveza Corona Light','Cerveza Corona Light','98.jpg',7,0,NULL,NULL),
(99,'Cerveza Barrilito','Cerveza Barrilito','99.jpg',7,0,NULL,NULL),
(100,'Cerveza Negra Modelo','Cerveza Negra Modelo','100.jpg',7,0,NULL,NULL),
(101,'Cerveza Modelo Especial','Cerveza Modelo Especial','101.jpg',7,0,NULL,NULL),
(102,'Lata Cerveza Modelo Especial','Cerveza Modelo Especial, LATA','102.jpg',7,0,NULL,NULL),
(103,'Cerveza Victoria Lata','Cerveza Victoria Lata','103.jpg',7,0,NULL,NULL),
(104,'Base Suero','Base Suero','104.jpg',7,1,225,NULL),
(105,'Base Michelada','Base Michelada','105.jpg',7,1,226,NULL),
(106,'Tortilla de Harina Extra','Tortilla de Harina Extra','106.jpg',1,1,200,NULL),
(107,'Orden Guacamole','Orden Guacamole','107.jpg',1,1,202,NULL),
(108,'Orden Zanahoria','Orden Zanahoria','108.jpg',1,1,203,NULL),
(109,'300 grs. carne al pastor ','Orden Carne Pastor 300 gr','109.jpg',15,1,118,NULL),
(110,'Promo Lunes','Promocion de Lunes','110.jpg',9,0,NULL,NULL),
(111,'Promo Miercoles','Promo Miercoles','111.jpg',9,0,NULL,NULL),
(112,'Paquete de todo un poco','2 tacos de al pastor o puerco,  2 tostadas al pastor o puerco,  1 pozole de puerco o pollo,  2 litros de agua de sabor o refresco de 2 litros','112.jpg',13,1,192,NULL),
(113,'Coca-Cola vidrio','Refresco Coca-Cola de vidrio','113.jpg',7,1,219,NULL),
(114,'2 tacos paquete 112 ','2 tacos para paquete \"De todo un poco\"','114.jpg',14,1,NULL,NULL),
(115,'2 Tostadas Pollo o Puerco','2 Tostadas de Pollo o Puerco\npara paquete \"De todo un poco\"','',14,1,NULL,NULL),
(116,'300 grs. carne de res ','Orden de Carne de Res 300 gr.','',15,1,117,NULL),
(117,'Tacos de costilla enchilada','Tacos de costilla enchilada','',4,1,2,NULL),
(118,'Taco de champiñones','Tacos de champiñones','',4,1,3,NULL),
(119,'Taco de Chuleta','Taco de chuleta de cerdo','',4,1,5,NULL),
(120,'Taco de chorizo','Taco de chorizo','',4,1,6,NULL),
(121,'Taco de costilla con queso','Taco de costilla con queso','',4,1,8,NULL),
(122,'Taco de Champiñones con queso','Taco de Champiñones con queso','',4,1,9,NULL),
(123,'Taco Chuleta con Queso','Taco de chuleta de cerdo con queso','',4,1,11,NULL),
(124,'Taco Chorizo con Queso','Taco de chorizo con queso','',4,1,12,NULL),
(125,'Taco de Pollo con Queso','Taco de pollo con queso','',4,1,13,NULL),
(126,'Taco Bisteck HARINA','Taco de bisteck con tortilla de harina','',4,1,14,NULL),
(127,'Taco costilla HARINA','Taco de costilla de harina','',4,1,15,NULL),
(128,'Taco Champiñones HARINA','Taco de champiñones con harina','',4,1,16,NULL),
(129,'Taco pastor HARINA','Taco al pastor elaborado con tortilla de harina','',4,1,17,NULL),
(130,'Tacho Chuleta HARINA','Taco de chuleta en tortilla de harina','',4,1,18,NULL),
(131,'Taco chorizo HARINA','Taco de chorizo con tortilla de harina','',4,1,19,NULL),
(132,'Taco de Pollo','Taco de pollo al vapor','',2,0,22,NULL),
(133,'Taco de Cabeza de Puerco','Taco de cabeza de puerco','',2,1,28,'1'),
(134,'Taco de Nana','Taco de nana de cerdo','',2,1,29,'1'),
(135,'Taco de Surtida','Taco de carne surtida	','',2,1,30,'1'),
(136,'Maciza de Res HARINA','Tacos de maciza de Res en Harina','',2,1,32,NULL),
(137,'Maciza de Puerco HARINA','Tacos de maciza de puerco en tortilla de Harina','',2,1,35,'3'),
(138,'Lengua de cerdo HARINA','Tacos de lengua de cerdo al vapor en tortilla de Harina','',2,1,33,''),
(139,'Carnitas HARINA','Tacos de carnitas en tortilla de Harina','',2,1,36,'3'),
(140,'Buche HARINA','Tacos de buche en tortilla de Harina','',2,1,38,'3'),
(141,'Oreja HARINA','Tacos de oreja de cerdo en tortilla de harina','',2,1,39,'3'),
(142,'Azadura HARINA','Tacos de azadura en tortilla de harina','',2,1,43,'3'),
(143,'Trompa HARINA','Tacos de trompa de cerdo en tortilla de Harina','',2,1,37,'3'),
(144,'Taco de Pollo HARINA','Taco de pollo al vapor en tortilla de Harina','',2,1,34,NULL),
(145,'Cabeza de Puerco HARINA','Taco de cabeza de puerco en tortilla de Harina','',2,1,40,'3'),
(146,'Nana en  HARINA','Taco de nana de cerdo en tortilla de Harina','',2,1,41,'3'),
(147,'Surtida HARINA','Taco de carne surtida en tortilla de Harina','',2,1,42,'3'),
(148,'Tostada de pollo','Tostada de pollo','',9,1,47,NULL),
(149,'Tostada de Costilla','Tostada de Costilla','',9,1,49,NULL),
(150,'Tostada de Chuleta','Tostada de Chuleta','',9,1,50,NULL),
(151,'Tostada Cabeza de Puerco','Tostada Cabeza de puerco','',9,1,56,'4'),
(152,'Tostada de Nana','Tosatada de Nana','',9,1,57,'4'),
(153,'Volcan Bistec de Res','Tostada con bistec de res y quesillo fundido','',9,1,60,NULL),
(154,'Volcan Maciza de Res','Tostada con maciza de res y quesillo fundido','',9,1,61,NULL),
(155,'Volcan de pollo','Tostada con pollo y quesillo fundido','',9,1,62,NULL),
(156,'Volcan de Pastor','Tostada con carne al pastor y quesillo fundido','',9,1,63,NULL),
(157,'Volcan de Costilla','Tostada con costilla  y quesillo fundido','',9,1,64,NULL),
(158,'Volcan de Chuleta','Tostada con chuleta y quesillo fundido','',9,1,65,NULL),
(159,'Volcan de Puerco','Tostada con carne de puerco y quesillo fundido','',9,1,66,NULL),
(160,'Volcan de Champiñones','Tostada con champiñones y quesillo fundido','',9,1,67,NULL),
(161,'Poz. de pollo CHICO','Pozole de pollo Chico','',10,1,71,NULL),
(162,'Poz. sin carne CHICO','Pozole CHICO sin carne','',10,0,NULL,NULL),
(163,'Poz. de pollo','Pozole de pollo','',10,1,77,NULL),
(164,'Pozole sin Carne','Pozole sin carne','',10,1,79,NULL),
(165,'Alambre Costilla','Cebolla, Chile Morrón, Tocino, Costilla y Quesillo','',5,1,89,NULL),
(166,'Alambre Chuleta','Cebolla, Chile Morrón, Tocino, Chuleta y Quesillo','',5,1,90,NULL),
(167,'Alambre de Pollo','Cebolla, Chile morrón, Tocino, Pollo y Quesillo','',5,1,93,NULL),
(168,'300 grs.  carne de bistec ','300 grs.  carne de bistec ','',15,1,116,NULL),
(169,'Vaso de Naranjada','Vaso de Naranjada fresca','NA.jpg',7,1,214,NULL),
(170,'Jarra de Naranjada','Jarra de Naranjada fresca','NA.jpg',7,1,217,NULL),
(171,'Tizana Fria','Tizana Fria ','NA.jpg',7,1,208,NULL),
(172,'Tizana Caliente','Tizana Caliente','NA.jpg',7,1,209,NULL),
(173,'Té ','Té','NA.jpg',7,1,212,NULL),
(174,'Queso Fundido Combinado','Queso fundido con dos ingredientes','NA.jpg',6,1,128,NULL),
(175,'Servicio 1','Cargo extra por servicio 1','NA.jpg',11,1,205,NULL),
(176,'Servicio 2','Corto Extra por servicio 2','NA.jpg',11,1,206,NULL),
(177,'Servicio 3','Cargo por servicio 3','NA.jpg',11,1,207,NULL),
(178,'Desechable','Cargo por contenedor desechable','NA.jpg',11,1,204,NULL),
(179,'Tostada de Surtida','Tostada con carne surtida ','NA.jpg',9,1,58,'4'),
(180,'Pozole Combinado','Pozole  combinado ','NA.jpg',10,1,78,NULL),
(181,'Alambre Chuleta Harina','Cebolla, Chile Morrón, Tocino, Chuleta y Quesillo con T. de HARINA','NA.jpg',5,1,108,NULL),
(182,'Queso Fundido Chuleta','Queso Fundido Chuleta','NA.jpg',6,1,133,NULL),
(183,'Queso Fundido Chuleta HARINA','Queso Fundido Chuleta HARINA','NA.jpg',6,1,142,NULL),
(184,'Quesadilla de chuleta','Quesadilla de chuleta','NA.jpg',6,1,149,NULL),
(185,'Gringa de Chuleta','Gringa de Chuleta','NA.jpg',6,1,157,NULL),
(186,'Burrita de Chuleta','Burrita de Chuleta','NA.jpg',6,1,165,NULL),
(187,'Quesadilla Chuleta Maiz','Quesadilla Chuleta Maiz','NA.jpg',6,1,167,NULL),
(188,'Gringa Chuleta Maiz','Gringa Chuleta Maiz','',6,1,180,NULL),
(189,'Burrita Chuleta Maiz','Burrita Chuleta Maiz','NA.jpg',6,1,188,NULL),
(190,'Burrita Costilla','Burrita Costilla','NA.jpg',6,1,163,NULL),
(191,'Burrita Pastor','Burrita Pastor','NA.jpg',6,1,164,NULL),
(192,'Burrita Champiñones','Burrita Champiñones','NA.jpg',6,1,166,NULL),
(194,'Burrita de Pollo','Burrita de Pollo','NA.jpg',6,1,168,NULL),
(195,'Burrita de Bisteck MAIZ','Burrita de Bisteck MAIZ','NA.jpg',6,1,185,NULL),
(196,'Burrita de Costilla MAIZ','Burrita de Costilla MAIZ','NA.jpg',6,1,186,NULL),
(197,'Burrita de Pastor MAIZ','Burrita de Pastor MAIZ','NA.jpg',6,1,187,NULL),
(199,'Burrita de Champiñones MAIZ','Burrita de Champiñones MAIZ','NA.jpg',6,1,189,NULL),
(200,'Burrita de Puerco MAIZ','Burrita de Puerco MAIZ','NA.jpg',6,1,190,NULL),
(201,'Burrita de Pollo MAIZ','Burrita de Pollo MAIZ','NA.jpg',6,1,191,NULL),
(202,'Taco de Corazon','Tacos de corazon','NA.jpg',2,1,28.5,'1'),
(203,'Plato suizo al pastor','Plato suizo con carne al pastor','NA.jpg',5,1,82,NULL),
(204,'Plato Suizo Combinado','Plato Suizo combinado con pastor y bistec de res','NA.jpg',5,1,83,NULL),
(205,'Mula Terca Pastor','Mula terca con carne pastor','NA.jpg',5,1,85,NULL),
(206,'Mula Terca Combinada','Mula terca combinada','NA.jpg',5,1,86,NULL),
(207,'Plato mixto al pastor','plato mixto al pastor','NA.jpg',5,1,91,NULL),
(208,'Alambre al pastor','alambre al pastor','NA.jpg',5,1,92,NULL),
(209,'Alambre de puerco','alambre de puerco','NA.jpg',5,1,94,NULL),
(210,'Alambre Combinado','Alambre Combinado','NA.jpg',5,1,95,NULL),
(211,'alambre especial Harina','alambre especial harina ','',5,1,98,NULL),
(212,'Plato Suizo Bistec Harina','Plato Suizo Bistec Harina','',5,1,99,NULL),
(213,'plato suizo al pastor harina ','plato suizo al pastor harina ','NA.jpg',5,1,100,NULL),
(214,'Plato Suizo Combinado Harina','Plato Suizo Combinado Harina','NA.jpg',5,1,101,NULL),
(215,'mula terca de bistec harina ','mula terca de bistec harina ','NA.jpg',5,1,102,NULL),
(216,'mula terca al pastor harina ','mula terca al pastor harina ','NA.jpg',5,1,103,NULL),
(217,'mula terca combinada harina ','mula terca combinada harina ','NA.jpg',5,1,104,NULL),
(218,'alambre bistec harina ','alambre bistec harina ','NA.jpg',5,1,105,NULL),
(219,'plato mixto bistec harina ','plato mixto bistec harina ','NA.jpg',5,1,106,NULL),
(220,'alambre de costilla harina ','alambre de costilla harina ','NA.jpg',5,1,107,NULL),
(221,'plato mixto al pastor harina ','plato mixto al pastor harina ','NA.jpg',5,1,109,NULL),
(222,'alambre al pastor harina ','alambre al pastor harina ','NA.jpg',5,1,110,NULL),
(223,'alambre de pollo harina ','alambre de pollo harina ','NA.jpg',5,1,111,NULL),
(224,'alambre de puerco harina ','alambre de puerco harina ','NA.jpg',5,1,112,NULL),
(225,'alambre combinado harina ','alambre combinado harina ','NA.jpg',5,1,113,NULL),
(226,'matahambre harina ','matahambre harina ','NA.jpg',5,1,114,NULL),
(227,'vegetariano harina ','vegetariano harina ','NA.jpg',5,1,115,NULL),
(228,'Queso Fundido Costilla','Queso Fundido Costilla','NA.jpg',6,1,130,NULL),
(229,'Queso Fundido Champiñones','Queso Fundido Champiñones','NA.jpg',6,1,131,NULL),
(230,'Queso Fundido Pastor','Queso Fundido Pastor','NA.jpg',6,1,132,NULL),
(231,'Queso Fundido Chorizo','Queso Fundido Chorizo','NA.jpg',6,1,134,NULL),
(232,'Queso Fundido Pollo','Queso Fundido Pollo','NA.jpg',6,1,135,NULL),
(233,'Queso Fundido Combinado HARINA','Queso Fundido Combinado HARINA','NA.jpg',6,1,137,NULL),
(234,'Queso Fundido Bistec HARINA','Queso Fundido Bistec HARINA','NA.jpg',6,1,138,NULL),
(235,'Queso Fundido Costilla HARINA','Queso Fundido Costilla HARINA','NA.jpg',6,1,139,NULL),
(236,'Queso Fundido Champ HARINA','Queso Fundido Champ HARINA','NA.jpg',6,1,140,NULL),
(237,'Queso Fundido Pastor HARINA','Queso Fundido Pastor HARINA','NA.jpg',6,1,141,NULL),
(238,'Queso Fundido Chorizo HARINA','Queso Fundido Chorizo HARINA','NA.jpg',6,1,143,NULL),
(239,'Queso Fundido Pollo HARINA','Queso Fundido Pollo HARINA','NA.jpg',6,1,144,NULL),
(240,'Queso Fundido Sencillo HARINA','Queso Fundido Sencillo HARINA','NA.jpg',6,1,145,NULL),
(241,'quesadilla champiñónes ','quesadilla champiñónes ','NA.jpg',6,1,150,NULL),
(242,'quesadilla de puerco','quesadilla de puerco','',6,1,151,NULL),
(243,'quesadilla de pollo','quesadilla de pollo','',6,1,152,NULL),
(244,'Gringa de Costilla','Gringa de Costilla','',6,1,155,NULL),
(245,'Gringa de Pastor','Gringa de Pastor','',6,1,156,NULL),
(246,'gringa  champiñónes ','gringa  champiñónes ','NA.jpg',6,1,158,NULL),
(247,'gringa de puerco','gringa de puerco','NA.jpg',6,1,159,NULL),
(248,'Gringa de Pollo','Gringa de Pollo','',6,1,160,NULL),
(249,'quesadilla bistec','quesadilla bistec','NA.jpg',6,1,146,NULL),
(250,'quesadilla costilla','quesadilla costilla','NA.jpg',6,1,147,NULL),
(251,'quesadilla al pastor','quesadilla al pastor','NA.jpg',6,1,148,NULL),
(255,'quesadilla bistec maiz ','quesadilla bistec maiz ','',6,1,169,NULL),
(256,'quesadilla costilla maiz','quesadilla costilla maiz','',6,1,170,NULL),
(257,'quesadilla al pastor maiz','quesadilla al pastor maiz','',6,1,171,NULL),
(258,'quesadilla chuleta maiz','quesadilla chuleta maiz','',6,1,172,NULL),
(259,'quesadilla champiñónes maiz','quesadilla champiñónes maiz','NA.jpg',6,1,173,NULL),
(260,'quesadilla de pueco maiz','quesadilla de pueco maiz','',6,1,174,NULL),
(261,'quesadilla de pollo maiz ','quesadilla de pollo maiz ','NA.jpg',6,1,175,NULL),
(262,'quesadilla normal maiz','quesadilla normal maiz','',6,1,176,NULL),
(263,'gringa bistec maiz','gringa bistec maiz','',6,1,177,NULL),
(264,'gringa  costilla maiz','gringa  costilla maiz','',6,1,178,NULL),
(265,'gringa al pastor maiz','gringa al pastor maiz','',6,1,179,NULL),
(266,'gringa  champiñónes maiz ','gringa  champiñónes maiz ','',6,1,181,NULL),
(267,'gringa puerco maiz','gringa puerco maiz','',6,1,182,NULL),
(268,'gringa de pollo maiz','gringa de pollo maiz','',6,1,183,NULL),
(269,'Paquete Pareja','paquete pareja','',13,1,193,NULL),
(270,'Paquete Familiar','Paquete Familiar','',13,1,194,NULL),
(271,'Paquete Empaches','Paquete Empaches','',13,1,195,NULL),
(281,'300 grs. carne de puerco ','300 grs. carne de puerco ','',15,1,119,NULL),
(282,'1/2.  kg bistec','1/2.  kg bistec','NA.jpg',15,1,120,NULL),
(283,'1/2.  kg res','1/2.  kg res','NA.jpg',15,1,121,NULL),
(284,'1/2.  kg pastor','1/2.  kg pastor','NA.jpg',15,1,122,NULL),
(285,'1 kg puerco','1 kg puerco','',15,1,123,NULL),
(286,'1 kg bistec de res','1 kg bistec de res','',15,1,124,NULL),
(287,'1. kg carne de res','1. kg carne de res','NA.jpg',15,1,125,NULL),
(288,'1. kg  carne al pastor','1. kg  carne al pastor','',15,1,126,NULL),
(289,'1. kg  carne de puerco','1. kg  carne de puerco','NA.jpg',15,0,127,NULL),
(290,'1/2.  kg carne puerco','1/2.  kg carne puerco','NA.jpg',15,1,122.5,NULL),
(291,'Cerveza Barrilito','Cerveza Barrilito','NA.jpg',7,1,222,NULL);
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
  `chr_dias_valido` varchar(7) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `bit_activo` int NOT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `id_precio` (`fl_descuento`),
  KEY `id_precio_2` (`fl_descuento`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tbl_promociones_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promociones`
--

LOCK TABLES `tbl_promociones` WRITE;
/*!40000 ALTER TABLE `tbl_promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_puestos`
--

DROP TABLE IF EXISTS `tbl_puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_puestos` (
  `id_puesto` int NOT NULL AUTO_INCREMENT,
  `chr_puesto` varchar(24) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_puesto` varchar(128) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `bit_activo` int NOT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_puestos`
--

LOCK TABLES `tbl_puestos` WRITE;
/*!40000 ALTER TABLE `tbl_puestos` DISABLE KEYS */;
INSERT INTO `tbl_puestos` VALUES (1,'Administrador','Administrador del negocio, responde por el resto del personal',1),
(2,'Cajero','Se encarga de la caja',1),
(3,'Mesero','Se encarga de atender las mesas',1),
(4,'Auxiliar','Se encarga de otras tareas (Lavaplatos, limpieza, etc).',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_reporte` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `int_tipo_reporte_id` int NOT NULL,
  PRIMARY KEY (`id_reporte`),
  KEY `int_tipo_reporte_id` (`int_tipo_reporte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
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
  `chr_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status`
--

LOCK TABLES `tbl_status` WRITE;
/*!40000 ALTER TABLE `tbl_status` DISABLE KEYS */;
INSERT INTO `tbl_status` VALUES (1,'Administrador'),
(2,'Normal'),
(3,'Mesero');
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ticket_cons`
--

LOCK TABLES `tbl_ticket_cons` WRITE;
/*!40000 ALTER TABLE `tbl_ticket_cons` DISABLE KEYS */;
INSERT INTO `tbl_ticket_cons` VALUES (1,1);
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
  `chr_tipo_reporte` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_tipo_reporte` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_reporte`),
  KEY `id_tipo_reporte` (`id_tipo_reporte`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_reporte`
--

LOCK TABLES `tbl_tipo_reporte` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_reporte` DISABLE KEYS */;
INSERT INTO `tbl_tipo_reporte` VALUES (1,'Normal','Reporte de ventas diarias normal'),
(2,'Mantenimiento','Reporte de mantenimiento');
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
  `chr_nombre_precio` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_tipo_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipos_precios`
--

LOCK TABLES `tbl_tipos_precios` WRITE;
/*!40000 ALTER TABLE `tbl_tipos_precios` DISABLE KEYS */;
INSERT INTO `tbl_tipos_precios` VALUES (1,'Normal',1),
(2,'Plataforma',1),
(3,'Personal',1),
(4,'Otro',0);
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
  `chr_login` varchar(128) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_password` varchar(1024) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `int_status` int NOT NULL,
  `bit_activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios`
--

LOCK TABLES `tbl_usuarios` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios` DISABLE KEYS */;
INSERT INTO `tbl_usuarios` VALUES (1,'admin','$1$tacosroy$tINrhk8Iak5HqU1sxDqtD1',1,1),
(2,'Cajero','936400f151ba2146a86cfcc342279f57',2,1),
(3,'Mesero1','85770ae9def3473f559e0dbe0609060a',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuarios_sistema`
--

LOCK TABLES `tbl_usuarios_sistema` WRITE;
/*!40000 ALTER TABLE `tbl_usuarios_sistema` DISABLE KEYS */;
INSERT INTO `tbl_usuarios_sistema` VALUES (1,1,1),
(2,2,2),
(3,3,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variantes_categorias`
--

LOCK TABLES `tbl_variantes_categorias` WRITE;
/*!40000 ALTER TABLE `tbl_variantes_categorias` DISABLE KEYS */;
INSERT INTO `tbl_variantes_categorias` VALUES (1,2,1),
(2,2,3),
(3,2,4),
(4,2,5),
(5,4,6),
(6,2,7),
(7,2,10),
(8,2,2),
(9,9,1),
(10,9,3),
(11,9,4),
(12,9,5),
(13,9,7),
(14,9,10),
(15,9,8),
(16,9,2),
(17,10,4),
(18,10,5),
(19,10,7),
(20,10,10),
(21,10,8),
(22,10,9),
(23,3,3),
(24,3,4),
(25,3,5),
(26,4,3),
(27,4,4),
(28,4,5),
(29,4,7),
(30,4,10),
(31,5,4),
(32,5,10),
(33,6,4),
(34,6,5),
(35,6,7),
(36,6,10),
(37,10,11),
(38,10,12),
(39,10,13),
(40,10,14),
(41,1,10),
(42,7,10),
(43,8,10),
(44,3,10),
(45,13,15),
(46,13,16),
(47,2,17),
(48,4,17),
(49,5,17),
(50,6,17),
(51,10,17),
(52,1,17),
(53,7,17),
(54,8,17),
(55,3,17),
(56,13,17),
(57,9,17),
(58,13,10),
(59,4,18),
(60,4,19),
(61,5,18),
(62,5,19),
(63,14,18),
(64,14,19);
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
  `chr_variante_nombre` varchar(64) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `chr_variante_descripcion` varchar(256) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_imprimir` varchar(12) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `fl_ordenar` float DEFAULT NULL,
  `bit_activo` int DEFAULT '1',
  PRIMARY KEY (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_variantes_platillos`
--

LOCK TABLES `tbl_variantes_platillos` WRITE;
/*!40000 ALTER TABLE `tbl_variantes_platillos` DISABLE KEYS */;
INSERT INTO `tbl_variantes_platillos` VALUES (1,'Sin Salsa','Productos preparados no llevan salsa','S/Salsa',1,1),
(2,'Sin Guacamole','Productos preparados no llevan guacamoles','S/Guacam',2,1),
(3,'Sin Verdura','Los platillos preparados no llevan verdura','S/Verdura',3,1),
(4,'Sin Cebolla','Los platillos preparados no llevan cebolla','S/Cebolla',4,1),
(5,'Sin Cilantro','Los platillos preparados no llevan cilantro','S/Cilantro',5,1),
(6,'Sin Piña','Los platillos preparados no llevan piña','Sin Pina',6,1),
(7,'Pura Carne','Los platillos preparados llevan pura carne al natural','Pura Carne',7,1),
(8,'Sin Col','Los platillos preparados no llevan Col','Sin Col',8,1),
(9,'Sin Rábano','Los platillos preparados no llevan Rábano','Sin Rabano',9,1),
(10,'Para llevar','Los productos son para llevar','P/Llevar',23,1),
(11,'Maciza de Puerco','El pozole lleva carne maciza de puerco','MacizaPco',10,1),
(12,'Maciza de Res','El pozole lleva carne Maciza de Res','MacizaRes',11,1),
(13,'Surtido Puerco','El pozole lleva carne surtida de puerco','SurtidaPco',12,1),
(14,'Mixto Puerco y Res','El pozole lleva carne mixta de puerco y res','Mixto',14,1),
(15,'Carne pastor','Para tacos o tostadas de paquete','Carne Pastor',15,1),
(16,'Carne Puerco','Para tacos o tostadas de paquete','Carne Pco',16,1),
(17,'A Domicilio','Producto a domicilio','A Domic.',24,1),
(18,'Tortilla Maiz','Producto con tortillas de maiz','Tt. Maiz',0.05,1),
(19,'Tortilla Harina','Producto con tortillas de harina','Tt. Harina',0.75,1),
(20,'Bistec Res','Producto preparado con Bistec de Res','C/BistecRes',17,1),
(21,'De Costilla','Carne Costilla para los platillos a la plancha que lo requieran','c/Costilla',18,1),
(22,'de Pollo','Carne de pollo para los platillos que lo requieren','c/Pollo',19,1),
(24,'Chuleta','Con Chuleta para preparar el platillo a la plancha','c/Chuleta',20,1),
(25,'Champiñones','Con Champiñones','c/Champñ',21,1),
(26,'Chorizo','Con Chorizo','c/Chorizo',22,1),
(27,'Carne de res','Producto lleva carne de Res','Surt. Res',13,1);
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
-- Temporary view structure for view `vw_facturas_clientes`
--

DROP TABLE IF EXISTS `vw_facturas_clientes`;
/*!50001 DROP VIEW IF EXISTS `vw_facturas_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_facturas_clientes` AS SELECT 
 1 AS `ID Factura`,
 1 AS `Folio Factura`,
 1 AS `Total`,
 1 AS `HoraFecha`,
 1 AS `Realizada`,
 1 AS `Email`,
 1 AS `Enviada`*/;
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
 1 AS `chr_consecutivo`,
 1 AS `chr_ticketConsecutivo`,
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
 1 AS `Orden`,
 1 AS `Cierre`,
 1 AS `Total`,
 1 AS `Mesa`,
 1 AS `Estado`,
 1 AS `Atendio`,
 1 AS `Control Fecha`,
 1 AS `Indexed`,
 1 AS `Status`,
 1 AS `Referencia`*/;
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
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_datos_personal_logins` AS select `tbl_usuarios_sistema`.`id_personal` AS `ID`,`tbl_personal`.`chr_nombre_persona` AS `Nombre`,`tbl_personal`.`chr_apellidos` AS `Apellidos`,`tbl_personal`.`chr_CURP` AS `CURP`,`tbl_personal`.`chr_telefono` AS `Telefono`,`tbl_puestos`.`chr_puesto` AS `Puesto`,`tbl_usuarios`.`chr_login` AS `Login`,`tbl_usuarios`.`id_usuario` AS `IDS`,`tbl_usuarios`.`chr_password` AS `PData`,`tbl_status`.`chr_status` AS `Tipo`,`tbl_personal`.`bit_activo` AS `Activo` from ((((`tbl_personal` left join `tbl_puestos` on((`tbl_personal`.`int_puesto` = `tbl_puestos`.`id_puesto`))) left join `tbl_usuarios_sistema` on((`tbl_personal`.`id_personal` = `tbl_usuarios_sistema`.`id_personal`))) left join `tbl_usuarios` on((`tbl_usuarios`.`id_usuario` = `tbl_usuarios_sistema`.`id_usuario`))) left join `tbl_status` on((`tbl_usuarios`.`int_status` = `tbl_status`.`id_status`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_facturas_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vw_facturas_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_facturas_clientes` AS select `tbl_facturas`.`id_factura` AS `ID Factura`,`tbl_facturas`.`chr_nr_factura` AS `Folio Factura`,`tbl_ordenes_cerradas`.`fl_total` AS `Total`,`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden` AS `HoraFecha`,`tbl_facturas`.`bit_realizada` AS `Realizada`,`tbl_clientes`.`chr_email` AS `Email`,`tbl_facturas_clientes`.`dt_enviada` AS `Enviada` from (((`tbl_facturas_clientes` left join `tbl_facturas` on((`tbl_facturas_clientes`.`id_factura` = `tbl_facturas`.`id_factura`))) left join `tbl_ordenes_cerradas` on((`tbl_facturas`.`id_orden` = `tbl_ordenes_cerradas`.`id_orden_cerrada`))) left join `tbl_clientes` on((`tbl_clientes`.`id_cliente` = `tbl_facturas_clientes`.`id_cliente`))) */;
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
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_ordenes_tickets` AS select `tbl_ordenes`.`id_orden_id` AS `id_orden_id`,`tbl_ordenes_cerradas`.`id_orden_cerrada` AS `id_orden_cerrada`,`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden` AS `dt_horafecha_cierre_orden`,`tbl_ordenes_cerradas`.`fl_total` AS `total`,`tbl_consecutivo`.`chr_consecutivo` AS `chr_consecutivo`,`tbl_ticket_cons`.`chr_ticketConsecutivo` AS `chr_ticketConsecutivo`,`tbl_ordenes_cerradas`.`int_lvl_report` AS `int_lvl_report`,`tbl_ordenes`.`chr_status_orden` AS `chr_status_orden` from (((`tbl_ordenes` left join `tbl_ordenes_cerradas` on((`tbl_ordenes`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`))) left join `tbl_consecutivo` on((`tbl_ordenes`.`int_consecutivo` = `tbl_consecutivo`.`id_consecutivo`))) left join `tbl_ticket_cons` on((`tbl_ticket_cons`.`id_ticketNrConsecutivo` = `tbl_ordenes_cerradas`.`id_ticket_IDNr`))) */;
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
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_insumos_usados_x_orden` AS select `tbl_ordenes`.`id_orden_id` AS `ID`,`tbl_ordenes`.`int_consecutivo` AS `Orden`,`tbl_ordenes`.`dt_horafecha_orden` AS `HoraFecha`,`tbl_ordenes`.`id_control_fecha` AS `Control Fecha`,`tbl_insumos`.`id_insumo` AS `InsumoID`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,(`tbl_prods_x_orden`.`int_cantidad` * `tbl_insumos_x_platillo`.`int_cantidad`) AS `Usado`,`tbl_ordenes`.`chr_status_orden` AS `Estado` from ((((`tbl_ordenes` left join `tbl_prods_x_orden` on((`tbl_prods_x_orden`.`int_orden_id` = `tbl_ordenes`.`id_orden_id`))) left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_insumos_x_platillo` on((`tbl_insumos_x_platillo`.`id_producto` = `tbl_productos`.`id_producto`))) left join `tbl_insumos` on((`tbl_insumos`.`id_insumo` = `tbl_insumos_x_platillo`.`id_insumo`))) */;
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
/*!50001 VIEW `vw_ordenes_x_mesero` AS select `tbl_ordenes`.`id_orden_id` AS `Orden`,`tbl_ordenes`.`dt_horafecha_orden` AS `Cierre`,`tbl_ordenes_cerradas`.`fl_total` AS `Total`,`tbl_mesas`.`chr_mesa` AS `Mesa`,`tbl_ordenes`.`chr_status_orden` AS `Estado`,`tbl_personal`.`chr_nombre_persona` AS `Atendio`,`tbl_ordenes`.`id_control_fecha` AS `Control Fecha`,`tbl_ordenes_cerradas`.`int_lvl_report` AS `Indexed`,`tbl_ordenes`.`chr_status_orden` AS `Status`,`tbl_ordenes_cerradas`.`chr_referencia_notas` AS `Referencia` from ((((`tbl_ordenes_cerradas` left join `tbl_ordenes` on((`tbl_ordenes`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`))) left join `tbl_ordenes_personal` on((`tbl_ordenes_personal`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`))) left join `tbl_personal` on((`tbl_ordenes_personal`.`id_personal` = `tbl_personal`.`id_personal`))) left join `tbl_mesas` on((`tbl_ordenes`.`int_mesa` = `tbl_mesas`.`id_mesa_id`))) */;
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
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_prods_x_orden` AS select `tbl_prods_x_orden`.`int_orden_id` AS `Orden`,`tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPO`,`tbl_productos`.`id_producto` AS `ID Prod`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_tipos_precios`.`id_tipo_precio` AS `Tipo Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `CHRTipoPrecio`,`tbl_ordenes`.`dt_horafecha_orden` AS `HoraFecha`,`tbl_ordenes`.`id_control_fecha` AS `Control Fecha`,`tbl_prods_x_orden`.`bool_activo` AS `Activo`,`tbl_prods_x_orden`.`bool_impreso` AS `Impreso`,`tbl_productos`.`fl_ordenar` AS `Ordenar` from ((((`tbl_prods_x_orden` left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_precio_tipo_ordenes` on((`tbl_prods_x_orden`.`int_orden_id` = `tbl_precio_tipo_ordenes`.`id_orden`))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precio_tipo_ordenes`.`id_tipo_precio`))) left join `tbl_ordenes` on((`tbl_ordenes`.`id_orden_id` = `tbl_prods_x_orden`.`int_orden_id`))) */;
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
/*!50001 VIEW `vw_products_catprecio` AS select `tbl_precios_productos`.`id_precio` AS `ID Precio`,`tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Desc`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`chr_desc_cat` AS `Tooltip`,`tbl_categorias`.`id_categoria` AS `CatID`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `Tipo`,`tbl_tipos_precios`.`id_tipo_precio` AS `IDTipo`,`tbl_productos`.`int_activo` AS `Activo`,`tbl_productos`.`fl_ordenar` AS `Ordenar`,`tbl_grupos_def`.`chr_nombre_grupo` AS `Agrupar` from ((((`tbl_productos` left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`))) left join `tbl_precios_productos` on(((`tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`) and (`tbl_precios_productos`.`bit_activo` = 1)))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`))) left join `tbl_grupos_def` on((`tbl_productos`.`id_grupo_producto` = `tbl_grupos_def`.`id_grupos_def`))) */;
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

-- Dump completed on 2022-01-08  1:25:05
