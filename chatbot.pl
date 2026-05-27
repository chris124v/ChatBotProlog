% =========================================================
%  ChatBot Prolog - Razonamiento Logico
%  Autor: Andrey Jimenez
%  Curso: Lenguajes de Programacion - IC 4700
%
%  Responsabilidades:
%    - Base de conocimiento personal (50+ hechos)
%    - Seccion 2.6: Motor de Inferencias Logicas
%    - Seccion 2.7: Flujo Conversacional
%
%  Para iniciar: swipl chatbot.pl  luego  ?- inicio.
% =========================================================


% ---------------------------------------------------------
%  DECLARACIONES DINAMICAS
%
%  Estas declaraciones le dicen a Prolog que los predicados
%  pueden cambiar durante la ejecucion (usando assertz/retract).
%  Sin esto, Prolog no permitiria agregar hechos en tiempo real.
% ---------------------------------------------------------

:- dynamic concepto/2.      % concepto(nombre, 'Descripcion en texto')
:- dynamic es_un/2.         % es_un(prolog, lenguaje_logico)
:- dynamic tiene/2.         % tiene(java, tipado_estatico)
:- dynamic sinonimo/2.      % sinonimo(js, javascript)
:- dynamic sirve_para/2.    % sirve_para(python, 'ciencia de datos')


% =========================================================
%  BASE DE CONOCIMIENTO INICIAL
%
%  Tema: Lenguajes de programacion y conceptos de
%        Ciencias de la Computacion.
%
%  Organizada en cinco tipos de hechos:
%    concepto/2    - define que ES algo
%    es_un/2       - establece jerarquias de categoria
%    tiene/2       - describe propiedades de un concepto
%    sinonimo/2    - equivalencias entre terminos
%    sirve_para/2  - usos principales de un concepto
% =========================================================


% ---------------------------------------------------------
%  DEFINICIONES (concepto/2)
%  Cada hecho responde "que es" para un tema especifico.
% ---------------------------------------------------------

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


% ---------------------------------------------------------
%  JERARQUIAS DE CATEGORIA (es_un/2)
%
%  Organizadas en cadenas para permitir inferencia transitiva.
%  Ejemplo: prolog -> lenguaje_logico -> lenguaje_programacion
%           Esto permite inferir que prolog es lenguaje_programacion
%           aunque no este declarado directamente.
% ---------------------------------------------------------

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


% ---------------------------------------------------------
%  PROPIEDADES (tiene/2)
%
%  Las propiedades definidas en una categoria padre son
%  heredadas automaticamente por sus subcategorias.
%  Ejemplo: lenguaje_logico tiene inferencia_automatica
%           Por lo tanto, prolog (que es lenguaje_logico) tambien la tiene.
% ---------------------------------------------------------

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


% ---------------------------------------------------------
%  SINONIMOS (sinonimo/2)
%
%  Permiten al chatbot entender abreviaciones y variantes.
%  El motor de inferencias usa estos pares para resolver
%  consultas aunque el usuario use el termino alternativo.
% ---------------------------------------------------------

sinonimo(pl,   programacion_logica).
sinonimo(ia,   inteligencia_artificial).
sinonimo(poo,  programacion_orientada_objetos).
sinonimo(oop,  programacion_orientada_objetos).
sinonimo(fp,   programacion_funcional).
sinonimo(js,   javascript).
sinonimo(py,   python).
sinonimo(ml,   machine_learning).
sinonimo(jvm,  maquina_virtual_jvm).


% ---------------------------------------------------------
%  USOS (sirve_para/2)
%
%  Describe el proposito principal de un lenguaje o concepto.
%  Tambien se heredan: si no hay uso directo para X,
%  se busca en el tipo padre de X.
% ---------------------------------------------------------

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


% =========================================================
%  SECCION 2.6 - MOTOR DE INFERENCIAS LOGICAS
%
%  Este modulo genera conclusiones nuevas a partir de los
%  hechos de la base de conocimiento usando:
%    - Transitividad (A es B, B es C => A es C)
%    - Herencia de propiedades (si A es de tipo B, hereda los tiene/2 de B)
%    - Resolucion por sinonimos (busca variantes antes de fallar)
%    - Herencia de usos (sirve_para se propaga por jerarquias)
%    - Deteccion de relaciones entre conceptos
% =========================================================


