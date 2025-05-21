-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: db_tacosroy_trujano
-- ------------------------------------------------------
-- Server version	8.0.41

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
  `bit_visible` tinyint(1) NOT NULL DEFAULT '1',
  `bit_activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `bit_activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_combo`),
  KEY `index2` (`id_producto_relacionado`),
  CONSTRAINT `fk_tbl_combos_1` FOREIGN KEY (`id_producto_relacionado`) REFERENCES `tbl_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `tbl_consecutivo`
--

DROP TABLE IF EXISTS `tbl_consecutivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_consecutivo` (
  `id_consecutivo` int NOT NULL AUTO_INCREMENT,
  `chr_consecutivo` int NOT NULL,
  PRIMARY KEY (`id_consecutivo`)
) ENGINE=InnoDB AUTO_INCREMENT=239669 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2031 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2395 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `tbl_insumos`
--

DROP TABLE IF EXISTS `tbl_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_insumos` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_insumo` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `chr_descripcion` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `bit_activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=18137 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=255079 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=253801 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=32343 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=254771 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=254221 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4038 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=1069942 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `tbl_ticket_cons`
--

DROP TABLE IF EXISTS `tbl_ticket_cons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ticket_cons` (
  `id_ticketNrConsecutivo` int NOT NULL AUTO_INCREMENT,
  `chr_ticketConsecutivo` int NOT NULL,
  PRIMARY KEY (`id_ticketNrConsecutivo`)
) ENGINE=InnoDB AUTO_INCREMENT=254930 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_tipos_precios`
--

DROP TABLE IF EXISTS `tbl_tipos_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipos_precios` (
  `id_tipo_precio` int NOT NULL AUTO_INCREMENT,
  `chr_nombre_precio` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `bit_activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_tipo_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `chr_pin` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  `int_status` int NOT NULL,
  `bit_activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `bit_activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_variante_pl`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- Dump completed on 2025-03-21 18:09:05
