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