#JOIN

#1- Generar un listado de todas las facturas del empleado 'Buchanan'. 
SELECT * FROM facturas f
JOIN empleados e
ON e.EmpleadoID=f.EmpleadoID
WHERE e.Apellido='Buchanan';

#2- Generar un listado con todos los campos de las facturas del correo 'Speedy Express'
SELECT * FROM facturas f
JOIN correos c
ON f.EnvioVia=c.CorreoID
WHERE c.Compania='Speedy Express';

#3- Generar un listado de todas las facturas con el nombre y apellido de los empleados
SELECT f.FacturaID,  e.Nombre, e.Apellido
FROM facturas f
JOIN empleados e
ON e.EmpleadoID=f.EmpleadoID;

#4- Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío “USA”
SELECT f.FacturaID, c.Titulo, f.PaisEnvio
FROM facturas f
JOIN clientes c
ON c.ClienteID=f.ClienteID
WHERE c.Titulo LIKE 'Owner%' AND f.PaisEnvio='USA';

#5- Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” o que incluyan el producto id = “42”
SELECT f.FacturaID, e.Apellido, fd.ProductoID
FROM facturas f
JOIN empleados e
ON e.EmpleadoID=f.EmpleadoID
JOIN facturadetalle fd
ON f.FacturaID=fd.FacturaID
WHERE e.Apellido='Leverling' OR fd.ProductoID=42;

#6- Mostrar todos los campos de las facturas del empleado cuyo apellido sea “Leverling” y que incluya los producto id = “80” o ”42”
SELECT f.FacturaID, e.Apellido, fd.ProductoID
FROM facturas f
JOIN empleados e
ON e.EmpleadoID=f.EmpleadoID
JOIN facturadetalle fd
ON f.FacturaID=fd.FacturaID
WHERE e.Apellido='Leverling' OR fd.ProductoID IN (42,80);

#7- Generar un listado con los cinco mejores clientes, según sus importes de compras total (PrecioUnitario * Cantidad)
SELECT c.ClienteID, 
	   c.Compania, 
       c.Contacto, 
       ROUND(SUM(fd.Cantidad*fd.PrecioUnitario-fd.Descuento),2) AS TotalCompras 
FROM facturadetalle fd
JOIN facturas f
ON fd.FacturaID=f.FacturaID
JOIN clientes c
ON f.ClienteID=c.ClienteID
GROUP BY c.ClienteID
ORDER BY TotalCompras DESC
LIMIT 5;

#8- Generar un listado de facturas, con los campos id, nombre y apellido del cliente, fecha de factura, país de envío, Total, ordenado de manera descendente por fecha de factura y limitado a 10 filas
SELECT f.FacturaID,
	   c.Contacto,
       f.FechaFactura,
       f.PaisEnvio,
       ROUND(SUM(fd.Cantidad*fd.PrecioUnitario-fd.Descuento),2) AS Total
FROM facturas f
JOIN clientes c
ON f.ClienteID=c.ClienteID
JOIN facturadetalle fd
ON fd.FacturaID=f.FacturaID
GROUP BY f.FacturaID
ORDER BY f.FechaFactura DESC
LIMIT 10;