% --- Inferencia 1: is-a transitivo ---
%
% Si A es_un B, y B es_un C (directa o por mas pasos),
% entonces es_tipo(A, C) es verdadero.
%
% Caso base: relacion directa en la base de conocimiento.
% Caso recursivo: encadena multiples relaciones es_un.
%
% Ejemplo:
%   prolog es_un lenguaje_logico
%   lenguaje_logico es_un lenguaje_programacion
%   => es_tipo(prolog, lenguaje_programacion) es verdadero

es_tipo(X, Z) :-
    es_un(X, Z).
es_tipo(X, Z) :-
    es_un(X, Y),
    es_tipo(Y, Z).


% --- Inferencia 2: Herencia de propiedades ---
%
% X hereda todas las propiedades de sus categorias ancestros.
% Si prolog es lenguaje_logico, y lenguaje_logico tiene inferencia_automatica,
% entonces tiene_inferido(prolog, inferencia_automatica) es verdadero
% aunque no este declarado directamente.

tiene_inferido(X, P) :-
    tiene(X, P).
tiene_inferido(X, P) :-
    es_tipo(X, Tipo),
    tiene(Tipo, P).


% --- Inferencia 3: Resolucion por sinonimos ---
%
% Antes de buscar un concepto, intenta normalizarlo usando la
% tabla de sinonimos. Esto permite que "js" funcione igual que "javascript".
%
% El corte (!) evita encontrar multiples sinonimos para el mismo termino.

normalizar(X, Y) :- sinonimo(X, Y), !.
normalizar(X, Y) :- sinonimo(Y, X), !.
normalizar(X, X).

% Busca la definicion resolviendo sinonimos si es necesario.
concepto_resuelto(X, Def) :-
    concepto(X, Def).
concepto_resuelto(X, Def) :-
    normalizar(X, Y),
    X \= Y,              % Solo continua si el termino cambio al normalizar
    concepto(Y, Def).


% --- Inferencia 4: Herencia de usos ---
%
% Si no hay un sirve_para directo para X, busca en su tipo padre.
% Ejemplo: si erlang es lenguaje_funcional,
%          y lenguaje_funcional tiene un uso definido,
%          erlang lo hereda.

sirve_para_inferido(X, Uso) :-
    sirve_para(X, Uso).
sirve_para_inferido(X, Uso) :-
    es_tipo(X, Tipo),
    sirve_para(Tipo, Uso).


% --- Inferencia 5: Deteccion de relacion entre dos conceptos ---
%
% Dos conceptos estan relacionados si comparten al menos
% una categoria comun en la jerarquia de es_tipo.
% Esto aplica razonamiento logico para generar nuevas conclusiones.

relacionados(X, Y) :-
    X \= Y,
    es_tipo(X, Tipo),
    es_tipo(Y, Tipo).


% =========================================================
%  SECCION 2.7 - FLUJO CONVERSACIONAL
%
%  Implementa la conversacion completa usando:
%    - Recursividad (sin ningun ciclo imperativo)
%    - Backtracking (para detectar intencion y listar respuestas)
%    - Predicados dinamicos (para aprendizaje en tiempo real)
%    - Reglas declarativas (cada comportamiento es una regla Prolog)
% =========================================================


% --- Punto de entrada ---
% El usuario inicia el chatbot ejecutando: ?- inicio.

inicio :-
    write('=================================================\n'),
    write('   ChatBot Prolog - Razonamiento Logico\n'),
    write('=================================================\n'),
    write('Bot: Hola! Soy un chatbot que razona con logica y legalmente si piensa.\n'),
    write('     Escribe "ayuda" para ver los comandos.\n\n'),
    conversar.


% --- Loop conversacional principal ---
%
% Mantiene la conversacion activa mediante recursion pura.
% No usa ninguna construccion imperativa (while, for, repeat con side-effects).
%
% Flujo:
%   1. Muestra prompt y lee entrada del usuario
%   2. Si el usuario se despide, termina
%   3. Si no, procesa la entrada y vuelve a llamarse a si mismo

conversar :-
    write('Tu: '),
    leer_entrada(Entrada),
    ( es_despedida(Entrada) ->
        despedirse
    ;
        procesar(Entrada),
        nl,
        conversar        % Llamada recursiva: reemplaza el ciclo imperativo
    ).


% --- Procesador de entrada ---
%
% Detecta la intencion del usuario (que quiere hacer) y la delega
% al manejador correspondiente. El corte (!) asegura que solo se
% use la primera intencion detectada.

