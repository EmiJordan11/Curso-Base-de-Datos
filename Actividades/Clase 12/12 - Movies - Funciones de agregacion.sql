#FUNCIONES DE AGREGACION, GROUP BY Y HAVING

#1- ¿Cuántas películas hay?
SELECT COUNT(*) AS cantidad_peliculas 
FROM movies;

#2- ¿Cuántas películas tienen entre 3 y 7 premios?
SELECT COUNT(*) AS cantidad_peliculas 
FROM movies
WHERE awards BETWEEN 3 AND 7;

#3- ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
SELECT COUNT(*) cantidad_peliculas
FROM movies
WHERE awards BETWEEN 3 AND 7 AND rating>7;

#4- Encuentra la cantidad de actores en cada película.
SELECT movie_id AS id_pelicula, COUNT(*) cantidad_actores
FROM actor_movie
GROUP BY movie_id;

#5- Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por id. de género.
SELECT genre_id AS id_genero, COUNT(*) AS cantidad_peliculas
FROM movies
GROUP BY ID_Genero
HAVING id_genero IS NOT NULL;

#6- De la consulta anterior, listar sólo aquellos géneros que tengan como suma de premios un número mayor a 5.
SELECT genre_id AS id_genero, COUNT(*) AS cantidad_peliculas
FROM movies
GROUP BY ID_Genero
HAVING id_genero IS NOT NULL;

#7- Encuentra los géneros que tienen las películas con un promedio de calificación mayor a 6.0
SELECT genre_id AS id_genero, ROUND(AVG(rating),1) AS promedio_rating
FROM movies
GROUP BY id_genero
HAVING promedio_rating > 6 AND id_genero IS NOT NULL;

#8- Encuentra los géneros que tienen al menos 3 películas.
SELECT genre_id AS id_genero, COUNT(*) as cantidad_peliculas
FROM movies
GROUP BY id_genero
HAVING cantidad_peliculas>2



