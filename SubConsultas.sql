Use ecommerce;

-- 1. Obtener el usuario que ha realizado más pedidos
-- Requisito: RF-31 (Consultar Pedidos) 
SELECT id, nombre 
FROM Usuario 
WHERE id = ( 
    SELECT id_usuario
    FROM Pedidos 
    GROUP BY id_usuario 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
);

-- 2. Mostrar el producto más vendido
-- Requisito: RF-02 (Gestiónar Productos)
SELECT nombre 
FROM Productos 
WHERE id = ( 
    SELECT id_producto
    FROM DetallesPedido 
    GROUP BY id_producto 
    ORDER BY SUM(cantidad) DESC 
    LIMIT 1 
);


-- 3. Obtener la categoría con más productos registrados
-- Requisito: RF-07 (Gestión de Categorías)
SELECT nombre 
FROM Categorias 
WHERE id = ( 
    SELECT categoria_id 
    FROM Productos 
    GROUP BY categoria_id 
    ORDER BY COUNT(*) DESC 
    LIMIT 1 
);

-- 4. Listar los descuentos activos con la mayor duración
-- Requisito: RF-23 (Consultar descuentos )
SELECT * 
FROM Descuento 
WHERE fecha_fin = ( 
    SELECT MAX(fecha_fin) 
    FROM Descuento 
);

-- 5. Obtener los pedidos cuyo total es mayor al promedio
-- Requisito: RF-31 (Consultar Pedidos)
SELECT * 
FROM Pedidos 
WHERE total > ( 
    SELECT AVG(total) 
    FROM Pedidos 
);

-- 6. Mostrar los métodos de pago más utilizados
-- Requisito: RF-24 (Gestionar Compras)
SELECT tipo_pago 
FROM MedioPago 
WHERE id = ( 
    SELECT id_medio_pago 
    FROM Pagos 
    GROUP BY id_medio_pago 
    ORDER BY COUNT(*) DESC 
    LIMIT 1 
);

-- 7. Mostrar las subcategorías con más productos
-- Requisito: RF-13 (Subcategorías)
SELECT nombre 
FROM SubCategorias 
WHERE id = ( 
    SELECT categoria_id 
    FROM Productos 
    GROUP BY categoria_id 
    ORDER BY COUNT(*) DESC 
    LIMIT 1 
);

-- 8. Obtener el número de productos en inventario con menos cantidad disponible
-- Requisito: RF-02 (Gestionar Productos)
SELECT cantidad_disponible 
FROM Inventario 
WHERE cantidad_disponible = ( 
    SELECT MIN(cantidad_disponible) 
    FROM Inventario 
);

-- 9. Obtener la factura con el mayor total facturado
-- Requisito: RF-24 (Gestionar Compras)
SELECT * 
FROM Factura 
WHERE total_facturado = ( 
    SELECT MAX(total_facturado) 
    FROM Factura 
);

-- 10. Mostrar el historial de precios de un producto específico con el cambio más reciente
-- Requisito: RF-24 (Gestionar Compras)
SELECT * 
FROM HistorialPrecios 
WHERE fecha_cambio = ( 
    SELECT MAX(fecha_cambio) 
    FROM HistorialPrecios 
    WHERE id_producto = 1 
);