procesar(Entrada) :-
    detectar_intencion(Entrada, Intencion, Dato),
    !,
    manejar(Intencion, Dato).


% --- Deteccion de intencion por palabras clave ---
%
% Cada clausula identifica una intencion diferente buscando
% frases clave en la entrada del usuario con sub_string.
%
% El backtracking de Prolog prueba las clausulas en orden
% hasta encontrar la primera que haga match.

% Preguntas de definicion: "que es X", "explique X", "defina X", etc.
detectar_intencion(E, definir, C) :-
    contiene_alguna(E, ["que es ","explique ","defina ","define ","describe "]),
    extraer_concepto(E, C).

% Preguntas de uso: "para que sirve X", "para que se usa X"
detectar_intencion(E, uso, C) :-
    contiene_alguna(E, ["para que sirve","para que se usa","como se usa"]),
    extraer_concepto(E, C).

% Preguntas de categoria: "que tipo es X", "que clase es X"
detectar_intencion(E, tipo, C) :-
    contiene_alguna(E, ["que tipo es","que clase es","que categoria es"]),
    extraer_concepto(E, C).

% Preguntas de propiedades: "que tiene X", "propiedades de X"
detectar_intencion(E, propiedades, C) :-
    contiene_alguna(E, ["que tiene ","propiedades de ","caracteristicas de "]),
    extraer_concepto(E, C).

% Verificar si dos conceptos estan relacionados
detectar_intencion(E, relacionar, info(X, Y)) :-
    contiene_alguna(E, ["relacionados","se relacionan","tienen relacion"]),
    extraer_dos_conceptos(E, X, Y).

% Aprendizaje de un nuevo concepto: "aprender que X es Y"
detectar_intencion(E, aprender, info(C, D)) :-
    sub_string(E, _, _, _, "aprender que "),
    extraer_aprendizaje(E, C, D).

% Aprendizaje de sinonimo: "X es sinonimo de Y" o "X significa Y"
detectar_intencion(E, nuevo_sinonimo, info(A, B)) :-
    contiene_alguna(E, ["es sinonimo de","significa "]),
    extraer_sinonimo(E, A, B).

% Olvidar un concepto: "olvidar X" — usa retract para eliminar de la BD dinamica
detectar_intencion(E, olvidar, C) :-
    contiene_alguna(E, ["olvidar ","eliminar concepto ","borrar "]),
    extraer_concepto(E, C).

% Solicitud de ayuda
detectar_intencion(E, ayuda, _) :-
    contiene_alguna(E, ["ayuda","help","comandos","que puedes"]).

% Fallback: si ninguna clausula anterior hizo match
detectar_intencion(_, desconocido, _).


% --- Manejadores de respuesta ---
%
% Cada clausula manejar/2 produce la respuesta apropiada
% para una intencion detectada.

% Responder: que es X
manejar(definir, C) :-
    ( concepto_resuelto(C, Def) ->
        format("Bot: ~w es ~w~n", [C, Def])
    ;
        % El chatbot no conoce el concepto, activa el aprendizaje
        aprender_nuevo_concepto(C)
    ).

% Responder: para que sirve X
manejar(uso, C) :-
    ( sirve_para_inferido(C, Uso) ->
        format("Bot: ~w sirve para ~w~n", [C, Uso])
    ;
        format("Bot: No tengo informacion sobre el uso de '~w'.~n", [C])
    ).

% Responder: que tipo de cosa es X (usa inferencia transitiva)
manejar(tipo, C) :-
    findall(T, es_tipo(C, T), Tipos),
    ( Tipos \= [] ->
        format("Bot: '~w' es de tipo: ", [C]),
        escribir_lista(Tipos)
    ;
        format("Bot: No se en que categoria esta '~w'.~n", [C])
    ).

% Responder: que propiedades tiene X (usa herencia de propiedades)
manejar(propiedades, C) :-
    findall(P, tiene_inferido(C, P), Props),
    ( Props \= [] ->
        format("Bot: '~w' tiene: ", [C]),
        escribir_lista(Props)
    ;
        format("Bot: No conozco propiedades de '~w'.~n", [C])
    ).

% Responder: estan relacionados X e Y (usa inferencia de relaciones)
manejar(relacionar, info(X, Y)) :-
    ( relacionados(X, Y) ->
        format("Bot: Si, '~w' y '~w' estan relacionados: comparten al menos una categoria en comun.~n", [X, Y])
    ;
        format("Bot: '~w' y '~w' no parecen estar relacionados segun mi conocimiento actual.~n", [X, Y])
    ).

