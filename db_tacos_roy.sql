-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2016 at 03:14 AM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_tacos_roy`
--
CREATE DATABASE IF NOT EXISTS `db_tacos_roy` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `db_tacos_roy`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categorias`
--

DROP TABLE IF EXISTS `tbl_categorias`;
CREATE TABLE IF NOT EXISTS `tbl_categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_cat` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_cat` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `fl_orden` float NOT NULL,
  `bool_activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_categorias`
--

INSERT INTO `tbl_categorias` (`id_categoria`, `chr_nombre_cat`, `chr_desc_cat`, `fl_orden`, `bool_activo`) VALUES
(1, 'Sin Categoria', 'Para productos sin categoria', 1, 1),
(2, 'Tacos al Vapor', 'Tacos al vapor', 2, 1),
(3, 'Tacos Ahogados', 'Tacos ahogados en salsa', 3, 1),
(4, 'Tacos a la plancha', 'Tacos preparados a la plancha', 4, 1),
(5, 'A la Plancha', 'Productos elaborados en plancha', 5, 1),
(6, 'Preparados', 'Productos preparados varios (Pozole, Queso fundido, etc).', 6, 1),
(7, 'Bebidas', 'Bebidas frías o calientes', 7, 1),
(8, 'Postres', 'Postres y alimentos dulces', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_consecutivo`
--

