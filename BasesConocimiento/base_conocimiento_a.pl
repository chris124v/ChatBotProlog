
%  Tema: Lenguajes de programacion y conceptos de Ciencias de la Computacion.
%  Autor: Andrey Jimenez


%  Declaraciones Dinamicas y Multifile
%
%  Estas declaraciones le dicen a Prolog que los predicados
%  pueden cambiar durante la ejecucion (usando assertz/retract).
%  Sin esto, Prolog no permitiria agregar hechos en tiempo real.

:- dynamic concepto/2.
:- multifile concepto/2.
:- dynamic es_un/2.
:- multifile es_un/2.
:- dynamic tiene/2.
:- multifile tiene/2.
:- dynamic sinonimo/2.
:- multifile sinonimo/2.
:- dynamic sirve_para/2.
:- multifile sirve_para/2.


%  Organizada en cinco tipos de hechos:
%    concepto/2    - define que ES algo
%    es_un/2       - establece jerarquias de categoria
%    tiene/2       - describe propiedades de un concepto
%    sinonimo/2    - equivalencias entre terminos
%    sirve_para/2  - usos principales de un concepto

%  Definciones (concepto/2)
%  Cada hecho responde "que es" para un tema especifico.

concepto(prolog,
    'lenguaje de programacion logica basado en calculo de predicados').
concepto(haskell,
    'lenguaje de programacion funcional puro con tipado estatico y evaluacion perezosa').
concepto(python,
    'lenguaje de programacion multiparadigma, interpretado y de alto nivel').
concepto(java,
    'lenguaje de programacion orientado a objetos compilado a bytecode para la JVM').
concepto(javascript,
    'lenguaje interpretado de tipado dinamico para desarrollo web frontend y backend').
concepto(c,
    'lenguaje de bajo nivel, compilado y de proposito general para programacion de sistemas').
concepto(lisp,
    'uno de los lenguajes funcionales mas antiguos, basado en listas y expresiones simbolicas').
concepto(erlang,
    'lenguaje funcional disenado para sistemas concurrentes, tolerantes a fallos y distribuidos').
concepto(rust,
    'lenguaje de sistemas con garantias de seguridad de memoria en tiempo de compilacion').
concepto(swift,
    'lenguaje orientado a objetos desarrollado por Apple para iOS y macOS').
concepto(kotlin,
    'lenguaje moderno para la JVM, interoperable con Java y oficial para Android').
concepto(scala,
    'lenguaje que combina programacion funcional y orientada a objetos sobre la JVM').

concepto(recursion,
    'tecnica donde una funcion se llama a si misma para resolver subproblemas mas pequenos').
concepto(backtracking,
    'tecnica de busqueda que explora caminos posibles y retrocede cuando encuentra un callejon sin salida').
concepto(paradigma,
    'enfoque o estilo fundamental para estructurar y escribir programas').
concepto(algoritmo,
    'secuencia finita de pasos bien definidos para resolver un problema computacional').
concepto(compilador,
    'herramienta que traduce codigo fuente completo a codigo maquina antes de ejecutarlo').
concepto(interprete,
    'herramienta que lee y ejecuta instrucciones directamente, linea por linea, sin compilar antes').
concepto(variable,
    'espacio con nombre en memoria para almacenar y modificar un valor durante la ejecucion').
concepto(funcion,
    'bloque de codigo reutilizable que realiza una tarea y puede retornar un valor').
concepto(tipo_de_dato,
    'clasificacion que define que valores puede almacenar un dato y que operaciones acepta').
concepto(lista,
    'estructura de datos secuencial que almacena elementos en orden').
concepto(arbol,
    'estructura de datos jerarquica formada por nodos conectados mediante ramas').
concepto(grafo,
    'estructura de datos con nodos y aristas que representan relaciones entre elementos').
concepto(unificacion,
    'mecanismo central de Prolog que hace que dos terminos sean iguales asignando valores a variables').
concepto(herencia,
    'mecanismo que permite a una clase adquirir propiedades y metodos de otra clase padre').
concepto(polimorfismo,
    'capacidad de tratar objetos de distintos tipos de manera uniforme mediante una interfaz comun').
concepto(encapsulamiento,
    'principio de ocultar detalles internos de un objeto y exponer solo lo necesario al exterior').
concepto(inteligencia_artificial,
    'campo de la computacion que crea sistemas capaces de realizar tareas que requieren inteligencia humana').
concepto(machine_learning,
    'subcampo de IA donde los sistemas aprenden de datos sin ser programados explicitamente para cada tarea').
concepto(programacion_funcional,
    'paradigma que trata la computacion como evaluacion de funciones matematicas, evitando el estado mutable').
concepto(programacion_logica,
    'paradigma basado en logica formal donde se declaran hechos y reglas, y el motor infiere conclusiones').
concepto(programacion_orientada_objetos,
    'paradigma que organiza el codigo en objetos que combinan datos y comportamiento').
concepto(estructura_datos,
    'forma de organizar y almacenar datos en memoria para accederlos y modificarlos eficientemente').
concepto(complejidad_algoritmica,
    'medida de los recursos (tiempo o memoria) que necesita un algoritmo segun el tamano del problema').

%  Jerarquias de Categorías (es_un/2)
%
%  Organizadas en cadenas para permitir inferencia transitiva.
%  Ejemplo: prolog -> lenguaje_logico -> lenguaje_programacion
%  Esto permite inferir que prolog es lenguaje_programacion
%  aunque no este declarado directamente.

