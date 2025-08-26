# Servidor Web con Nginx

Este directorio contiene una configuración de Docker para desplegar un servidor web Nginx simple.

El servidor está configurado para servir una página estática (`index.html`) y puede ser fácilmente modificado.

---

### Instrucciones de Uso

**1. Iniciar el Servidor:**

Desde este directorio (`nginx/`), ejecute:
```bash
docker-compose up -d
```

**2. Detener el Servidor:**
```bash
docker-compose down
```

---

### Acceso

Una vez iniciado, puede acceder a la página web en su navegador a través de:

- **URL:** [http://localhost](http://localhost)

---

### Personalización

La configuración es completamente personalizable de forma sencilla:

- **Para cambiar el contenido de la página web:** Edite el archivo `app/index.html`.
- **Para cambiar la configuración de Nginx:** Edite el archivo `nginx.conf`.

Los cambios se aplicarán la próxima vez que reinicie el contenedor (`docker-compose restart`).
