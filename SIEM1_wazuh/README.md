# Laboratorio de Seguridad en Arquitectura de Microservicios

Este README proporciona una guía detallada para configurar y ejecutar un entorno de laboratorio basado en Docker. El laboratorio está diseñado para simular una arquitectura de microservicios protegida por diversas herramientas de seguridad open-source.

## Prerrequisitos

Antes de comenzar, asegúrate de tener instaladas las siguientes herramientas:

*   **Docker:** [Guía de instalación de Docker](https://docs.docker.com/engine/install/)
*   **Docker Compose:** [Guía de instalación de Docker Compose](https://docs.docker.com/compose/install/)
*   **Git:** [Guía de instalación de Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (Opcional, si clonas el repositorio)

## Estructura del Directorio

El laboratorio está compuesto por varios servicios y herramientas, cada uno en su propio directorio:

```
/
├── auth-service/         # Microservicio de autenticación
├── falco/                # Herramienta de detección de intrusiones en tiempo de ejecución
├── filebeat/             # Agente para el envío de logs
├── kong/                 # API Gateway
├── logstash/             # Procesador de logs
├── opa/                  # Motor de políticas (Open Policy Agent)
├── product-service/      # Microservicio de productos
├── prometheus/           # Sistema de monitoreo y alertas
├── suricata/             # Sistema de detección de intrusiones (IDS/IPS)
├── user-service/         # Microservicio de usuarios
├── docker-compose-wazuh.yml # Archivo Docker Compose para el stack de Wazuh
├── docker-compose.yml    # Archivo Docker Compose para los microservicios y herramientas
├── ejecutar.sh           # Script de ejecución (revisar contenido)
├── locustfile.py         # Script para pruebas de carga con Locust
└── ...
```

## Instalación

Puedes configurar el laboratorio de dos maneras:

### Opción A: Clonar el Repositorio (Recomendado)

Si este proyecto está en un repositorio Git, clónalo en tu máquina local:

```bash
git clone <URL_DEL_REPOSITORIO>
cd <NOMBRE_DEL_DIRECTORIO>/M3/Leccion7/Laboratorio
```

### Opción B: Creación Manual de Archivos

Si no tienes acceso al repositorio, deberás crear manualmente los directorios y archivos de configuración (`Dockerfile`, `docker-compose.yml`, etc.) según la estructura descrita. Esta guía se centrará en la ejecución asumiendo que los archivos ya existen.

## Ejecución del Laboratorio

El laboratorio se levanta en dos partes: el stack principal de la aplicación y el stack de Wazuh.

### Paso 1: Levantar el Stack Principal

Este comando iniciará todos los microservicios y las herramientas de seguridad (Suricata, Falco, Prometheus, etc.).

1.  Abre una terminal en el directorio `M3/Leccion7/Laboratorio`.
2.  Ejecuta el siguiente comando para construir y levantar los contenedores en segundo plano:

    ```bash
    docker-compose -f docker-compose.yml up --build -d
    ```

### Paso 2: Levantar el Stack de Wazuh

Wazuh se ejecuta de forma separada.

1.  En la misma terminal, ejecuta el siguiente comando para iniciar el stack de Wazuh:

    ```bash
    docker-compose -f docker-compose-wazuh.yml up --build -d
    ```

2.  **Nota:** La primera vez que inicies Wazuh, puede tardar varios minutos en que todos los componentes estén completamente operativos y saludables.

## Acceso a las Herramientas

Una vez que los contenedores estén en ejecución, puedes acceder a las diferentes herramientas a través de tu navegador web o cliente de API:

| Herramienta | URL de Acceso | Credenciales (si aplica) |
| :--- | :--- | :--- |
| **Kong (API Gateway)** | `http://localhost:8000` (Proxy) / `http://localhost:8001` (Admin) | - |
| **Prometheus** | `http://localhost:9090` | - |
| **Wazuh UI (Kibana)** | `https://localhost:5601` | `admin` / `SecretPassword` (revisar `docker-compose-wazuh.yml`) |
| **Suricata** | (Se integra con Wazuh/Logstash) | - |
| **Falco** | (Logs a través de `docker logs`) | - |

*Nota: Los puertos y credenciales pueden variar. Revisa los archivos `docker-compose.yml` y `docker-compose-wazuh.yml` para obtener los valores exactos.*

## Uso del Laboratorio

Para generar tráfico y probar las defensas, puedes utilizar el script de pruebas de carga `locustfile.py`.

1.  Asegúrate de tener Python y Locust instalados (`pip install locust`).
2.  Ejecuta Locust apuntando al API Gateway (Kong):

    ```bash
    locust -f locustfile.py --host http://localhost:8000
    ```

3.  Abre la interfaz web de Locust en `http://localhost:8089` para iniciar la simulación de carga.
4.  Observa los logs, métricas y alertas en Prometheus, Wazuh y los logs de los contenedores para ver cómo responden las herramientas de seguridad.

## Detener el Laboratorio

Para detener todos los servicios y liberar los recursos, ejecuta los siguientes comandos:

```bash
# Detener el stack principal
docker-compose -f docker-compose.yml down

# Detener el stack de Wazuh
docker-compose -f docker-compose-wazuh.yml down
```

