
# Laboratorio Consolidado de Hacking Ético

Este proyecto consolida los diversos laboratorios, servicios vulnerables y herramientas de pentesting del "Curso de Hacking Ético en Aplicativos Web 2025" en un único entorno portable y fácil de desplegar. El objetivo es proporcionar un campo de entrenamiento autocontenido que se pueda levantar y destruir con simples comandos.

---

## Arquitectura del Laboratorio

Este entorno está orquestado por Docker Compose y se compone de los siguientes servicios principales:

### Aplicaciones Web Vulnerables (Objetivos)

| Servicio | URL de Acceso | Credenciales por Defecto |
| :--- | :--- | :--- |
| **OWASP Juice Shop** | `http://localhost:3000` | N/A (autenticación propia) |
| **DVWA** | `http://localhost:8080` | `admin` / `password` |

### Laboratorio de Microservicios y Monitoreo (SIEM)

| Servicio | URL/Puerto de Acceso | Propósito |
| :--- | :--- | :--- |
| **Kibana** | `http://localhost:5601` | Visualización de logs y SIEM |
| **Elasticsearch** | `localhost:9200` | Almacenamiento y búsqueda de logs |
| **Logstash** | `localhost:5044` | Ingesta y procesamiento de logs |
| **Auth Service** | `http://localhost:5001` | Microservicio de autenticación |
| **User Service** | `http://localhost:5002` | Microservicio de usuarios |
| **Product Service** | `http://localhost:5003` | Microservicio de productos |
| **OPA** | `http://localhost:8181` | Motor de políticas de seguridad |
| **Locust** | `http://localhost:8089` | Herramienta de pruebas de carga |

---

## Guía de Inicio Rápido

### Prerrequisitos

- **Docker**: [Instrucciones de instalación](https://docs.docker.com/get-docker/)
- **Docker Compose**: Generalmente incluido con Docker Desktop.
- Un cliente de terminal con **Bash** (como Git Bash en Windows, o cualquier terminal en Linux/macOS).

### 1. Levantar el Laboratorio

Para iniciar todos los servicios en segundo plano, navega a la raíz de este directorio (`ConsolidatedEthicalHackingLab`) y ejecuta:

```bash
docker-compose up -d
```

El primer despliegue puede tardar varios minutos mientras Docker descarga las imágenes base y construye los servicios personalizados.

### 2. Usar el Toolkit de Pentesting en Python

El script `toolkit.sh` es un lanzador para las herramientas de escaneo basadas en Python. Para usarlo:

**a. Dar permisos de ejecución al script (solo la primera vez):**
```bash
chmod +x toolkit.sh
```

**b. Ejecutar el toolkit:**
```bash
./toolkit.sh
```

Se presentará un menú interactivo. La primera vez que se ejecute, el script creará automáticamente un entorno virtual de Python y instalará todas las dependencias necesarias.

### 3. Detener y Limpiar el Laboratorio

Para detener todos los contenedores en ejecución, ejecuta:

```bash
docker-compose down
```

Para eliminar también los volúmenes de datos (como la base de datos de DVWA y los logs de Elasticsearch), ejecuta:

```bash
docker-compose down -v
```

---

Proyecto consolidado por IA para fines educativos.