DROP TABLE IF EXISTS `tbl_consecutivo`;
CREATE TABLE IF NOT EXISTS `tbl_consecutivo` (
  `id_ticketNrConsecutivo` int(11) NOT NULL AUTO_INCREMENT,
  `chr_consecutivo` int(11) NOT NULL,
  PRIMARY KEY (`id_ticketNrConsecutivo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `tbl_consecutivo`
--

INSERT INTO `tbl_consecutivo` (`id_ticketNrConsecutivo`, `chr_consecutivo`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datos_sucursal`
--

DROP TABLE IF EXISTS `tbl_datos_sucursal`;
CREATE TABLE IF NOT EXISTS `tbl_datos_sucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir1` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir2` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `chr_dir3` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono1` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono2` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario_encargado` int(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_datos_sucursal`
--

INSERT INTO `tbl_datos_sucursal` (`id_sucursal`, `chr_nombre`, `chr_dir1`, `chr_dir2`, `chr_dir3`, `chr_telefono1`, `chr_telefono2`, `id_usuario_encargado`) VALUES
(1, 'Tacos Roy Suc. Escuadron', 'Calle Escuadrón 201 Nr. 300', 'Col. Antiguo Aeropuerto', 'CP. 68050, Oaxaca, Oaxaca.', '9511327096', '000000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gastos`
--

DROP TABLE IF EXISTS `tbl_gastos`;
CREATE TABLE IF NOT EXISTS `tbl_gastos` (
  `id_gasto` int(11) NOT NULL AUTO_INCREMENT,
  `dt_horafecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_cantidad` float NOT NULL,
  `chr_concepto_gasto` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `id_usuario_auth` int(11) NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `id_usuario_auth` (`id_usuario_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_insumos`
--

DROP TABLE IF EXISTS `tbl_insumos`;
CREATE TABLE IF NOT EXISTS `tbl_insumos` (
  `id_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_insumo` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_descripcion` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_insumos`
--

INSERT INTO `tbl_insumos` (`id_insumo`, `chr_nombre_insumo`, `chr_descripcion`) VALUES
(1, 'Tortilla', 'Tortilla de Maiz'),
(2, 'Tortilla de harina', 'Tortilla de harina de trigo'),
(3, 'Tosatada', 'Tostada frita para acompañar aliemntos'),
(4, 'Pepsi', 'Refresco Pepsi'),
(5, 'Squirt', 'Refresco Squirt'),
(6, 'Mirinda', 'Refresco Mirinda'),
(7, 'Sangría', 'Refresco Sangría'),
(8, 'Cerveza Corona', 'Cerveza Corona');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inventario`
--

DROP TABLE IF EXISTS `tbl_inventario`;
CREATE TABLE IF NOT EXISTS `tbl_inventario` (
  `id_inventario_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_insumo_id` int(11) NOT NULL,
  `int_cantidad` int(11) NOT NULL,
  `dt_fecha_insumo` datetime NOT NULL,
  PRIMARY KEY (`id_inventario_id`),
  KEY `id_insumo_id` (`id_insumo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tbl_inventario`
--

INSERT INTO `tbl_inventario` (`id_inventario_id`, `id_insumo_id`, `int_cantidad`, `dt_fecha_insumo`) VALUES
(4, 1, 300, '2016-03-18 00:00:00'),
(5, 2, 150, '2016-03-18 00:00:00'),
(6, 3, 50, '2016-03-18 00:00:00'),
(7, 4, 80, '2016-03-18 00:00:00'),
(8, 5, 50, '2016-03-18 00:00:00'),
(9, 6, 40, '2016-03-18 00:00:00'),
(10, 7, 50, '2016-03-18 00:00:00'),
(11, 8, 100, '2016-03-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mesas`
--

DROP TABLE IF EXISTS `tbl_mesas`;
CREATE TABLE IF NOT EXISTS `tbl_mesas` (
  `id_mesa_id` int(11) NOT NULL AUTO_INCREMENT,
  `chr_mesa` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `int_nr_personas` int(11) NOT NULL,
  `bit_mesa_activa` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_mesa_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `tbl_mesas`
--

INSERT INTO `tbl_mesas` (`id_mesa_id`, `chr_mesa`, `int_nr_personas`, `bit_mesa_activa`) VALUES
(1, '1', 4, 1),
(2, '2', 4, 1),
(3, '3', 5, 1),
(4, '4', 4, 1),
(5, '5', 6, 1),
(6, '6', 4, 1),
(7, '7', 6, 1),
(8, '8', 5, 1),
(9, '9', 4, 1),
(10, '10', 5, 1),
(11, '11', 1, 1),
(12, 'P. Llevar', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ordenes`
--

DROP TABLE IF EXISTS `tbl_ordenes`;
CREATE TABLE IF NOT EXISTS `tbl_ordenes` (
  `id_orden_id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_horafecha_orden` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `int_mesa` int(11) NOT NULL,
  `int_consecutivo` int(11) NOT NULL,
  `chr_status_orden` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_orden_id`),
  KEY `int_mesa` (`int_mesa`),
  KEY `int_mesa_2` (`int_mesa`),
  KEY `int_consecutivo` (`int_consecutivo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `tbl_ordenes`
--

INSERT INTO `tbl_ordenes` (`id_orden_id`, `dt_horafecha_orden`, `int_mesa`, `int_consecutivo`, `chr_status_orden`) VALUES
(1, '2016-03-17 06:15:43', 1, 1, 'Cancelada'),
(11, '2016-03-17 02:19:24', 5, 17, 'Cancelada'),
(12, '2016-03-13 00:50:03', 8, 12, 'Abierta'),
(13, '2016-03-13 01:11:16', 6, 13, 'Abierta'),
(14, '2016-03-13 01:13:31', 7, 14, 'Abierta'),
(15, '2016-03-17 02:19:34', 6, 15, 'Cancelada'),
(16, '2016-03-13 01:16:49', 7, 16, 'Abierta'),
(17, '2016-03-17 09:09:30', 8, 17, 'Cancelada'),
(18, '2016-03-15 20:54:34', 9, 18, 'Abierta'),
(19, '2016-03-15 20:55:40', 5, 19, 'Abierta'),
(20, '2016-03-15 20:56:50', 3, 20, 'Abierta'),
(21, '2016-03-17 02:15:08', 1, 21, 'Abierta'),
(22, '2016-03-17 06:14:35', 12, 22, 'Abierta');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ordenes_cerradas`
--

DROP TABLE IF EXISTS `tbl_ordenes_cerradas`;
CREATE TABLE IF NOT EXISTS `tbl_ordenes_cerradas` (
  `id_orden_cerrada` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden_id` int(11) NOT NULL,
  `dt_horafecha_cierre_orden` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fl_total` float NOT NULL,
  `bool_factura` tinyint(1) NOT NULL DEFAULT '0',
  `chr_referencia_notas` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `int_lvl_report` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_orden_cerrada`),
  KEY `id_orden_id` (`id_orden_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_precios_productos`
--

DROP TABLE IF EXISTS `tbl_precios_productos`;
CREATE TABLE IF NOT EXISTS `tbl_precios_productos` (
  `id_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `dbl_precio` decimal(10,2) NOT NULL,
  `int_tipo_precio` int(11) NOT NULL,
  `bit_activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_precio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=54 ;

--
-- Dumping data for table `tbl_precios_productos`
--

INSERT INTO `tbl_precios_productos` (`id_precio`, `id_producto`, `dbl_precio`, `int_tipo_precio`, `bit_activo`) VALUES
(1, 5, 11.00, 1, 1),
(2, 6, 10.00, 1, 1),
(3, 0, 10.00, 1, 1),
(4, 7, 10.00, 1, 1),
(5, 8, 10.00, 1, 1),
(6, 9, 10.00, 1, 1),
(7, 10, 10.00, 1, 1),
(8, 11, 10.00, 1, 1),
(9, 12, 10.00, 1, 1),
(10, 13, 10.00, 1, 1),
(11, 14, 12.00, 1, 1),
(12, 15, 10.00, 1, 1),
(13, 16, 15.00, 1, 1),
(14, 17, 15.00, 1, 1),
(15, 18, 80.00, 1, 1),
(16, 19, 80.00, 1, 1),
(17, 20, 75.00, 1, 1),
(18, 21, 75.00, 1, 1),
(19, 22, 75.00, 1, 1),
(20, 23, 75.00, 1, 1),
(21, 24, 75.00, 1, 1),
(22, 25, 1.00, 1, 1),
(23, 26, 45.00, 1, 1),
(24, 27, 40.00, 1, 1),
(25, 28, 40.00, 1, 1),
(26, 29, 45.00, 1, 1),
(27, 30, 27.00, 1, 1),
(28, 31, 27.00, 1, 1),
(29, 32, 24.00, 1, 1),
(30, 33, 22.00, 1, 1),
(31, 34, 22.00, 1, 1),
(32, 35, 27.00, 1, 1),
(33, 36, 2.00, 1, 1),
(34, 37, 15.00, 1, 1),
(35, 38, 45.00, 1, 1),
(36, 39, 15.00, 1, 1),
(37, 40, 45.00, 1, 1),
(38, 41, 15.00, 1, 1),
(39, 42, 45.00, 1, 1),
(40, 43, 15.00, 1, 1),
(41, 44, 45.00, 1, 1),
(42, 45, 15.00, 1, 1),
(43, 46, 15.00, 1, 1),
(44, 47, 15.00, 1, 1),
(45, 48, 15.00, 1, 1),
(46, 49, 15.00, 1, 1),
(47, 50, 15.00, 1, 1),
(48, 51, 15.00, 1, 1),
(49, 52, 15.00, 1, 1),
(50, 53, 12.00, 1, 1),
(51, 54, 25.00, 1, 1),
(52, 55, 25.00, 1, 1),
(53, 56, 30.00, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_prods_x_orden`
--

DROP TABLE IF EXISTS `tbl_prods_x_orden`;
CREATE TABLE IF NOT EXISTS `tbl_prods_x_orden` (
  `id_prod_x_orden` int(11) NOT NULL AUTO_INCREMENT,
  `int_orden_id` int(11) NOT NULL,
  `int_producto_id` int(11) NOT NULL,
  `int_cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_prod_x_orden`),
  KEY `int_orden_id` (`int_orden_id`,`int_producto_id`),
  KEY `int_producto_id` (`int_producto_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=34 ;

--
-- Dumping data for table `tbl_prods_x_orden`
--

INSERT INTO `tbl_prods_x_orden` (`id_prod_x_orden`, `int_orden_id`, `int_producto_id`, `int_cantidad`) VALUES
(1, 1, 6, 2),
(2, 1, 8, 5),
(3, 1, 11, 2),
(5, 12, 9, 7),
(6, 13, 9, 5),
(7, 14, 11, 6),
(8, 15, 15, 2),
(9, 16, 9, 6),
(10, 16, 6, 6),
(11, 16, 20, 1),
(12, 16, 45, 1),
(13, 16, 47, 1),
(14, 17, 17, 7),
(15, 18, 26, 1),
(16, 18, 20, 2),
(17, 19, 16, 2),
(18, 20, 9, 8),
(19, 20, 40, 1),
(20, 21, 15, 5),
(21, 21, 30, 3),
(22, 21, 7, 4),
(24, 21, 46, 1),
(25, 14, 5, 2),
(26, 21, 47, 1),
(27, 20, 29, 1),
(28, 22, 20, 1),
(29, 22, 18, 2),
(30, 22, 32, 2),
(31, 22, 45, 1),
(32, 22, 48, 1),
(33, 22, 52, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productos`
--

DROP TABLE IF EXISTS `tbl_productos`;
CREATE TABLE IF NOT EXISTS `tbl_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_prod` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_prod` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `chr_pic_prod_path` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `int_activo` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=57 ;

--
-- Dumping data for table `tbl_productos`
--

INSERT INTO `tbl_productos` (`id_producto`, `chr_nombre_prod`, `chr_desc_prod`, `chr_pic_prod_path`, `id_categoria`, `int_activo`) VALUES
(5, 'Maciza de Res', 'Tacos de maciza de Res', '5.jpg', 2, 1),
(6, 'Maciza de Puerco', 'Tacos de maciza de puerco', '6.jpg', 2, 1),
(7, 'Lengua de cerdo', 'Tacos de lengua de cerdo al vapor', '7.jpg', 2, 1),
(8, 'Carnitas', 'Tacos de carnitas', '8.jpg', 2, 1),
(9, 'Buche', 'Tacos de buche', '9.jpg', 2, 1),
(10, 'Oreja', 'Tacos de oreja de cerdo', '10.jpg', 2, 1),
(11, 'Azadura', 'Tacos de azadura', '11.jpg', 2, 1),
(12, 'Trompa', 'Tacos de trompa de cerdo', '12.jpg', 2, 1),
(13, 'Corazón', 'Tacos de corazón', '13.jpg', 2, 1),
(14, 'Bistec de res', 'Tacos de bistec de res', '14.jpg', 4, 1),
(15, 'Pastor', 'Tacos al pastor', '15.jpg', 4, 1),
(16, 'Bistec con quesillo', 'Taco de bistec de res con quesillo', '16.jpg', 4, 1),
(17, 'Pastor con quesillo', 'Taco al pastor con quesillo', '17.jpg', 4, 1),
(18, 'Mula Terca', 'Tocino/Jamón/Bistec de res o carne al pastor y quesillo', '18.jpg', 5, 1),
(19, 'Plato Suizo', 'Bistec de res o carne al pastor y quesillo', '19.jpg', 5, 1),
(20, 'Alambre', 'Cebolla, Chile Morrón, Tocino, Bistec de Res y Quesillo', '20.jpg', 5, 1),
(21, 'Alambre Especial', 'Cebolla, Chile morrón, Tocino, Bistec de Res, Jamón, Champiñones, Carne al pastor y Quesillo', '21.jpg', 5, 1),
(22, 'Mata Hambre', 'Cebolla, Chile Morrón, Tocino, Bistec de Res, Jamón, Carne al pastor, Tomate y Quesillo', '22.jpg', 5, 1),
(23, 'Plato Mixto', 'Tocino, Jamón, Carne al pastor, Salsa Mexicana y quesillo', '23.jpg', 5, 1),
(24, 'Vegetariano', 'Cebolla, Chile Morrón, Tomate, Champiñones y quesillo', '24.jpg', 5, 1),
(25, 'Tortilla adicional', 'Tortilla adicional', '25.jpg', 1, 1),
(26, 'Pozole rojo', 'Plato de pozole rojo, grande', '26.jpg', 6, 1),
(27, 'Pozole Rojo Chico', 'Pozole Rojo Chico', '27.jpg', 6, 1),
(28, 'Queso Fundido', 'Queso fundido normal', '28.jpg', 6, 1),
(29, 'Queso Especial', 'Queso fundido combinado con bistec, pastor o champiñones', '29.jpg', 6, 1),
(30, 'Gringa', 'Tortilla de harina con queso y carne', '30.jpg', 6, 1),
(31, 'Sincronizada', 'Tortilla de harina con queso y jamón', '31.jpg', 6, 1),
(32, 'Tostada', 'Se prepara con la carne de su elección', '32.jpg', 6, 1),
(33, 'Burrita', '', '33.jpg', 6, 1),
(34, 'Quesadilla', 'Quesadilla', '34.jpg', 6, 1),
(35, 'Quesadilla Especial', 'Con Bistec de res, pastor o champiñones', '35.jpg', 6, 1),
(36, 'Tostada adicional', 'Tostada adicional para cualquier alimento', '36.jpg', 1, 1),
(37, 'Vaso Agua de horchata', 'Agua fresca de horchata, un vaso', '37.jpg', 7, 1),
(38, 'Agua de horchata, Jarra', 'Jarra de agua de horchata', '38.jpg', 7, 1),
(39, 'Agua de Jamaica, Vaso', 'Vaso de agua de jamaica', '39.jpg', 7, 1),
(40, 'Agua de Jamaica, Jarra', 'Jarra de agua de jamaica', '40.jpg', 7, 1),
(41, 'Agua de Naranja, Vaso', 'Vaso de agua de naranja', '41.jpg', 7, 1),
(42, 'Agua de naranja, Jarra', 'Jarra de agua de naranja', '42.jpg', 7, 1),
(43, 'Agua de Mandarina, Vaso', 'Vaso de agua de mandarina', '43.jpg', 7, 1),
(44, 'Agua de Mandarina, Jarra', 'Jarra de agua de mandarina', '44.jpg', 7, 1),
(45, 'R. Pepsi', 'Refresco marca Pepsi', '45.jpg', 7, 1),
(46, 'Mirinda', 'Refresco mirinda', '46.jpg', 7, 1),
(47, 'Sangria', 'Refresco Sangría', '47.jpg', 7, 1),
(48, '7 Up', 'Refresco 7up', '48.jpg', 7, 1),
(49, 'Manzanita Sol', 'Refresco Manzanita Sol', '49.jpg', 7, 1),
(50, 'Agua Mineral', 'Agua mineral embotellada', '50.jpg', 7, 1),
(51, 'Café', 'Tasa de café', '51.jpg', 7, 1),
(52, 'Atole', 'Atole', '52.jpg', 7, 1),
(53, 'Agua embotellada SIN gas', 'Agua embotellada SIN gas', '53.jpg', 7, 1),
(54, 'Panqué de elote', 'Panqué de elote', '54.jpg', 7, 1),
(55, 'Flan', 'Flan', '55.jpg', 7, 1),
(56, 'Pastel de Queso', 'Pastel de queso', '56.jpg', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_promociones`
--

DROP TABLE IF EXISTS `tbl_promociones`;
CREATE TABLE IF NOT EXISTS `tbl_promociones` (
  `id_promocion` int(11) NOT NULL AUTO_INCREMENT,
  `id_precio` int(11) NOT NULL,
  `dt_fecha_inicio` date NOT NULL,
  `dt_fecha_final` date NOT NULL,
  `chr_dias_valido` varchar(7) COLLATE utf8_spanish_ci NOT NULL,
  `bit_activo` int(11) NOT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `id_precio` (`id_precio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recetas_productos`
--

DROP TABLE IF EXISTS `tbl_recetas_productos`;
CREATE TABLE IF NOT EXISTS `tbl_recetas_productos` (
  `id_receta_prod` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `int_cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_receta_prod`),
  KEY `id_producto` (`id_producto`,`id_insumo`),
  KEY `id_insumo` (`id_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reportes`
--

DROP TABLE IF EXISTS `tbl_reportes`;
CREATE TABLE IF NOT EXISTS `tbl_reportes` (
  `id_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `dt_fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `chr_reporte` text COLLATE utf8_spanish_ci NOT NULL,
  `int_tipo_reporte_id` int(11) NOT NULL,
  PRIMARY KEY (`id_reporte`),
  KEY `int_tipo_reporte_id` (`int_tipo_reporte_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
CREATE TABLE IF NOT EXISTS `tbl_status` (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `chr_status` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_status`
--

INSERT INTO `tbl_status` (`id_status`, `chr_status`) VALUES
(1, 'Administrador'),
(2, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipos_precios`
--

DROP TABLE IF EXISTS `tbl_tipos_precios`;
CREATE TABLE IF NOT EXISTS `tbl_tipos_precios` (
  `id_tipo_precio` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_precio` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_precio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_tipos_precios`
--

INSERT INTO `tbl_tipos_precios` (`id_tipo_precio`, `chr_nombre_precio`) VALUES
(1, 'Normal'),
(2, 'Promocion'),
(3, 'Cortesía'),
(4, 'Otro');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tipo_reporte`
--

DROP TABLE IF EXISTS `tbl_tipo_reporte`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_reporte` (
  `id_tipo_reporte` int(11) NOT NULL AUTO_INCREMENT,
  `chr_tipo_reporte` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `chr_desc_tipo_reporte` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_reporte`),
  KEY `id_tipo_reporte` (`id_tipo_reporte`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_tipo_reporte`
--

INSERT INTO `tbl_tipo_reporte` (`id_tipo_reporte`, `chr_tipo_reporte`, `chr_desc_tipo_reporte`) VALUES
(1, 'Normal', 'Reporte de ventas diarias normal'),
(2, 'Mantenimiento', 'Reporte de mantenimiento');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usuarios`
--

DROP TABLE IF EXISTS `tbl_usuarios`;
CREATE TABLE IF NOT EXISTS `tbl_usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `chr_nombre_usuario` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `chr_login` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `chr_password` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `chr_telefono_usuario` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chr_email_usuario` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `int_status` int(11) NOT NULL,
  `bit_activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id_usuario`, `chr_nombre_usuario`, `chr_login`, `chr_password`, `chr_telefono_usuario`, `chr_email_usuario`, `int_status`, `bit_activo`) VALUES
(1, 'Usuario De Sistema', 'admin', '827ccb0eea8a', '123565656', 'mail@mail.com', 1, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_datos_usuarios`
--
DROP VIEW IF EXISTS `vw_datos_usuarios`;
CREATE TABLE IF NOT EXISTS `vw_datos_usuarios` (
`ID` int(11)
,`Nombre` varchar(128)
,`Login` varchar(128)
,`Teléfono` varchar(10)
,`Email` varchar(128)
,`Activo` tinyint(1)
,`Tipo` varchar(32)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_inventarios_fecha`
--
DROP VIEW IF EXISTS `vw_inventarios_fecha`;
CREATE TABLE IF NOT EXISTS `vw_inventarios_fecha` (
`InvID` int(11)
,`Insumo` varchar(64)
,`Cantidad` int(11)
,`Fecha` datetime
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_orden_prods_precio`
--
DROP VIEW IF EXISTS `vw_orden_prods_precio`;
CREATE TABLE IF NOT EXISTS `vw_orden_prods_precio` (
`Orden` int(11)
,`Producto` varchar(128)
,`Cantidad` int(11)
,`Precio` decimal(10,2)
,`IDPO` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_precios_productos`
--
DROP VIEW IF EXISTS `vw_precios_productos`;
CREATE TABLE IF NOT EXISTS `vw_precios_productos` (
`ID` int(11)
,`Producto` varchar(128)
,`Precio` decimal(10,2)
,`Tipo` varchar(64)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_products_catprecio`
--
DROP VIEW IF EXISTS `vw_products_catprecio`;
CREATE TABLE IF NOT EXISTS `vw_products_catprecio` (
`ID` int(11)
,`Producto` varchar(128)
,`Categoria` varchar(64)
,`CatID` int(11)
,`Precio` decimal(10,2)
,`Tipo` varchar(64)
,`Activo` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_products_infoCat`
--
DROP VIEW IF EXISTS `vw_products_infoCat`;
CREATE TABLE IF NOT EXISTS `vw_products_infoCat` (
`ID` int(11)
,`Producto` varchar(128)
,`Descripcion` varchar(256)
,`Categoria` varchar(64)
,`Tooltip` varchar(256)
,`Activo` int(11)
);
-- --------------------------------------------------------

--
-- Structure for view `vw_datos_usuarios`
--
DROP TABLE IF EXISTS `vw_datos_usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_datos_usuarios` AS select `tbl_usuarios`.`id_usuario` AS `ID`,`tbl_usuarios`.`chr_nombre_usuario` AS `Nombre`,`tbl_usuarios`.`chr_login` AS `Login`,`tbl_usuarios`.`chr_telefono_usuario` AS `Teléfono`,`tbl_usuarios`.`chr_email_usuario` AS `Email`,`tbl_usuarios`.`bit_activo` AS `Activo`,`tbl_status`.`chr_status` AS `Tipo` from (`tbl_usuarios` left join `tbl_status` on((`tbl_usuarios`.`int_status` = `tbl_status`.`id_status`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_inventarios_fecha`
--
DROP TABLE IF EXISTS `vw_inventarios_fecha`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_inventarios_fecha` AS select `tbl_inventario`.`id_inventario_id` AS `InvID`,`tbl_insumos`.`chr_nombre_insumo` AS `Insumo`,`tbl_inventario`.`int_cantidad` AS `Cantidad`,`tbl_inventario`.`dt_fecha_insumo` AS `Fecha` from (`tbl_inventario` left join `tbl_insumos` on((`tbl_inventario`.`id_insumo_id` = `tbl_insumos`.`id_insumo`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_orden_prods_precio`
--
DROP TABLE IF EXISTS `vw_orden_prods_precio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_orden_prods_precio` AS select `tbl_ordenes`.`id_orden_id` AS `Orden`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_prods_x_orden`.`int_cantidad` AS `Cantidad`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_prods_x_orden`.`id_prod_x_orden` AS `IDPO` from (((`tbl_ordenes` left join `tbl_prods_x_orden` on((`tbl_ordenes`.`id_orden_id` = `tbl_prods_x_orden`.`int_orden_id`))) left join `tbl_productos` on((`tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`))) left join `tbl_precios_productos` on((`tbl_precios_productos`.`id_producto` = `tbl_productos`.`id_producto`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_precios_productos`
--
DROP TABLE IF EXISTS `vw_precios_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_precios_productos` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `Tipo` from ((`tbl_productos` left join `tbl_precios_productos` on((`tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_products_catprecio`
--
DROP TABLE IF EXISTS `vw_products_catprecio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_products_catprecio` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`id_categoria` AS `CatID`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `Tipo`,`tbl_productos`.`int_activo` AS `Activo` from (((`tbl_productos` left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`))) left join `tbl_precios_productos` on((`tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_products_infoCat`
--
DROP TABLE IF EXISTS `vw_products_infoCat`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_products_infoCat` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_productos`.`chr_desc_prod` AS `Descripcion`,`tbl_categorias`.`chr_nombre_cat` AS `Categoria`,`tbl_categorias`.`chr_desc_cat` AS `Tooltip`,`tbl_productos`.`int_activo` AS `Activo` from (`tbl_productos` left join `tbl_categorias` on((`tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_gastos`
--
ALTER TABLE `tbl_gastos`
  ADD CONSTRAINT `tbl_gastos_ibfk_1` FOREIGN KEY (`id_usuario_auth`) REFERENCES `tbl_usuarios` (`id_usuario`);

--
-- Constraints for table `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD CONSTRAINT `tbl_inventario_ibfk_1` FOREIGN KEY (`id_insumo_id`) REFERENCES `tbl_insumos` (`id_insumo`);

--
-- Constraints for table `tbl_ordenes_cerradas`
--
ALTER TABLE `tbl_ordenes_cerradas`
  ADD CONSTRAINT `Cerrada_orden_ID` FOREIGN KEY (`id_orden_id`) REFERENCES `tbl_ordenes` (`id_orden_id`);

--
-- Constraints for table `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD CONSTRAINT `tbl_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categorias` (`id_categoria`);

--
-- Constraints for table `tbl_recetas_productos`
--
ALTER TABLE `tbl_recetas_productos`
  ADD CONSTRAINT `tbl_recetas_productos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`id_producto`),
  ADD CONSTRAINT `tbl_recetas_productos_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `tbl_insumos` (`id_insumo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
