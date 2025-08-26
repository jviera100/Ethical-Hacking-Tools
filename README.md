# Arsenal de Hacking Ético y Ciberseguridad

---

### Visión del Arquitecto

Este repositorio es una navaja suiza de ciberseguridad, consolidando un arsenal de laboratorios, herramientas y sistemas para la práctica y el estudio del hacking ético. Ha sido **completamente re-arquitecturado** para que cada componente sea fácil de desplegar, robusto y esté bien documentado, permitiendo al usuario centrarse en el aprendizaje y no en la configuración.

Cada directorio principal ahora funciona como un **módulo independiente**, con su propia documentación detallada (`README.md`) que explica su propósito y cómo utilizarlo.

---

### Requisitos Globales

Para utilizar este arsenal, es indispensable contar con el siguiente software:

-   **Docker:** [https://www.docker.com/get-started](https://www.docker.com/get-started)
-   **Docker Compose:** Generalmente incluido con Docker Desktop.

#### Entorno de Ejecución Recomendado

Este proyecto, debido a su complejidad y al uso intensivo de redes de contenedores y scripts de sistema, está **optimizado para un entorno de ejecución Linux nativo o una máquina virtual (VM) dedicada**.

-   **Opción 1 (Recomendada): Máquina Virtual (ej. VirtualBox, VMware)**
    -   **Razón:** Ofrece el **máximo aislamiento y estabilidad**. La VM tiene su propia pila de red y recursos dedicados, lo que evita conflictos y comportamientos inesperados, especialmente al desplegar sistemas complejos como el SIEM.

-   **Opción 2 (Avanzado): Subsistema de Windows para Linux (WSL 2)**
    -   Es funcional, pero la capa de red compartida con Windows puede generar inestabilidad en sistemas distribuidos complejos. Úselo si se siente cómodo depurando problemas de red.

---

### Mapa del Repositorio (Módulos Principales)

Navegue a cada directorio para encontrar su `README.md` específico con instrucciones detalladas.

-   **`SIEM/`**
    -   Sistema de Gestión de Información y Eventos de Seguridad (Wazuh, Logstash, Prometheus, Grafana, etc.).
    -   **Ver `SIEM/README.md` para instrucciones detalladas.**

-   **`AplicacionesWebVulnerables/`**
    -   Laboratorios para practicar hacking web (OWASP Juice Shop, DVWA).
    -   **Ver `AplicacionesWebVulnerables/README.md` para instrucciones detalladas.**

-   **`HerramientasYServicios/`**
    -   Colección de herramientas y servicios de seguridad y red (Kali Linux, Nginx, OpenVAS, DNS Server).
    -   **Ver `HerramientasYServicios/README.md` para instrucciones detalladas.**

-   **`InformesDeAuditoria/`**
    -   Proyectos de portafolio que demuestran backends vulnerables y seguros, junto con sus informes.
    -   **Ver `InformesDeAuditoria/README.md` para instrucciones detalladas.**

-   **`LaboratoriosWebPHP_MySQL/`**
    -   Aplicaciones web vulnerables en PHP/MySQL diseñadas para un entorno tradicional (XAMPP/WAMP/LAMP).
    -   **Ver `LaboratoriosWebPHP_MySQL/README.md` para instrucciones detalladas.**

-   **`Subnetting/`**
    -   Laboratorios basados en Docker para practicar la segmentación de redes y enrutamiento.
    -   **Ver `Subnetting/README.md` para instrucciones detalladas.**

-   **`DiagramasDeArquitectura/`**
    -   Material conceptual, diagramas y documentos de diseño de sistemas.
    -   **Ver `DiagramasDeArquitectura/README.md` para instrucciones detalladas.**

---

### Conclusión

Este repositorio es ahora un recurso organizado y eficiente para el aprendizaje y la práctica de la ciberseguridad. ¡Disfrute explorando y aprendiendo!