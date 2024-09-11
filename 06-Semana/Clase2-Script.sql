-- DDL (Lenguaje de Definición de Datos)
-- Gestinar la estructura

-- Verificar si existe la base de datos, eliminarla. 
DROP DATABASE IF EXISTS ubicacion;

-- Crear base de datos 
CREATE DATABASE ubicacion;

-- Usar base de datos. 
USE ubicacion;

-- Crar tabla.
CREATE TABLE continente(
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo INT UNIQUE,
	nombre VARCHAR(50) NOT NULL UNIQUE,
	descripcion VARCHAR (250) NOT NULL,
	estado BIT DEFAULT (1)
);

CREATE TABLE pais(
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo INT UNIQUE,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR (250) NOT NULL,
	estado BIT DEFAULT (1),
	continente_id INT,
	CONSTRAINT fk_pais_continente_id_continente_id FOREIGN KEY (continente_id) REFERENCES continente(id)
);

CREATE TABLE estado(
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo INT UNIQUE,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR (250) NOT NULL,
	estado BIT DEFAULT (1),
	pais_id INT,
	CONSTRAINT fk_estado_pais_id_pais_id FOREIGN KEY (pais_id) REFERENCES pais(id)
);

CREATE TABLE provincia(
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo INT UNIQUE,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR (250) NOT NULL,
	estado BIT DEFAULT (1),
	estado_id INT,
	CONSTRAINT provincia_estado_id_estado_id FOREIGN KEY (estado_id) REFERENCES estado(id)
);

-- DML (Lenguaje de Manipulación de Datos)
-- Gestinar los datos (CRUD)

-- Insertar datos 
INSERT INTO continente(
	codigo,
	nombre,
	descripcion,
	estado
)VALUES(
	1013,
	"África",
	"N/A",
	1
);

-- Insetar masivo
INSERT INTO continente (codigo,	nombre,	descripcion, estado) VALUES
(1010, "América del Norte",	"Paises vinculados al emisferio occidente/norte",1),
(1011, "América del Sur", "Paises vinculados al emisferio occidente/sur",1),
(1012, "Europa", "Paises vinculados al emisferio oriente",0);


-- Actualizar registro
UPDATE continente 
	SET 
		descripcion = "Paises vinculados al emisferio occidente/norte",
		estado = 0	
WHERE id = 1;

-- Consutar registros. 
SELECT nombre FROM continente;

-- Eliminar registros
DELETE 
	FROM continente 
WHERE id = 1;

-- Insertar datos 
INSERT INTO pais(
	codigo,
	nombre,
	descripcion,
	estado,
	continente_id
)VALUES(
	41,
	"Colombia",
	"N/A",
	1,
	3
);

UPDATE pais 
	set 
		nombre = "España",
		continente_id = 4	
WHERE 
	id = 7;
	
-- Insertar datos 
INSERT INTO estado(
	codigo,
	nombre,
	descripcion,
	estado,
	pais_id
)VALUES(
	41001,
	"Huila",
	"N/A",
	1,
	1
);

-- Insertar datos 
INSERT INTO estado(codigo, nombre, descripcion, estado, pais_id)VALUES
(41002, "Bogotá", "N/A", 1, 1),
(41003, "Valle del Cauca", "N/A", 1, 1),
(41004, "Tolima", "N/A", 1, 1),
(41005, "Bolivar", "N/A", 1, 1);


-- Conocer los estados de un país?. Se envía el nombre del País. 
-- Regresar. Nombre del continente al que pertenece, nombre del país, nombre del estado (departamento)

SELECT 
	c.nombre,
    p.nombre,
    e.nombre
FROM 
	continente c
	INNER JOIN pais p ON c.id = p.continente_id
	INNER JOIN estado e ON p.id = e.pais_id
WHERE p.nombre = "Colombia";