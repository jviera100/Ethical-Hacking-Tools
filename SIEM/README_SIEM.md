# SIEM con Docker

Este directorio contiene la configuración para desplegar un entorno completo de SIEM (Security Information and Event Management) utilizando Docker y Docker Compose. El sistema está diseñado para ser modular y fácil de levantar.

### TL;DR (Despliegue Rápido)

```bash
# 1. Navega a la carpeta SIEM
cd EthicalHackingTools/SIEM

# 2. Levanta todos los servicios en segundo plano
docker-compose up -d --build
```

---

## Filosofía

Este proyecto sigue la filosofía **KISS (Keep It Simple, Stupid)**. El objetivo es proporcionar una solución de seguridad robusta con la mínima complejidad en su despliegue y gestión, utilizando herramientas open-source estándar en la industria.

## Requisitos Previos

- **Docker:** [Instrucciones de instalación](https://docs.docker.com/engine/install/)
- **Docker Compose:** Generalmente incluido con Docker Desktop. [Instrucciones](https://docs.docker.com/compose/install/)
- **Git:** Para clonar el repositorio.

## Despliegue

Existen dos maneras de desplegar este entorno: clonando el repositorio (recomendado) o construyéndolo desde cero (explicado en detalle).

### Opción 1: Clonando el Repositorio (Recomendado)

Este es el método más sencillo y rápido para tener el entorno funcionando.

1.  **Clonar el repositorio:**
    ```bash
    git clone <URL-del-repositorio>
    cd EthicalHackingTools/SIEM
    ```

2.  **Configurar variables de entorno (si es necesario):**
    Algunos servicios pueden requerir variables de entorno. Revisa si existen archivos `.env.example` y créales una copia llamada `.env` con los valores adecuados.
    ```bash
    # Ejemplo para el servicio API
    cd api
    copy .env.example .env
    cd ..
    ```

3.  **Levantar el entorno:**
    Este comando construirá las imágenes personalizadas y levantará todos los contenedores en modo "detached" (segundo plano).
    ```bash
    docker-compose up -d --build
    ```

4.  **Verificar el estado:**
    Para asegurar que todos los contenedores están corriendo correctamente, ejecuta:
    ```bash
    docker-compose ps
    ```

### Opción 2: Construcción desde Cero (Guía Explícita)

Esta guía te mostrará cómo construir el entorno manualmente, archivo por archivo.

1.  **Crear la estructura de directorios:**
    Primero, crea la estructura de carpetas principal.
    ```bash
    mkdir SIEM
    cd SIEM
    mkdir api auth-service backend db falco filebeat grafana kong logstash monitoring opa product-service prometheus suricata user-service zap-reports
    ```

2.  **Crear el orquestador `docker-compose.yml`:**
    En la raíz de la carpeta `SIEM`, crea el archivo `docker-compose.yml` con el siguiente contenido. Este archivo define y conecta todos los servicios.

    <details>
    <summary>Ver contenido de <code>docker-compose.yml</code></summary>

    ```yaml
    services:
      auth-service:
        build: ./auth-service
        ports: ['8000:8000']
        networks: [internal_net]
        restart: unless-stopped
    
      # ... (resto de los servicios como en el archivo original) ...

      api:
        build: ./api
        env_file: [./api/.env]
        environment: [PYTHONUNBUFFERED=1]
        ports: ["8000:8000"]
        depends_on: [jaeger, logstash]

    volumes:
      data01:
      netdataconfig:
      # ... (etc.)

    networks:
      internal_net:
      monitoring_net:
      # ... (etc.)
    ```
    *(Nota: El contenido completo del `docker-compose.yml` es extenso. Se recomienda copiarlo directamente del repositorio para evitar errores.)*
    </details>

3.  **Crear `Dockerfile` para un servicio (Ej: API):**
    Dentro de la carpeta `api`, crea un archivo llamado `Dockerfile`. Este le dice a Docker cómo construir la imagen para este servicio.

    <details>
    <summary>Ver contenido de <code>api/Dockerfile</code></summary>

    ```dockerfile
    FROM python:3.11-slim

    ENV PYTHONDONTWRITEBYTECODE=1 \
        PYTHONUNBUFFERED=1

    WORKDIR /app

    COPY requirements.txt .
    RUN pip install -U pip && pip install -r requirements.txt

    COPY . . 

    RUN chmod +x /app/entrypoint.sh

    EXPOSE 8000
    ENTRYPOINT ["/app/entrypoint.sh"]
    ```
    </details>
    
    También necesitarás los archivos que este `Dockerfile` copia, como `requirements.txt` y `entrypoint.sh`, dentro de la carpeta `api`.

4.  **Crear archivo de configuración (Ej: Logstash):**
    Dentro de `logstash`, crea una subcarpeta `pipeline`. Adentro, crea el archivo `logstash.conf` para definir cómo se procesarán los logs.

    <details>
    <summary>Ver contenido de <code>logstash/pipeline/logstash.conf</code></summary>

    ```ruby
    input {
      udp {
        port => 5044
        codec => json_lines
      }
    }
    filter {
      mutate { add_field => { "service" => "secure-api" } }
    }
    output {
      elasticsearch {
        hosts => ["http://elasticsearch:9200"]
        index => "secure-api-%{+YYYY.MM.dd}"
      }
      stdout { codec => rubydebug }
    }
    ```
    </details>

5.  **Repetir para todos los servicios:**
    Deberás repetir los pasos 3 y 4 para cada servicio definido en el `docker-compose.yml` que requiera un `Dockerfile` o archivos de configuración específicos (como `prometheus.yml`, `kong.yml`, etc.).

6.  **Levantar el entorno:**
    Una vez que todos los archivos están en su lugar, el comando final es el mismo:
    ```bash
    docker-compose up -d --build
    ```

## Componentes del Sistema
El `docker-compose.yml` orquesta los siguientes servicios clave:

-   **`api`, `auth-service`, `backend`, etc.**: Microservicios que simulan una aplicación real.
-   **`db`**: Base de datos para los servicios.
-   **`logstash`**: Procesa y enriquece los logs antes de enviarlos a Elasticsearch.
-   **`falco`**: Herramienta de seguridad en tiempo de ejecución para detectar actividad anómala.
-   **`suricata`**: Sistema de Detección de Intrusiones (IDS) basado en red.
-   **`prometheus`**: Sistema de monitoreo y alertas para métricas.
-   **`grafana`**: Plataforma para visualización de métricas y logs.
-   **`kong`**: API Gateway para gestionar el tráfico hacia los microservicios.
-   **`opa`**: Motor de políticas para control de acceso (Policy as Code).

## Acceso a las Herramientas
Una vez desplegado, puedes acceder a las interfaces web de las diferentes herramientas (los puertos pueden variar, revisa `docker-compose.yml`):

-   **Grafana:** `http://localhost:3000`
-   **Kibana/Wazuh:** `http://localhost:5601` o `http://localhost:5602`
-   **API (a través de Kong):** `http://localhost:8003`

## Detener el Entorno
Para detener y eliminar todos los contenedores, redes y volúmenes creados:

```bash
# Detiene y elimina los contenedores y redes
docker-compose down

# Para una limpieza completa (elimina también los volúmenes de datos)
docker-compose down -v
```
