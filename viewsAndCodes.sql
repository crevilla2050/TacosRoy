create view `vw_categorias` as
SELECT
`tbl_categorias`.`chr_nombre_cat` ,  
`tbl_subcategorias`.`chr_nom_subcat` ,
`tbl_subcategorias`.`id_subcategoria` 
FROM  `tbl_subcategorias` 
RIGHT JOIN  `db_tacos_roy`.`tbl_categorias` ON  `tbl_subcategorias`.`id_cat_padre` =  `tbl_categorias`.`id_categoria` 

CREATE VIEW  `vw_datos_usuarios` AS SELECT  
`tbl_usuarios`.`id_usuario` AS 					  'ID', 
`tbl_usuarios`.`chr_nombre_usuario` AS 	  'Nombre',  
`tbl_usuarios`.`chr_login` AS  					  'Login', 
`tbl_usuarios`.`chr_telefono_usuario` AS  'Teléfono', 
`tbl_usuarios`.`chr_email_usuario` AS  		'Email',
`tbl_usuarios`.`bit_activo` AS  					'Activo',
`tbl_status`.`chr_status` AS  						'Tipo'
FROM  `tbl_usuarios` 
LEFT JOIN  `db_tacos_roy`.`tbl_status` ON  `tbl_usuarios`.`int_status` =  `tbl_status`.`id_status`

Create view `vw_precios_productos` AS
SELECT  
`tbl_productos`.`id_producto` as 'ID', 
`tbl_productos`.`chr_nombre_prod` AS 'Producto',
`tbl_precios_productos`.`dbl_precio` as 'Precio', 
`tbl_tipos_precios`.`chr_nombre_precio` as 'Tipo'
FROM `tbl_productos`
LEFT JOIN `tbl_precios_productos` ON `tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`
LEFT JOIN `tbl_tipos_precios` ON `tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`

Create view `vw_products_infoCat` AS
SELECT 
`tbl_productos`.`id_producto` as 'ID', 
`tbl_productos`.`chr_nombre_prod` as 'Producto',
`tbl_productos`.`chr_desc_prod` as 'Descripcion',
`tbl_categorias`.`chr_nombre_cat` as 'Categoria',
`tbl_categorias`.`chr_desc_cat` as 'Tooltip',
`tbl_productos`.`int_activo` as 'Activo'
FROM `tbl_productos`
 LEFT JOIN `db_tacos_roy`.`tbl_categorias` ON `tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria` 

Create view `vw_products_catprecio` AS
SELECT 
`tbl_productos`.`id_producto` as 'ID', 
`tbl_productos`.`chr_nombre_prod` AS 'Producto',
`tbl_productos`.`chr_desc_prod` as 'Desc',
`tbl_categorias`.`chr_nombre_cat` as 'Categoria',
`tbl_categorias`.`chr_desc_cat` as 'Tooltip',
`tbl_categorias`.`id_categoria` as 'CatID',
`tbl_precios_productos`.`dbl_precio` as 'Precio',
`tbl_tipos_precios`.`chr_nombre_precio` as 'Tipo',
`tbl_productos`.`int_activo` as 'Activo'
FROM `tbl_productos`
 LEFT JOIN `db_tacos_roy`.`tbl_categorias` ON `tbl_productos`.`id_categoria` = `tbl_categorias`.`id_categoria`
 LEFT JOIN `db_tacos_roy`.`tbl_precios_productos` ON `tbl_productos`.`id_producto` = `tbl_precios_productos`.`id_producto`
 LEFT JOIN `tbl_tipos_precios` ON `tbl_tipos_precios`.`id_tipo_precio` = `tbl_precios_productos`.`int_tipo_precio`
 

CREATE VIEW `vw_orden_prods_precio` AS
SELECT 
`tbl_ordenes`.`id_orden_id` as 'Orden',
`tbl_prods_x_orden`.`id_prod_x_orden` as 'IDPO',
`tbl_productos`.`chr_nombre_prod` as 'Producto',
`tbl_productos`.`id_producto` as 'IDPR',
`tbl_prods_x_orden`.`int_cantidad` as 'Cantidad', 
`tbl_precios_productos`.`dbl_precio` as 'Precio',
`tbl_consecutivo`.`chr_consecutivo` as 'OrdenNR'
FROM `tbl_ordenes`
 LEFT JOIN `db_tacos_roy`.`tbl_prods_x_orden` ON `tbl_ordenes`.`id_orden_id` = `tbl_prods_x_orden`.`int_orden_id` 
 LEFT JOIN `db_tacos_roy`.`tbl_productos` ON `tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`
 LEFT JOIN `db_tacos_roy`.`tbl_precios_productos` on `tbl_precios_productos`.`id_producto` = `tbl_productos`.`id_producto`
 LEFT JOIN `db_tacos_roy`.`tbl_consecutivo` on `tbl_ordenes`.`int_consecutivo` = `tbl_consecutivo`.`id_consecutivo`

