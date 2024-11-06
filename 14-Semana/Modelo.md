# Modelo Relacional de Usuarios y Roles

Este modelo relacional está diseñado para gestionar usuarios, roles, módulos, vistas, y sus relaciones. A continuación, se describe cada tabla y sus relaciones en el sistema:

## Tablas

### 1. **person**
   - **Descripción**: Almacena la información básica de las personas.
   - **Campos**:
     - `id`: Identificador único.
     - `address`: Dirección de la persona.
     - `document_num`: Número de documento.
     - `document_type`: Tipo de documento.
     - `email`: Correo electrónico de la persona.
     - `first_name`: Primer nombre.
     - `last_name`: Primer apellido.
     - `middle_name`: Segundo nombre.
     - `phone`: Número de teléfono.
     - `second_last_name`: Segundo apellido.
     - **Campos de auditoría**: `created_at`, `created_by`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, y `state`.

### 2. **user**
   - **Descripción**: Representa a los usuarios del sistema y está relacionada con la tabla `person`.
   - **Campos**:
     - `id`: Identificador único.
     - `password`: Contraseña del usuario.
     - `username`: Nombre de usuario.
     - `person_id`: Llave foránea hacia la tabla `person`, indicando la persona asociada a este usuario.
     - **Campos de auditoría**: `created_at`, `created_by`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, y `state`.

### 3. **role**
   - **Descripción**: Define los roles dentro del sistema.
   - **Campos**:
     - `id`: Identificador único.
     - `code`: Código del rol.
     - `description`: Descripción del rol.
     - `name`: Nombre del rol.
     - **Campos de auditoría**: `created_at`, `created_by`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, y `state`.

### 4. **user_role**
   - **Descripción**: Relación muchos a muchos entre `user` y `role`, permitiendo que un usuario tenga múltiples roles.
   - **Campos**:
     - `id`: Identificador único.
     - `role_id`: Llave foránea hacia `role`.
     - `user_id`: Llave foránea hacia `user`.
     - **Campos de auditoría**: `created_at`, `created_by`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, y `state`.

### 5. **module**
   - **Descripción**: Representa los módulos del sistema.
   - **Campos**:
     - `id`: Identificador único.
     - `code`: Código del módulo.
     - `description`: Descripción del módulo.
     - `name`: Nombre del módulo.
     - **Campos de auditoría**: `created_at`, `created_by`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, y `state`.

### 6. **view**
   - **Descripción**: Representa las vistas dentro de cada módulo.
   - **Campos**:
     - `id`: Identificador único.
     - `code`: Código de la vista.
     - `description`: Descripción de la vista.
     - `name`: Nombre de la vista.
     - `path`: Ruta de la vista.
     - **Campos de auditoría**: `created_at`, `created_by`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, y `state`.

### 7. **module_view**
   - **Descripción**: Relación muchos a muchos entre `module` y `view`, indicando las vistas que pertenecen a cada módulo.
   - **Campos**:
     - `id`: Identificador único.
     - `module_id`: Llave foránea hacia `module`.
     - `view_id`: Llave foránea hacia `view`.
     - **Campos de auditoría**: `created_at`, `created_by`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, y `state`.

### 8. **role_module**
   - **Descripción**: Relación muchos a muchos entre `role` y `module`, permitiendo que un rol tenga acceso a varios módulos.
   - **Campos**:
     - `id`: Identificador único.
     - `module_id`: Llave foránea hacia `module`.
     - `role_id`: Llave foránea hacia `role`.
     - **Campos de auditoría**: `created_at`, `created_by`, `deleted_at`, `deleted_by`, `updated_at`, `updated_by`, y `state`.

## Relaciones

1. **Persona - Usuario**: Cada usuario está asociado a una persona a través de la relación `person_id` en la tabla `user`.
2. **Usuario - Rol**: La relación `user_role` permite que un usuario pueda tener múltiples roles y que cada rol pueda estar asignado a varios usuarios.
3. **Módulo - Vista**: La relación `module_view` establece las vistas que pertenecen a cada módulo, permitiendo organizar las vistas dentro de los módulos correspondientes.
4. **Rol - Módulo**: La relación `role_module` define qué módulos están accesibles para cada rol, estableciendo permisos a nivel de módulo.

## Campos de Auditoría
Cada tabla incluye campos de auditoría para realizar un seguimiento de las modificaciones, eliminaciones y el estado del registro:
   - `created_at`, `created_by`: Fecha y usuario que creó el registro.
   - `updated_at`, `updated_by`: Fecha y usuario que actualizó el registro.
   - `deleted_at`, `deleted_by`: Fecha y usuario que eliminó el registro.
   - `state`: Indica el estado activo (1) o inactivo (0) del registro.

Este modelo es robusto y flexible, permitiendo una estructura jerárquica de roles, módulos y vistas, ideal para gestionar el acceso y las operaciones de usuarios dentro de un sistema complejo.
