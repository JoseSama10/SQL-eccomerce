USE ecommerce;

-- 10 Consultas Sencillas
-- 1. Mostrar todos los productos  
-- Requisito: RF-02 (Gestión de Productos)  
SELECT * FROM productos;

-- 2. Listar todas las categorías  
-- Requisito: RF-03 (Gestión de Categorías)  
SELECT * FROM categorias;

-- 3. Obtener los nombres y correos de los usuarios registrados  
-- Requisito: RF-01 (Inicio de Sesión)  
SELECT nombre, correo FROM usuario;

-- 4. Mostrar los productos con su precio  
-- Requisito: RF-02 (Gestión de Productos)  
SELECT nombre, precio FROM productos;

-- 5. Contar la cantidad total de productos en la base de datos  
-- Requisito: RF-02 (Gestión de Productos)  
SELECT COUNT(*) total_productos FROM productos;

-- 6. Listar los pedidos realizados  
-- Requisito: RF-31 (Consultar pedidos)  
SELECT * FROM Pedidos;

-- 7. Obtener los detalles de un pedido específico (ejemplo ID orden = 1)  
-- Requisito: RF-31 (Consultar Pedidos)  
SELECT * FROM DetallesPedido WHERE id = 4;

-- 8. Mostrar los nombres de los productos ordenados alfabéticamente  
-- Requisito: RF-02 (Gestión de Productos)  
SELECT nombre FROM productos ORDER BY nombre ASC;

-- 9. Obtener la cantidad total de usuarios registrados  
-- Requisito: RF-01 (Inicio de Sesión)  
SELECT COUNT(*) total_usuarios FROM usuario;

-- 10. Mostrar los pedidos ordenados del más reciente al más antiguo  
-- Requisito: RF-31 (Consultar Pedidos)  
SELECT * FROM pedidos ORDER BY fecha_pedido DESC;


