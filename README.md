# Numerian · Aula y comunidad · Versión 3

## Demostración pública gratuita — actualización del 12 de octubre de 2026

Se incluye una configuración para **Render Free**. Sigue [PUBLICAR_DEMO.md](PUBLICAR_DEMO.md) para publicar desde GitHub con `render.yaml`. El arranque `start-render.cjs` configura automáticamente el origen HTTPS de Render y las cookies seguras. El paquete específico se entrega como `Numerian_Demo_Render.zip`.

**En Render Free los datos son temporales:** cuentas, archivos, notas y progreso se pierden al suspenderse, reiniciarse o desplegarse el servicio. Es una demostración, no un alojamiento persistente para el colegio. Netlify Drop no ejecuta este servidor; la guía explica la alternativa y el alcance de una futura migración a Netlify. No se ha desplegado públicamente el proyecto en esta entrega.

Actualización del proyecto Numerian existente, preparada el **11 de octubre de 2026**.

## Qué cambió

- Logo del monstruo aportado por el usuario en cabecera, inicio, pie, Sobre nosotros e icono de página.
- Identidad: azul `#159FE5`, morado `#8E3FE8`, amarillo `#FFC928`, verde `#61D83D`; fondo `#00001a` y texto principal `#FFFFFF`.
- **DynaPuff** en títulos, encabezados y frases destacadas; **Instrument Sans** en texto, menú, botones, formularios e interfaz. Los archivos de fuentes y sus licencias están incluidos; no se descargan al navegar.
- Menú con **Sobre nosotros** y **Contacto**. **Servicios** reemplaza a Planes. Las antiguas rutas `planes.html` y `proyecto.html` redirigen a las nuevas.
- Cuentas independientes para estudiantes, profesores y familiares, protegidas por contraseña y sesiones de servidor. Ya no hay selector de alias de otros estudiantes.
- Recursos propios del profesor: PDF, PNG/JPG, TXT, DOCX, XLSX y PPTX. Biblioteca privada o compartida con un grupo.
- Se conservan los cuatro materiales PDF anteriores y se añade un generador de talleres editables con ejercicios y solucionario. Se identifica expresamente como generador por plantillas; no se presenta como una IA conectada.
- Actividades con explicación previa obligatoria, enunciado, enlaces y archivos. Respuestas del estudiante mediante texto y/o archivos, incluyendo imágenes y pantallazos.
- Nota final y comentario del profesor, incluso si no hay entrega. El profesor define la nota máxima de cada actividad y puede reabrir una entrega calificada.
- Explicación, ejemplo y pasos antes de empezar cada módulo; instrucciones antes de memoria y de cada actividad docente.

## Importante: ahora es una aplicación con servidor

Esta versión **no funciona como una aplicación completa en un alojamiento exclusivamente estático**. Las contraseñas, permisos, archivos y notas se gestionan en el servidor, con una base de datos SQLite. No se protegen las cuentas guardando contraseñas o roles en `localStorage`.

No publiques solo la carpeta `public/` en Netlify Drop o GitHub Pages: allí se mostraría parte de la interfaz, pero no funcionarían las cuentas ni el aula. Debes ejecutar `server.cjs` en un alojamiento compatible con Node.js 24 y almacenamiento persistente.

No se ha creado una publicación pública ni una cuenta de alojamiento en esta entrega. El ZIP incluye toda la aplicación, sus fuentes, documentación y pruebas, **sin usuarios, contraseñas ni datos de prueba**.

## Probar en tu computador

