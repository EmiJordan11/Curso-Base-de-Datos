#PRODUCTOS
#1: Listar todos los productos ordenados descendentemente por precio unitario.
SELECT ProductoID, ProductoNombre, PrecioUnitario
FROM Productos
ORDER BY PrecioUnitario DESC;

#2: Listar el top 5 de productos cuyo precio unitario es el más caro.
SELECT ProductoID, ProductoNombre, PrecioUnitario
FROM Productos
ORDER BY PrecioUnitario DESC
LIMIT 5;

#3: Obtener un top 10 de los productos con más unidades en stock.
SELECT ProductoID, ProductoNombre, UnidadesStock
FROM Productos
ORDER BY UnidadesStock DESC
LIMIT 10;
