# Laboratorio 1: Formulario de Comentarios PHP/MySQL (con CSRF Token)

Este laboratorio contiene una aplicación web PHP/MySQL simple que implementa un formulario de comentarios. Está diseñado para ser desplegado en un entorno de servidor web tradicional (como XAMPP, WAMP o LAMP).

El laboratorio incluye un token CSRF, lo que lo hace ideal para estudiar la protección contra ataques de Cross-Site Request Forgery (CSRF) o para intentar encontrar formas de bypassar dicha protección.

---

### Requisitos

-   Un servidor web con soporte para PHP (versión 7.x o superior recomendada).
-   Un servidor de base de datos MySQL/MariaDB.
-   **XAMPP, WAMP o LAMP** son entornos ideales para este laboratorio.

---

### Configuración del Laboratorio

Siga estos pasos para configurar y ejecutar el laboratorio:

**1. Copiar los Archivos:**

-   Copie todo el contenido de este directorio (`lab1/`) al directorio de documentos de su servidor web (ej. `htdocs` en XAMPP).
    -   Si lo copia directamente en `htdocs`, la URL será `http://localhost/lab1/`.

**2. Configurar la Base de Datos:**

-   Acceda a su gestor de base de datos (ej. phpMyAdmin en XAMPP).
-   Cree una nueva base de datos con el nombre `seguridad_lab`.
-   Importe el archivo `script.sql` en esta nueva base de datos.

**3. Verificar la Conexión a la Base de Datos:**

-   El archivo `conexion.php` está configurado para conectarse a:
    -   **Servidor:** `127.0.0.1`
    -   **Usuario:** `root`
    -   **Contraseña:** (vacía)
    -   **Base de Datos:** `seguridad_lab`
    -   **Puerto:** `3307`

-   **Si su configuración de MySQL es diferente (ej. puerto 3306, usuario con contraseña), deberá editar el archivo `conexion.php` para que coincida con sus credenciales.**

---

### Acceso al Laboratorio

Una vez configurado, acceda a la aplicación a través de su navegador web. Si copió los archivos a `htdocs/lab1/`:

-   **URL:** [http://localhost/lab1/](http://localhost/lab1/)

---
