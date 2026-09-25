param(
    [Parameter(Mandatory=$false)]
    [string]$ProjectName
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "         GearSoftCA - Inicializador Web Next.js           " -ForegroundColor Yellow
Write-Host "      'Impulsa tu negocio con soluciones innovadoras'     " -ForegroundColor DarkCyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Preguntar interactivamente por el nombre del proyecto si no se proporcionó
if ([string]::IsNullOrWhiteSpace($ProjectName)) {
    $ProjectName = Read-Host "Ingresa el nombre del proyecto o carpeta"
}

# Limpiar espacios
$ProjectName = $ProjectName.Trim()

if ([string]::IsNullOrWhiteSpace($ProjectName)) {
    Write-Host "Error: Debes proporcionar un nombre de proyecto valido." -ForegroundColor Red
    exit 1
}

# Validar si ya existe el directorio
if (Test-Path $ProjectName) {
    Write-Host "Error: Ya existe una carpeta o archivo con el nombre '$ProjectName'." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Resumen de configuracion:" -ForegroundColor Green
Write-Host " -> Proyecto / Carpeta : $ProjectName"
Write-Host " -> Framework          : Next.js (Ultima version con App Router y TypeScript)"
Write-Host " -> Iconos / UI        : lucide-react, simple-icons, motion"
Write-Host " -> Skills de Agentes  : vercel-react-best-practices, frontend-design"
Write-Host ""

$Confirm = Read-Host "¿Deseas iniciar la creacion del proyecto ahora? (s/n)"
if ($Confirm -ne "s" -and $Confirm -ne "S") {
    Write-Host "Operacion cancelada por el usuario." -ForegroundColor Yellow
    exit 0
}

Write-Host ""
Write-Host "[1/4] Creando proyecto Next.js..." -ForegroundColor Cyan
npx create-next-app@latest $ProjectName --typescript --eslint --app --src-dir --import-alias "@/*" --use-npm

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error al crear la aplicacion Next.js." -ForegroundColor Red
    exit $LASTEXITCODE
}

Set-Location $ProjectName

Write-Host ""
Write-Host "[2/4] Instalando dependencias de interfaz y animacion (lucide-react, simple-icons, motion)..." -ForegroundColor Cyan
npm install lucide-react simple-icons motion

Write-Host ""
Write-Host "[3/4] Instalando Skill: vercel-react-best-practices..." -ForegroundColor Cyan
npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices -y

Write-Host ""
Write-Host "[4/4] Instalando Skill: frontend-design (Anthropic)..." -ForegroundColor Cyan
npx skills add https://github.com/anthropics/skills --skill frontend-design -y

Write-Host ""
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "      ¡Proyecto '$ProjectName' creado exitosamente!       " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Para comenzar:"
Write-Host "  cd $ProjectName"
Write-Host "  npm run dev"
Write-Host ""
