--  Productos con descuentos mayores al 10% en la categoría "Computadoras" --
SELECT nombre 
FROM producto 
WHERE id_producto IN (
    SELECT id_producto 
    FROM descuento 
    WHERE porcentaje > 10 
    AND tipo_descuento = 'Producto'
) 
AND id_categoria=(
    SELECT id_categoria 
    FROM categoria 
    WHERE nombre_categoria = 'Computadoras'
);

SELECT nombre 
FROM producto 
WHERE id_producto IN (
    SELECT id_producto 
    FROM detalles_factura 
    WHERE id_factura IN (
        SELECT id_factura 
        FROM factura 
        WHERE MONTH(fecha_factura) = 6 
        AND YEAR(fecha_factura) = 2025
    )
);
 -- Clientes con compras pendientes --  
SELECT nombre_cliente 
FROM usuario 
WHERE id_usuario IN (
    SELECT id_usuario 
    FROM factura 
    WHERE estado = 'pendiente'
);
-- Consultar productos disponibles --

SELECT p.nombre, p.descripcion, p.precio, 
    (SELECT c.nombre_categoria FROM categoria c WHERE c.id_categoria = p.id_categoria) AS categoria
FROM producto p 
WHERE p.stock > 0;
-- Obtener el rol de un usuario basado en su nombre y contraseña encriptada. --
SELECT rol 
FROM usuario 
WHERE nombre_cliente = 'Juan Pérez' AND contrasena_encriptada = 'hashed1234';


 -- Listar los clientes que tienen compras canceladas --

SELECT DISTINCT u.nombre_cliente
FROM usuario u
WHERE u.id_usuario IN (SELECT f.id_usuario FROM factura f WHERE f.estado = 'cancelada');


-- subconsulta que traer los productos con la categoria computadoras --
SELECT nombre, descripcion, precio, stock 
FROM producto 
WHERE id_categoria = (
    SELECT id_categoria FROM categoria WHERE nombre_categoria = 'Computadoras'
);
-- Obtener los productos comprados por un usuario específico --
SELECT p.nombre 
FROM producto p
WHERE p.id_producto IN (
    SELECT df.id_producto 
    FROM detalles_factura df
    WHERE df.id_factura IN (
        SELECT f.id_factura 
        FROM factura f
        WHERE f.id_usuario = (
            SELECT u.id_usuario
            FROM usuario u
            WHERE u.nombre_cliente = 'María López'
        )
    )
);
 -- Obtener los clientes que han gastado más de $1000 en compras--
SELECT u.nombre_cliente
FROM usuario u
WHERE u.id_usuario IN (
    SELECT f.id_usuario
    FROM factura f
    WHERE f.id_factura IN (
        SELECT df.id_factura
        FROM detalles_factura df
        GROUP BY df.id_factura
        HAVING SUM(df.subtotal) > 1000
    )
);
 -- obtener los productos que pertenecen a una subcategoría específica --
SELECT nombre, descripcion, precio, stock 
FROM producto 
WHERE id_categoria = (
    SELECT id_categoria FROM subcategoria WHERE nombre_subcategoria = 'Laptops'
);