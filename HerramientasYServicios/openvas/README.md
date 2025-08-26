# Escáner de Vulnerabilidades OpenVAS (GVM)

Este directorio contiene una configuración de Docker para desplegar el escáner de vulnerabilidades OpenVAS (Greenbone Vulnerability Management - GVM).

OpenVAS es una suite completa de herramientas para la gestión de vulnerabilidades, incluyendo un escáner, una base de datos de vulnerabilidades y una interfaz web.

---

### Instrucciones de Uso

**1. Iniciar el Servicio:**

Desde este directorio (`openvas/`), ejecute:
```bash
docker-compose up -d
```

**2. Primer Inicio (Importante):**

El primer inicio de OpenVAS puede tardar **varias horas** (2-6 horas o más, dependiendo de su conexión a internet y recursos del sistema). Durante este tiempo, el sistema descargará y actualizará las bases de datos de vulnerabilidades (NVT, SCAP, CERT, etc.).

**Es crucial esperar a que este proceso finalice antes de intentar acceder a la interfaz web o realizar escaneos.** Puede monitorear los logs del contenedor para ver el progreso:
```bash
docker-compose logs -f openvas
```

**3. Detener el Servicio:**
```bash
docker-compose down
```

---

### Acceso y Credenciales

Una vez que el servicio esté completamente iniciado y las bases de datos actualizadas:

- **Interfaz Web:** [https://localhost:9392](https://localhost:9392)
  - *Nota: Es normal que el navegador muestre una advertencia de seguridad, ya que los certificados son autofirmados. Acepte el riesgo para continuar.*

- **Credenciales por Defecto:**
  - **Usuario:** `admin`
  - **Contraseña:** `admin` (establecida en el `docker-compose.yml`)

---

### Notas Adicionales

- **Recursos:** OpenVAS es intensivo en recursos. Asegúrese de tener suficiente RAM y CPU disponibles en su máquina anfitriona.
- **Actualizaciones:** Para mantener las bases de datos de vulnerabilidades actualizadas, puede que necesite reiniciar el contenedor periódicamente o buscar comandos específicos de actualización dentro del contenedor.
