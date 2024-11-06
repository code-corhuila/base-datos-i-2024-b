# Diccionario de Datos del Modelo de Usuarios y Roles

## Tabla: person
| Nombre del Campo     | Tipo de Dato         | Descripción |
|----------------------|----------------------|-------------|
| id                   | BIGINT               | Identificador único de la persona |
| address              | VARCHAR(255)         | Dirección de la persona |
| document_num         | VARCHAR(15)          | Número de documento de identidad |
| document_type        | VARCHAR(20)          | Tipo de documento de identidad |
| email                | VARCHAR(100)         | Correo electrónico de la persona |
| first_name           | VARCHAR(50)          | Primer nombre |
| last_name            | VARCHAR(50)          | Primer apellido |
| middle_name          | VARCHAR(50)          | Segundo nombre |
| phone                | VARCHAR(15)          | Número de teléfono |
| second_last_name     | VARCHAR(50)          | Segundo apellido |
| created_at           | DATETIME(6)          | Fecha de creación del registro |
| created_by           | BIGINT               | ID del usuario que creó el registro |
| deleted_at           | DATETIME(6)          | Fecha de eliminación del registro |
| deleted_by           | BIGINT               | ID del usuario que eliminó el registro |
| updated_at           | DATETIME(6)          | Fecha de actualización del registro |
| updated_by           | BIGINT               | ID del usuario que actualizó el registro |
| state                | BIT(1)               | Estado del registro (activo/inactivo) |

## Tabla: user
| Nombre del Campo     | Tipo de Dato         | Descripción |
|----------------------|----------------------|-------------|
| id                   | BIGINT               | Identificador único del usuario |
| username             | VARCHAR(50)          | Nombre de usuario |
| password             | VARCHAR(255)         | Contraseña del usuario |
| person_id            | BIGINT               | Llave foránea a la tabla `person` |
| created_at           | DATETIME(6)          | Fecha de creación del registro |
| created_by           | BIGINT               | ID del usuario que creó el registro |
| deleted_at           | DATETIME(6)          | Fecha de eliminación del registro |
| deleted_by           | BIGINT               | ID del usuario que eliminó el registro |
| updated_at           | DATETIME(6)          | Fecha de actualización del registro |
| updated_by           | BIGINT               | ID del usuario que actualizó el registro |
| state                | BIT(1)               | Estado del registro (activo/inactivo) |

## Tabla: user_role
| Nombre del Campo     | Tipo de Dato         | Descripción |
|----------------------|----------------------|-------------|
| id                   | BIGINT               | Identificador único de la relación usuario-rol |
| user_id              | BIGINT               | Llave foránea a la tabla `user` |
| role_id              | BIGINT               | Llave foránea a la tabla `role` |
| created_at           | DATETIME(6)          | Fecha de creación del registro |
| created_by           | BIGINT               | ID del usuario que creó el registro |
| deleted_at           | DATETIME(6)          | Fecha de eliminación del registro |
| deleted_by           | BIGINT               | ID del usuario que eliminó el registro |
| updated_at           | DATETIME(6)          | Fecha de actualización del registro |
| updated_by           | BIGINT               | ID del usuario que actualizó el registro |
| state                | BIT(1)               | Estado del registro (activo/inactivo) |

## Tabla: role
| Nombre del Campo     | Tipo de Dato         | Descripción |
|----------------------|----------------------|-------------|
| id                   | BIGINT               | Identificador único del rol |
| code                 | VARCHAR(20)          | Código del rol |
| description          | VARCHAR(255)         | Descripción del rol |
| name                 | VARCHAR(100)         | Nombre del rol |
| created_at           | DATETIME(6)          | Fecha de creación del registro |
| created_by           | BIGINT               | ID del usuario que creó el registro |
| deleted_at           | DATETIME(6)          | Fecha de eliminación del registro |
| deleted_by           | BIGINT               | ID del usuario que eliminó el registro |
| updated_at           | DATETIME(6)          | Fecha de actualización del registro |
| updated_by           | BIGINT               | ID del usuario que actualizó el registro |
| state                | BIT(1)               | Estado del registro (activo/inactivo) |

## Tabla: module
| Nombre del Campo     | Tipo de Dato         | Descripción |
|----------------------|----------------------|-------------|
| id                   | BIGINT               | Identificador único del módulo |
| code                 | VARCHAR(20)          | Código del módulo |
| description          | VARCHAR(255)         | Descripción del módulo |
| name                 | VARCHAR(100)         | Nombre del módulo |
| created_at           | DATETIME(6)          | Fecha de creación del registro |
| created_by           | BIGINT               | ID del usuario que creó el registro |
| deleted_at           | DATETIME(6)          | Fecha de eliminación del registro |
| deleted_by           | BIGINT               | ID del usuario que eliminó el registro |
| updated_at           | DATETIME(6)          | Fecha de actualización del registro |
| updated_by           | BIGINT               | ID del usuario que actualizó el registro |
| state                | BIT(1)               | Estado del registro (activo/inactivo) |

## Tabla: view
| Nombre del Campo     | Tipo de Dato         | Descripción |
|----------------------|----------------------|-------------|
| id                   | BIGINT               | Identificador único de la vista |
| code                 | VARCHAR(20)          | Código de la vista |
| description          | VARCHAR(255)         | Descripción de la vista |
| name                 | VARCHAR(100)         | Nombre de la vista |
| path                 | VARCHAR(255)         | Ruta de la vista |
| created_at           | DATETIME(6)          | Fecha de creación del registro |
| created_by           | BIGINT               | ID del usuario que creó el registro |
| deleted_at           | DATETIME(6)          | Fecha de eliminación del registro |
| deleted_by           | BIGINT               | ID del usuario que eliminó el registro |
| updated_at           | DATETIME(6)          | Fecha de actualización del registro |
| updated_by           | BIGINT               | ID del usuario que actualizó el registro |
| state                | BIT(1)               | Estado del registro (activo/inactivo) |

## Tabla: module_view
| Nombre del Campo     | Tipo de Dato         | Descripción |
|----------------------|----------------------|-------------|
| id                   | BIGINT               | Identificador único de la relación módulo-vista |
| module_id            | BIGINT               | Llave foránea a la tabla `module` |
| view_id              | BIGINT               | Llave foránea a la tabla `view` |
| created_at           | DATETIME(6)          | Fecha de creación del registro |
| created_by           | BIGINT               | ID del usuario que creó el registro |
| deleted_at           | DATETIME(6)          | Fecha de eliminación del registro |
| deleted_by           | BIGINT               | ID del usuario que eliminó el registro |
| updated_at           | DATETIME(6)          | Fecha de actualización del registro |
| updated_by           | BIGINT               | ID del usuario que actualizó el registro |
| state                | BIT(1)               | Estado del registro (activo/inactivo) |

## Tabla: role_module
| Nombre del Campo     | Tipo de Dato         | Descripción |
|----------------------|----------------------|-------------|
| id                   | BIGINT               | Identificador único de la relación rol-módulo |
| role_id              | BIGINT               | Llave foránea a la tabla `role` |
| module_id            | BIGINT               | Llave foránea a la tabla `module` |
| created_at           | DATETIME(6)          | Fecha de creación del registro |
| created_by           | BIGINT               | ID del usuario que creó el registro |
| deleted_at           | DATETIME(6)          | Fecha de eliminación del registro |
| deleted_by           | BIGINT               | ID del usuario que eliminó el registro |
| updated_at           | DATETIME(6)          | Fecha de actualización del registro |
| updated_by           | BIGINT               | ID del usuario que actualizó el registro |
| state                | BIT(1)               | Estado del registro (activo/inactivo) |
