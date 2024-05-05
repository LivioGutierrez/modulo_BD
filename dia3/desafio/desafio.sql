--Entrando a postgres
psql -U postgres

--Creacion de la base de datos
create database desafio_livio_gutierrez_001;

--Comprobar las bases de datos creadas 
\l

--Entrando a la BD
\c desafio_livio_gutierrez_001

--Creando la tabla clientes con sus columnas requeridas
create table clientes(
    email varchar(50),
    nombre varchar,
    telefono varchar(16),
    empresa varchar(50), 
    prioridad smallint
);

-- Confirmando que la tabla este creada correctamente
\d

--Insertando datos ramdoms
insert into clientes values 
('cliente1@email.com ', 'Pedro','111111111', 'Empresa Sonrisas', 1),
('cliente2@email.com ', 'Juan','222222222', 'Empresa Cosquillas', 5),
('cliente3@email.com ', 'Diego','333333333', 'Empresa Alegria', 6),
('cliente4@email.com ', 'Carla','444444444', 'Empresa Comida', 2),
('cliente5@email.com ', 'Samanta','555555555', 'Empresa DormirBien', 10);

-- Confirmando que todos los datos esten bien echos
select * from clientes;

-- Haciendo la conosulda requerida
select * from clientes where empresa = 'Empresa Alegria' or prioridad = 1;