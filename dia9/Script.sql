SELECT id, "pelicula", anio_estrenos , "director"
FROM public.peliculas;

select id from peliculas where "pelicula" = 'Titanic';

select max(anio_estrenos) from peliculas;

select min(anio_estrenos) from peliculas;

select count(id) from peliculas where director = 'Peter Jackson';

select "pelicula", anio_estrenos from peliculas where "director" = 'Peter Jackson';

select p.director, count(p.director) as cantidad from  peliculas p group by p.director having count(p.director) >=2 order by cantidad ;