% Guardar nuevo concepto dinamicamente
manejar(aprender, info(C, D)) :-
    % assertz agrega el hecho al final de la BD; estara disponible de inmediato
    assertz(concepto(C, D)),
    format("Bot: Entendido! Aprendi que '~w' es ~w~n", [C, D]).

% Guardar nuevo sinonimo dinamicamente
manejar(nuevo_sinonimo, info(A, B)) :-
    assertz(sinonimo(A, B)),
    format("Bot: Anotado! Ahora se que '~w' y '~w' son equivalentes.~n", [A, B]).

% Olvidar un concepto usando retract — elimina el hecho de la base de conocimiento en tiempo real
manejar(olvidar, C) :-
    ( retract(concepto(C, _)) ->
        format("Bot: Listo, olvide todo lo que sabia sobre '~w'.~n", [C])
    ;
        format("Bot: No tenia ningun concepto guardado para '~w'.~n", [C])
    ).

% Mostrar ayuda
manejar(ayuda, _) :-
    mostrar_ayuda.

% Respuesta generica cuando no se reconocio la entrada
manejar(desconocido, _) :-
    write("Bot: No entendi eso. Escribe 'ayuda' para ver los comandos disponibles.\n").


% --- Aprendizaje dinamico interactivo ---
%
% Cuando el chatbot no conoce un concepto, le pregunta al usuario.
% La respuesta se guarda con assertz para usarla en consultas futuras.
% Este es un ejemplo directo de aprendizaje dinamico con predicados dinamicos.

aprender_nuevo_concepto(C) :-
    format("Bot: No conozco '~w'. Que es? (escribe la definicion o Enter para omitir)~n", [C]),
    write('Tu: '),
    read_line_to_string(user_input, Def),
    ( Def \= "" ->
        atom_string(DefAtom, Def),
        assertz(concepto(C, DefAtom)),
        format("Bot: Gracias! Ahora recordare que '~w' es ~w~n", [C, DefAtom])
    ;
        write("Bot: Sin problema. Puedes ensenarme despues con: aprender que X es Y\n")
    ).


% =========================================================
%  UTILIDADES DE PROCESAMIENTO DE TEXTO
%
%  Predicados auxiliares para leer, normalizar y analizar
%  el texto que ingresa el usuario.
% =========================================================


% --- Lectura y normalizacion de entrada ---
%
% Lee la linea completa del usuario y la convierte a minusculas
% para que las comparaciones no sean sensibles a mayusculas.

leer_entrada(EntradaNorm) :-
    read_line_to_string(user_input, Linea),
    string_lower(Linea, EntradaNorm).


% --- Deteccion de palabras clave ---
%
% Verifica si al menos una de las frases en la lista aparece en el texto.
% El corte evita seguir buscando cuando ya encontro una coincidencia.

contiene_alguna(Str, [H|_]) :-
    sub_string(Str, _, _, _, H), !.
contiene_alguna(Str, [_|T]) :-
    contiene_alguna(Str, T).


% --- Deteccion de despedida ---
%
% Lista de expresiones que indican que el usuario quiere terminar.

es_despedida(E) :-
    contiene_alguna(E, ["salir","adios","exit","bye","chao","hasta luego","finalizar"]).


% --- Extraccion del concepto de una pregunta ---
%
% Quita prefijos funcionales (verbos de pregunta, articulos) del inicio
% del texto y retorna el primer token significativo como atomo.
% Ejemplo: "explique la recursion" => recursion

extraer_concepto(Entrada, Concepto) :-
    Prefijos = [
        "que es ","explique ","defina ","define ","describe ",
        "para que sirve ","para que se usa ","como se usa ",
        "que tipo es ","que clase es ","que categoria es ",
        "propiedades de ","caracteristicas de ",
        "que tiene ","que tienen ",
        "el ","la ","los ","las ","un ","una "
    ],
    quitar_prefijos(Entrada, Prefijos, Resto),
    primer_token(Resto, TokenLimpio),
    atom_string(Concepto, TokenLimpio).


% Intenta eliminar cada prefijo de la lista de manera recursiva.
% Si un prefijo coincide con el inicio del string, lo quita y repite.
% El corte evita explorar multiples prefijos innecesarios.

