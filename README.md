# ChatBotProlog Inteligente con Programación Lógica
 
El Chatbot Inteligente es una aplicación de consola desarrollada en Prolog que permite a los usuarios mantener conversaciones interactivas, hacer preguntas sobre una base de conocimiento, aprender nueva información dinámicamente y explorar inferencias lógicas. El sistema funciona como una herramienta de diálogo que responde preguntas, maneja sinónimos y genera nuevo conocimiento durante la ejecución.
 
---
 
## Integrantes
 
- Christopher Daniel Vargas Villalta, 2024108443
- Andrey Jesús Jiménez Núñez,  2024145153
- Isaac Villalobos Bonilla, 2024124285
- Daniel Arce Campos, 2024174489
**IC 4700: Lenguajes de Programación**  
Prof. Bryan Tomás Hernández Sibaja
 
---
 
## Requisitos
 
- [SWI-Prolog](https://www.swi-prolog.org/Download.html) — intérprete de Prolog (versión 8.0 o superior)
- [Visual Studio Code](https://code.visualstudio.com/) con la extensión **Prolog** (`arthurwang.prolog` o `carlos-schuck.swiprolog`)
 
---
 
## Instalación de SWI-Prolog
 
### Windows
 
1. Descargar el instalador desde https://www.swi-prolog.org/Download.html
2. Ejecutar el instalador y seguir los pasos (seleccionar "Add to PATH" durante la instalación)
3. Abrir una terminal nueva y verificar con:
```bash
swipl --version
```
 
### Linux
 
```bash
sudo apt-get install swi-prolog
```
 
### macOS
 
```bash
brew install swi-prolog
```
 
---
 
## Configuración de VS Code

### 1. Instalar la extensión de Prolog

1. Abre VS Code
2. Ve a **Extensions** (`Ctrl + Shift + X`)
3. Busca `vsc-prolog` e instala la extensión de **arthurwang** (`arthurwang.vsc-prolog`)
4. Presiona `Ctrl + ,`, busca `prolog.executablePath` y configura la ruta:
   - **Windows**: `C:\Program Files\swipl\bin\swipl.exe`
   - **Linux/macOS**: `/usr/bin/swipl`

La extensión agrega resaltado de sintaxis y permite ejecutar consultas directamente desde el editor.

---

## Cómo correr el proyecto desde VS Code

### Paso 1 — Abrir el proyecto

Abre la carpeta `ChatBotProlog` en VS Code (`Archivo > Abrir carpeta`).

### Paso 2 — Abrir la terminal integrada

Presiona `` Ctrl + ` `` para abrir la terminal de VS Code.

### Paso 3 — Ejecutar SWI-Prolog con el archivo

**En Windows**, si `swipl` no se reconoce como comando, usa la ruta completa:

```powershell
& "C:\Program Files\swipl\bin\swipl.exe" swipl --no-tty -q -s main.pl -g inicio
```

> **Nota:** Esto ocurre cuando el instalador de SWI-Prolog no agregó la ruta al PATH del sistema.
> Para evitarlo en el futuro, puedes agregar `C:\Program Files\swipl\bin` al PATH de Windows
> desde: **Configuración > Sistema > Acerca de > Configuración avanzada del sistema > Variables de entorno**.

**En Linux/macOS:**

```bash
swipl --no-tty -q -s main.pl -g inicio
```

### Paso 4 — Iniciar el chatbot

```prolog.
swipl --no-tty -q -s main.pl -g inicio
```

Ya dentro del interprete se puede preguntar todo naturalmente.

> Importante: en Prolog todo comando termina con un punto `.`

El chatbot se ejecuta directamente sin necesidad de compilación previa. SWI-Prolog interpreta el código al instante.
 
---
 
## Uso del Chatbot
 
El chatbot presenta un menú interactivo donde puedes:
 
- **Hacer preguntas** sobre la base de conocimiento
- **Aprender nueva información** (el chatbot la almacena dinámicamente)
- **Consultar definiciones** de conceptos
- **Explorar relaciones lógicas** entre hechos
- **Enseñar sinónimos** para mejorar la interpretación

---

### Ejemplo de Interacción
 

---
 
## Estructura del Proyecto
 
```
ChatBotProlog/
├── chatbot.pl              # Archivo principal del chatbot
├── base_conocimiento.pl    # Base de conocimiento inicial (hechos y reglas)
├── predicados_utiles.pl    # Predicados auxiliares
├── README.md               # Este archivo
└── .gitignore              # Archivos a ignorar en Git
```
 
---

## Manual de Usuario
https://docs.google.com/document/d/11Yi4OkmKMyBl8SDd7LAa2cJ5KuY_m3wxhZjJFJalTEQ/edit?usp=sharing
