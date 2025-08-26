# Portafolio 1: Backend Vulnerable con FastAPI y SQLite

Este proyecto contiene un backend de API REST desarrollado con FastAPI y SQLite, diseñado intencionalmente con diversas vulnerabilidades para fines educativos y de laboratorio de seguridad.

---

### Vulnerabilidades Demostradas

Este backend es un laboratorio práctico para explorar y explotar:

-   **Cross-Site Scripting (XSS)**
-   **Inyección SQL (SQLi)**
-   **Escalada de Privilegios**
-   **Autenticación Rota (Broken Authentication)**
-   **Control de Acceso Roto (Broken Access Control)**

---

### Configuración y Ejecución

**1. Requisitos:**

-   Python 3.x

**2. Instalación de Dependencias:**

Desde este directorio (`Portafolio1/`), instale las dependencias necesarias:
```bash
pip install -r requirements.txt
```

**3. Ejecutar la Aplicación:**

Una vez instaladas las dependencias, inicie el servidor de la API:
```bash
uvicorn main:app --host 0.0.0.0 --port 8000
```

La aplicación se ejecutará en `http://localhost:8000`.

---

### Guía de Explotación

Para una guía paso a paso sobre cómo explotar las vulnerabilidades de este backend, consulte el archivo:

-   `Ejecucion.md`

---

### Informe y Evidencias

Los resultados y evidencias de la explotación de este laboratorio se encuentran en:

-   `informe.html`
-   `Screenshot*.png` (capturas de pantalla)

---
