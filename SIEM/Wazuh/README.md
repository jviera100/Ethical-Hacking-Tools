# Entorno SIEM con Wazuh (Versión Re-arquitecturada)

---

### Visión del Arquitecto

Esta configuración del SIEM ha sido completamente rediseñada para ser robusta, predecible y fácil de desplegar. Se han eliminado las configuraciones ambiguas y se ha creado un único punto de entrada automatizado. El objetivo es que cualquier usuario, independientemente de su nivel de experiencia con Docker, pueda levantar un entorno de Wazuh funcional en minutos.

---

### Arquitectura del Stack

Este entorno despliega la última versión estable del stack de Wazuh, que incluye:

- **Wazuh Manager:** El núcleo del sistema, encargado de gestionar agentes, analizar datos y generar alertas.
- **Wazuh Indexer:** El motor de almacenamiento y búsqueda de datos, basado en OpenSearch.
- **Wazuh Dashboard:** La interfaz web para visualización, análisis de alertas y gestión del sistema.

---

### Requisito Indispensable: Entorno de Ejecución

Para garantizar la estabilidad y el correcto funcionamiento de esta compleja red de servicios, se recomienda encarecidamente el siguiente entorno:

- **Opción Recomendada: Máquina Virtual Linux (ej. Ubuntu/Debian en VirtualBox/VMware)**
  - **Razón:** Una VM proporciona un aislamiento completo de red y recursos. Esto es crítico para sistemas como Wazuh, previniendo conflictos y asegurando que la comunicación entre los componentes del stack sea limpia y estable.

- **Opción para Usuarios Avanzados: WSL 2**
  - Es funcional, pero la capa de red compartida con Windows puede, en ocasiones, generar inestabilidad en sistemas distribuidos complejos.

---

### Instrucciones de Despliegue

El proceso ha sido automatizado en un único script. Siga estos dos sencillos pasos:

**1. Navegue al directorio SIEM:**
```bash
cd SIEM
```

**2. Ejecute el script de inicio:**
```bash
bash start-siem.sh
```

El script se encargará de todo automáticamente:
- Ajustará los prerrequisitos del sistema (si se ejecuta en Linux).
- Generará los certificados de seguridad SSL/TLS la primera vez que se ejecute.
- Levantará todo el stack de servicios en el orden correcto.

---

### Acceso y Credenciales

Una vez finalizado el script, espere entre 2 y 5 minutos para que todos los servicios se inicien por completo.

- **URL de Acceso:** [https://localhost](https://localhost)
  - *Nota: Es normal que el navegador muestre una advertencia de seguridad, ya que los certificados son autofirmados. Simplemente acepte el riesgo para continuar.*

- **Credenciales:**
  - **Usuario:** `admin`
  - **Contraseña:** `SecretPassword`

---

### Gestión del Entorno

- **Para detener el SIEM:**
  ```bash
  # Asegúrese de estar en el directorio SIEM/
  docker-compose down
  ```

- **Para ver los logs de un servicio (ej. wazuh.manager):**
  ```bash
  # Asegúrese de estar en el directorio SIEM/
  docker-compose logs -f wazuh.manager
  ```
