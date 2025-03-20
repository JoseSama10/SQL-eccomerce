-- 10 Consultas con JOIN
-- 1 Obtener el nombre de los usuarios junto con sus direcciones de envío 
-- Requisito: RF-31 RF-37 (Consultar Pedidos Y Consultar usuario)
SELECT Usuario.nombre, DireccionEnvio.direccion 
FROM Usuario 
JOIN DireccionEnvio ON Usuario.id = DireccionEnvio.id_usuario;

-- 2. Listar los productos junto con sus categorías 
-- Requisito: RF-02 y RF-07 (Gestión de Productos y Categorías)
SELECT Productos.nombre, Categorias.nombre AS categoria 
FROM Productos 
JOIN Categorias ON Productos.categoria_id = Categorias.id;

-- 3. Obtener los pedidos junto con los nombres de los usuarios 
-- Requisito: RF-31 RF-37 (Consultar Pedidos Y Consultar Usuario)
SELECT Pedidos.id, Usuario.nombre 
FROM Pedidos 
JOIN Usuario ON Pedidos.id_usuario = Usuario.id;

-- 4. Listar los detalles de pedidos junto con los nombres de los productos 
-- Requisito: RF-02 y RF-31 (Consultar Pedidos y Gestionar Productos)
SELECT DetallesPedido.id, Productos.nombre, DetallesPedido.cantidad 
FROM DetallesPedido 
JOIN Productos ON DetallesPedido.id_producto = Productos.id;

-- 5. Obtener los pagos junto con los tipos de medios de pago utilizados 
-- Requisito: RF-24 (Gestión de Compras)
SELECT Pagos.id, MedioPago.tipo_pago 
FROM Pagos 
JOIN MedioPago ON Pagos.id_medio_pago = MedioPago.id;

-- 6. Listar los productos con su respectivo stock en inventario 
-- Requisito: RF-02 (Gestión Productos)
SELECT Productos.nombre, Inventario.cantidad_disponible 
FROM Productos 
JOIN Inventario ON Productos.id = Inventario.id_producto;

-- 7. Mostrar los pedidos junto con los métodos de envío utilizados 
-- Requisito: RF-24 (Gestionar Compras)
SELECT Pedidos.id, MetodoEnvio.nombre 
FROM Pedidos 
JOIN MetodoEnvio ON Pedidos.id = MetodoEnvio.id;

-- 8. Obtener el historial de cambios de precio junto con los nombres de los productos 
-- Requisito: RF-24 (Gestionar Compras)
SELECT HistorialPrecios.id, Productos.nombre, HistorialPrecios.precio_nuevo 
FROM HistorialPrecios 
JOIN Productos ON HistorialPrecios.id_producto = Productos.id;

-- 9. Listar las facturas junto con los nombres de los clientes 
-- Requisito: RF-24 (Gestiónr de Compras)
SELECT Factura.numero_factura, Usuario.nombre 
FROM Factura 
JOIN Pedidos ON Factura.id_pedido = Pedidos.id 
JOIN Usuario ON Pedidos.id_usuario = Usuario.id;

-- 10. Mostrar las subcategorías junto con las categorías a las que pertenecen 
-- Requisito: RF-7 RF-18 (Gestión de Categorías y Subcategorías)
SELECT SubCategorias.nombre AS subcategoria, Categorias.nombre AS categoria 
FROM SubCategorias 
JOIN Categorias ON SubCategorias.categoria_id = Categorias.id;