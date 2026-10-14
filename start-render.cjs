'use strict';
// Render supplies this URL; never derive the trusted origin from request headers.
const origin = process.env.PUBLIC_ORIGIN || process.env.RENDER_EXTERNAL_URL;
if (!origin) throw new Error('Falta RENDER_EXTERNAL_URL o PUBLIC_ORIGIN.');
const parsed = new URL(origin);
if (parsed.protocol !== 'https:' || parsed.username || parsed.password || parsed.pathname !== '/' || parsed.search || parsed.hash) {
  throw new Error('El origen público debe ser una URL HTTPS sin ruta, credenciales ni parámetros.');
}
process.env.PUBLIC_ORIGIN = parsed.origin;
process.env.NODE_ENV = 'production';
process.env.SECURE_COOKIES = '1';
process.env.HOST = '0.0.0.0';
console.log('Numerian en Render. En el plan Free, las cuentas y archivos son temporales.');
require('./server.cjs');
