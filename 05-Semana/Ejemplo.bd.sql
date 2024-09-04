-- DDL (DDL significa Data Definition Language o Lenguaje de Definición de Datos)

-- Eliminar base de datos si existe. 
DROP DATABASE IF EXISTS concesionario;

-- Crear base de datos.
CREATE DATABASE concesionario;

-- Usar base de Datos
USE concesionario;

-- Crear entidades.
CREATE TABLE marca(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR (50) NOT NULL UNIQUE,
	descripcion VARCHAR (250) NOT NULL
);

CREATE TABLE categoria(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR (50) NOT NULL UNIQUE,
	descripcion VARCHAR (250) NOT NULL,
	marca_id INT NOT NULL,
	CONSTRAINT fk_categoria_marca_id_marca_id FOREIGN KEY (marca_id) REFERENCES marca(id)
);

-- DML 

INSERT INTO marca(nombre,descripcion) VALUES ("Toyota","Carro xyz");

SELECT * FROM marca;