USE db_shopping_car;

DROP PROCEDURE IF EXISTS spr_create_view;
DROP PROCEDURE IF EXISTS spr_update_view;
DROP PROCEDURE IF EXISTS spr_delete_view;
DROP PROCEDURE IF EXISTS spr_find_all_view;
DROP PROCEDURE IF EXISTS spr_find_view_by_id;
DROP PROCEDURE IF EXISTS spr_create_module;
DROP PROCEDURE IF EXISTS spr_update_module;
DROP PROCEDURE IF EXISTS spr_delete_module;
DROP PROCEDURE IF EXISTS spr_find_all_module;
DROP PROCEDURE IF EXISTS spr_find_module_by_id;
DROP PROCEDURE IF EXISTS spr_create_module_view;
DROP PROCEDURE IF EXISTS spr_update_module_view;
DROP PROCEDURE IF EXISTS spr_delete_module_view;
DROP PROCEDURE IF EXISTS spr_find_all_module_view;
DROP PROCEDURE IF EXISTS spr_find_module_view_by_id;

-- =============================================================================
--                              Procedimientos almacenados para la tabla `view`
-- =============================================================================
DELIMITER //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_create_view
-- Descripción : Crea un nuevo registro en la tabla `view`. Registra los datos
--               principales de la vista y establece la fecha de creación.
-- Parámetros  :
--      - p_code        : Código de la vista.
--      - p_description : Descripción de la vista.
--      - p_name        : Nombre de la vista.
--      - p_path        : Ruta de la vista.
--      - p_created_by  : ID del usuario que crea el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_create_view(
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_path VARCHAR(255),
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO view (code, description, name, path, created_at, created_by, state)
    VALUES (p_code, p_description, p_name, p_path, NOW(), p_created_by, 1);
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_update_view
-- Descripción : Actualiza un registro en la tabla `view` con nuevos valores.
-- Parámetros  :
--      - p_id          : ID del registro a actualizar.
--      - p_code        : Nuevo código de la vista.
--      - p_description : Nueva descripción de la vista.
--      - p_name        : Nuevo nombre de la vista.
--      - p_path        : Nueva ruta de la vista.
--      - p_updated_by  : ID del usuario que actualiza el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_update_view(
    IN p_id BIGINT,
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_path VARCHAR(255),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE view
    SET code = p_code,
        description = p_description,
        name = p_name,
        path = p_path,
        updated_at = NOW(),
        updated_by = p_updated_by
    WHERE id = p_id;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_delete_view
-- Descripción : Realiza una eliminación lógica en la tabla `view`, marcando el
--               estado como inactivo.
-- Parámetros  :
--      - p_id          : ID del registro a eliminar.
--      - p_deleted_by  : ID del usuario que elimina el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_delete_view(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE view
    SET deleted_at = NOW(),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_find_all_view
-- Descripción : Consulta todos los registros activos en la tabla `view`.
-- Parámetros  : Ninguno.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_find_all_view()
BEGIN
    SELECT * FROM view WHERE state = 1;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_find_view_by_id
-- Descripción : Consulta un registro específico en `view` por su ID.
-- Parámetros  :
--      - p_id : ID del registro a consultar.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_find_view_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT * FROM view WHERE id = p_id AND state = 1;
END //
DELIMITER ;

-- =============================================================================
--                              Procedimientos almacenados para la tabla `module`
-- =============================================================================
DELIMITER //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_create_module
-- Descripción : Crea un nuevo registro en la tabla `module`.
-- Parámetros  :
--      - p_code        : Código del módulo.
--      - p_description : Descripción del módulo.
--      - p_name        : Nombre del módulo.
--      - p_created_by  : ID del usuario que crea el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_create_module(
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO module (code, description, name, created_at, created_by, state)
    VALUES (p_code, p_description, p_name, NOW(), p_created_by, 1);
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_update_module
-- Descripción : Actualiza un registro en la tabla `module`.
-- Parámetros  :
--      - p_id          : ID del registro a actualizar.
--      - p_code        : Nuevo código del módulo.
--      - p_description : Nueva descripción del módulo.
--      - p_name        : Nuevo nombre del módulo.
--      - p_updated_by  : ID del usuario que actualiza el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_update_module(
    IN p_id BIGINT,
    IN p_code VARCHAR(20),
    IN p_description VARCHAR(255),
    IN p_name VARCHAR(100),
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE module
    SET code = p_code,
        description = p_description,
        name = p_name,
        updated_at = NOW(),
        updated_by = p_updated_by
    WHERE id = p_id;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_delete_module
-- Descripción : Realiza una eliminación lógica en la tabla `module`.
-- Parámetros  :
--      - p_id          : ID del registro a eliminar.
--      - p_deleted_by  : ID del usuario que elimina el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_delete_module(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE module
    SET deleted_at = NOW(),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_find_all_module
-- Descripción : Consulta todos los registros activos en `module`.
-- Parámetros  : Ninguno.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_find_all_module()
BEGIN
    SELECT * FROM module WHERE state = 1;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_find_module_by_id
-- Descripción : Consulta un registro en `module` por ID.
-- Parámetros  :
--      - p_id : ID del registro a consultar.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_find_module_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT * FROM module WHERE id = p_id AND state = 1;
END //
DELIMITER ;

-- =============================================================================
--                              Procedimientos almacenados para la tabla `module_view`
-- =============================================================================
DELIMITER //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_create_module_view
-- Descripción : Crea un nuevo registro en la tabla `module_view`, estableciendo
--               la relación entre un módulo y una vista.
-- Parámetros  :
--      - p_module_id   : ID del módulo.
--      - p_view_id     : ID de la vista.
--      - p_created_by  : ID del usuario que crea el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_create_module_view(
    IN p_module_id BIGINT,
    IN p_view_id BIGINT,
    IN p_created_by BIGINT
)
BEGIN
    INSERT INTO module_view (module_id, view_id, created_at, created_by, state)
    VALUES (p_module_id, p_view_id, NOW(), p_created_by, 1);
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_update_module_view
-- Descripción : Actualiza un registro en la tabla `module_view`.
-- Parámetros  :
--      - p_id          : ID del registro a actualizar.
--      - p_module_id   : Nuevo ID del módulo.
--      - p_view_id     : Nuevo ID de la vista.
--      - p_updated_by  : ID del usuario que actualiza el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_update_module_view(
    IN p_id BIGINT,
    IN p_module_id BIGINT,
    IN p_view_id BIGINT,
    IN p_updated_by BIGINT
)
BEGIN
    UPDATE module_view
    SET module_id = p_module_id,
        view_id = p_view_id,
        updated_at = NOW(),
        updated_by = p_updated_by
    WHERE id = p_id;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_delete_module_view
-- Descripción : Realiza una eliminación lógica en la tabla `module_view`, 
--               marcando el registro como inactivo.
-- Parámetros  :
--      - p_id          : ID del registro a eliminar.
--      - p_deleted_by  : ID del usuario que elimina el registro.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_delete_module_view(
    IN p_id BIGINT,
    IN p_deleted_by BIGINT
)
BEGIN
    UPDATE module_view
    SET deleted_at = NOW(),
        deleted_by = p_deleted_by,
        state = 0
    WHERE id = p_id;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_find_all_module_view
-- Descripción : Consulta todos los registros activos en la tabla `module_view`.
-- Parámetros  : Ninguno.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_find_all_module_view()
BEGIN
    SELECT * FROM module_view WHERE state = 1;
END //

-- -----------------------------------------------------------------------------
-- Procedimiento: spr_find_module_view_by_id
-- Descripción : Consulta un registro específico en `module_view` por su ID.
-- Parámetros  :
--      - p_id : ID del registro a consultar.
-- -----------------------------------------------------------------------------
CREATE PROCEDURE spr_find_module_view_by_id(
    IN p_id BIGINT
)
BEGIN
    SELECT * FROM module_view WHERE id = p_id AND state = 1;
END //
DELIMITER ;