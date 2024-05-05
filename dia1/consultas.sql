-- Lo primero a realizar es concetarse a la base de datos


--Paso 1: Accedemos al cliente de postgresql via el terminal.
--> comando para conectarse psql -U postgres, postgres es el usuario

-- Paso 2: Crea una base de datos llamada prueba1.
CREATE DATABASE prueba1;

--Paso 3: Lista las bases de datos creadas.(comando de postgres va sin ";" ")
\l

--Paso 4: Conéctate a la base de datos. (comando de postgres va sin ";" ")
\c prueba1

--Paso5: salir de la base de datos
\q

--CREACION DE UNA TABLA

--VARCHAR -> STRING
create table clientes(
    nombre varchar(30),
    apellido varchar(30)
);

-- LISTAR LAS TABLAS DE UNA BADE DE DATO
\d

-- DESCRIBE UNA TABLA
\d clientes
\d+ clientes
-- INSTERTAR VALORES EN UNA TABLA
insert into clientes (nombre, apellido) values ('Livio','Gutierrez');
insert into clientes (nombre, apellido) values ('Sofia','Guzman');
insert into clientes values ('Alex','Guzman');
insert into clientes (apellido,nombre) values ('Guzman','pedro');

-- TRABAJO
insert into clientes (apellido,nombre) values ('Guzman','Sandra');
insert into clientes (apellido,nombre) values ('Guzman','Juan');
insert into clientes (apellido,nombre) values ('Guzman','Oscar');
insert into clientes (apellido,nombre) values ('Guzman','Fernanda');
insert into clientes (apellido,nombre) values ('Guzman','Cristian');

-- CONSULTAR REGISTROS EN UNA TABLA
SELECT * FROM clientes;

-- CONSULTAR REGISTROS EN UNA TABLA
select * from clientes order by nombre desc;

