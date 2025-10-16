# 🚌 Sistema de Gestión de Transporte - Base de Datos

Un sistema completo de gestión para una empresa de transporte de pasajeros implementado con SQL Server, que maneja reservas, viajes, flotas de buses y clientes.

## 🎯 Descripción del Proyecto

Este proyecto de base de datos modela un sistema integral de transporte que incluye:

- **Gestión de Flota**: Administración de buses con diferentes tipos y capacidades
- **Red de Terminales**: Organización por departamentos y terminales
- **Sistema de Reservas**: Compra de pasajes y asignación de asientos
- **Gestión de Viajes**: Programación de rutas, horarios y precios
- **Administración de Clientes**: Registro completo con validación de documentos

## 🗃️ Estructura de la Base de Datos

### Entidades Principales

#### 🚍 **Bus**
```sql
- idBus (PK)
- marca, tipo, capacidad
- Tipos: Semi-Cama, Cama, Leito, Económico, Premium
```

#### 🪑 **Asiento**
```sql
- idAsiento (PK)
- numeroDeFila, letra
- idBus (FK)
```

#### 🏢 **Terminal & Departamento**
```sql
- Departamento: idDepartamento, nombreDepartamento
- Terminal: idTerminal, nombreTerminal, idDepartamento
```

#### 👤 **Cliente**
```sql
- idCliente (PK)
- nombre, apellido1, apellido2
- tipoDocumento, nDocumento
- fechaNacimiento, correo, contrasena
```

#### ✈️ **Viaje**
```sql
- idViaje (PK)
- importe, fechaSalida, hora
- duracionViaje, descripcion
- idBus, idOrigen, idDestino (FKs)
```

#### 🎫 **Pasaje & Compra**
```sql
- Sistema de reservas con estados
- Relación Cliente-Pasaje-Viaje
- Control de asientos disponibles
```

## 📁 Archivos del Proyecto

### **DDL.sql** - Definición de Esquema
- Creación de base de datos `ObligatorioDB`
- Definición de todas las tablas
- Establecimiento de relaciones (Foreign Keys)
- Restricciones de integridad

### **DML.sql** - Datos de Prueba
- Inserción de departamentos: Montevideo, Canelones, Maldonado, Colonia
- Carga de terminales por departamento
- Flota de buses con diferentes especificaciones
- Configuración de asientos por bus
- Datos de clientes, viajes y compras de prueba

### **Consultas.sql** - Reportes y Análisis

#### 📊 Consultas Implementadas:

1. **Top Clientes**: Clientes con mayor cantidad de compras
2. **Disponibilidad de Buses**: Buses con capacidad >35 disponibles mañana
3. **Clientes Frecuentes**: Usuarios con 5+ viajes comprados
4. **Asignación de Asientos**: Detalle de pasajeros por fila y asiento
5. **Análisis de Ocupación**: Estadísticas de uso por ruta
6. **Reportes Financieros**: Ingresos por período y destino

## 🔧 Tecnologías Utilizadas

- **SQL Server** 2019+
- **T-SQL** para procedimientos y funciones
- **DATEFORMAT** para manejo de fechas
- **Triggers** para validaciones automáticas
- **Índices** para optimización de consultas

## ⚡ Características Técnicas

### Validaciones Implementadas
- Control de capacidad de buses vs asientos creados
- Validación de fechas de viaje (no pueden ser pasadas)
- Verificación de disponibilidad de asientos
- Integridad referencial en todas las FK

### Optimizaciones
- Índices en campos de búsqueda frecuente
- Consultas optimizadas para reportes
- Uso de GROUP BY y HAVING para agregaciones
- Subconsultas para análisis complejos

## 📈 Casos de Uso Cubiertos

### Para Clientes
- ✅ Registro y autenticación
- ✅ Búsqueda de viajes por origen/destino
- ✅ Selección y compra de asientos
- ✅ Historial de viajes

### Para Administradores
- ✅ Gestión de flota de buses
- ✅ Programación de viajes
- ✅ Reportes de ocupación
- ✅ Análisis de clientes frecuentes
- ✅ Control de ingresos

### Reportes Gerenciales
- 📊 Clientes con más compras
- 🚌 Utilización de flota
- 💰 Ingresos por ruta y período
- 📅 Proyecciones de demanda

## 🎯 Modelo de Negocio

El sistema está diseñado para una empresa de transporte terrestre que opera:

- **Rutas Interdepartamentales** en Uruguay
- **Múltiples tipos de servicios** (Económico a Premium)
- **Reservas online** con asignación automática
- **Gestión de capacidad** en tiempo real

## 📝 Documentación Técnica

### Relaciones Principales
```
Departamento 1:N Terminal
Bus 1:N Asiento
Terminal 1:N Viaje (origen/destino)
Cliente 1:N Compra
Viaje 1:N Pasaje
Compra N:1 Pasaje
```

### Consultas Complejas Destacadas
- Uso de **ALL** para encontrar máximos absolutos
- **JOINS** múltiples para reportes integrados
- **DATEADD** para filtros temporales
- **HAVING** para filtros post-agregación

---

Este proyecto demuestra el diseño e implementación de una base de datos relacional completa, aplicando principios de normalización, integridad de datos y optimización de consultas para un dominio empresarial real.