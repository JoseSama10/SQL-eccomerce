INSERT INTO usuario (nombre_cliente, contrasena, contrasena_encriptada, direccion, rol) VALUES
('Juan Pérez', '1234', 'hashed1234', 'Calle 1, Ciudad A', 'admin'),
('María López', '5678', 'hashed5678', 'Calle 2, Ciudad B', 'normal'),
('Carlos Gómez', 'abcd', 'hashedabcd', 'Calle 3, Ciudad C', 'normal'),
('Laura Torres', 'efgh', 'hashedefgh', 'Calle 4, Ciudad D', 'admin'),
('Pedro Sánchez', 'ijkl', 'hashedijkl', 'Calle 5, Ciudad E', 'normal'),
('Ana Ruiz', 'mnop', 'hashedmnop', 'Calle 6, Ciudad F', 'admin'),
('Roberto Díaz', 'qrst', 'hashedqrst', 'Calle 7, Ciudad G', 'normal'),
('Elena Fernández', 'uvwx', 'hasheduvwx', 'Calle 8, Ciudad H', 'normal'),
('Fernando Castro', 'yz12', 'hashedyz12', 'Calle 9, Ciudad I', 'admin');
INSERT INTO usuario (nombre_cliente, contrasena, contrasena_encriptada, direccion, rol) VALUES
('juan camilo', '3456', 'hashed3456', 'Calle 10, Ciudad J', 'normal');
SELECT * FROM usuario;
INSERT INTO factura (Metodo_pago, fecha_factura, estado, id_usuario) VALUES
('Tarjeta de Crédito', '2025-03-01', 'pagada', 1),
('PayPal', '2025-03-02', 'pendiente', 2),
('Transferencia Bancaria', '2025-03-03', 'cancelada', 3),
('Efectivo', '2025-03-04', 'pagada', 4),
('Tarjeta de Débito', '2025-03-05', 'pendiente', 5),
('PayPal', '2025-03-06', 'pagada', 6),
('Efectivo', '2025-03-07', 'cancelada', 7),
('Transferencia Bancaria', '2025-03-08', 'pendiente', 8),
('Tarjeta de Crédito', '2025-03-09', 'pagada', 9),
('Efectivo', '2025-03-10', 'cancelada', 10),
('Efectivo', '2025-06-10', 'cancelada', 10);
SELECT * FROM factura;
INSERT INTO categoria (nombre_categoria, descripcion_categoria) VALUES
('Computadoras', 'Equipos de cómputo y accesorios'),
('Periféricos', 'Dispositivos externos como teclados y ratones'),
('Componentes de Hardware', 'Partes internas de una PC'),
('Sillas Gamer', 'Sillas ergonómicas para gaming'),
('Accesorios', 'Fundas, soportes y cables para PC'),
('Software', 'Licencias de software y antivirus'),
('Redes', 'Equipos para conexión a Internet'),
('Impresoras', 'Dispositivos de impresión y escaneo'),
('Almacenamiento', 'Discos duros y unidades flash'),
('Monitores', 'Pantallas para computadoras de alta resolución');
SELECT * FROM categoria;
INSERT INTO subcategoria (nombre_subcategoria, descripcion_subcategoria, id_categoria) VALUES
('Laptops', 'Computadoras portátiles', 1),
('PCs de Escritorio', 'Computadoras de alto rendimiento', 1),
('Teclados', 'Teclados mecánicos y ergonómicos', 2),
('Ratones', 'Ratones ópticos y láser', 2),
('Memoria RAM', 'Módulos de memoria de alto rendimiento', 3),
('Procesadores', 'CPUs de última generación', 3),
('Sillas ergonómicas', 'Sillas con ajuste lumbar y reclinables', 4),
('Cables HDMI', 'Cables para transmisión de video', 5),
('Antivirus', 'Software de seguridad informática', 6),
('Routers WiFi', 'Dispositivos de conexión inalámbrica', 7);
SELECT * FROM subcategoria;
INSERT INTO producto (nombre, descripcion, precio, stock, id_categoria, fecha_creacion) VALUES
('Laptop HP Envy', 'Ultrabook con pantalla táctil', 1199.99, 15, 1, '2025-03-05'),
('PC Gamer Alienware', 'Computadora con RTX 4080', 2999.99, 8, 1, '2025-03-06'),
('Teclado Mecánico Razer', 'Teclado RGB con switches ópticos', 149.99, 25, 2, '2025-03-07'),
('Mouse Logitech G502', 'Ratón gaming de alta precisión', 89.99, 40, 2, '2025-03-08'),
('Memoria RAM Kingston 32GB', 'DDR5 para alto rendimiento', 199.99, 30, 3, '2025-03-09'),
('Procesador AMD Ryzen 9', 'CPU de alto rendimiento', 499.99, 10, 3, '2025-03-10'),
('Silla Gamer Corsair', 'Silla ergonómica con ajuste lumbar', 249.99, 20, 4, '2025-03-11'),
('Cable HDMI 2.1', 'Cable de ultra alta velocidad', 29.99, 50, 5, '2025-03-12'),
('Antivirus Norton', 'Protección completa para PC', 79.99, 35, 6, '2025-03-13'),
('Router TP-Link AX6000', 'WiFi 6 para conexiones rápidas', 179.99, 15, 7, '2025-03-14');
 SELECT * FROM producto;
INSERT INTO detalles_factura (cantidad, subtotal, id_factura, id_producto) VALUES
(1, 1199.99, 1, 1),
(1, 2999.99, 2, 2),
(2, 299.98, 3, 3),
(1, 89.99, 4, 4),
(2, 399.98, 5, 5),
(1, 499.99, 6, 6),
(1, 249.99, 7, 7),
(3, 89.97, 8, 8),
(1, 79.99, 9, 9),
(2, 359.98, 10, 10);
 SELECT * FROM detalles_factura;
INSERT INTO descuento (tipo_descuento, porcentaje, estado_descuento, id_producto, id_categoria) VALUES
('Producto', 10.00, 'Activo', 1, NULL),
('Producto', 15.00, 'Activo', 2, NULL),
('Producto', 5.00, 'Activo', 3, NULL),
('Producto', 8.00, 'Activo', 4, NULL),
('Producto', 12.00, 'Activo', 5, NULL),
('Producto', 20.00, 'Activo', 6, NULL),
('Producto', 10.00, 'Activo', 7, NULL),
('Producto', 25.00, 'Activo', 8, NULL),
('Producto', 15.00, 'Activo', 9, NULL),
('Categoria', 10.00, 'Activo', NULL, 1);  

 SELECT * FROM descuento;
