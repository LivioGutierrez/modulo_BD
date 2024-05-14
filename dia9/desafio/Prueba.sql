SELECT id, "Pelicula", "Año estreno", "Director"
FROM public.peliculas;

--3. Obtener el ID de la película “Titanic”.
select id as id_elicula_Titanic from peliculas where "Pelicula" = 'Titanic';

--4. Listar a todos los actores que aparecen en la película "Titanic".
select actor as nombre_actores_de_titanic from reparto r where id_pelicula = 2; 

--5. Consultar en cuántas películas del top 100 participa Harrison Ford.
select  p."Pelicula" from reparto r join peliculas p on r.id_pelicula = p.id where r.actor = 'Harrison Ford' and p."Pelicula"  IN (SELECT "Pelicula" FROM peliculas);

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente
select "Pelicula", "Año estreno" from peliculas p where "Año estreno" between 1990 and 1999 order by "Pelicula" asc;

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”
select  "Pelicula" as nombre_pelicula , length("Pelicula") as longitud_titulo from peliculas p;

--8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
select max(length(p."Pelicula")) as longitud_titulo from peliculas p;
