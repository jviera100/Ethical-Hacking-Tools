# Laboratorio 1: Simulación de Redes Segmentadas con Router e IPTables

Este laboratorio despliega una topología de red segmentada utilizando Docker, con un contenedor actuando como router/firewall y varios PCs cliente en diferentes VLANs (redes bridge de Docker).

El objetivo es practicar la configuración de redes, enrutamiento y reglas de firewall con `iptables`.

---

### Topología de Red

El laboratorio consta de los siguientes componentes:

-   **`router`**: Un contenedor Alpine Linux que actuará como router y firewall.
-   **`admin_pc`**: PC en VLAN 10 (192.168.110.10/24)
-   **`dev_pc`**: PC en VLAN 20 (192.168.120.10/24)
-   **`support_pc`**: PC en VLAN 30 (192.168.130.10/24)
-   **`internal_server`**: Servidor en VLAN 40 (192.168.140.10/24)

---

### Instrucciones de Uso

**1. Iniciar la Topología de Red:**

Desde este directorio (`lab1/`), ejecute:
```bash
docker-compose up -d
```

**2. Conectar el Router a las VLANs Adicionales:**

Una vez que los contenedores estén levantados, el `router` solo estará conectado a `vlan10`. Debe conectarlo manualmente a las otras VLANs. Ejecute los siguientes comandos en su terminal:

```bash
docker network connect --ip 192.168.120.254 subnetting_lab1_vlan20 router
docker network connect --ip 192.168.130.254 subnetting_lab1_vlan30 router
docker network connect --ip 192.168.140.254 subnetting_lab1_vlan40 router
```

**3. Configurar Reglas de IPTables en el Router:**

Acceda a la terminal del contenedor `router`:
```bash
docker exec -it router sh
```

Una vez dentro del contenedor, aplique las siguientes reglas de `iptables` para configurar el enrutamiento y el firewall:

```sh
# Política por defecto: bloquear tráfico entre contenedores
iptables -P FORWARD DROP

# Permitir administración a todas las VLANs
iptables -A FORWARD -s 192.168.110.0/24 -j ACCEPT

# Bloquear tráfico entre Desarrollo y Soporte Técnico
iptables -A FORWARD -s 192.168.120.0/24 -d 192.168.130.0/24 -j DROP
iptables -A FORWARD -s 192.168.130.0/24 -d 192.168.120.0/24 -j DROP

# Permitir acceso a servidor interno desde todas las VLANs
iptables -A FORWARD -d 192.168.140.0/24 -j ACCEPT
```

**4. Verificar la Configuración (Opcional):**

Dentro del contenedor `router`, puede usar estos comandos para verificar la configuración:

```sh
ip a
ip route
iptables -L -v --line-numbers
```

**5. Probar la Conectividad:**

Desde cualquiera de los PCs cliente (ej. `admin_pc`), puede hacer `ping` a otras IPs para verificar las reglas. Para acceder a un PC cliente:
```bash
docker exec -it admin_pc sh
```

**6. Detener el Laboratorio:**
```bash
docker-compose down
```
