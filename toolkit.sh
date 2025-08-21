#!/bin/bash

# Colores para la salida
C_RESET='\033[0m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_BLUE='\033[0;34m'
C_CYAN='\033[0;36m'

# Directorio base de las herramientas de Python
TOOLS_DIR="./python_tools/web_scanner_suite"

# --- Funciones de las Herramientas ---

run_recon() {
    echo -e "${C_BLUE}Iniciando herramienta de Reconocimiento...${C_RESET}"
    local tool_path="${TOOLS_DIR}/reconocimiento.py"
    
    if [ ! -f "$tool_path" ]; then
        echo -e "${C_RED}Error: No se encuentra el script 'reconocimiento.py'.${C_RESET}"
        return
    fi

    read -p "Ingrese la URL objetivo (ej. http://localhost:3000): " target
    
    # Activar entorno virtual y ejecutar
    (cd "$TOOLS_DIR" && source .venv/Scripts/activate && python reconocimiento.py --url "$target")
}

run_scanner() {
    echo -e "${C_BLUE}Iniciando Escáner de Puertos y Vulnerabilidades...${C_RESET}"
    local tool_path="${TOOLS_DIR}/scanner.py"

    if [ ! -f "$tool_path" ]; then
        echo -e "${C_RED}Error: No se encuentra el script 'scanner.py'.${C_RESET}"
        return
    fi

    read -p "Ingrese el host objetivo (ej. localhost): " target

    (cd "$TOOLS_DIR" && source .venv/Scripts/activate && python scanner.py --host "$target")
}

run_xss_checker() {
    echo -e "${C_BLUE}Iniciando Buscador de Vulnerabilidades XSS...${C_RESET}"
    local tool_path="${TOOLS_DIR}/xss_checker.py"

    if [ ! -f "$tool_path" ]; then
        echo -e "${C_RED}Error: No se encuentra el script 'xss_checker.py'.${C_RESET}"
        return
    fi

    read -p "Ingrese la URL del formulario a probar: " target

    (cd "$TOOLS_DIR" && source .venv/Scripts/activate && python xss_checker.py --url "$target")
}

run_sqli_tester() {
    echo -e "${C_BLUE}Iniciando Probador de Inyección SQL...${C_RESET}"
    local tool_path="${TOOLS_DIR}/sqli_tester.py"

    if [ ! -f "$tool_path" ]; then
        echo -e "${C_RED}Error: No se encuentra el script 'sqli_tester.py'.${C_RESET}"
        return
    fi

    read -p "Ingrese la URL del formulario a probar: " target

    (cd "$TOOLS_DIR" && source .venv/Scripts/activate && python sqli_tester.py --url "$target")
}

# --- Gestión del Entorno ---

setup_env() {
    echo -e "${C_BLUE}Configurando entorno virtual para las herramientas...${C_RESET}"
    if [ -d "${TOOLS_DIR}/.venv" ]; then
        echo -e "${C_GREEN}El entorno virtual ya existe.${C_RESET}"
        return
    fi

    echo "Creando entorno virtual en ${TOOLS_DIR}/.venv..."
    python -m venv "${TOOLS_DIR}/.venv"

    echo "Instalando dependencias desde requirements.txt..."
    source "${TOOLS_DIR}/.venv/Scripts/activate"
    pip install -r "${TOOLS_DIR}/requirements.txt"
    deactivate
    echo -e "${C_GREEN}Entorno configurado con éxito.${C_RESET}"
}

# --- Menú Principal ---

main_menu() {
    # Primero, asegurar que el entorno está configurado
    setup_env

    while true; do
        echo -e "\n${C_CYAN}--- Menú del Toolkit de Pentesting ---${C_RESET}"
        echo "1. Reconocimiento (Subdominios y Tecnologías)"
        echo "2. Escáner de Puertos y Vulnerabilidades"
        echo "3. Buscador de XSS"
        echo "4. Probador de Inyección SQL"
        echo "5. Salir"
        read -p "Seleccione una opción [1-5]: " choice

        case $choice in
            1)
                run_recon
                ;;
            2)
                run_scanner
                ;;
            3)
                run_xss_checker
                ;;
            4)
                run_sqli_tester
                ;;
            5)
                echo -e "${C_GREEN}Saliendo del toolkit.${C_RESET}"
                break
                ;;
            *)
                echo -e "${C_RED}Opción no válida. Por favor, intente de nuevo.${C_RESET}"
                ;;
        esac
    done
}

# Iniciar el script
main_menu
