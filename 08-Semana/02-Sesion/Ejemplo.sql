SELECT * FROM ejercicio.Continente;
SELECT * FROM ejercicio.Pais;
SELECT * FROM ejercicio.Departamento;
SELECT * FROM ejercicio.Ciudad;

-- Mostrar las ciudades de chile. Mostrar el nombre de:
-- Continente, Pais, Departamento y Ciudad.
USE ejercicio;
SELECT 
	* 
FROM Continente AS c
	LEFT JOIN Pais AS p ON  c.continente_id = p.continente_id;
    
SELECT 
	* 
FROM Pais AS p
	RIGHT JOIN Continente AS c ON  c.continente_id = p.continente_id;
    
    
    
SELECT 
	c.nombre AS continente,
    p.nombre AS pais,
    d.nombre AS departamento,
    ci.nombre AS ciudad
FROM Continente AS c
	INNER JOIN Pais AS p ON  c.continente_id = p.continente_id
    INNER JOIN Departamento AS d ON p.pais_id = d.pais_id
    INNER JOIN Ciudad AS ci ON d.departamento_id = ci.departamento_id
WHERE c.nombre like "%AM%";



-- BUscar una persona por nombre e indicar de que ciudad, departamento, pais y continente es.