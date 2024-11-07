-- Eliminar base de datos 
DROP DATABASE IF EXISTS parque;

-- Crear base de datos 
CREATE DATABASE parque;

-- Usar base de datos 
USE parque;

-- Crear entidades - tablas
CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR (50) NOT NULL,
	correo VARCHAR (40) NOT NULL	
);

CREATE TABLE servicio(
	id INT PRIMARY KEY AUTO_INCREMENT,
	codigo VARCHAR (10) NOT NULL,
	nombre VARCHAR (50) NOT NULL,
	precio_unitario DECIMAL(7,2)
);

CREATE TABLE servicio_cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
	valor_pagar DECIMAL(7,2),
	cantidad INT NOT NULL,
	cliente_id INT,
	servicio_id INT,
	FOREIGN KEY (cliente_id) REFERENCES cliente(id),
	FOREIGN KEY (servicio_id) REFERENCES servicio(id)
);