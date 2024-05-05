-- ● Paso 1: Creamos la base de datos con el nombre bbdd_gimnasios.
create database bbdd_gimnasios;

-- ● Paso 2: Nos conectamos a la base de datos una vez que haya sido creada
\c bbdd_gimnasios;

-- ● Paso 3: Creamos la tabla clientes con los siguientes campos:
-- ○ Nombre
-- ○ Apellido
-- ○ Rut
-- ○ Email
create table clientes(
    nombre varchar(50), -- character varying(50)
    apellido varchar(50), 
    rut int, 
    email varchar(50)
);

--● Paso 4: Modificamos la tabla clientes y definimos que el rut será la clave primaria (Primary Key)
alter table clientes add primary key(rut);

--● Paso 5: Creamos la tabla matrículas con los siguientes campos:
-- ○ Monto
-- ○ Estado
-- ○ Asignamos la clave foránea para la integración de ambas tablas con el Rut.
create table matriculas(
    monto varchar(50), 
    estado boolean, 
    cliente_rut int references clientes(rut)-- establecer una relacion
);

--● Paso 6: Insertamos 5 registros en la tabla clientes.
insert into clientes values ('Cliente 1', 'Apellido cliente 1',
'999999999', 'cliente1@email.com');
insert into clientes values ('Cliente 2', 'Apellido cliente 2',
'888888888', 'cliente2@email.com');
insert into clientes values ('Cliente 3', 'Apellido cliente 3',
'777777777', 'cliente3@email.com');
insert into clientes values ('Cliente 4', 'Apellido cliente 4',
'666666666', 'cliente4@email.com');
insert into clientes values ('Cliente 5', 'Apellido cliente 5',
'555555555', 'cliente5@email.com');

--● Paso 7: Insertamos 5 registros en la tabla matriculas y los asociamos mediante su rut a cada cliente.
insert into matriculas values ('40000', True, '999999999');
insert into matriculas values ('40000', False, '888888888');
insert into matriculas values ('55000', True, '555555555');
insert into matriculas values ('35000', True, '777777777');
insert into matriculas values ('60000', False, '666666666');

insert into matriculas values ('55000', True, '777777777');
insert into matriculas values ('55000', False, '555555555');
--● Paso 8: Utilizar el inner join para que se muestren todos los registros que estén relacionados. Recordemos que esto se ejecuta siempre que exista una columna que relacione nuestras dos tablas.
select cli.email, cli.rut, mat.monto, mat.estado 
from clientes cli
inner join matriculas mat 
on cli.rut = mat.cliente_rut;

--● Paso 9: Podemos incluso agregar funciones anidadas a la consulta, en este caso supongamos que queremos ordenar según el monto de cada cliente. El orden será de manera ascendente, es decir del monto menor al mayor, para ello utilizaremos order by.
select cli.email, cli.rut, mat.monto, mat.estado 
from clientes cli
inner join matriculas mat 
on cli.rut = mat.cliente_rut
order by mat.monto;

--● Paso 10: Agrupar consultas, para ello añadiremos una matrícula nueva a un RUT ya existente. Esta agrupación consistirá en obtener aquellos clientes que tienen más de una matrícula generada.
select cliente_rut, count(cliente_rut) from matriculas group by cliente_rut having
count(cliente_rut) >= 2;

select*from matriculas;

-- ● Paso 11: Hasta el paso 10 recibimos los datos del registro que tiene dos matrículas
-- asignadas, pero estos datos están incompletos, no sabemos el nombre de la
-- persona, su rut ni el email. Para solucionarlo debemos primero agrupar a partir de
-- aquellos campos que tienen una función de agregado implementada, veamos el
-- código.
select email, rut, monto, estado, 
count(matriculas.*) 
from clientes
inner join matriculas 
on clientes.rut = cliente_rut 
group by email, monto, rut, estado;

--CODIGO CORRECTO
select rut, email, estado, count(matriculas.*) 
from clientes 
inner join matriculas 
on clientes.rut = cliente_rut 
group by rut, email, estado;