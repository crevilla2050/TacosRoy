-- Creating a view to show products and their related categories
CREATE VIEW vw_productos_categorias AS
SELECT 
    p.id_producto,
    p.chr_nombre_prod,
    c.chr_nombre_cat,
    p.int_activo
FROM 
    tbl_productos p
JOIN 
    tbl_categorias c ON p.id_categoria = c.id_categoria;
