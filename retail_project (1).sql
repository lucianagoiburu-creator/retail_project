CREATE DATABASE retail_project;

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    edad INT CHECK (edad >= 18),
    fecha_registro DATE NOT NULL
);

CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha_venta TIMESTAMP NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

BEGIN;

INSERT INTO clientes (nombre, email, edad, fecha_registro)
VALUES
('Juan Perez', 'juan@gmail.com', 30, '2025-01-10'),
('Maria Lopez', 'maria@gmail.com', 25, '2025-01-15'),
('Carlos Gomez', 'carlos@gmail.com', 40, '2025-02-01'),
('Ana Torres', 'ana@gmail.com', 22, '2025-02-10'),
('Lucia Fernandez', 'lucia@gmail.com', 35, '2025-03-01');

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES
('Notebook Lenovo', 'Tecnologia', 220000.00, 10),
('Mouse Logitech', 'Tecnologia', 45000.00, 50),
('Teclado Redragon', 'Tecnologia', 35000.00, 30),
('Monitor Samsung', 'Tecnologia', 150000.00, 15),
('Silla Gamer', 'Muebles', 250000.00, 8);

INSERT INTO ventas (id_cliente, id_producto, cantidad, fecha_venta)
VALUES
(1, 1, 1, '2026-04-21 10:00:00'),
(2, 2, 2, '2025-06-12 15:23:00'),
(3, 3, 1, '2025-03-06 12:45:00'),
(4, 4, 1, '2025-06-14 09:00:00'),
(5, 5, 2, '2025-07-28 18:05:00');

SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;

COMMIT;

UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Tecnologia';

DELETE FROM ventas
WHERE id_venta = 5;

SELECT * FROM ventas 