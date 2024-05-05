create database mascotas;

create table mascotas(
    ID int, 
    Nombre varchar(50),
    Raza varchar(50),
    Edad int
);

insert into mascotas values 
('1', 'Pedro','Labrador Retriever', 1),
('2', 'Juan','Pastor Alemán', 5),
('3', 'Diego','Bulldog Francés', 6),
('4', 'Carla','Golden Retriever', 2),
('5', 'Samanta','Chihuahua', 10);

UPDATE mascotas set nombre='Terri' where id = 1;
UPDATE mascotas set nombre='Jose' where id = 2;
UPDATE mascotas set nombre='Negro' where id = 3;
UPDATE mascotas set nombre='Jazmin' where id = 4;
UPDATE mascotas set nombre='Tu' where id = 5;

delete from mascotas where id in (1,2,3,4,5);