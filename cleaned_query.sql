SELECT p.id_producto, p.chr_nombre_prod, c.chr_nombre_cat, p.id_categoria, c.fl_orden as CatOrd, p.fl_ordenar, p.int_activo
FROM tbl_productos p
RIGHT JOIN tbl_categorias c ON p.id_categoria = c.id_categoria
WHERE p.int_activo = 1
ORDER BY c.fl_orden, p.fl_ordenar ASC
