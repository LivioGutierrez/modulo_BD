-- ● Paso 1: Creamos la base de datos restricciones_psql. Luego debemos conectarnos a ella
create database restricciones_psql;

-- ● Paso 2: Creamos una tabla llamada company con los campos id y nombre.
create table company (
    id serial primary key, 
    nombre varchar not null unique
);

select * from company;
\d company;

-- ● Paso 3: Hacemos dos insert a la tabla.
insert into company(nombre) values('Amazon');
insert into company(nombre) values('Apple');
insert into company(nombre) values('Microsoft');

-- ● Paso 4: Validar la restricción Unique dentro de la tabla. Para ello intentaremos ingresar un nombre que ya exista.
insert into company(nombre) values('Apple');

select nextval('company_id_seq'::regclass);
select nextval('company_id_seq');

select * from company_id_seq;