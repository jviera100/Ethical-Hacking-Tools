# Arsenal de Hacking Ético y Ciberseguridad

---

### Visión del Arquitecto

Este repositorio es una navaja suiza de ciberseguridad, consolidando un arsenal de laboratorios, herramientas y sistemas para la práctica y el estudio del hacking ético. Ha sido revisado y re-arquitecturado para que cada componente sea fácil de desplegar, robusto y esté bien documentado, permitiendo al usuario centrarse en el aprendizaje y no en la configuración.

---

### Requisitos Globales

Para utilizar este arsenal, es indispensable contar con el siguiente software:

- **Docker:** [https://www.docker.com/get-started](https://www.docker.com/get-started)
- **Docker Compose:** Generalmente incluido con Docker Desktop.

#### Entorno de Ejecución Recomendado

Este proyecto, debido a su complejidad y al uso intensivo de redes de contenedores y scripts de sistema, está **optimizado para un entorno de ejecución Linux nativo o una máquina virtual (VM) dedicada**.

- **Opción 1 (Recomendada): Máquina Virtual (ej. VirtualBox, VMware)**
  - **Razón:** Ofrece el **máximo aislamiento y estabilidad**. La VM tiene su propia pila de red y recursos dedicados, lo que evita conflictos y comportamientos inesperados, especialmente al desplegar sistemas complejos como el SIEM.

- **Opción 2 (Avanzado): Subsistema de Windows para Linux (WSL 2)**
  - Es funcional, pero la capa de red compartida con Windows puede generar inestabilidad en sistemas distribuidos complejos. Úselo si se siente cómodo depurando problemas de red.

---

### Mapa del Repositorio

- `SIEM/`: Contiene un sistema de **Gestión de Información y Eventos de Seguridad (SIEM)** basado en Wazuh. Ha sido re-diseñado para un despliegue automatizado.
- `AplicacionesWebVulnerables/`: Laboratorios para practicar hacking web, incluyendo **OWASP Juice Shop** y **DVWA**.
- `HerramientasYServicios/`: Colección de herramientas y servicios de seguridad y red, como **Kali Linux**, **OpenVAS**, un servidor **DNS** y **Nginx**.
- `Subnetting/`: Laboratorios basados en Docker para practicar la **segmentación de redes**.
- `LaboratoriosWebPHP_MySQL/`: Aplicaciones web vulnerables en PHP/MySQL diseñadas para un entorno **no-Docker** (como XAMPP/WAMP).
- `InformesDeAuditoria/` y `DiagramasDeArquitectura/`: Ejemplos de artefactos y documentos de soporte para auditorías y diseño de sistemas.

---

### Flujos de Trabajo Principales

A continuación se muestran las instrucciones para los casos de uso más comunes.

#### Workflow 1: Desplegar el SIEM con Wazuh

El SIEM es el componente más complejo, pero su despliegue ha sido completamente automatizado.

1.  Navegue al directorio:
    ```bash
    cd SIEM
    ```
2.  Ejecute el script de inicio:
    ```bash
    bash start-siem.sh
    ```
    El script se encargará de todo. Consulte el `SIEM/README.md` para más detalles sobre el acceso y credenciales.

#### Workflow 2: Iniciar Laboratorios de Hacking Web

Para practicar con aplicaciones web vulnerables:

1.  Navegue al directorio:
    ```bash
    cd AplicacionesWebVulnerables
    ```
2.  Levante los servicios:
    ```bash
    docker-compose up -d
    ```
- **OWASP Juice Shop:** [http://localhost:3001](http://localhost:3001)
- **DVWA:** [http://localhost:8080](http://localhost:8080)

#### Workflow 3: Utilizar una Herramienta Específica (ej. Kali Linux)

Para iniciar un contenedor con una herramienta individual:

1.  Navegue al directorio de la herramienta:
    ```bash
    cd HerramientasYServicios/KaliLinux
    ```
2.  Inicie el contenedor:
    ```bash
    docker-compose up
    ```

---

### Sobre los Otros Servicios en SIEM

Como observaste, el directorio `SIEM/` contiene muchas otras carpetas de servicios (`api`, `backend`, `falco`, `opa`, etc.). Estos parecen formar parte de una arquitectura de microservicios más grande que, en el estado actual del repositorio, no está orquestada ni documentada. La integración y el despliegue de estos componentes es un tema avanzado que queda fuera del alcance de la re-arquitectura actual del stack de Wazuh.
