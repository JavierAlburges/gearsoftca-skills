@echo off
setlocal enabledelayedexpansion

echo ==========================================================
echo          GearSoftCA - Inicializador Web Next.js           
echo       "Impulsa tu negocio con soluciones innovadoras"     
echo ==========================================================
echo.

set "PROJECT_NAME=%~1"

if "%PROJECT_NAME%"=="" (
    set /p "PROJECT_NAME=Ingresa el nombre del proyecto o carpeta: "
)

if "%PROJECT_NAME%"=="" (
    echo [ERROR] Debes proporcionar un nombre valido.
    pause
    exit /b 1
)

if exist "%PROJECT_NAME%" (
    echo [ERROR] Ya existe una carpeta o archivo con el nombre "%PROJECT_NAME%".
    pause
    exit /b 1
)

echo.
echo Resumen de configuracion:
echo  - Nombre: %PROJECT_NAME%
echo  - Next.js (Ultima version con TypeScript)
echo  - Iconos y Animacion: lucide-react, simple-icons, motion
echo  - Skills: vercel-react-best-practices, frontend-design
echo.

set /p "CONFIRM=Deseas continuar? (s/n): "
if /i not "%CONFIRM%"=="s" (
    echo Operacion cancelada por el usuario.
    pause
    exit /b 0
)

echo.
echo [1/4] Creando proyecto Next.js...
call npx create-next-app@latest %PROJECT_NAME% --typescript --eslint --app --src-dir --import-alias "@/*" --use-npm
if errorlevel 1 (
    echo [ERROR] Fallo la creacion del proyecto Next.js.
    pause
    exit /b %errorlevel%
)

cd "%PROJECT_NAME%"

echo.
echo [2/4] Instalando lucide-react, simple-icons y motion...
call npm install lucide-react simple-icons motion

echo.
echo [3/4] Instalando skill vercel-react-best-practices...
call npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices -y

echo.
echo [4/4] Instalando skill frontend-design...
call npx skills add https://github.com/anthropics/skills --skill frontend-design -y

echo.
echo ==========================================================
echo       Proyecto %PROJECT_NAME% creado exitosamente!
echo ==========================================================
echo.
echo Para comenzar a programar:
echo   cd %PROJECT_NAME%
echo   npm run dev
echo.
pause
