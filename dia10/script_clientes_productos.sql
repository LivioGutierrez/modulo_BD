drop table IF EXISTS compras;
drop table IF EXISTS clientes;
drop table IF EXISTS productos;

create table clientes(
    id serial primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    direccion varchar(250) not null,
    dni varchar(50) not null unique
);

create table productos(
    id serial primary key,
    codigo varchar(250) not null unique
);

create table compras(
    id serial primary key,
    cliente_id int,
    producto_id int,
    foreign key(cliente_id) references clientes(id),
    foreign key(producto_id) references productos(id) 
);