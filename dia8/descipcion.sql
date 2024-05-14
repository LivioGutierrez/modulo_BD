-- ● Paso 1: Creamos la tabla clientes create table clientes;
create table clientes (
    id integer unique not null, 
    name varchar(25) not null, 
    email varchar(50)
);

-- ● Paso 2: Insertamos al menos 3 registros, todos sin ingresar el campo email.
insert into clientes(id, name) values (1, 'Nombre 1');
insert into clientes(id, name) values (2, 'Nombre 2');
insert into clientes(id, name) values (3, 'Nombre 3');
insert into clientes(id, name, email) values (4, 'Nombre 4','a@aq.cl');

--● Paso 3: Modificamos el campo email a not null con alter table.
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

-- ● Paso 4: Debemos actualizar la tabla con el comando UPDATE, seguidamente debemos indicar la columna a modificar y por último con WHERE definir la condición cuando el campo sea nulo.
UPDATE clientes SET email = '' WHERE email IS NULL;

-- ● Paso 5: Modifica el campo email a not null con alter table
ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

-- ● Paso 6: En la tabla clientes del ejercicio anterior, crearemos un campo fecha. Para esto, modifica la tabla y asigna la restricción.
ALTER TABLE clientes ADD COLUMN fecha DATE NOT NULL;

-- ERROR:  la columna «fecha» de la relación «clientes» contiene valores null
ALTER TABLE clientes ADD COLUMN fecha DATE NOT NULL DEFAULT NOW();

-- COALESCE; (FUNCIONA PARA LOS NULL)
UPDATE clientes SET email = COALESCE(email, 'SIN EMAIL');

-- QUITAR UNA RESTRICCION 
ALTER TABLE IF EXISTS public.clientes ALTER COLUMN email DROP NOT NULL;