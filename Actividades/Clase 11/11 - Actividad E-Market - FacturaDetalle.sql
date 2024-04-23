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
