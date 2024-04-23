#Categorias y Productos
#1: Listar categorias
SELECT *
FROM categorias;

#2: Listar CategoriaNombre y Descripcion 
SELECT CategoriaNombre, Descripcion 
FROM categorias;

#3: Listar productos
SELECT * 
FROM Productos;

#4: Existen productos discontinuados? (Discontinuado = 1).
SELECT * 
FROM Productos 
WHERE Discontinuado=1;

#5: Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
SELECT * 
FROM Productos
WHERE ProveedorId=8;

#6: Listar productos cuyo precio unitario se encuentre entre 10 y 22.
SELECT * 
FROM Productos
WHERE preciounitario BETWEEN 10 AND 22;

#7:  Un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT productoid, productonombre, unidadesstock, nivelreorden 
FROM Productos
WHERE unidadesstock<nivelreorden;

#8: Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.
SELECT productoid, productonombre, unidadesstock, nivelreorden, unidadespedidas 
FROM Productos
WHERE unidadesstock<nivelreorden AND unidadespedidas=0;