quitar_prefijos(Str, Prefijos, Resultado) :-
    member(P, Prefijos),
    string_concat(P, Resto, Str),
    !,
    quitar_prefijos(Resto, Prefijos, Resultado).
quitar_prefijos(Str, _, Str).


% Extrae el primer token del string, ignorando puntuacion y espacios.
% Convierte el resultado a minusculas.

primer_token(Str, Token) :-
    split_string(Str, " \t\n?!.,:", " \t\n?!.,:", Partes),
    exclude(=(""), Partes, [Primero|_]),
    !,
    string_lower(Primero, Token).
primer_token(Str, Str).


% --- Extraccion de par concepto+definicion para aprendizaje ---
%
% Parsea el patron: "aprender que NOMBRE es DEFINICION"
% Ejemplo: "aprender que rust es un lenguaje de sistemas"
%   => Concepto = rust, Definicion = 'un lenguaje de sistemas'

extraer_aprendizaje(Entrada, Concepto, Definicion) :-
    sub_string(Entrada, Antes, Largo, _, "aprender que "),
    Inicio is Antes + Largo,
    sub_string(Entrada, Inicio, _, 0, Resto),
    % Busca el primer " es " que separa nombre de definicion
    sub_string(Resto, PosEs, LargoEs, _, " es "),
    !,
    sub_string(Resto, 0, PosEs, _, NombreStr),
    InicioDefStr is PosEs + LargoEs,
    sub_string(Resto, InicioDefStr, _, 0, DefStr),
    atom_string(Concepto, NombreStr),
    atom_string(Definicion, DefStr).


% --- Extraccion de par de sinonimos ---
%
% Parsea patrones como:
%   "js es sinonimo de javascript"
%   "py significa python"

extraer_sinonimo(Entrada, A, B) :-
    (   sub_string(Entrada, PosConector, LargoConector, _, " es sinonimo de ")
    ;   sub_string(Entrada, PosConector, LargoConector, _, " significa ")
    ),
    !,
    sub_string(Entrada, 0, PosConector, _, StrA),
    InicioB is PosConector + LargoConector,
    sub_string(Entrada, InicioB, _, 0, StrB),
    primer_token(StrA, TokenA),
    primer_token(StrB, TokenB),
    atom_string(A, TokenA),
    atom_string(B, TokenB).


% --- Extraccion de dos conceptos para verificar relacion ---
%
% Parsea patrones como: "relacionados prolog y haskell"
% Busca la conjuncion " y " o " e " para separar los dos conceptos.

extraer_dos_conceptos(Entrada, X, Y) :-
    (   sub_string(Entrada, PosRel, LargoRel, _, "relacionados ")
    ;   sub_string(Entrada, PosRel, LargoRel, _, "se relacionan ")
    ),
    !,
    InicioPar is PosRel + LargoRel,
    sub_string(Entrada, InicioPar, _, 0, Par),
    (   sub_string(Par, PosSep, LargoSep, _, " y ")
    ;   sub_string(Par, PosSep, LargoSep, _, " e ")
    ),
    !,
    sub_string(Par, 0, PosSep, _, StrX),
    InicioY is PosSep + LargoSep,
    sub_string(Par, InicioY, _, 0, StrY),
    primer_token(StrX, TokenX),
    primer_token(StrY, TokenY),
    atom_string(X, TokenX),
    atom_string(Y, TokenY).


% --- Salida formateada ---

% Escribe una lista de elementos separados por coma.
% Caso base: un solo elemento, termina con salto de linea.
% Caso recursivo: escribe el primero, coma, y llama recursivamente.

escribir_lista([H]) :-
    write(H), nl.
escribir_lista([H|T]) :-
    write(H), write(', '),
    escribir_lista(T).


% Muestra el menu de ayuda al usuario.

mostrar_ayuda :-
    write("Bot: Puedo responder preguntas como:\n"),
    write("  que es prolog\n"),
    write("  explique recursion\n"),
    write("  para que sirve python\n"),
    write("  que tipo es java\n"),
    write("  que tiene haskell\n"),
    write("  relacionados prolog y haskell\n"),
    write("  aprender que rust es un lenguaje de sistemas\n"),
    write("  js es sinonimo de javascript\n"),
    write("  olvidar rust\n"),
    write("  salir\n").


% Mensaje de despedida al terminar la sesion.

despedirse :-
    write("Bot: Hasta luego! Fue un placer conversar contigo.\n").
