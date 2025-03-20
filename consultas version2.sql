/*consultas*/
/*mostrar los productos, descripciones, precio, cantidad y categoria*/
SELECT 
    p.nombre AS producto,
    p.descripcion AS descripcion,
    p.precio,
    p.stock AS cantidad,
    c.nombre_categoria AS categoria
FROM producto p
JOIN categoria c ON p.categoria_id = c.id_categoria;
/*mostrar las personas registradas*/

SELECT nombre_cliente AS nombre FROM usuario ;
/*mostrar todos los datos de los clientes*/

SELECT nombre_cliente AS nombre, contrasena AS contraseña, contrasena_encriptada AS contraseñaencriptada, direccion AS direccion 
FROM usuario 
WHERE rol = 'normal';

/*mostrar detalles de la orden*/
SELECT 
    p.nombre AS nombreproducto, 
    p.precio, 
    p.stock AS Stock 
FROM producto p
JOIN detalles_factura df ON p.id_producto = df.id_producto;
/*seleccionar el nombre de producto, tipo de descuento, valor de descuento, precio, estado descuento*/
SELECT
    p.nombre AS nombreproducto,
    d.tipo_descuento AS tipo,
    d.porcentaje AS descuento,
    p.precio AS precioProducto,
    d.estado_descuento AS estado
FROM producto p
JOIN descuento d ON p.id_producto = d.id_producto;


/*mostrar las categorias y subcategorias de los productos*/

SELECT
categoria.nombre_categoria AS categoria,
subcategoria.nombre_subcategoria AS subcategoria
FROM categoria 
JOIN subcategoria ON  categoria.id_categoria = subcategoria.id_subcategoria;


/*mostrar los usuarios que son adminproductoproductodescuentoistradores*/
SELECT
usuario.nombre_cliente as nombre from usuario 
WHERE rol = 'admin';
/* mostrar el nombre del producto, el tipo de descuento aplicado y el valor del descuento en un rango de 10.00 y 20.000 */
SELECT  
producto.nombre AS nombredeproducto, 
descuento.tipo_descuento AS tipodedescuento,
descuento.porcentaje AS porcentaje
FROM producto
JOIN descuento ON producto.id_producto = descuento.id_descuento
WHERE descuento.porcentaje >= 10.00 and descuento.porcentaje <= 20.00;
/* mostrar el nombre del producto, el tipo de descuento aplicado y el valor del descuento para los productos cuyo porcentaje sea 10.00 0 20.00*/

SELECT  
producto.nombre AS nombredeproducto, 
descuento.tipo_descuento AS tipodedescuento,
descuento.porcentaje AS porcentaje
FROM producto
JOIN descuento ON producto.id_producto = descuento.id_descuento
WHERE descuento.porcentaje = 10.00 or descuento.porcentaje = 20.00;
 

-- Seleccionar todos los productos con sus categorías y subcategorías (si las tienen)
SELECT 
    producto.id_producto,
    producto.nombre AS nombre_producto,
    categoria.nombre_categoria,
    subcategoria.nombre_subcategoria
FROM 
    producto
LEFT JOIN 
    categoria ON producto.categoria_id = categoria.id_categoria
LEFT JOIN 
    subcategoria ON categoria.id_categoria = subcategoria.categoria_id;
 
 
-- Obtener la cantidad de facturas de cada usuario--
 SELECT nombre_cliente, 
       (SELECT COUNT(*) FROM factura f WHERE f.id_usuario = u.id_usuario) AS total_facturas
FROM usuario u;

--  Obtener el total de ventas por producto --
SELECT p.nombre, 
       (SELECT SUM(df.cantidad) FROM detalles_factura df WHERE df.id_producto = p.id_producto) AS total_vendido
FROM producto p;

 -- Obtener los productos que han sido vendidos al menos una vez --
SELECT p.nombre 
FROM producto p 
WHERE EXISTS (SELECT 1 FROM detalles_factura df WHERE df.id_producto = p.id_producto);
-- Consultar la cantidad de productos por categoría --
 SELECT c.nombre_categoria, 
       (SELECT COUNT(*) FROM producto p WHERE p.categoria_id = c.id_categoria) AS cantidad_productos
FROM categoria c;

 -- Obtener el total recaudado por cada usuario --
SELECT u.nombre_cliente, 
       (SELECT SUM(df.subtotal) 
        FROM factura f 
        JOIN detalles_factura df ON f.id_factura = df.id_factura 
        WHERE f.id_usuario = u.id_usuario) AS total_gastado
FROM usuario u;
-- obtener el descuento aplicado a un producto específico -- 

SELECT p.nombre, 
       (SELECT d.porcentaje FROM descuento d WHERE d.id_producto = p.id_producto AND d.estado_descuento = 'Activo') AS descuento_aplicado
FROM producto p;
 -- Listar las categorías que tienen al menos una subcategoría asociada --
SELECT c.nombre_categoria
FROM categoria c
WHERE EXISTS (SELECT 1 FROM subcategoria s WHERE s.categoria_id = c.id_categoria);
-- Listar los productos con su respectivo descuento activo --

SELECT p.nombre AS producto, d.porcentaje AS descuento  
FROM (  
    SELECT id_producto, porcentaje  
    FROM descuento  
    WHERE estado_descuento = 'Activo'  
) AS d  
JOIN producto p ON p.id_producto = d.id_producto;
-- Obtener el último producto agregado en cada categoría --
SELECT c.nombre_categoria, ultimo_producto.nombre AS producto_reciente, ultimo_producto.fecha_creacion  
FROM (  
    SELECT p.nombre, p.fecha_creacion, p.categoria_id  
    FROM producto p  
    WHERE p.fecha_creacion = (  
        SELECT MAX(fecha_creacion) FROM producto WHERE categoria_id = p.categoria_id  
    )  
) AS ultimo_producto  
JOIN categoria c ON c.id_categoria = ultimo_producto.categoria_id;

-- Obtener los clientes que han gastado más de 500 en compras--

SELECT u.nombre_cliente, gastos.total_gastado  
FROM (  
    SELECT f.id_usuario, SUM(df.subtotal) AS total_gastado  
    FROM factura f  
    JOIN detalles_factura df ON f.id_factura = df.id_factura  
    GROUP BY f.id_usuario  
    HAVING SUM(df.subtotal) > 500  
) AS gastos  
JOIN usuario u ON u.id_usuario = gastos.id_usuario;
