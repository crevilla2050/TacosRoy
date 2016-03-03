create view `vw_categorias` as
SELECT  `tbl_categorias`.`chr_nombre_cat` ,  `tbl_subcategorias`.`chr_nom_subcat` ,  `tbl_subcategorias`.`id_subcategoria` 
FROM  `tbl_subcategorias` 
RIGHT JOIN  `db_tacos_roy`.`tbl_categorias` ON  `tbl_subcategorias`.`id_cat_padre` =  `tbl_categorias`.`id_categoria` 
LIMIT 0 , 30

CREATE VIEW  `vw_datos_usuarios` AS SELECT  
`tbl_usuarios`.`id_usuario` AS 					  'ID', 
`tbl_usuarios`.`chr_nombre_usuario` AS 	  'Nombre',  
`tbl_usuarios`.`chr_login` AS  					  'Login', 
`tbl_usuarios`.`chr_password` AS  			  'Contraseña',  
`tbl_usuarios`.`chr_telefono_usuario` AS  'Teléfono', 
`tbl_usuarios`.`chr_email_usuario` AS  		'Email',
`tbl_usuarios`.`bit_activo` AS  					'Activo',
`tbl_status`.`chr_status` AS  						'Tipo'
FROM  `tbl_usuarios` 
LEFT JOIN  `db_tacos_roy`.`tbl_status` ON  `tbl_usuarios`.`int_status` =  `tbl_status`.`id_status`
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
