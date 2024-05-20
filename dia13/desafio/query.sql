--1. Crea el modelo (revisa bien cuál es el tipo de relación antes de crearlo), respeta las claves primarias, foráneas y tipos de datos. (1 punto)
    create database desafio_livio_gutierrez_003;

    \c desafio_livio_gutierrez_003

    create table peliculas(
        id integer primary key, 
        nombre varchar(255), 
        anno integer
    );

    create table tags(
        id integer primary key, 
        tag varchar(255)
    );

    create table pelicula_tag(
        id_pelicula integer,
        id_tags integer,
        foreign key(id_pelicula) references peliculas(id),
        foreign key(id_tags) references tags(id)
    );
--2. Inserta 5 películas y 5 tags, la primera película tiene que tener 3 tags asociados, la segunda película debe tener dos tags asociados. (1 punto)
    insert into peliculas(id, nombre, anno) values
    (1, 'Pelicula1', 2000),
    (2, 'Pelicula2', 2001),
    (3, 'Pelicula3', 2002),
    (4, 'Pelicula4', 2003),
    (5, 'Pelicula5', 2004);

    insert into tags(id, tag) values
    (1, 'Accion'),
    (2, 'Comedia'),
    (3, 'Drama'),
    (4, 'Ciencia ficcion'),
    (5, 'Romance');

    insert into pelicula_tag(id_pelicula,id_tags) values
    (1,1),(1,2),(1,3),
    (2,3),(2,4),
    (3,1),(3,2),
    (4,1),(4,5),
    (5,2),(5,3);

    select * from peliculas;
    select * from tags;

--3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0. (1 punto)
    select p.id as id_pelicula, p.nombre as nombre_pelicula, COUNT(peli_tag.id_tags) as cantidad_tags from peliculas p left join pelicula_tag peli_tag on p.id= peli_tag.id_pelicula group by p.id, p.nombre;


--4. Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de datos. (1 punto)
    create table pregunta(
        id integer primary key, 
        pregunta varchar(255), 
        respuesta_correcta varchar(255)
    );

    create table usuarios(
        id integer primary key, 
        nombre varchar(255), 
        edad integer
    );

    create table respuestas(
        id integer,
        respuesta varchar(255),
        usuario_id integer,
        pregunta_id integer,
        foreign key(usuario_id) references usuarios(id),
        foreign key(pregunta_id) references pregunta(id)
    );

--5. Agrega 5 registros a la tabla preguntas, de los cuales: (1 punto)
    --Creando los usarios
    insert into usuarios (id,nombre, edad) values
    (1,'Pedro', 20),
    (2,'Marta', 21),
    (3,'Juan', 29),
    (4,'Jose', 25),
    (5,'Jesus', 15);

    --Creando preguntas
    insert into pregunta(id,pregunta, respuesta_correcta) values
    (1,'pregunta1', 'pregunta1'),
    (2,'pregunta2', 'pregunta2'),
    (3,'pregunta3', 'pregunta3'),
    (4,'pregunta4', 'pregunta4'),
    (5,'pregunta5', 'pregunta5');

--a. 1. La primera pregunta debe ser contestada correctamente por dos usuarios distintos
    insert into respuestas (id, respuesta, usuario_id, pregunta_id) values
    (1,'pregunta1', 1, 1),
    (2,'pregunta1', 2, 1);

--b. 2. La pregunta 2 debe ser contestada correctamente por un usuario.
    insert into respuestas (id, respuesta, usuario_id, pregunta_id) values
    (1,'pregunta2', 3, 2);

--c. 3. Los otros dos registros deben ser respuestas incorrectas.
    insert into respuestas (id, respuesta, usuario_id, pregunta_id) values
    (1,'pregunta3', 1, 5),
    (2,'pregunta4', 2, 2);

--6. Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta). (1 punto)
    select u.nombre, COUNT(*) as respuestas_correctas from usuarios u join respuestas r on u.id= r.usuario_id
    join pregunta p on r.pregunta_id= p.id where r.respuesta= p.respuesta_correcta group by u.nombre;


--7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta. (1 punto)
    select p.id as pregunta_id, p.pregunta, COUNT(*) as usuarios_respuesta from pregunta p join respuestas r on p.id= r.pregunta_id
    where r.respuesta= p.respuesta_correcta group by p.id, p.pregunta;

--8. Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación. (1 punto)
    alter table respuestas add constraint fk_usuario_respuesta foreign key (usuario_id) references usuarios(id) on delete cascade;
    delete from usuarios where id = 5;

--9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos. (1 punto)
    alter table usuarios add constraint edad_min check (edad >= 18);

--10. Altera la tabla existente de usuarios agregando el campo email con la restricción de único. (1 punto)
    alter table usuarios add column email varchar(255) unique;