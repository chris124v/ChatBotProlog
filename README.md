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
 
## Configuración de VS Code (Opcional)
 
1. Abre VS Code
2. Ve a **Extensions** (Ctrl + Shift + X)
3. Busca `Prolog` e instala la extensión `arthurwang.vsc-prolog`
3. Busca `Prolog` e instala la extensión `penglv.prolog`
4. Presiona `Ctrl + ,` y busca `prolog.executablePath`
5. Configura la ruta según tu SO:
   - **Windows**: `C:\Program Files\swipl\bin\swipl.exe`
   - **Linux/macOS**: `/usr/bin/swipl`
---
 
## Cómo correr el proyecto
 
```bash
# 1. Clonar el repositorio
git clone <url-del-repositorio>
cd ChatBotProlog
 
# 2. Ejecutar el chatbot
swipl chatbot.pl
 
# 3. En la consola de Prolog, escribe:
?- inicio.
```
 
El chatbot se ejecuta directamente sin necesidad de compilación previa. SWI-Prolog interpreta el código al instante.
 
---
 
## Uso del Chatbot
 
Una vez iniciado con `inicio.`, el chatbot presenta un menú interactivo donde puedes:
 
- **Hacer preguntas** sobre la base de conocimiento
- **Aprender nueva información** (el chatbot la almacena dinámicamente)
- **Consultar definiciones** de conceptos
- **Explorar relaciones lógicas** entre hechos
- **Enseñar sinónimos** para mejorar la interpretación

---

### Ejemplo de Interacción
 
```
?- inicio.
========================================
   BIENVENIDO AL CHATBOT INTELIGENTE
========================================
 
¿Qué deseas hacer?
1. Hacer una pregunta
2. Aprender nueva información
3. Consultar un concepto
4. Salir
 
Opción: 1.
```
Importante siempre poner un "." despues de poner el comando.

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
