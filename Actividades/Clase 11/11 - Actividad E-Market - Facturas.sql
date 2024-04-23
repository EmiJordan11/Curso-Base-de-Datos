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