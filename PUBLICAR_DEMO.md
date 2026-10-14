# Publicar Numerian gratis para una demostración

Preparado el 12 de octubre de 2026.

## Recomendación: Render Free

Este paquete ejecuta la aplicación completa: cuentas separadas, grupos, materiales, entregas, notas y juegos. Incluye `render.yaml` para crear un servicio gratuito y `start-render.cjs` para configurar automáticamente la dirección HTTPS asignada por Render y las cookies seguras.

**Los datos de esta demostración son temporales.** Render Free suspende el servicio después de 15 minutos sin tráfico. Al suspenderse, reiniciarse o publicar otra versión, pierde su disco local: se borran cuentas, archivos, notas y progreso. Al volver a entrar, el arranque puede tardar aproximadamente un minuto. Utiliza nombres ficticios y archivos de prueba; prepara las cuentas al comenzar cada presentación. No se incluyen cuentas predeterminadas.

### Publicación paso a paso

1. Descomprime `Numerian_Demo_Render.zip` en tu computador.
2. Crea un repositorio en GitHub, preferiblemente privado, por ejemplo `numerian-demo`.
3. En GitHub, usa **Add file → Upload files**. Sube el **contenido** de la carpeta descomprimida: `render.yaml`, `Dockerfile`, `server.cjs`, `start-render.cjs`, `curriculum.cjs`, `package.json`, `public/` y los demás archivos. Estos deben quedar en la raíz del repositorio, sin una carpeta contenedora adicional. No subas el ZIP ni una carpeta `data/` de una prueba local.
4. Crea o abre tu cuenta en https://dashboard.render.com/ y conecta GitHub.
5. Selecciona **New → Blueprint** y elige el repositorio. Render leerá `render.yaml`.
6. Revisa que aparezca un único **Web Service**, llamado `numerian-demo`, con plan **Free**. No necesitas agregar una base de datos ni un disco de pago. Confirma la creación del servicio.
7. Espera a que termine la construcción. Abre la URL HTTPS `https://<nombre-asignado>.onrender.com` que muestre Render. Esa es la dirección para compartir; no es una dirección creada en esta entrega.
8. Registra un profesor y un estudiante de prueba. Crea un grupo, solicita y aprueba el ingreso, asigna una actividad, entrega una imagen y registra una nota. Usa ventanas privadas o navegadores distintos para los perfiles.

La dirección pública se obtiene de `RENDER_EXTERNAL_URL`; no tienes que editar el código al cambiar el nombre del servicio. Si usas un dominio propio, configura `PUBLIC_ORIGIN` con su origen HTTPS exacto y utiliza ese dominio para acceder.

### Si prefieres crear el servicio manualmente

En **New → Web Service**, conecta el repositorio y elige **Docker**, plan **Free**, archivo `./Dockerfile` y comando de inicio **`node start-render.cjs`**. Deja la raíz vacía si subiste el contenido como se indica arriba. La imagen incluye Node.js 24 y el servidor escucha el puerto que proporciona Render. No hay comando de instalación de paquetes. No elijas **Static Site**.

## ¿Y Netlify?

El panel es https://app.netlify.com/. Este ZIP **no es compatible con arrastrar y soltar en Netlify Drop**. Numerian usa un servidor Node.js continuo y una base SQLite local; Netlify Functions ejecuta funciones en entornos temporales. Subir solamente `public/` muestra las páginas pero rompe las cuentas y el aula.

Para llevar la aplicación completa a Netlify habría que migrar el servidor a funciones, la base a un servicio persistente y los adjuntos a almacenamiento privado. Esa migración no está incluida. Para esta demostración se conserva la aplicación completa en Render y su enlace público puede compartirse directamente.

## Conservar los datos después de la demostración

En Render, un servicio de pago con disco persistente montado en `/app/data` puede conservar la SQLite actual. El plan Free no admite ese disco. Otra opción requiere adaptar la aplicación a una base externa y almacenamiento privado de archivos; no basta con añadir una URL de base de datos a esta versión.

Los planes gratuitos tienen cuotas de uso que pueden cambiar. Revisa el plan Free y los límites de tu cuenta antes de confirmar; no selecciones mejoras de pago para esta demostración. Los servicios y suscripciones dentro de Numerian siguen siendo propuestas visuales, sin cobros reales.

## Qué se verificó y qué queda pendiente

Se verificaron localmente el arranque con la configuración de Render, el origen HTTPS y las cookies seguras, además de las pruebas de acceso de la aplicación. No se ha realizado un despliegue remoto: requiere subir el proyecto a tu repositorio y conectar tu cuenta de Render. La construcción Docker y la URL pública deben comprobarse durante ese despliegue.

Documentación oficial consultada el 12 de octubre de 2026:

- https://render.com/docs/free
- https://render.com/docs/blueprint-spec
- https://render.com/docs/environment-variables
- https://docs.netlify.com/build/functions/overview/
