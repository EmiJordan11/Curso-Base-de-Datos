#TABLE REFERENCE

#1- Queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
SELECT title, name
FROM movies m, genres g
WHERE m.genre_id=g.id;

#2- Listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT title as Episode, CONCAT(first_name,' ' , last_name) as Actor
FROM actors a, actor_episode ae, episodes e
WHERE ae.actor_id=a.id AND ae.episode_id=e.id
ORDER BY Episode;

#3- Obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias
SELECT CONCAT(first_name,' ' , last_name) as Actor
FROM actors a, actor_movie am, movies m
WHERE am.actor_id=a.id AND am.movie_id=m.id AND m.title LIKE "La Guerra de las Galaxias%"
GROUP BY Actor;

#4- Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
SELECT name as Genre, COUNT(*) AS Amount
FROM movies m, genres g
WHERE m.genre_id=g.id
GROUP BY Genre
