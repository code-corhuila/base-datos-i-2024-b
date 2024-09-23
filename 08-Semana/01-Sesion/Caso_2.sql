DROP DATABASE IF EXISTS caso2;
CREATE DATABASE caso2;
USE caso2;
CREATE TABLE primera_fn(
	estudiante INT,
    nombre VARCHAR(50),
    salon INT,
    clase VARCHAR(50)
);

INSERT INTO primera_fn
	(estudiante, nombre, salon, clase)VALUES
    (1022,"Jones",412,"101-07"),
    (1022,"Jones",412,"102-07"),
    (1022,"Jones",412,"109-07"),
    (4123,"Smith",216,"201-01"),
    (4123,"Smith",216,"203-08"),
    (4123,"Smith",216,"209-02"),
    (2312,"María",216,"201-01"),
    (2103,"Pedro",211,"201-02");
    
    SELECT * FROM primera_fn;