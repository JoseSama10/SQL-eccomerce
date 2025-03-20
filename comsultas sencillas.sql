-- Elimina el usuario y las facturas asociadas a el --

Delete FROM usuario where id_usuario =10;
-- visualizar los nombres de las personas registradas en el ecommerce --
select nombre_cliente from usuario;
-- actualizar la direccion de un usuario--
UPDATE usuario  SET direccion = 'calle 98' where id_usuario = 8;

-- actualizar el stock de un producto --
UPDATE producto SET stock = stock - 1 where id_producto = 9;

-- añadir un nuevo producto--
INSERT INTO producto (nombre, descripcion, precio, stock, id_categoria, fecha_creacion) VALUES
('coleer memo dl06 ', 'disipador para telefono inteligente', 50.00, 11, 8, '2025-04-14');

-- consultar categoria en especifico --
select nombre_categoria AS categoria from categoria WHERE  nombre_categoria = 'Monitores';

-- visualizar el estado del pago de un producto y sus datos--
select * from factura where estado = 'pagada';

-- counsultar los datos de una compra realizada en un mes en especifico --
SELECT * FROM factura WHERE fecha_factura = '2025-03-07';
-- contar el numero de usuarios  normales registrados en el ecommerce --
SELECT COUNT(*) AS NumeroClientes FROM usuario WHERE rol = 'normal';
-- buscar los productos con un precio mayor o igual a un precio--
SELECT nombre AS producto , precio from producto where precio >= 89.99;


