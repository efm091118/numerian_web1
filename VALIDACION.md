# Validación de Numerian V3

Fecha: **11 de octubre de 2026**.

## Comprobaciones del servidor

Ejecutadas con Node.js **24.19.0**, sobre una base SQLite temporal e independiente. Resultado: **13 pruebas aprobadas, 0 fallos** (incluye el caso principal y sus 12 subcasos).

1. Usuario/contraseña, ausencia de sesión, CSRF incorrecto y origen externo.
2. Solicitud de ingreso pendiente, aprobación por el profesor propietario y rechazo de administración por otro profesor.
3. Recursos y actividades inaccesibles para un profesor ajeno y un estudiante sin pertenencia al grupo; las soluciones de comprobación no se entregan en el panel del estudiante.
4. Entrega con texto e imagen; acceso denegado entre compañeros; rechazo de reutilización de un archivo ajeno; validación básica de formatos; recompensa de actividad no repetida.
5. Nota dentro de la escala, rechazo de nota fuera de rango, nota cero sin entrega, cierre de respuesta calificada y reapertura.
6. Código familiar de un solo uso, consulta solo del estudiante autorizado y revocación inmediata de acceso a sus archivos.
7. Coexistencia de recursos propios compartidos y taller generado privado.
8. Inicio y respuesta en los ocho módulos; rechazo de misión ajena y de un segundo intento sobre la misma pregunta.
9. Memoria completa: seis parejas, 120 puntos, una estrella; rechazo de carta duplicada y acceso a partida ajena.
10. Retirar un estudiante revoca el acceso a actividades y archivos del grupo.
11. Recuperación de contraseña invalida las sesiones y el código anterior.
12. El código del servidor, archivos de entorno y base de datos no se sirven como contenido público. Cerrar sesión invalida el acceso autenticado.

Las pruebas se incluyen en `tests/access.test.cjs` y pueden repetirse con `npm test`.

## Comprobaciones de navegador

Recorridos realizados en Chrome con ventanas independientes para profesor, estudiante y familiar:

- Registro, visualización del código de recuperación e ingreso al portal del perfil.
- Grupo, solicitud y aprobación del estudiante.
- Actividad con explicación previa, enlaces y archivo.
- Archivo propio en biblioteca y generación de taller.
- Respuesta escrita e imagen adjunta; visualización en el aula del profesor.
- Nota final y bloqueo de edición de una entrega ya calificada.
- Vínculo familiar autorizado y consulta de la nota y el trabajo.
- Misión de cinco aciertos, con inicio posterior a la explicación previa.
- Menú con Sobre nosotros, Contacto y Servicios; redirección al intentar un portal de otro perfil.
- Cierre de sesión y rechazo de acceso posterior.
- Fuentes DynaPuff e Instrument Sans cargadas desde archivos locales; referencias al nuevo logo.
- Ausencia de errores JavaScript durante el recorrido.

Vistas comprobadas: **1440 × 1000** en escritorio y **390 × 844** en móvil emulado. No se detectó desbordamiento horizontal en las páginas recorridas. Se inspeccionaron capturas de inicio, aula docente, misión, portal de estudiantes y explicación previa en móvil.

## Integridad del paquete

- Se conserva la versión anterior por separado.
- El paquete no contiene bases de datos, usuarios, sesiones, códigos de recuperación ni entregas de prueba.
- Los cuatro PDF originales se conservan sin modificar.
- El logo y las fuentes se sirven localmente, con las licencias de fuentes incluidas.
- Se revisaron la sintaxis de los archivos JavaScript y la integridad del ZIP final.

## Límites de la validación

No se realizaron auditoría de seguridad externa, prueba de carga, certificación WCAG, pruebas físicas en móviles, validación en todos los navegadores ni pruebas en un alojamiento de producción. El contenedor Docker se proporciona como configuración de despliegue, sin afirmar que fue construido o publicado. No hay pasarela de pagos que validar.

La vista previa persistente entre sesiones de esta herramienta presentó un problema de conexión. Las pruebas de navegador se completaron ejecutando el servidor y el navegador dentro del mismo proceso de verificación. Se entrega una captura del diseño y la aplicación ejecutable localmente; no una URL pública de producción.
