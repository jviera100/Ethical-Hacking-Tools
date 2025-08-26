# Laboratorio de Servidor DNS con BIND

Este directorio contiene una configuración de Docker para desplegar un servidor DNS autoritativo usando BIND9.

El servidor está configurado para actuar como el servidor maestro para la zona de dominio ficticia `empresa.local`.

---

### Instrucciones de Uso

**1. Iniciar el Servidor DNS:**

Desde este directorio (`dns_server/`), ejecute:
```bash
docker-compose up -d
```

**2. Detener el Servidor:**
```bash
docker-compose down
```

---

### Configuración y Registros DNS

Este servidor DNS responderá a consultas para los siguientes registros:

- **`ns1.empresa.local`** -> `172.20.0.53`
- **`intranet.empresa.local`** -> `172.20.0.100`

---

### Cómo Probar el Servidor

Para verificar que el servidor DNS funciona correctamente, puedes usar una herramienta como `nslookup` o `dig` desde tu máquina anfitriona, apuntando al servidor DNS que se ejecuta en `localhost` (puerto 53).

**Ejemplo con `nslookup`:**

```bash
# Consultar por el registro de intranet
nslookup intranet.empresa.local 127.0.0.1
```

**Respuesta Esperada:**
```
Server:		127.0.0.1
Address:	127.0.0.1#53

Name:   intranet.empresa.local
Address: 172.20.0.100
```
