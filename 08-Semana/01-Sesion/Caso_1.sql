DROP DATABASE IF EXISTS caso1;
CREATE DATABASE caso1;
USE caso1;
CREATE TABLE sin_normalizar(
	estudiante INT UNIQUE,
    nombre VARCHAR(50),
    salon INT,
    clase1 VARCHAR(50),
    clase2 VARCHAR(50),
    clase3 VARCHAR(50),
    clase4 VARCHAR(50),
    clase5 VARCHAR(50)
);

INSERT INTO sin_normalizar
	(estudiante, nombre, salon, clase1, clase2, clase3, clase4, clase5)VALUES
    (1022,"Jones",412,"101-07","143-01","159-02","",""),
    (4123,"Smith",216,"201-01","211-02","214-01","",""),
    (2312,"María",216,"201-01","211-02","214-01","",""),
    (2103,"Pedro",211,"201-02","221-02","214-01","231-01","231-04");
    
    SELECT * FROM sin_normalizar;