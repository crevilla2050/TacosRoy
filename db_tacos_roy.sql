-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2016 at 10:45 PM
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
  `chr_consecutivo` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_ticketNrConsecutivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ordenes`
--

DROP TABLE IF EXISTS `tbl_ordenes`;
CREATE TABLE IF NOT EXISTS `tbl_ordenes` (
  `id_orden_id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_horafecha_orden` datetime NOT NULL,
  `int_mesa` int(11) NOT NULL,
  `int_consecutivo` int(11) NOT NULL,
  PRIMARY KEY (`id_orden_id`),
  KEY `int_mesa` (`int_mesa`),
  KEY `int_mesa_2` (`int_mesa`),
  KEY `int_consecutivo` (`int_consecutivo`)
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_precios_productos`
--

INSERT INTO `tbl_precios_productos` (`id_precio`, `id_producto`, `dbl_precio`, `int_tipo_precio`, `bit_activo`) VALUES
(1, 5, 11.00, 1, 1),
(2, 6, 10.00, 1, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_productos`
--

INSERT INTO `tbl_productos` (`id_producto`, `chr_nombre_prod`, `chr_desc_prod`, `chr_pic_prod_path`, `id_categoria`, `int_activo`) VALUES
(5, 'Maciza de Res', 'Tacos de maciza de Res', '5.jpg', 0, 0),
(6, 'Maciza de Puerco', 'Tacos de maciza de puerco', '6.jpg', 0, 0);

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
  `bit_activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`id_usuario`, `chr_nombre_usuario`, `chr_login`, `chr_password`, `chr_telefono_usuario`, `chr_email_usuario`, `int_status`, `bit_activo`) VALUES
(1, 'Usuario de sistema', 'admin', '*00A51F3F484', '1234567894', 'mail@mail.com', 1, 1);

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
-- Structure for view `vw_datos_usuarios`
--
DROP TABLE IF EXISTS `vw_datos_usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_datos_usuarios` AS select `tbl_usuarios`.`id_usuario` AS `ID`,`tbl_usuarios`.`chr_nombre_usuario` AS `Nombre`,`tbl_usuarios`.`chr_login` AS `Login`,`tbl_usuarios`.`chr_telefono_usuario` AS `Teléfono`,`tbl_usuarios`.`chr_email_usuario` AS `Email`,`tbl_usuarios`.`bit_activo` AS `Activo`,`tbl_status`.`chr_status` AS `Tipo` from (`tbl_usuarios` left join `tbl_status` on((`tbl_usuarios`.`int_status` = `tbl_status`.`id_status`)));

-- --------------------------------------------------------

--
-- Structure for view `vw_precios_productos`
--
DROP TABLE IF EXISTS `vw_precios_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_precios_productos` AS select `tbl_productos`.`id_producto` AS `ID`,`tbl_productos`.`chr_nombre_prod` AS `Producto`,`tbl_precios_productos`.`dbl_precio` AS `Precio`,`tbl_tipos_precios`.`chr_nombre_precio` AS `Tipo` from ((`tbl_productos` left join `tbl_precios_productos` on((`tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`))) left join `tbl_tipos_precios` on((`tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
