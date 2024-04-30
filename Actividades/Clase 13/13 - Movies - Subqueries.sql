#SUBQUERIES

#1- Queremos conocer, por un lado, los títulos y el nombre del género de todas las series de la base de datos.
SELECT title,
	   (SELECT name
        FROM genres g
        WHERE g.id=m.genre_id) AS Genre
FROM movies m;

#2- Listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT 
	   (SELECT title
	    FROM episodes e
        WHERE ae.episode_id=e.id) AS Episode,
        (SELECT CONCAT(first_name,' ' ,last_name)
		FROM actors a
        WHERE ae.actor_id=a.id) AS Actor
FROM actor_episode ae 
ORDER BY Episode;

#3- Obtener a todos los actores o actrices (mostrar nombre y apellido) que han trabajado en cualquier película de la saga de La Guerra de las galaxias
SELECT 
	   (SELECT CONCAT(first_name,' ', last_name)
        FROM actors a
        WHERE am.actor_id=a.id) AS Actor
FROM actor_movie am
WHERE (SELECT title /*Condiciono que haya actuado en alguna peli de star wars*/
        FROM movies m
        WHERE am.movie_id=m.id AND title LIKE "La Guerra de las Galaxias%") IS NOT NULL
        
GROUP BY Actor; /*Agrupo por actor ya que no me importa la cantidad de veces que actuó en alguna de ellas*/

#4- Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género.
SELECT 
		(SELECT name
         FROM genres g
         WHERE g.id=m.genre_id) AS Genre,
         COUNT(*) as Amount
FROM movies m
GROUP BY Genre
HAVING Genre IS NOT NULL; /* hay pelis sin genero*/

