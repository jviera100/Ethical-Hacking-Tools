# Repositorio de Laboratorios de Hacking Ético

Este repositorio contiene una colección de laboratorios, herramientas y aplicaciones para practicar diversas áreas de la ciberseguridad y el hacking ético. El proyecto ha sido reestructurado en carpetas temáticas para eliminar redundancias y facilitar el acceso y la ejecución de cada componente.

## Estructura del Repositorio

A continuación se describe el contenido de cada una de las carpetas principales:

- **`siem/`**: Contiene un entorno completo de SIEM (Security Information and Event Management) consolidado, con herramientas como Wazuh, Elasticsearch, Kibana, Suricata, Falco, y más.
- **`AplicacionesWebVulnerables/`**: Agrupa aplicaciones web deliberadamente vulnerables, como OWASP Juice Shop y DVWA, para practicar hacking web.
- **`Subnetting/`**: Incluye varios laboratorios para practicar la segmentación de redes (subnetting) y configuración de topologías de red con Docker.
- **`AplicacionesPython/`**: Colección de diversas aplicaciones desarrolladas en Python, incluyendo apps web con Flask, scripts de base de datos y aplicaciones full-stack.
- **`LaboratoriosWebPHP_MySQL/`**: Contiene aplicaciones web de ejemplo desarrolladas en PHP y MySQL, útiles para entender vulnerabilidades comunes en este tipo de entornos.
- **`InformesDeAuditoria/`**: Contiene ejemplos de informes, scripts y otros artefactos relacionados con portafolios de auditoría de ciberseguridad.
- **`HerramientasYServicios/`**: Agrupa herramientas de seguridad (OpenVAS, Kali Linux), servicios de red (DNS) y configuraciones para servidores web (Nginx, Traefik).
- **`DiagramasDeArquitectura/`**: Material conceptual, diagramas y documentos de diseño, como el ejemplo de Flujo de Login Universal.

## Instrucciones de Uso

### 1. Entorno SIEM

Para levantar todo el stack de monitoreo y seguridad:

```bash
cd siem
docker-compose up -d
```

### 2. Aplicaciones Web Vulnerables

Esta carpeta contiene OWASP Juice Shop y DVWA. Para iniciarlas:

```bash
cd AplicacionesWebVulnerables
docker-compose up -d
```
- **OWASP Juice Shop** estará disponible en `http://localhost:3001`.
- **DVWA** estará disponible en `http://localhost:8080`.

### 3. Laboratorios de Subnetting

Cada laboratorio en esta carpeta es un escenario de red independiente. Para ejecutar uno, entra en el subdirectorio correspondiente.

```bash
cd Subnetting/lab1  # o lab2, lab3
docker-compose up -d
```

### 4. Aplicaciones Python

Cada aplicación es independiente. Navega a su subdirectorio y sigue las instrucciones de sus archivos (`README.md`, `requirements.txt`, etc.).

### 5. Laboratorios Web PHP con MySQL

Estos laboratorios están diseñados para ser ejecutados en un entorno como XAMPP, aunque también puedes adaptarlos a Docker. El código fuente y los scripts de base de datos se encuentran en sus respectivas carpetas (`lab1`, `lab2`).

### 6. Herramientas y Servicios

Cada herramienta o servicio tiene su propia configuración. Entra en el subdirectorio de tu interés (`KaliLinux`, `nginx`, `openvas`, etc.) y utiliza el `docker-compose.yml` correspondiente.

- **Ejemplo con Kali Linux:**
  ```bash
  cd HerramientasYServicios/KaliLinux
  docker-compose up
  ```