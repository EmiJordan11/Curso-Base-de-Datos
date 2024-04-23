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
