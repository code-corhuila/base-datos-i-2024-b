
USE db_shopping_car;

-- ====================================================================
-- Ejemplos de Uso para Procedimientos de la Tabla `view`
-- ====================================================================

-- 1. Crear registros en `view`
CALL spr_create_view('V001', 'Descripción de la vista 1', 'Vista 1', '/ruta/vista1', 1001);
CALL spr_create_view('V002', 'Descripción de la vista 2', 'Vista 2', '/ruta/vista2', 1002);
CALL spr_create_view('V003', 'Descripción de la vista 3', 'Vista 3', '/ruta/vista3', 1003);

-- 2. Actualizar registros en `view`
CALL spr_update_view(1, 'V001', 'Vista 1 - Actualizada', 'Vista 1', '/nueva/ruta/vista1', 2001);
CALL spr_update_view(2, 'V002', 'Vista 2 - Actualizada', 'Vista 2', '/nueva/ruta/vista2', 2002);
CALL spr_update_view(3, 'V003', 'Vista 3 - Actualizada', 'Vista 3', '/nueva/ruta/vista3', 2003);

-- 3. Eliminar registros en `view` (eliminación lógica)
CALL spr_delete_view(1, 3001);
CALL spr_delete_view(2, 3002);
CALL spr_delete_view(3, 3003);

-- 4. Consultar todos los registros activos en `view`
CALL spr_find_all_view();

-- 5. Consultar un registro específico en `view` por ID
CALL spr_find_view_by_id(1);
CALL spr_find_view_by_id(2);
CALL spr_find_view_by_id(3);


-- ====================================================================
-- Ejemplos de Uso para Procedimientos de la Tabla `module`
-- ====================================================================

-- 1. Crear registros en `module`
CALL spr_create_module('M001', 'Módulo de usuarios', 'Usuarios', 1001);
CALL spr_create_module('M002', 'Módulo de productos', 'Productos', 1002);
CALL spr_create_module('M003', 'Módulo de ventas', 'Ventas', 1003);

-- 2. Actualizar registros en `module`
CALL spr_update_module(1, 'M001', 'Módulo de usuarios - Actualizado', 'Usuarios', 2001);
CALL spr_update_module(2, 'M002', 'Módulo de productos - Actualizado', 'Productos', 2002);
CALL spr_update_module(3, 'M003', 'Módulo de ventas - Actualizado', 'Ventas', 2003);

-- 3. Eliminar registros en `module` (eliminación lógica)
CALL spr_delete_module(1, 3001);
CALL spr_delete_module(2, 3002);
CALL spr_delete_module(3, 3003);

-- 4. Consultar todos los registros activos en `module`
CALL spr_find_all_module();

-- 5. Consultar un registro específico en `module` por ID
CALL spr_find_module_by_id(1);
CALL spr_find_module_by_id(2);
CALL spr_find_module_by_id(3);


-- ====================================================================
-- Ejemplos de Uso para Procedimientos de la Tabla `module_view`
-- ====================================================================

-- 1. Crear registros en `module_view`
CALL spr_create_module_view(1, 1, 1001); -- Asocia módulo 1 con vista 1
CALL spr_create_module_view(2, 2, 1002); -- Asocia módulo 2 con vista 2
CALL spr_create_module_view(3, 3, 1003); -- Asocia módulo 3 con vista 3

-- 2. Actualizar registros en `module_view`
CALL spr_update_module_view(1, 1, 2, 2001); -- Cambia vista del módulo 1 a vista 2
CALL spr_update_module_view(2, 2, 3, 2002); -- Cambia vista del módulo 2 a vista 3
CALL spr_update_module_view(3, 3, 1, 2003); -- Cambia vista del módulo 3 a vista 1

-- 3. Eliminar registros en `module_view` (eliminación lógica)
CALL spr_delete_module_view(1, 3001);
CALL spr_delete_module_view(2, 3002);
CALL spr_delete_module_view(3, 3003);

-- 4. Consultar todos los registros activos en `module_view`
CALL spr_find_all_module_view();

-- 5. Consultar un registro específico en `module_view` por ID
CALL spr_find_module_view_by_id(1);
CALL spr_find_module_view_by_id(2);
CALL spr_find_module_view_by_id(3);
