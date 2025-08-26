# Laboratorio 2: Comentarios Vulnerables (XSS)

Este laboratorio contiene una aplicación web PHP/MySQL simple que implementa un formulario de comentarios. Está diseñado para demostrar vulnerabilidades de **Cross-Site Scripting (XSS)**, tanto reflejado como almacenado, debido a la falta de sanitización de la entrada y salida.

---

### Requisitos

-   Un servidor web con soporte para PHP (versión 7.x o superior recomendada).
-   Un servidor de base de datos MySQL/MariaDB.
-   **XAMPP, WAMP o LAMP** son entornos ideales para este laboratorio.

---

### Configuración del Laboratorio

Siga estos pasos para configurar y ejecutar el laboratorio:

**1. Copiar los Archivos:**

-   Copie todo el contenido de este directorio (`lab2/`) al directorio de documentos de su servidor web (ej. `htdocs` en XAMPP).
    -   Si lo copia directamente en `htdocs`, la URL será `http://localhost/lab2/`.

**2. Configurar la Base de Datos:**

-   Acceda a su gestor de base de datos (ej. phpMyAdmin en XAMPP).
-   Cree una nueva base de datos con el nombre `vuln_lab`.
-   Importe el archivo `scripts.sql` en esta nueva base de datos.

**3. Verificar la Conexión a la Base de Datos:**

-   El archivo `db.php` está configurado para conectarse a:
    -   **Servidor:** `localhost`
    -   **Usuario:** `root`
    -   **Contraseña:** (vacía)
    -   **Base de Datos:** `vuln_lab`
    -   **Puerto:** `3307`

-   **Si su configuración de MySQL es diferente (ej. puerto 3306, usuario con contraseña), deberá editar el archivo `db.php` para que coincida con sus credenciales.**

---

### Acceso al Laboratorio

Una vez configurado, acceda a la aplicación a través de su navegador web. Si copió los archivos a `htdocs/lab2/`:

-   **URL:** [http://localhost/lab2/](http://localhost/lab2/)

---

### Demostración de la Vulnerabilidad (XSS)

Para demostrar la vulnerabilidad de XSS, intente introducir código JavaScript en el campo de comentario, como por ejemplo:

```html
<script>alert('XSS Vulnerable!');</script>
```

Al enviar el comentario, el script debería ejecutarse en el navegador, demostrando la inyección de código.
