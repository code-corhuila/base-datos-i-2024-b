DROP DATABASE IF EXISTS c2_quiz_1;

CREATE DATABASE c2_quiz_1;

USE c2_quiz_1;

CREATE TABLE persona(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR (50) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	direccion VARCHAR (50) NOT NULL
);

CREATE TABLE acceso(
	id INT PRIMARY KEY AUTO_INCREMENT,
	usuario VARCHAR(50) UNIQUE NOT NULL,
	clave VARCHAR(50) NOT NULL,
	rol VARCHAR(50) NOT NULL,
	persona_id INT NOT NULL,
	FOREIGN KEY (persona_id) REFERENCES persona(id)
);

CREATE TABLE libro(
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo INT NOT NULL UNIQUE,
	titulo VARCHAR(50) NOT NULL,
	publicacion DATE NOT NULL, 
	autor VARCHAR(50) NOT NULL,
	persona_id INT NOT NULL,
	FOREIGN KEY (persona_id) REFERENCES persona(id)
);


INSERT INTO persona(
	nombre,
	fecha_nacimiento,
	direccion
)VALUES(
	"Pepito",
	"2024-09-15",
	"Calle 20 # 3-21"
);

UPDATE persona
	SET nombre = "Pepito Perez"
WHERE id = 1;

SELECT * FROM persona;