# Laboratorio 3: Enrutamiento Básico entre Subredes

Este laboratorio despliega una topología de red con un router central y múltiples PCs cliente, cada uno en su propia subred (VLAN). El router está preconfigurado para reenviar paquetes entre estas subredes.

El objetivo es comprender el enrutamiento básico y verificar la conectividad entre diferentes segmentos de red.

---

### Topología de Red

El laboratorio consta de los siguientes componentes:

-   **`router`**: Un contenedor Ubuntu que actúa como router, con una interfaz en cada VLAN.
-   **`pc1`**: PC en VLAN 10 (10.100.10.10/26)
-   **`pc2`**: PC en VLAN 20 (10.100.20.10/26)
-   **`pc3`**: PC en VLAN 30 (10.100.30.10/26)
-   **`pc4`**: PC en VLAN 40 (10.100.40.10/26)

---

### Instrucciones de Uso

**1. Iniciar la Topología de Red:**

Desde este directorio (`lab3/`), ejecute:
```bash
docker-compose up -d
```

**2. Ejecutar las Pruebas de Conectividad:**

Una vez que los contenedores estén levantados, puede ejecutar el script `test.sh` para verificar la conectividad:
```bash
bash test.sh
```

Este script realizará pings desde el router a cada PC y entre los PCs, mostrando los resultados en la consola.

**3. Interacción Manual (Opcional):**

Para acceder a la terminal de cualquier PC o del router, use `docker exec`:

```bash
# Acceder a pc1
docker exec -it pc1 bash

# Acceder al router
docker exec -it laboratorio-router bash
```

**4. Detener el Laboratorio:**
```bash
docker-compose down
```
