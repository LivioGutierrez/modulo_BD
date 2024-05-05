-- Creación de la tabla 'productos'
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2)
    -- Otros campos según tus necesidades
);

-- Inserción de datos en la tabla 'productos'
INSERT INTO productos (id_producto, nombre, precio)
VALUES
    (1, 'Producto A', 20.99),
    (2, 'Producto B', 15.50),
    (3, 'Producto C', 25.75),
    (4, 'Producto D', 18.50),
    (5, 'Producto E', 30.25),
    (6, 'Producto F', 12.75),
    (7, 'Producto G', 22.99),
    (8, 'Producto H', 15.00),
    (9, 'Producto I', 28.50),
    (10, 'Producto J', 19.99),
    (11, 'Producto K', 10.50),
    (12, 'Producto L', 24.75),
    (13, 'Producto M', 16.50);

-- Creación de la tabla 'pedidos_detalle'
CREATE TABLE pedidos_detalle (
    id_pedido_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT
    -- Otros campos según tus necesidades
);

-- Inserción de datos en la tabla 'pedidos_detalle'
INSERT INTO pedidos_detalle (id_pedido_detalle, id_pedido, id_producto, cantidad)
VALUES
    (1, 101, 1, 3),
    (2, 101, 2, 2),
    (3, 102, 1, 1),
    (4, 103, 3, 4),
    (5, 104, 4, 2),
    (6, 104, 5, 1),
    (7, 105, 6, 3),
    (8, 105, 7, 2),
    (9, 106, 8, 1),
    (10, 107, 9, 4),
    (11, 107, 10, 2),
    (12, 108, 11, 3),
    (13, 109, 12, 2),
    (14, 110, 13, 1);

-- SUB CONSULTAS
SELECT * FROM productos;
SELECT * FROM pedidos_detalle;

--Obtener todos los productos que el precio este sobre el precio promedio
SELECT AVG(precio)FROM productos;--20.1515384615384615

SELECT * FROM productos WHERE precio > 20.1515384615384615;-- promedio no interactivo

SELECT * FROM productos WHERE precio >(SELECT AVG(precio)FROM productos);--promedio interactivo

--PAG 18 DIA 2 PPT 2
--SELECT AVG(total_venta) as promedio_ventas;
--FROM (SELECT empleado_id, SUM(monto) as total_ventaFROM ventasGROUP BY empleado_id);

--Encontrar los productos que se han vendido mas de una vez
SELECT * FROM productos;
SELECT id_producto, COUNT(id_producto) from pedidos_detalle GROUP BY id_producto;


--FUE MERA CASUALIDAD QUE SALIERA EL RESULTADO XD
-- SELECT id_producto, COUNT(id_producto) as cantidad
-- from pedidos_detalle 
-- WHERE id_producto < 2 
-- GROUP BY id_producto;

select id_producto, count(id_producto) as cantidad
from pedidos_detalle 
where cantidad > 1
group by id_producto;

select * from productos
where id_producto IN (select id_producto
from (
    select id_producto, count(id_producto) as cant
    from pedidos_detalle 
    group by id_producto
) as temporal
where cant > 1);

select*
from productos
where id_producto IN (20,1,55,3);