1. Descomprime `Numerian_V3_Aula_y_Comunidad.zip`.
2. Instala **Node.js 24 LTS**, si no lo tienes, desde [nodejs.org](https://nodejs.org/).
3. En Windows abre `INICIAR_NUMERIAN.cmd`, o abre una terminal dentro de la carpeta `numerian_v3` y ejecuta:

```sh
npm start
```

4. Abre **http://127.0.0.1:8787/**.
5. Mantén abierto el proceso mientras utilices la aplicación. `Ctrl+C` lo detiene.

No necesitas `npm install`: la aplicación utiliza módulos incluidos en Node.js 24 y los recursos del ZIP. La base de datos se crea automáticamente en `data/numerian.sqlite`. Al reiniciar, conserva lo guardado. No borres `data/` si quieres conservar tus cuentas y archivos.

Para probar perfiles simultáneos, utiliza navegadores diferentes o ventanas privadas. Las pestañas del mismo perfil de navegador comparten la cookie de sesión; no corresponden a personas distintas.

## Primer recorrido: profesor → estudiante → familiar

### 1. Crear cuentas

Desde **Mi cuenta → Crear cuenta**, cada persona elige un usuario, contraseña y tipo de cuenta. El estudiante elige tercero o cuarto.

- Usuario: entre 4 y 30 letras sin tildes, números o guion bajo.
- Contraseña: entre 10 y 128 caracteres.
- El registro entrega un **código de recuperación de un solo uso**. Debe guardarse en un lugar privado. No lo compartas con compañeros.
- Recuperar acceso cambia la contraseña, invalida todas las sesiones y entrega un código nuevo. No existe recuperación por correo en esta entrega.
- No se requiere un correo del estudiante. El nombre puede ser un alias. Los estudiantes deben contar con acompañamiento adulto al crear su cuenta.
- El perfil no puede cambiarse mediante el navegador; si se necesita otro tipo de cuenta, debe registrarse una cuenta separada.

### 2. Crear el grupo y aprobar ingresos

En **Profesores**:

1. Crea el grupo y su grado.
2. Comparte su código con tus estudiantes.
3. El estudiante lo escribe en **Mis grupos → Solicitar ingreso**.
4. Aprueba la solicitud desde tu aula. Hasta entonces no verá actividades ni materiales del grupo.

Puedes rechazar una solicitud, retirar un estudiante y renovar el código para futuras solicitudes. No puedes administrar grupos de otro profesor. La aprobación requiere que reconozcas la cuenta: el software no verifica la identidad institucional de quien se registra como profesor.

### 3. Subir recursos propios o usar materiales de Numerian

En **Profesores → Tus materiales, a tu manera** hay dos opciones:

**Tus archivos:** título, tipo, grupo opcional y hasta tres archivos. Al elegir «Solo para mí» el material es privado. Si eliges un grupo, sus estudiantes aprobados y familiares vinculados pueden descargarlo.

**Recursos Numerian:** los cuatro PDFs originales y un generador de diez ejercicios con solucionario, por módulo y grado. El generador crea un TXT editable en tu biblioteca privada. Revísalo, separa el solucionario y súbelo como recurso propio cuando quieras compartirlo.

Cada archivo admite hasta **8 MB**. Cada cuenta dispone de **100 MB** de archivos. Los formatos admitidos son PNG, JPG/JPEG, PDF, TXT, DOCX, XLSX y PPTX. Los documentos de Office se descargan; no se editan dentro de la plataforma.

Los archivos subidos se guardan en SQLite y se sirven tras comprobar el permiso. No existen URLs públicas de descarga por carpeta. Retirar un recurso de la biblioteca no borra sus archivos ni los adjuntos ya vinculados a actividades o entregas; la limpieza de almacenamiento de producción corresponde al administrador.

### 4. Asignar una actividad

Completa título, grupo, módulo y **explicación previa**. En esa explicación incluye el objetivo, un ejemplo y los pasos. Puedes añadir texto, hasta cinco enlaces externos (uno por línea) y hasta tres adjuntos.

La respuesta breve de comprobación es opcional. Úsala para preguntas con respuesta exacta; déjala vacía para trabajos escritos, imágenes o problemas abiertos. La comprobación automática orienta al estudiante, **no asigna la nota final**.

Define la nota máxima de tu escala: por ejemplo, 5 o 100. La fecha es orientativa: no bloquea entregas posteriores.

### 5. Entregar un trabajo

El estudiante encuentra las actividades de sus grupos aprobados en su propia cuenta. Lee la explicación, responde mediante texto, imagen o archivo y confirma que revisó la actividad.

Puede actualizar la respuesta mientras no esté calificada. Si elige archivos nuevos, reemplazan la lista de adjuntos de la entrega; si no elige ninguno, conserva los anteriores. Los archivos antiguos permanecen en el almacenamiento del servidor.

La respuesta breve correcta puede otorgar 40 puntos una sola vez. Los puntos son motivacionales, independientes de la evaluación del profesor.

### 6. Registrar la nota final

En **Profesores → Revisa y califica**, elige una actividad. Aparecen todos sus estudiantes aprobados, con o sin respuesta.

- Lee el texto y descarga o visualiza las imágenes adjuntas.
- Registra una nota entre 0 y el máximo definido y añade tu comentario.
- Puedes calificar con 0 u otra nota a quien no haya respondido; indica el motivo.
- Después de calificar, la entrega queda cerrada para cambios del estudiante.
- **Reabrir entrega** retira la nota final y permite responder o corregir. La entrega existente se conserva.
- El estudiante y su familiar autorizado ven la nota y el comentario.

El reporte CSV del aula contiene el progreso de práctica de estudiantes aprobados. La calificación detallada de trabajos se consulta por actividad en el aula; ese CSV no es un acta de notas finales.

### 7. Autorizar al familiar

Desde su cuenta, el estudiante genera un código familiar de un solo uso, válido por 30 minutos. El familiar crea su propia cuenta y usa ese código para vincularse.

El familiar puede consultar progreso, actividades, entregas, archivos y notas de ese estudiante. No puede responder o calificar en su nombre. El estudiante puede revocar el vínculo; el familiar también puede desvincularse. Un código de grupo del profesor no sustituye esta autorización familiar.

## Aprendizaje y explicaciones

Hay ocho módulos: multiplicación, división, suma, resta, fracciones, geometría, medidas y problemas. Cada uno presenta explicación, ejemplo y pasos antes del botón de inicio. Las misiones tienen cinco preguntas sin cronómetro; hay pista y retroalimentación en cada pregunta.

Los aciertos dan 30 puntos y 5 monedas. Cada tres aciertos consecutivos se obtiene una estrella. Los niveles mantienen los nombres **Matemático Novato**, **Calculador Experto** y **Maestro Numerian**, con cambios a los 300 y 600 puntos.

La memoria explica cómo emparejar multiplicaciones y resultados antes de comenzar. Cada pareja da 20 puntos y 3 monedas; completar las seis da una estrella.

Los intentos, las respuestas correctas y las recompensas se validan en el servidor. Una pregunta ya respondida no acepta una segunda recompensa. El servidor tampoco entrega al estudiante las soluciones futuras de la misión.

Estas actividades son una herramienta formativa, no una evaluación de alta seguridad ni un currículo completo. El profesor debe revisar su adecuación al grupo.

## Servicios y pagos

La sección antes llamada «Planes» ahora se llama **Servicios**. Conserva propuestas visuales de acceso gratuito, un módulo, todos los mundos, aula docente e institución, con precios ilustrativos.

**Durante este piloto, las herramientas correspondientes a cada perfil están disponibles sin pago.** Elegir una propuesta solo la guarda en la cuenta: no hace cargos, no activa renovaciones ni cambia los permisos de rol o los vínculos entre personas.

La arquitectura de pagos descrita en la versión anterior sigue siendo un trabajo futuro. Esta entrega no integra pasarela, mandato de cobro, facturación ni webhooks. No se deben interpretar las selecciones como compras reales.

## Publicación con servidor

### Opción A: proceso Node.js

En un servidor con Node.js 24:

1. Copia toda la carpeta de la aplicación, excepto cualquier `data/` de pruebas.
2. Configura almacenamiento persistente y permisos de escritura para `DATA_DIR`.
3. Coloca un proxy HTTPS delante del proceso y configura estas variables:

```text
NODE_ENV=production
HOST=0.0.0.0
PORT=8080
PUBLIC_ORIGIN=https://tu-dominio.example
SECURE_COOKIES=1
DATA_DIR=/ruta/persistente/numerian
```

4. Ejecuta `node server.cjs` con el supervisor de procesos del alojamiento.
5. Comprueba registro, sesión, carga de archivo y persistencia después de reiniciar el servicio.

`PUBLIC_ORIGIN` debe ser el origen HTTPS exacto, sin ruta ni barra final. En producción, el servidor se niega a iniciar si no tiene origen HTTPS y cookies seguras. `.env.example` es una referencia: no se carga automáticamente. Si lo copias a `.env`, Node.js 24 puede cargarlo con `node --env-file=.env server.cjs`.

### Opción B: Docker

Se incluye `Dockerfile` sin dependencias externas de aplicación:

```sh
docker build -t numerian:v3 .
docker run -d --name numerian --restart unless-stopped \
  -p 127.0.0.1:8080:8080 \
  -v numerian_data:/app/data \
  -e PUBLIC_ORIGIN=https://tu-dominio.example \
  numerian:v3
```

Pon un proxy HTTPS delante de `127.0.0.1:8080`. El volumen debe conservarse entre versiones. Esta configuración es para una única instancia; no ejecutes varias instancias con copias independientes de SQLite esperando sincronización.

El contenedor no se construyó ni publicó durante esta entrega. Para una institución con muchos grupos o varias instancias, planifica base de datos administrada y almacenamiento de objetos privados; ese despliegue no está incluido.

## Datos y seguridad: alcance concreto

Implementado:

- Contraseñas derivadas con `scrypt` y sal individual (N=32768); no se almacenan contraseñas en texto claro.
- Tokens de sesión aleatorios cuyo hash se almacena en base de datos. Cookie `HttpOnly`, `SameSite=Strict` y `Secure` en producción.
- Sesiones con vencimiento de ocho horas, cierre de sesión y revocación tras cambio o recuperación de contraseña.
- Comprobación de rol y propiedad en cada operación de grupos, actividades, notas y archivos.
- CSRF para operaciones autenticadas; rechazo de solicitudes con origen externo.
- Límites de intentos de acceso y recuperación. Se utiliza la IP de conexión, sin confiar automáticamente en cabeceras de proxy.
- Validación de tamaño, extensión y firmas básicas de archivos; documentos descargados como adjuntos; imágenes PNG/JPG solo visibles con permiso.
- Consultas parametrizadas, escape de texto en la interfaz, cabeceras de seguridad y exclusión de base de datos y código del servidor del directorio público.

Límites de esta entrega:

- El registro es autogestionado; no hay verificación de identidad, correo, aprobación institucional de profesores ni inicio de sesión de una institución.
- No hay escaneo antivirus de archivos. La validación de formato no equivale a un análisis de contenido malicioso.
- No incluye cifrado de base de datos en reposo, copias de seguridad automatizadas, monitoreo, historial inmutable de notas ni integración con sistemas escolares.
- No hay panel de administración para borrar cuentas, revisar mensajes de contacto o administrar almacenamiento. Contacto guarda los mensajes en el servidor, sin enviar correo ni prometer respuesta.
- Antes de un despliegue institucional con menores, el responsable debe definir consentimiento, retención, recuperación de cuentas, acceso administrativo y tratamiento de datos, y validar el servicio en su infraestructura.

No se declara una auditoría de seguridad completa ni una certificación de accesibilidad. Las verificaciones concretas se detallan en `VALIDACION.md`.

## Actualización desde la versión 2

La versión 2 permanece entregada por separado. Su progreso y alias vivían en el navegador, sin dueño autenticado. **No se importan automáticamente como cuentas**, porque no sería posible determinar quién puede ver cada dato de forma segura.

La versión 3 comienza con cuentas nuevas y guarda datos en el servidor. No borra las claves antiguas del navegador. Conserva el contenido del proyecto, el sistema de misiones y memoria, los niveles y los cuatro PDFs; cambia la organización de datos y la gestión de accesos.

## Estructura y mantenimiento

```text
numerian_v3/
  server.cjs                 servidor, sesiones, permisos y datos
  curriculum.cjs             explicaciones y generador matemático
  public/                    páginas, estilos, interacción y recursos públicos
    assets/numerian-monstruo.png
    assets/fonts/            DynaPuff e Instrument Sans y licencias OFL
    resources/               cuatro PDF originales
  tests/access.test.cjs      pruebas reproducibles de acceso y funcionalidad
  data/                      creado al iniciar; privado y persistente
  Dockerfile
  INICIAR_NUMERIAN.cmd
  README.md
  VALIDACION.md
```

Para ejecutar las pruebas del servidor:

```sh
npm test
```

Las pruebas crean una base temporal fuera del proyecto; no usan tus cuentas. Para hacer una copia de seguridad sencilla, detén el servidor y copia toda la carpeta `data/` a almacenamiento privado. No publiques esa copia ni la incluyas en un ZIP para compartir el código.

Fuentes técnicas: [SQLite en Node.js 24](https://nodejs.org/docs/latest-v24.x/api/sqlite.html), [criptografía en Node.js 24](https://nodejs.org/docs/latest-v24.x/api/crypto.html). El logo fue suministrado por el usuario; DynaPuff e Instrument Sans proceden de Google Fonts y se distribuyen con sus licencias OFL.
