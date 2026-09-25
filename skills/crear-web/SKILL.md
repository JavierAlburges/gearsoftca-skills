---
name: crear-web
description: Procedimiento estándar de GearSoftCA para inicializar aplicaciones web modernas con la última versión de Next.js, dependencias de diseño e iconos (lucide-react, simple-icons, motion), y los skills de Vercel React Best Practices y Anthropic Frontend Design.
metadata:
  author: GearSoftCA (Ing. Javier Alburges)
  company: GearSoftCA
  slogan: Impulsa tu negocio con soluciones innovadoras
---

# Skill: Crear Proyecto Web GearSoftCA (`crear-web`)

Este skill estandariza la inicialización de proyectos web de alto rendimiento y diseño premium para **GearSoftCA**.

---

## ⚠️ REGLA DE ORO / PASO OBLIGATORIO: INTERACCIÓN PREVIA

**BAJO NINGUNA CIRCUNSTANCIA DEBES EJECUTAR COMANDOS NI CREAR ARCHIVOS ANTES DE ESTE PASO.**

Cuando el usuario invoque este skill diciendo *"crear web"*, *"crea una web"*, *"nuevo proyecto"*, o similar:

1. **Detente inmediatamente** y pregunta al usuario:
   > *"¿Qué nombre o carpeta deseas asignarle al proyecto?"*
2. **Espera la respuesta del usuario.**
3. Presenta el plan detallado indicando el nombre de la carpeta elegida.
4. **Solo cuando el usuario confirme explícitamente**, procede a ejecutar las acciones siguientes.

---

## Paleta Corporativa GearSoftCA

Al generar estilos base, temas o componentes, aplicar:
- **Principal (Azul Oscuro)**: `#131D47`
- **Secundario (Celeste)**: `#9AECED`
- **Complemento (Gris)**: `#4C4C4C`
- **Base / Fondo (Blanco)**: `#F1F1F1`
- **Texto / Contraste (Negro)**: `#000000`

---

## Protocolo de Ejecución (Paso a Paso)

Una vez confirmado el `<nombre-proyecto>`:

### 1. Inicialización de Next.js (Última versión)
Ejecutar de forma no interactiva:
```bash
npx create-next-app@latest <nombre-proyecto> --typescript --eslint --app --src-dir --import-alias "@/*" --use-npm
```

### 2. Instalación de Dependencias de Iconos y Animaciones
Moverse al directorio del proyecto e instalar:
```bash
cd <nombre-proyecto>
npm install lucide-react simple-icons motion
```

### 3. Instalación de Skills Esenciales de Referencia
Instalar los skills de mejores prácticas y diseño:
```bash
npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices -y
npx skills add https://github.com/anthropics/skills --skill frontend-design -y
```

### 4. Configuración Base de Identidad
Verificar que `src/app/layout.tsx` y los estilos base incluyan:
- Título y metadatos con el branding del proyecto.
- Tipografía moderna e integración de las variables corporativas si es un proyecto de GearSoftCA.