% Lenguajes especificos a su paradigma
es_un(prolog,      lenguaje_logico).
es_un(haskell,     lenguaje_funcional).
es_un(lisp,        lenguaje_funcional).
es_un(erlang,      lenguaje_funcional).
es_un(python,      lenguaje_multiparadigma).
es_un(java,        lenguaje_orientado_objetos).
es_un(swift,       lenguaje_orientado_objetos).
es_un(kotlin,      lenguaje_orientado_objetos).
es_un(scala,       lenguaje_multiparadigma).
es_un(javascript,  lenguaje_interpretado).
es_un(c,           lenguaje_compilado).
es_un(rust,        lenguaje_compilado).

% Paradigmas como categorias de lenguajes
es_un(lenguaje_logico,            lenguaje_programacion).
es_un(lenguaje_funcional,         lenguaje_programacion).
es_un(lenguaje_multiparadigma,    lenguaje_programacion).
es_un(lenguaje_orientado_objetos, lenguaje_programacion).
es_un(lenguaje_interpretado,      lenguaje_programacion).
es_un(lenguaje_compilado,         lenguaje_programacion).

% Los lenguajes de programacion son herramientas informaticas
es_un(lenguaje_programacion, herramienta_informatica).

% Estructuras de datos
es_un(lista,  estructura_datos).
es_un(arbol,  estructura_datos).
es_un(grafo,  estructura_datos).

% Tecnicas de programacion
es_un(recursion,    tecnica_programacion).
es_un(backtracking, tecnica_programacion).

% Herramientas de desarrollo
es_un(compilador,  herramienta_desarrollo).
es_un(interprete,  herramienta_desarrollo).
es_un(herramienta_desarrollo, herramienta_informatica).

% Subcampos de la inteligencia artificial
es_un(machine_learning, inteligencia_artificial).
es_un(inteligencia_artificial, campo_computacional).

%  Propiedades (tiene/2)
%
%  Las propiedades definidas en una categoria padre son
%  heredadas automaticamente por sus subcategorias.
%  Ejemplo: lenguaje_logico tiene inferencia_automatica por lo tanto, prolog (que es lenguaje_logico) tambien la tiene.

% Propiedades de los paradigmas (heredadas por todos sus lenguajes)
tiene(lenguaje_logico,            inferencia_automatica).
tiene(lenguaje_logico,            backtracking_integrado).
tiene(lenguaje_logico,            unificacion).
tiene(lenguaje_funcional,         funciones_de_orden_superior).
tiene(lenguaje_funcional,         inmutabilidad_por_defecto).
tiene(lenguaje_orientado_objetos, herencia).
tiene(lenguaje_orientado_objetos, encapsulamiento).
tiene(lenguaje_orientado_objetos, polimorfismo).

% Propiedades especificas de lenguajes concretos
tiene(prolog,      sintaxis_declarativa).
tiene(prolog,      motor_de_inferencia).
tiene(haskell,     evaluacion_perezosa).
tiene(haskell,     tipado_fuerte).
tiene(haskell,     sistema_de_tipos_hindley_milner).
tiene(python,      tipado_dinamico).
tiene(python,      sintaxis_simple).
tiene(python,      gran_ecosistema_de_librerias).
tiene(java,        tipado_estatico).
tiene(java,        maquina_virtual_jvm).
tiene(java,        recolector_de_basura).
tiene(rust,        gestion_memoria_sin_gc).
tiene(rust,        seguridad_de_memoria_en_compilacion).
tiene(javascript,  ejecucion_en_navegador).
tiene(javascript,  tipado_dinamico).

%  Sinonimos (sinonimo/2)
%
%  Permiten al chatbot entender abreviaciones y variantes.
%  El motor de inferencias usa estos pares para resolver
%  consultas aunque el usuario use el termino alternativo.

sinonimo(pl,   programacion_logica).
sinonimo(ia,   inteligencia_artificial).
sinonimo(poo,  programacion_orientada_objetos).
sinonimo(oop,  programacion_orientada_objetos).
sinonimo(fp,   programacion_funcional).
sinonimo(js,   javascript).
sinonimo(py,   python).
sinonimo(ml,   machine_learning).
sinonimo(jvm,  maquina_virtual_jvm).


%  Usos (sirve_para/2)
%
%  Describe el proposito principal de un lenguaje o concepto.
%  Tambien se heredan: si no hay uso directo para X,
%  se busca en el tipo padre de X.

sirve_para(prolog,
    'sistemas expertos, resolucion de problemas logicos e inteligencia artificial').
sirve_para(python,
    'ciencia de datos, machine learning, automatizacion y scripting').
sirve_para(java,
    'aplicaciones empresariales, desarrollo Android y sistemas distribuidos').
sirve_para(javascript,
    'desarrollo web frontend, backend con Node.js y aplicaciones interactivas').
sirve_para(haskell,
    'programacion funcional pura, verificacion formal y desarrollo de compiladores').
sirve_para(c,
    'programacion de sistemas, drivers, sistemas operativos y software de alto rendimiento').
sirve_para(rust,
    'programacion de sistemas segura sin recolector de basura').
sirve_para(erlang,
    'sistemas distribuidos de alta disponibilidad y telecomunicaciones').
sirve_para(machine_learning,
    'reconocimiento de patrones, predicciones y clasificacion automatica de datos').