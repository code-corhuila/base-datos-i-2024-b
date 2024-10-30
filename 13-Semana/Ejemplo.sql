USE db_shopping_car;
SELECT 
	u.username,
    u.state,
    u.password
FROM user u
WHERE 
	username = 'admin' 
    AND password = 'password123';
    
SELECT 
	u.username,
    u.state,
    u.password
FROM user u
WHERE 
	username = '' OR '1' = '1' -- ' AND contrasenia = '';
    
SELECT * FROM person WHERE state = false;

SELECT * FROM person WHERE state = false OR '1' = '1'; -- ';


