% =========================================================
%  SECCION 2.6 - MOTOR DE INFERENCIAS LOGICAS
%
%  Este módulo implementa inferencias lógicas simples
%  para generar conclusiones a partir de los hechos
%  de la base de conocimiento.
%
%  Técnicas de razonamiento lógico:
%    - Transitividad (A es B, B es C => A es C)
%    - Herencia de propiedades (si A es de tipo B,
%      hereda los tiene/2 de B)
%    - Resolución por sinónimos (normalizar términos)
%    - Herencia de usos (sirve_para se propaga)
%    - Detección de relaciones entre conceptos
% =========================================================
 
 
% ----- INFERENCIA 1: IS-A TRANSITIVO -----
%
% Si X es_un Y, e Y es_un Z (directa o por más pasos),
% entonces es_tipo(X, Z) es verdadero.
%
% Caso base: relación directa en la base de conocimiento.
% Caso recursivo: encadena múltiples relaciones es_un.
%
% Ejemplo:
%   es_un(prolog, lenguaje_logico).
%   es_un(lenguaje_logico, lenguaje_programacion).
%   => es_tipo(prolog, lenguaje_programacion) es verdadero
%
% Aplicación: El chatbot puede inferir que "prolog es
% un lenguaje de programación" aunque no esté declarado
% directamente, navegando la jerarquía de tipos.
 
es_tipo(X, Z) :-
    es_un(X, Z).
es_tipo(X, Z) :-
    es_un(X, Y),
    es_tipo(Y, Z).
 
 
% ----- INFERENCIA 2: HERENCIA DE PROPIEDADES -----
%
% X hereda todas las propiedades de sus categorías
% ancestros en la jerarquía es_un.
%
% Si tiene(lenguaje_logico, inferencia_automatica) y
% es_un(prolog, lenguaje_logico), entonces prolog
% también tiene inferencia_automatica, aunque no
% esté declarado directamente.
%
% Caso base: propiedad directa en la base de conocimiento.
% Caso recursivo: busca propiedades en tipos padre.
%
% Aplicación: El chatbot infiere propiedades de
% luchadores sin necesidad de listarlas todas.
% Ejemplo: "¿Qué tiene wrestling?"
%   tiene(wrestling, derribos) - directo
%   tiene(estilo_lucha_proyeccion, control_posicion) - heredado
 
tiene_inferido(X, P) :-
    tiene(X, P).
tiene_inferido(X, P) :-
    es_tipo(X, Tipo),
    tiene(Tipo, P).
 
 
% ----- INFERENCIA 3: RESOLUCIÓN POR SINÓNIMOS -----
%
% Normaliza términos usando la tabla de sinónimos
% antes de buscar conceptos. Esto permite que
% variantes como "js" funcionen igual que "javascript".
%
% El corte (!) evita encontrar múltiples sinónimos
% innecesarios para el mismo término.
 
normalizar(X, Y) :- sinonimo(X, Y), !.
normalizar(X, Y) :- sinonimo(Y, X), !.
normalizar(X, X).
 
% Busca la definición resolviendo sinónimos si es necesario.
% Si "bjj" es sinónimo de "jiu_jitsu_brasileno", busca ambos.
 
concepto_resuelto(X, Def) :-
    concepto(X, Def).
concepto_resuelto(X, Def) :-
    normalizar(X, Y),
    X \= Y,              % Solo continúa si el término cambió al normalizar
    concepto(Y, Def).
 
 
% ----- INFERENCIA 4: HERENCIA DE USOS -----
%
% Si no hay un sirve_para directo para X,
% busca en su tipo padre en la jerarquía.
%
% Ejemplo:
%   sirve_para(boxeo, 'defensa personal...').
%   es_un(boxeo, estilo_lucha_de_pie).
%   => si pregunta "para que sirve boxeo" se responde
%      aunque sea una categoría padre quien define el uso.
%
% Aplicación: Evita duplicar información en la BD.
% Caso base: uso directo del concepto.
% Caso recursivo: busca en tipos ancestros.
 
sirve_para_inferido(X, Uso) :-
    sirve_para(X, Uso).
sirve_para_inferido(X, Uso) :-
    es_tipo(X, Tipo),
    sirve_para(Tipo, Uso).
 
 
% ----- INFERENCIA 5: DETECCIÓN DE RELACIÓN ENTRE CONCEPTOS -----
%
% Dos conceptos están relacionados si comparten al menos
% una categoría común en la jerarquía de es_tipo.
%
% Esto aplica razonamiento lógico para generar nuevas
% conclusiones sobre relaciones entre hechos.
%
% Ejemplo:
%   es_un(perro, animal).
%   es_un(gato, animal).
%   => relacionados(perro, gato) es verdadero
%      porque ambos son animales.
%
% Aplicación: El chatbot responde "¿están relacionados?"
%   "¿relacionados khamzat y strickland?"
%   Respuesta: Sí, ambos son luchadores de peso medio.
 
relacionados(X, Y) :-
    X \= Y,
    es_tipo(X, Tipo),
    es_tipo(Y, Tipo).