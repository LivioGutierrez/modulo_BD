-- DQL: Lenguaje de consulta de datos: SELECT
-- DML: Lenguaje de Manipulacion de datos: INSERT; UPDATE; DELETE
-- DDL:
-- DCL

-- ● Paso 1: Creamos una base de datos de comidas típicas chilenas.
create database comidas_tipicas;

-- ● Paso 2: Creamos una tabla llamada cocina chilena con los campos id y nombre.
create table cocina_chilena(id int, nombre varchar(50));

-- ● Paso 3: Insertamos 2 registros a la tabla con sus respectivos campos.
insert into cocina_chilena (id, nombre) values ('1','Pastel de choclo');
insert into cocina_chilena (id, nombre) values ('2', 'Umitas');
insert into cocina_chilena (id, nombre) values ('3', 'carbonada');
insert into cocina_chilena (id, nombre) values ('4', 'pascado de casuela');
insert into cocina_chilena (id, nombre) values ('5', 'zopaipillas');

-- ● Paso 4: Para actualizar un registro utilizamos update.
UPDATE cocina_chilena set nombre='Humitas' where id = 2;
UPDATE cocina_chilena set nombre='Caldillo de pescado' where id = 4;
UPDATE cocina_chilena set nombre='Sopaipillas' where id = 5;

-- ● Paso 5: Eliminar un registro lo podremos hacer con la sentencia Delete. Así como hicimos con la actualización, utilizaremos el id para capturar un registro puntual.
delete from cocina_chilena where id = 2;

-- ● Paso 6: Eliminar múltiples registros en la tabla. Para ello añadiremos platos de cocina chilena
delete from cocina_chilena where id in (3,4,5);

delete from cocina_chilena  --DELETE 0
where id = 5
and id = 3;

delete from cocina_chilena 
where id = 5
OR id = 3;

UPDATE cocina_chilena set nombre= nombre + '2024' returning *; -- no actualiza string mas int
UPDATE cocina_chilena set id= id + '2024' returning *; -- con los datos numericos si funcionan
UPDATE cocina_chilena set nombre= concat(nombre,' 2024') returning *;