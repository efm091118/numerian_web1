@echo off
chcp 65001 >nul
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Instala Node.js 24 LTS desde https://nodejs.org/ y vuelve a abrir este archivo.
  pause
  exit /b 1
)
node -e "if (Number(process.versions.node.split('.')[0]) !== 24) process.exit(1)"
if errorlevel 1 (
  echo Esta entrega requiere Node.js 24 LTS. Consulta README.md.
  pause
  exit /b 1
)
echo Abre http://127.0.0.1:8787/ en tu navegador.
echo Deja esta ventana abierta mientras uses Numerian. Ctrl+C detiene el servidor.
node server.cjs
pause
