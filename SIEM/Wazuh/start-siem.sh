#!/bin/bash

# Script para desplegar el entorno SIEM de Wazuh de forma automatizada.
# Creado por el Arquitecto de Ciberseguridad del MIT.

# Terminar el script si cualquier comando falla.
set -e

# Cambiar al directorio donde se encuentra el script para que las rutas relativas funcionen.
cd "$(dirname "$0")"

echo "================================================="
echo "    INICIANDO DESPLIEGUE DEL SIEM WAZUH"
echo "================================================="

# --- PASO 1: Verificar Prerrequisitos del Host ---
echo "
### PASO 1: Verificando prerrequisitos del sistema anfitrión..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Sistema Linux detectado. Ajustando vm.max_map_count..."
    # Este valor es requerido por Wazuh Indexer (Elasticsearch).
    sudo sysctl -w vm.max_map_count=262144
else
    echo "Sistema no-Linux detectado. Omitiendo ajuste de vm.max_map_count. Asegúrese de que su entorno (ej. Docker Desktop en WSL 2) tenga los recursos adecuados."
fi

# --- PASO 2: Generar Certificados SSL/TLS ---
echo "
### PASO 2: Verificando la existencia de certificados..."

if [ -f "wazuh_config/wazuh_indexer_ssl_certs/wazuh.indexer.pem" ]; then
    echo "Los certificados ya existen. Omitiendo generación."
else
    echo "No se encontraron certificados. Generando nuevos certificados..."
    docker-compose -f generate-certs.yml run --rm generator
    echo "Certificados generados con éxito."
fi

# --- PASO 3: Levantar el Stack de Wazuh ---
echo "
### PASO 3: Iniciando todos los servicios de Wazuh..."

docker-compose up -d

# --- FINALIZADO ---
echo "
================================================="
echo "      ✅ ¡DESPLIEGUE COMPLETADO! ✅"
echo "================================================="
echo "
El sistema puede tardar entre 2 y 5 minutos en estar completamente operativo.

Acceso a la Interfaz Web:
- URL: https://localhost
- Usuario: admin
- Contraseña: SecretPassword

Para detener el entorno, ejecute: docker-compose down
"