Create view `vw_inventarios_fecha` as SELECT 
`tbl_inventario`.`id_inventario_id` as 'InvID', 
`tbl_insumos`.`chr_nombre_insumo` as 'Insumo', 
`tbl_inventario`.`int_cantidad` as 'Cantidad', 
`tbl_inventario`.`dt_fecha_insumo` as 'Fecha'
FROM `db_tacos_roy`.`tbl_inventario`
LEFT JOIN `db_tacos_roy`.`tbl_insumos` ON `tbl_inventario`.`id_insumo_id` = `tbl_insumos`.`id_insumo`

CREATE VIEW `vw_variantes_x_categoria` AS 
SELECT 
`tbl_variantes_categorias`.`id_variante_categoria` as 'ID',
`tbl_variantes_categorias`.`id_catgoria` as 'IDCAT', 
`tbl_categorias`.`chr_nombre_cat` as 'Categoria',
`tbl_variantes_platillos`.`id_variante_pl` as 'IDVAR',
`tbl_variantes_platillos`.`chr_variante_nombre` as 'Variante'
FROM `db_tacos_roy`.`tbl_variantes_categorias`     
LEFT JOIN `db_tacos_roy`.`tbl_categorias` ON `tbl_variantes_categorias`.`id_catgoria` = `tbl_categorias`.`id_categoria` 
LEFT JOIN `db_tacos_roy`.`tbl_variantes_platillos` ON `tbl_variantes_platillos`.`id_variante_pl` = `tbl_variantes_categorias`.`id_variante_platillo`  

CREATE VIEW `vw_opciones_platillos_ticket` AS
SELECT
`tbl_prods_orden_opciones`.`id_prod_orden_opcion` as 'ID',
`tbl_prods_orden_opciones`.`id_prod_x_orden` as 'IDPO', 
`tbl_variantes_platillos`.`chr_imprimir` AS 'TxtTicket'
FROM `tbl_prods_orden_opciones` 
LEFT JOIN `db_tacos_roy`.`tbl_variantes_platillos` ON `tbl_prods_orden_opciones`.`id_variante_platillo` = `tbl_variantes_platillos`.`id_variante_pl`

CREATE VIEW `vw_insumos_usados_x_orden` AS
SELECT 
`tbl_ordenes_cerradas`.`id_orden_cerrada` as 'OrdenID',
`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden` as 'HoraFecha',
`tbl_insumos`.`id_insumo` as 'InsumoID',
`tbl_insumos`.`chr_nombre_insumo` as 'Insumo', 
 `tbl_prods_x_orden`.`int_cantidad` * `tbl_insumos_x_platillo`.`int_cantidad` as 'Usado' 
FROM `tbl_ordenes_cerradas` 
LEFT JOIN `tbl_prods_x_orden` on `tbl_prods_x_orden`.`int_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`
LEFT JOIN `tbl_productos` on `tbl_prods_x_orden`.`int_producto_id` = `tbl_productos`.`id_producto`
LEFT JOIN `tbl_insumos_x_platillo` on `tbl_insumos_x_platillo`.`id_producto` = `tbl_productos`.`id_producto`  
LEFT JOIN `tbl_insumos` on `tbl_insumos`.`id_insumo` = `tbl_insumos_x_platillo`.`id_insumo`

CREATE VIEW `vw_info_ordenes_tickets` AS
SELECT 
`tbl_ordenes`.`id_orden_id`, 
`tbl_ordenes_cerradas`.`id_orden_cerrada`, 
`tbl_ordenes_cerradas`.`dt_horafecha_cierre_orden`, 
`tbl_consecutivo`.`chr_consecutivo`, 
`tbl_ticket_cons`.`chr_ticketConsecutivo`, 
`tbl_ordenes_cerradas`.`int_lvl_report`,
`tbl_ordenes`.`chr_status_orden`
FROM `tbl_ordenes`
LEFT JOIN `tbl_ordenes_cerradas` ON `tbl_ordenes`.`id_orden_id` = `tbl_ordenes_cerradas`.`id_orden_id`  
LEFT JOIN `tbl_consecutivo` on `tbl_ordenes`.`int_consecutivo` = `tbl_consecutivo`.`id_consecutivo`
LEFT JOIN `tbl_ticket_cons` on `tbl_ticket_cons`.`id_ticketNrConsecutivo` = `tbl_ordenes_cerradas`.`id_ticket_IDNr` 





/*
PRIVATE MyLabel AS Label
...
MyLabel = NEW Label(MyForm)
MyLabel.Move(10, 10, 120, 30)
MyLabel.Text = "Hello"
...

If you want event handlers, do that:

MyLabel = NEW Label(MyForm) AS "MyLabel"
...
PUBLIC SUB MyLabel_Click()
...
END
*/
