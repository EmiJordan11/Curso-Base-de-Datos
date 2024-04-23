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

#CLIENTES
#1:  Listar todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT Compania, Contacto, Titulo, Pais  
FROM clientes
ORDER BY Pais;

#2: Queremos conocer a todos los clientes que tengan un título “Owner”
SELECT Compania, Contacto, Titulo, Pais  
FROM clientes
WHERE Titulo LIKE '%Owner%';

#3: El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
SELECT Compania, Contacto, Titulo, Pais  
FROM clientes
WHERE Contacto LIKE 'C%';

#FACTURAS
#1: Listar todas las facturas, ordenado por fecha de factura ascendente.
SELECT * 
FROM Facturas
ORDER BY FechaFactura;

#2: Listar las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3
SELECT * 
FROM Facturas
WHERE PaisEnvio='USA' AND EnvioVia!=3;

#3: ¿El cliente 'GOURL' realizó algún pedido?
SELECT * 
FROM Facturas
WHERE ClienteID='GOURL';

#4: Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT * 
FROM Facturas
WHERE EmpleadoID IN (2,3,5,8,9);

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

#FACTURADETALLE
#1: Obtener un listado de FacturaID, ProductoID, Cantidad
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle;

#2: Ordenar el listado anterior por cantidad descendentemente.
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle
ORDER BY cantidad DESC;

#3: Filtrar el listado solo para aquellos productos donde la cantidad se encuentre entre 50 y 100
SELECT FacturaID, ProductoID, Cantidad
FROM facturadetalle
WHERE cantidad BETWEEN 50 AND 100;

#4:  Obtener un listado con los siguientes nombres de columnas: NroFactura (FacturaID), Producto (ProductoID), Total (PrecioUnitario*Cantidad)
SELECT FacturaID AS NroFactura, ProductoID AS Producto, Cantidad*PrecioUnitario AS Total
FROM facturadetalle;

#EXTRAS
#1: Listar todos los clientes que viven en “Brazil" o “Mexico”, o que tengan un título que empiece con “Sales”. 
SELECT ClienteID, Compania, Contacto, Titulo, Pais
FROM clientes
WHERE Pais IN ('Brazil', 'Mexico') OR Titulo LIKE "Sales%";

#2: Listar todos los clientes que pertenecen a una compañía que empiece con la letra "A".
SELECT ClienteID, Compania, Contacto, Titulo, Pais
FROM clientes
WHERE compania LIKE "A%";

#3: Obtener un listado con los datos: Ciudad, Contacto y renombrarlo como Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los clientes que sean de la ciudad "Madrid"
SELECT Contacto AS 'Nombre y Apellido', Titulo AS Puesto, Ciudad
FROM clientes
WHERE Ciudad = 'Madrid';

#4: Obtener un listado de todas las facturas con ID entre 10000 y 10500
SELECT *
FROM Facturas
WHERE FacturaID BETWEEN 10000 AND 10500;

#5: Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de los clientes con ID que empiecen con la letra “B”
SELECT *
FROM Facturas
WHERE FacturaID BETWEEN 10000 AND 10500 OR ClienteID LIKE "B%";

#6: ¿Existen facturas que la ciudad de envío sea “Vancouver” o que utilicen el correo 3?
SELECT *
FROM Facturas
WHERE CiudadEnvio = "Vancouver" OR EnvioVia=3;

#7: ¿Cuál es el ID de empleado de “Buchanan”?
SELECT EmpleadoID, Nombre,Apellido
FROM Empleados
WHERE Apellido = 'Buchanan';

#8: ¿Existen facturas con EmpleadoID del empleado del ejercicio anterior? (No relacionar, sino verificar que existan facturas)
SELECT *
FROM Facturas
WHERE EmpleadoID = 5;