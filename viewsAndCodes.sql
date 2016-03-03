create view `vw_categorias` as
SELECT  `tbl_categorias`.`chr_nombre_cat` ,  `tbl_subcategorias`.`chr_nom_subcat` ,  `tbl_subcategorias`.`id_subcategoria` 
FROM  `tbl_subcategorias` 
RIGHT JOIN  `db_tacos_roy`.`tbl_categorias` ON  `tbl_subcategorias`.`id_cat_padre` =  `tbl_categorias`.`id_categoria` 
LIMIT 0 , 30

create view `vw_usuarios_datos` as
SELECT `tbl_usuarios`.*, `tbl_status`.`chr_status`
FROM `tbl_usuarios`
 LEFT JOIN `db_tacos_roy`.`tbl_status` ON `tbl_usuarios`.`int_status` = `tbl_status`.`id_status` 

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
