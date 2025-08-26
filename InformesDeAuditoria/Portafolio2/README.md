# Portafolio 2: Backend Seguro con FastAPI, SQLite y JWT

Este proyecto es una demostración de un backend de API REST desarrollado con FastAPI, que implementa medidas de seguridad fundamentales para protegerse contra las vulnerabilidades comunes.

---

### Características de Seguridad Demostradas

Este backend es un laboratorio práctico para entender la implementación de:

-   **Autenticación Segura:** Uso de hashing de contraseñas (`bcrypt`) y tokens JWT para la gestión de sesiones.
-   **Autorización:** Control de acceso a rutas protegidas mediante roles (ej. `admin`).
-   **Prevención de Inyección SQL:** Uso de consultas parametrizadas.
-   **Prevención de XSS:** Manejo adecuado de entradas de usuario.
-   **Control de Acceso Robusto:** Rutas protegidas que requieren autenticación y validación de tokens.

---

### Configuración y Ejecución

**1. Requisitos:**

-   Python 3.x

**2. Instalación de Dependencias:**

Desde este directorio (`Portafolio2/`), instale las dependencias necesarias:
```bash
pip install -r requirements.txt
```

**3. Ejecutar la Aplicación:**

Una vez instaladas las dependencias, inicie el servidor de la API:
```bash
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

La aplicación se ejecutará en `http://localhost:8000`.

---

### Guía de Demostración

Para una guía paso a paso sobre cómo interactuar con este backend seguro y verificar sus características, consulte el archivo:

-   `Ejecucion.md`

---

### Notas Adicionales

-   **Clave Secreta JWT:** La clave secreta (`SECRET_KEY`) para los JWT está hardcodeada en `security.py` (`"supersecretkey"`). En un entorno de producción, esto debería ser una variable de entorno segura.
-   **Base de Datos:** Utiliza SQLite (`safestart.db`), que se inicializa automáticamente al iniciar la aplicación.
