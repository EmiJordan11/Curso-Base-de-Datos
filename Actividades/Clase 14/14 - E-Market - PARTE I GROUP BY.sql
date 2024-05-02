#GROUP BY

#CLIENTES
#1- ¿Cuántos clientes existen?
SELECT COUNT(*) AS CantidadClientes FROM clientes;

#2- ¿Cuántos clientes hay por ciudad?
SELECT Ciudad, COUNT(*) AS CantidadClientes
FROM clientes
GROUP BY Ciudad;

#FACTURAS

#1- ¿Cuál es el total de transporte?
SELECT ROUND(SUM(Transporte),2) AS TotaLTransporte
FROM facturas;

#2- ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
SELECT EnvioVia, ROUND(SUM(Transporte),2) AS TotalRecaudado
FROM facturas
GROUP BY EnvioVia;

#3- Calcular la cantidad de facturas por cliente. Ordenar descendentemente por cantidad de facturas
SELECT ClienteID, COUNT(*) AS CantidadFacturas 
FROM facturas
GROUP BY ClienteID
ORDER BY CantidadFacturas DESC;

#4- Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas
SELECT ClienteID, COUNT(*) AS CantidadFacturas 
FROM facturas
GROUP BY ClienteID
ORDER BY CantidadFacturas DESC
LIMIT 5;

#5- ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
SELECT PaisEnvio, COUNT(*) AS CantidadFacturas
FROM facturas
GROUP BY PaisEnvio
ORDER BY CantidadFacturas
LIMIT 1;

#6- ¿Qué ID de empleado realizó más operaciones de ventas?
SELECT EmpleadoID, COUNT(*) AS CantidadVentas 
FROM facturas
GROUP BY EmpleadoID
ORDER BY CantidadVentas DESC
LIMIT 1;

#FACTURA DETALLE

#1- ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
SELECT ProductoID, COUNT(*) AS Apariciones
FROM facturadetalle
GROUP BY ProductoID
ORDER BY Apariciones DESC
LIMIT 1;

#2- ¿Cuál es el total facturado? Considerar que el total facturado es la suma de cantidad por precio unitario
SELECT ROUND(SUM(Cantidad*PrecioUnitario),2) AS TotalFacturado
FROM facturadetalle;

#3- ¿Cuál es el total facturado para los productos ID entre 30 y 50?
SELECT ProductoID, ROUND(SUM(Cantidad*PrecioUnitario),2) AS TotalFacturado
FROM facturadetalle
WHERE ProductoID BETWEEN 30 AND 50
GROUP BY ProductoID;

#4- ¿Cuál es el precio unitario promedio de cada producto?
SELECT ProductoID, ROUND(AVG(DISTINCT PrecioUnitario),2) AS PrecioUnitarioPromedio 
FROM facturadetalle
GROUP BY ProductoID;

#5- ¿Cuál es el precio unitario máximo?
SELECT ProductoID, PrecioUnitario
FROM facturadetalle
ORDER BY PrecioUnitario DESC
LIMIT 1


