# Propuesta Call Center

Se requiere una aplicación web para ingresar los reclamos de clientes que se toman
dentro de un call center. Para poder ingresar el reclamo, el cliente debe estar dado de alta, con lo
cual se debe contar con administración de clientes.
Para dar de alta un incidente se debe seleccionar el cliente, el tipo de incidencia (administrable), la prioridad (administrable) y agregar la problemática. El sistema deberá manejar seguridad y distintos perfiles: Administrador, Telefonista y Supervisor. Cada vez que se ingrese una incidencia, ésta quedará asignada a su usuario creador, pero el Supervisor podrá cambiar la asignación en cualquier momento. Además para los incidentes se debe manejar un modelo de estados (Abierto, En Análisis, Cerrado, Reabierto, Asignado, Resuelto), que será administrado automáticamente a medida que se gestione el reclamo. Un incidente nace en estado “Abierto”, pasa a "Asignado" cuando se reasigna; a “En Análisis” cuando se lo modifica por algún motivo. Una vez que se dio una respuesta satisfactoria se pasa a "Resuelto" con un botón "Resolver" que pedirá algún dato adicional final; y por último, el incidente puede ser cerrado desde un botón “Cerrar Incidencia”. Cuando se cierra, sí o sí debe pedir un comentario final de cierre. Un incidente puede ser cerrado por distintos motivos distintos a no haber llegado a una solución, por eso es distinto de "Resuelto".
El estado no puede ser cambiado manualmente por los usuarios.
Un incidente no debería ser eliminado nunca.
Con respecto a la visibilidad, los telefonistas podrán ver y administrar clientes e incidencias, pero
sólo ver las incidencias asignadas a ellos. El administrador podrá ver y manipular todo, inclusive usuarios y accesos y el Supervisor es quien puede ver todo y reasignar incidencias.
Cuando se da de alta una incidencia, la misma debe ser enviada por mail al cliente en cuestión con
el detalle del alta y el número de reclamo para su posterior seguimiento, lo mismo cuando fue
cerrada o resuelta.

## Hitos de TPC
### Etapa 1

**Para la primera etapa del TPC se solicita:**
- La arquitectura de clases (modelo de dominio),
- Armado de pantallas de la aplicación (SIN funcionalidad, sólo ventanas, algunos controles y navegación) y
- Lectura desde base de datos de al menos UNA entidad.


### Etapa 2

**Para la segunda etapa del TPC se solicita:**
- Completar y corregir las cuestiones pendientes de la primera etapa,
- Desarrollar todos los ABMs y listados de las entidades administrables de la aplicación, pero NO de las que correspondan a funcionalidad core (Turnos, Incidencia, Venta o Mesas)


*Nota: tener en cuenta validaciones, diseño visual, seguir ampliando/corrigiendo el modelo.*


### Etapa 3

**Para la tercera etapa del TPC deberán construir:**
- La funcionalidad del core de la aplicación (turnos: nuevo, re programar; mesa: abrir, generar pedido, cerrar; ventas: comprar, vender, etc.).
- Las funcionalidades que aportan valor de agregado al core (búsquedas dinámicas, registrarse, olvidé mi pass, etc.).
- Validaciones a lo largo de la aplicación: tipos de datos, requeridos, formatos.

### Etapa Final

**Para la cuarta y última etapa del TPC deberán:
- Cerrar toda la funcionalidad pendiente (abms y filtrados en todas las entidades).**
- Validaciones a lo largo de toda la aplicación (web y escritorio).
- Seguridad y perfiles de usuario, con la funcionalidad correspondiente para cada perfil (Web y escritorio).
- Optimización del diseño visual de cara al usuario (colorcitos, botoncitos lindos, etc.). Principalmente en web, pero aplica a escritorio también.

## Fechas TPC

Las revisiones serán personalizadas por cada equipo con encuentros en vivo de 15 minutos por equipo programados de antemano.

### Primera revisión
Del 1/011 al 03/11

### Segunda revisión
14 y 15 de noviembre

### Tercera revisión (última)
Del 24 y 25 de noviemre

### Última instancia de entrega final
Desde el 28/11

### Límite FINAL: 20/12
- Para todos los casos estará disponible la agenda para anotarse.
- Tener en cuenta que todo el mundo tiene acceso de edición a la planilla. Usar con responsabilidad.
- Sólo pueden anotarse a "turnos" existentes, no pueden crear espacios nuevos.
- Si no les sirve ningún día y horario de los disponibles, deben ponerse en contacto de inmediato para coordinar.
- Recuerden subir el link del repo. Se sube una única vez.

