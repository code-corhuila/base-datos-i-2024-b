DELIMITER //

CREATE PROCEDURE GetUserDetails(
    IN p_username VARCHAR(50), 
    IN p_password VARCHAR(100)
)
BEGIN
    SELECT 
        u.username,
        u.state,
        u.password
    FROM user u
    WHERE 
        u.username = p_username
        AND u.password = p_password;
END //

DELIMITER ;

CALL GetUserDetails('admin', 'password123');
CALL GetUserDetails("' OR '1' = '1'; --", '');


