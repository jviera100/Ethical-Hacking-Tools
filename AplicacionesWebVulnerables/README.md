# Laboratorios de Aplicaciones Web Vulnerables

Este directorio contiene una colección de aplicaciones web deliberadamente vulnerables, empaquetadas con Docker para un despliegue rápido y sencillo. 

---

### Instrucciones de Uso

Todas las aplicaciones en este directorio se gestionan con un único archivo `docker-compose.yml`.

**Para iniciar todos los laboratorios:**

Desde este directorio (`AplicacionesWebVulnerables/`), ejecute:
```bash
docker-compose up -d
```

**Para detener todos los laboratorios:**
```bash
docker-compose down
```

---

### Detalles de los Laboratorios

#### 1. OWASP Juice Shop

Una aplicación web moderna, sofisticada e increíblemente insegura, ideal para practicar hacking web en un entorno realista.

- **Acceso:** [http://localhost:3001](http://localhost:3001)
- **Credenciales:** No se requieren para empezar. ¡El objetivo es encontrarlas!

#### 2. Damn Vulnerable Web Application (DVWA)

Un clásico para aprender los fundamentos de las vulnerabilidades web más comunes en un entorno PHP/MySQL.

- **Acceso:** [http://localhost:8080](http://localhost:8080)
- **Credenciales por Defecto:**
  - **Usuario:** `admin`
  - **Contraseña:** `password`

**Nota Importante:** En su primer acceso a DVWA, deberá hacer clic en el botón **"Create / Reset Database"** en la parte inferior de la página para inicializar la base de datos y poder empezar a usar la aplicación.
