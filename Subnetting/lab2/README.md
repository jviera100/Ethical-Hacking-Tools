# Laboratorio 2: Simulación de Redes Segmentadas con Router Automatizado

Este laboratorio es una mejora del Laboratorio 1, donde el proceso de conexión del router a las diferentes subredes y la asignación de IPs adicionales se realiza de forma automatizada mediante un script.

El objetivo es desplegar una topología de red segmentada y verificar la conectividad entre los diferentes segmentos.

---

### Topología de Red

El laboratorio consta de los siguientes componentes:

-   **`router`**: Un contenedor Alpine Linux que actuará como router.
-   **`admin_pc`**: PC en subred 192.168.100.0/27 (IP: 192.168.100.10)
-   **`finance_pc`**: PC en subred 192.168.100.32/27 (IP: 192.168.100.34)
-   **`hr_pc`**: PC en subred 192.168.100.64/27 (IP: 192.168.100.66)
-   **`prod_pc`**: PC en subred 192.168.100.96/27 (IP: 192.168.100.98)

---

### Instrucciones de Uso

**1. Ejecutar el Script de Despliegue Automatizado:**

Desde este directorio (`lab2/`), ejecute el script `connect-router.sh`:
```bash
bash connect-router.sh
```

Este script realizará automáticamente los siguientes pasos:
-   Limpiará cualquier entorno Docker anterior.
-   Levantará los contenedores definidos en `docker-compose.yml`.
-   Conectará el `router` a todas las subredes necesarias.
-   Asignará las IPs adicionales a las interfaces del `router`.
-   Realizará pings de verificación desde el `router` a cada PC.

**2. Probar la Conectividad (Opcional):**

Una vez que el script haya finalizado, puede acceder a cualquiera de los PCs cliente (ej. `admin_pc`) y probar la conectividad con otros segmentos de red.

Para acceder a un PC cliente:
```bash
docker exec -it admin_pc sh
```

**3. Detener el Laboratorio:**

Para detener y limpiar el entorno, ejecute:
```bash
docker-compose down
```
