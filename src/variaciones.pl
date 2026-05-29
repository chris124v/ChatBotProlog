% =========================================================
% Variaciones en de preguntas
%
%  Este modulo permite que el chatbot interprete la misma
%  pregunta escrita de formas distintas.
%
%  Estrategias implementadas:
%    1. Alias de patrones    - multiples frases para la misma intencion
%    2. Normalizacion        - quita signos, acentos comunes, mayusculas
%    3. Resolucion sinonimos - resuelve el concepto antes de buscar
%    4. Deteccion por tema   - palabras clave sin estructura de pregunta
% =========================================================

%  1. Patrones de preguntas

patron_definir("que es ").
patron_definir("explique ").
patron_definir("defina ").
patron_definir("define ").
patron_definir("describe ").
patron_definir("quien es ").
patron_definir("dime sobre ").
patron_definir("dime que es ").
patron_definir("explicame ").
patron_definir("explicame que es ").
patron_definir("cual es la definicion de ").
patron_definir("cual es el concepto de ").
patron_definir("que significa ").
patron_definir("que entiendes por ").
patron_definir("que sabes de ").
patron_definir("hablame de ").
patron_definir("habla de ").
patron_definir("informacion sobre ").
patron_definir("informacion de ").
patron_definir("conoces ").
patron_definir("que es lo que es ").

patron_uso("para que sirve ").
patron_uso("para que se usa ").
patron_uso("como se usa ").
patron_uso("cual es el uso de ").
patron_uso("cuales son los usos de ").
patron_uso("para que lo uso ").
patron_uso("en que se usa ").
patron_uso("para que se utiliza ").
patron_uso("como se utiliza ").
patron_uso("de que sirve ").
patron_uso("que utilidad tiene ").
patron_uso("para que es ").
patron_uso("cual es la funcion de ").
patron_uso("cual es la utilidad de ").

patron_tipo("que tipo es ").
patron_tipo("que tipo de cosa es ").
patron_tipo("que clase es ").
patron_tipo("que clase de cosa es ").
patron_tipo("que categoria es ").
patron_tipo("en que categoria esta ").
patron_tipo("como clasificas ").
patron_tipo("como se clasifica ").
patron_tipo("a que categoria pertenece ").
patron_tipo("a que grupo pertenece ").
patron_tipo("es un tipo de ").
patron_tipo("que tipo de ").

patron_propiedad("que tiene ").
patron_propiedad("que caracteristicas tiene ").
patron_propiedad("cuales son las caracteristicas de ").
patron_propiedad("propiedades de ").
patron_propiedad("cuales son las propiedades de ").
patron_propiedad("que atributos tiene ").
patron_propiedad("que incluye ").
patron_propiedad("que elementos tiene ").
patron_propiedad("como esta compuesto ").
patron_propiedad("de que se compone ").

patron_relacion("relacionados ").
patron_relacion("se relacionan ").
patron_relacion("tienen relacion ").
patron_relacion("que relacion hay entre ").
patron_relacion("como se relacionan ").
patron_relacion("que tienen en comun ").
patron_relacion("son parecidos ").
patron_relacion("son similares ").
patron_relacion("hay relacion entre ").
patron_relacion("existe relacion entre ").


%  2. Maneras de escribir la misma pregunta

normalizar_entrada(Entrada, Normalizada) :-
    quitar_signos(Entrada, S1),
    normalizar_acentos(S1, S2),
    normalize_space(string(Normalizada), S2).

quitar_signos(S0, S1) :-
    string_codes(S0, Codes0),
    exclude(es_signo, Codes0, Codes1),
    string_codes(S1, Codes1).

% Codigos de signos a eliminar: ¿ ? ¡ !
es_signo(0'?).
es_signo(0'!).
es_signo(191).   % ¿
es_signo(161).   % ¡

normalizar_acentos(S0, S1) :-
    string_codes(S0, Codes0),
    maplist(normalizar_codigo, Codes0, Codes1),
    string_codes(S1, Codes1).

% Vocales con tilde → vocales sin tilde (UTF-8 code points)
normalizar_codigo(225, 0'a) :- !.  % á
normalizar_codigo(233, 0'e) :- !.  % é
normalizar_codigo(237, 0'i) :- !.  % í
normalizar_codigo(243, 0'o) :- !.  % ó
normalizar_codigo(250, 0'u) :- !.  % ú
normalizar_codigo(193, 0'a) :- !.  % Á
normalizar_codigo(201, 0'e) :- !.  % É
normalizar_codigo(205, 0'i) :- !.  % Í
normalizar_codigo(211, 0'o) :- !.  % Ó
normalizar_codigo(218, 0'u) :- !.  % Ú
normalizar_codigo(C,   C).



%  3. Interpeta variaciones de preguntas

interpreta_variacion(Entrada, definir, C) :-
    normalizar_entrada(Entrada, Norm),
    patron_definir(Pat),
    string_concat(Pat, Resto, Norm),
    Resto \= "",
    normalizar_identificador(Resto, C),
    C \= ''.

interpreta_variacion(Entrada, uso, C) :-
    normalizar_entrada(Entrada, Norm),
    patron_uso(Pat),
    string_concat(Pat, Resto, Norm),
    Resto \= "",
    normalizar_identificador(Resto, C),
    C \= ''.

interpreta_variacion(Entrada, tipo, C) :-
    normalizar_entrada(Entrada, Norm),
    patron_tipo(Pat),
    string_concat(Pat, Resto, Norm),
    Resto \= "",
    normalizar_identificador(Resto, C),
    C \= ''.

interpreta_variacion(Entrada, propiedades, C) :-
    normalizar_entrada(Entrada, Norm),
    patron_propiedad(Pat),
    string_concat(Pat, Resto, Norm),
    Resto \= "",
    normalizar_identificador(Resto, C),
    C \= ''.

interpreta_variacion(Entrada, relacionar, info(X, Y)) :-
    normalizar_entrada(Entrada, Norm),
    patron_relacion(Pat),
    string_concat(Pat, Resto, Norm),
    Resto \= "",
    extraer_par_desde_frase(Resto, X, Y).



%  4. Resuelve usando sinonimos

resolver_concepto(Termino, Resuelto) :-
    concepto(Termino, _),
    !,
    Resuelto = Termino.
resolver_concepto(Termino, Resuelto) :-
    normalizar(Termino, Resuelto),
    Resuelto \= Termino,
    concepto(Resuelto, _),
    !.
resolver_concepto(Termino, Termino).