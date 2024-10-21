
# Manual de Configuración de Contenedores MySQL y Creación de Base de Datos

---

## 1. Montaje de Contenedores MySQL  
A continuación, se presentan los pasos para montar tres contenedores MySQL con puertos específicos y contraseñas personalizadas.

### **Contenedores a montar:**
- **serve-mysql-g1:** puerto 3310, contraseña personalizada  
- **serve-mysql-g2:** puerto 3311, contraseña personalizada  
- **serve-mysql-g3:** puerto 3313, contraseña personalizada  

#### **Comando para ejecutar cada contenedor:**
```bash
docker run -d --name serve-mysql-g1 -e MYSQL_ROOT_PASSWORD=personalizada -p 3310:3306 mysql:latest
docker run -d --name serve-mysql-g2 -e MYSQL_ROOT_PASSWORD=personalizada -p 3311:3306 mysql:latest
docker run -d --name serve-mysql-g3 -e MYSQL_ROOT_PASSWORD=personalizada -p 3313:3306 mysql:latest
```

#### **Captura de pantalla:**
Incluya una captura después de que los contenedores estén corriendo, mostrando el resultado del siguiente comando:

```bash
docker ps
```

---

## 2. Creación de la Base de Datos `db_security`  
Para la gestión de seguridad, crearemos la base de datos **`db_security`** y ejecutaremos las sentencias DDL y DML necesarias.

### **Proceso de creación:**
```sql
DROP DATABASE IF EXISTS db_security;
CREATE DATABASE db_security;
USE db_security;
```

### **Campos de auditoría:**  
Cada tabla en la base de datos debe incluir los siguientes campos de auditoría:  
- `state`  
- `createdAt`  
- `updatedAt`  
- `deletedAt`  
- `createdBy`  
- `updatedBy`  
- `deletedBy`  

---

## 3. Consulta con INNER JOIN  
A continuación, se muestra un ejemplo de una consulta para validar si un usuario tiene credenciales activas. Esta consulta retorna el nombre completo y el nombre de usuario.

### **Ejemplo de consulta:**
```sql
USE db_security;
SELECT 
    CONCAT(p.first_name, ' ', p.middle_name, ' ', p.last_name, ' ', p.second_last_name) AS nombre,
    u.username AS usuario
FROM 
    person p
INNER JOIN 
    user u ON p.id = u.person_id
WHERE 
    u.username = 'johndoe' 
    AND u.password = 'hashed_password_1' 
    AND u.state = true;
```

---

## 4. Actualización del estado de usuario  
Para activar las credenciales de un usuario, se utiliza la siguiente instrucción SQL:

```sql
UPDATE user 
SET state = true 
WHERE id = 4;
```

---

## 5. Enlaces adicionales de referencia  
- [Lista de clases con correo](https://plus.corhuila.edu.co/sgacampus/#matr43)  
- [Ingreso de notas](https://plus.corhuila.edu.co/sgacampus/#notf10)  
- [Inasistencia de estudiantes](https://plus.corhuila.edu.co/sgacampus/#notf18)  

---

Este manual permite configurar contenedores MySQL y realizar la gestión de usuarios en una base de datos de seguridad.
