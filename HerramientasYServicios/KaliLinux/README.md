# Entorno de Pentesting con Kali Linux

Este directorio despliega un contenedor de Kali Linux con una configuración de alta permisividad, ideal para laboratorios de pentesting avanzados.

---

### ⚠️ ADVERTENCIA DE SEGURIDAD IMPORTANTE ⚠️

Esta configuración utiliza las opciones `privileged: true` y `network_mode: host` en Docker. Esto significa que:

1.  **El contenedor tiene acceso de `root` a los dispositivos de su máquina anfitriona (`host`).**
2.  **El contenedor opera en la misma red que su `host`, no en una red aislada de Docker.**

Esta configuración es **extremadamente poderosa** para realizar análisis de red y otras tareas de pentesting, pero también **elimina muchas de las barreras de seguridad de la contenedorización.**

**NO ejecute software no confiable dentro de este contenedor.** Úselo solo para fines de aprendizaje y laboratorio.

---

### Instrucciones de Uso

**1. Iniciar una Sesión Interactiva:**

Desde este directorio (`KaliLinux/`), ejecute:
```bash
docker-compose up
```
Este comando construirá la imagen (la primera vez) y le dejará directamente en una terminal de `root` (`#`) dentro del contenedor de Kali.

**2. Persistencia de Datos:**

El directorio `/root` dentro del contenedor está mapeado al directorio local `kali-data/`. Cualquier archivo, script o herramienta que guarde en `/root` se conservará en su máquina anfitriona, incluso después de detener el contenedor.

**3. Reconectarse a un Contenedor en Ejecución:**

Si dejó el contenedor corriendo en segundo plano (con `docker-compose up -d`), puede volver a entrar en él en cualquier momento con:
```bash
docker exec -it kali_pentest_box bash
```

**4. Detener el Entorno:**

Para detener y eliminar el contenedor, presione `Ctrl+C` en la terminal donde ejecutó `docker-compose up`, o ejecute:
```bash
docker-compose down
```
