/*mostrar detalles de la orden*/
SELECT 
    p.nombre AS nombreproducto, 
    p.precio, 
    p.stock AS Stock 
FROM producto p
JOIN detalles_factura df ON p.id_producto = df.id_producto;
-- Listar todos los usuarios y sus facturas (incluso si no han comprado nada) -- 
SELECT usuario.nombre_cliente, factura.id_factura, factura.estado 
FROM usuario
LEFT JOIN factura ON usuario.id_usuario = factura.id_usuario;
SELECT p.nombre AS producto, d.porcentaje AS descuento  
FROM (  
    SELECT id_producto, porcentaje  
    FROM descuento  
    WHERE estado_descuento = 'Activo'  
) AS d  
JOIN producto p ON p.id_producto = d.id_producto;
-- Seleccionar todos los productos con sus categorías y subcategorías (si las tienen)
SELECT 
    producto.id_producto,
    producto.nombre AS nombre_producto,
    categoria.nombre_categoria,
    subcategoria.nombre_subcategoria
FROM 
    producto
LEFT JOIN 
    categoria ON producto.id_categoria = categoria.id_categoria
LEFT JOIN 
    subcategoria ON categoria.id_categoria = subcategoria.id_categoria;
  /* mostrar el nombre del producto, el tipo de descuento aplicado y el valor del descuento */

SELECT  
producto.nombre AS nombredeproducto, 
descuento.tipo_descuento AS tipodedescuento,
descuento.porcentaje AS porcentaje
FROM producto
JOIN descuento ON producto.id_producto = descuento.id_descuento;

   /*mostrar los productos, descripciones, precio, cantidad y categoria*/
SELECT 
    p.nombre AS producto,
    p.descripcion AS descripcion,
    p.precio,
    p.stock AS cantidad,
    c.nombre_categoria AS categoria
FROM producto p
JOIN categoria c ON p.id_categoria = c.id_categoria;

-- Listar categorías y los productos asociados (incluyendo categorías sin productos)--
SELECT categoria.nombre_categoria, producto.nombre 
FROM categoria
LEFT JOIN producto ON categoria.id_categoria = producto.id_categoria;
-- Listar productos y la cantidad total vendida (incluyendo productos que no se han vendido)--
SELECT producto.nombre, SUM(detalles_factura.cantidad) AS total_vendido
FROM producto
LEFT JOIN detalles_factura ON producto.id_producto = detalles_factura.id_producto
GROUP BY producto.nombre;
-- Listar todas las categorías y los productos que pertenecen a ellas--
    SELECT categoria.nombre_categoria, producto.nombre 
FROM categoria
RIGHT JOIN producto ON categoria.id_categoria = producto.id_categoria;
-- Listar productos que han sido vendidos con su cantidad total --
SELECT producto.nombre, SUM(detalles_factura.cantidad) AS total_vendido
FROM producto
INNER JOIN detalles_factura ON producto.id_producto = detalles_factura.id_producto
GROUP BY producto.nombre;
-- Listar productos y su descuento aplicado (incluyendo productos sin descuento)-- 
SELECT producto.nombre, producto.precio, descuento.porcentaje 
FROM producto
LEFT JOIN descuento ON producto.id_producto = descuento.id_producto;