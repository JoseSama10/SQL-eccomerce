create database Ecommerce character set utf8mb4 collate utf8mb4_unicode_ci;
use Ecommerce;
SELECT * FROM Pedidos;

-- 1
CREATE TABLE Usuario (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nombre VARCHAR(100) NOT NULL,
   correo VARCHAR(200) NOT NULL,
   password VARCHAR(255) NOT NULL,
   telefono varchar(100) NOT NULL,
   fecha_registro DATE NOT NULL,
   fecha_inicio DATE NOT NULL,
   direccion_ip VARCHAR(50) NOT NULL
);

-- 2
CREATE TABLE DireccionEnvio (
   id INT AUTO_INCREMENT PRIMARY KEY,
   id_usuario INT NOT NULL,
   direccion VARCHAR(200) NOT NULL,
   ciudad VARCHAR(100) NOT NULL,
   codigo_postal VARCHAR(20) NOT NULL,
   pais VARCHAR(100) NOT NULL,
   FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

-- 3
CREATE TABLE Categorias (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nombre VARCHAR(100) NOT NULL,
   descripcion TEXT NOT NULL,
   fecha_creacion DATE NOT NULL
);

-- 4
CREATE TABLE MedioPago (
   id INT AUTO_INCREMENT PRIMARY KEY,
   tipo_pago ENUM('Tarjeta de Crédito', 'PayPal', 'Transferencia Bancaria', 'Bitcoin', 'Efectivo') NOT NULL,
   estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo' NOT NULL
);

-- 5
CREATE TABLE Descuento (
   id INT AUTO_INCREMENT PRIMARY KEY,
   porcentaje_descuento DECIMAL(5,2) NOT NULL,
   fecha_inicio DATE NOT NULL,
   fecha_fin DATE NOT NULL,
   tipo_descuento VARCHAR(50) NOT NULL
);

-- 6
CREATE TABLE MetodoEnvio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    tiempo_estimado VARCHAR(50) NOT NULL
);


-- 7
CREATE TABLE SubCategorias (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nombre VARCHAR(100) NOT NULL,
   descripcion TEXT,
   categoria_id INT NOT NULL,
   fecha_creacion DATE NOT NULL,
   FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

-- 8
CREATE TABLE Productos (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nombre VARCHAR(100) NOT NULL,
   descripcion TEXT NOT NULL,
   precio DECIMAL(10,2) NOT NULL,
   stock INT NOT NULL,
   categoria_id INT NOT NULL,
   fecha_creacion DATE NOT NULL,
   FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

-- 9
CREATE TABLE Pedidos (
   id INT AUTO_INCREMENT PRIMARY KEY,
   id_usuario INT NOT NULL,
   fecha_pedido DATE NOT NULL,
   estado VARCHAR(50) NOT NULL,
   total DECIMAL(10,2) NOT NULL,
   FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

-- 10
CREATE TABLE DetallesPedido (
   id INT AUTO_INCREMENT PRIMARY KEY,
   id_pedido INT NOT NULL,
   id_producto INT NOT NULL,
   cantidad INT NOT NULL,
   precio_unitario DECIMAL(10,2) NOT NULL,
   descuento_aplicado DECIMAL(10,2) DEFAULT 0.00,
   subtotal DECIMAL(10,2) NOT NULL,
   FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
   FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

-- 11
CREATE TABLE Pagos (
   id INT AUTO_INCREMENT PRIMARY KEY,
   id_pedido INT NOT NULL,
   id_medio_pago INT NOT NULL,
   cantidad DECIMAL(10,2) NOT NULL,
   fecha_pago DATE NOT NULL,
   estado_pago ENUM('Completado', 'Pendiente', 'Fallido') NOT NULL,
   FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
   FOREIGN KEY (id_medio_pago) REFERENCES MedioPago(id)
);

-- 12
CREATE TABLE Inventario (
   id INT AUTO_INCREMENT PRIMARY KEY,
   id_producto INT NOT NULL,
   cantidad_disponible INT NOT NULL,
   fecha_actualizacion DATE NOT NULL,
   FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

-- 13
CREATE TABLE HistorialPrecios (
   id INT AUTO_INCREMENT PRIMARY KEY,
   id_producto INT NOT NULL,
   precio_antiguo DECIMAL(10,2) NOT NULL,
   precio_nuevo DECIMAL(10,2) NOT NULL,
   fecha_cambio DATE NOT NULL,
   motivo_cambio VARCHAR(255),
   FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

-- 14
CREATE TABLE Factura (
   id INT AUTO_INCREMENT PRIMARY KEY,
   id_pedido INT NOT NULL,
   numero_factura VARCHAR(50) NOT NULL,
   fecha_emision DATE NOT NULL,
   fecha_vencimiento DATE NOT NULL,
   monto_total DECIMAL(10,2) NOT NULL,
   impuesto DECIMAL(10,2) NOT NULL,
   descuento DECIMAL(10,2),
   total_facturado DECIMAL(10,2) NOT NULL,
   estado_factura VARCHAR(50) NOT NULL,
   FOREIGN KEY (id_pedido) REFERENCES Pedidos(id)
);









