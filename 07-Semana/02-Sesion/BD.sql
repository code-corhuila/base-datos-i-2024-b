DROP DATABASE IF EXISTS aeropuerto;
CREATE DATABASE IF NOT EXISTS aeropuerto;
USE aeropuerto;

/****************************************************
 * Datos personas
 ****************************************************/
CREATE TABLE persona (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento ENUM('DNI', 'P', 'CC','CE') NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL
);

CREATE TABLE tripulacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rol ENUM('Piloto', 'Copiloto', 'Azafata') NOT NULL,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES persona(id)
);

/****************************************************
 * Datos ubicación
 ****************************************************/
CREATE TABLE continente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE pais (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_continente INT NOT NULL,
    FOREIGN KEY (id_continente) REFERENCES continente(id)
);

CREATE TABLE departamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais(id)
);

CREATE TABLE ciudad (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

/****************************************************
 * Datos aerolinea
 ****************************************************/

CREATE TABLE aerolinea (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE avion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(10) NOT NULL,
    tipo ENUM('Comercial', 'Privado') NOT NULL,
    capacidad_pasajero INT NOT NULL,
    id_aerolinea INT NOT NULL,
    FOREIGN KEY (id_aerolinea) REFERENCES aerolinea(id)
);

CREATE TABLE vuelo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero_vuelo VARCHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,
    ciudad_origen_id INT NOT NULL,
    ciudad_destino_id INT NOT NULL,
    avion_id INT NOT NULL,
    FOREIGN KEY (avion_id) REFERENCES avion(id),
    FOREIGN KEY (ciudad_origen_id) REFERENCES ciudad(id),
    FOREIGN KEY (ciudad_destino_id) REFERENCES ciudad(id)
);

CREATE TABLE tripulacion_vuelo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tripulacion_id INT NOT NULL,
    vuelo_id INT NOT NULL,
    FOREIGN KEY (tripulacion_id) REFERENCES tripulacion(id),
    FOREIGN KEY (vuelo_id) REFERENCES vuelo(id)
);

CREATE TABLE estado_vuelo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE detalle_vuelo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hora TIME NOT NULL,
    vuelo_id INT NOT NULL,
    estado_vuelo_id INT NOT NULL,
    FOREIGN KEY (vuelo_id) REFERENCES vuelo(id),
    FOREIGN KEY (estado_vuelo_id) REFERENCES estado_vuelo(id)    
);
