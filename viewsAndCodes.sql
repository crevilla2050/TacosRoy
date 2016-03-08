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

Create view `vw_precios_productos` AS
SELECT  
`tbl_productos`.`id_producto` as 'ID', 
`tbl_productos`.`chr_nombre_prod` AS 'Producto',
`tbl_productos`.
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
