% ===============================================
% PRUEBA SIMPLE DE PROLOG - VERSIÓN 2
% ===============================================
% Este programa verifica que SWI-Prolog funciona correctamente
% Versión corregida sin caracteres especiales

% ===============================================
% 1. HECHOS SIMPLES (Base de conocimiento)
% ===============================================
padre(juan, luis).
padre(juan, ana).
padre(luis, pedro).

% Géneros
hombre(juan).
hombre(luis).
hombre(pedro).
mujer(ana).
mujer(maria).

% ===============================================
% 2. REGLAS (Inferencias lógicas)
% ===============================================

% Regla: si X es padre de Y, entonces X es progenitor de Y
progenitor(X, Y) :- padre(X, Y).

% Regla: si X es progenitor de Y e Y es progenitor de Z, 
% entonces X es abuelo de Z
abuelo(X, Z) :- progenitor(X, Y), progenitor(Y, Z).

% Regla: si X es hombre y es progenitor de Y, es padre
es_padre(X) :- hombre(X), progenitor(X, _).

% Regla: hermanos - comparten el mismo padre
hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.

% ===============================================
% 3. RECURSIÓN - Factorial
% ===============================================
factorial(0, 1) :- !.
factorial(N, F) :- 
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% ===============================================
% 4. LISTA SIMPLE - Predicado para listas
% ===============================================

% Verificar si un elemento está en una lista
miembro(X, [X|_]).
miembro(X, [_|Cola]) :- miembro(X, Cola).

% Longitud de una lista
longitud([], 0).
longitud([_|Cola], N) :- longitud(Cola, N1), N is N1 + 1.

% ===============================================
% PUNTO DE ENTRADA - MENÚ INTERACTIVO
% ===============================================

% Inicia el programa
inicio :-
    write('========================================'), nl,
    write('   BIENVENIDO A LA PRUEBA DE PROLOG    '), nl,
    write('========================================'), nl, nl,
    menu.

% Menú principal
menu :-
    write('Selecciona una opcion:'), nl,
    write('1. Consultar padres'), nl,
    write('2. Consultar abuelos'), nl,
    write('3. Consultar hermanos'), nl,
    write('4. Calcular factorial'), nl,
    write('5. Verificar miembro en lista'), nl,
    write('6. Salir'), nl,
    write('Opcion: '),
    read(Opcion), nl,
    procesar_opcion(Opcion).

% Procesar la opción seleccionada
procesar_opcion(1) :-
    write('--- PADRES ---'), nl,
    padre(X, Y),
    format('~w es padre de ~w~n', [X, Y]),
    fail.
procesar_opcion(1) :- nl, menu.

procesar_opcion(2) :-
    write('--- ABUELOS ---'), nl,
    abuelo(X, Z),
    format('~w es abuelo de ~w~n', [X, Z]),
    fail.
procesar_opcion(2) :- nl, menu.

procesar_opcion(3) :-
    write('--- HERMANOS ---'), nl,
    hermano(X, Y),
    format('~w y ~w son hermanos~n', [X, Y]),
    fail.
procesar_opcion(3) :- nl, menu.

procesar_opcion(4) :-
    write('Ingresa un numero para calcular su factorial: '),
    read(N),
    factorial(N, F),
    format('El factorial de ~w es: ~w~n~n', [N, F]),
    menu.

procesar_opcion(5) :-
    write('Elementos en la lista [1, 2, 3, 4, 5]:'), nl,
    Lista = [1, 2, 3, 4, 5],
    write('Esta el 3 en la lista? '),
    (miembro(3, Lista) -> write('Si') ; write('No')), nl,
    write('Esta el 10 en la lista? '),
    (miembro(10, Lista) -> write('Si') ; write('No')), nl,
    format('Longitud de la lista: ~w~n~n', [5]),
    menu.

procesar_opcion(6) :-
    write('Hasta luego!'), nl.

procesar_opcion(_) :-
    write('Opcion no valida. Intenta de nuevo.'), nl, nl,
    menu.

% ===============================================
% CONSULTAS DIRECTAS (sin menú)
% ===============================================
% Descomenta cualquiera para ejecutar directamente:

% ?- padre(juan, X).        % De quien es padre Juan?
% ?- abuelo(X, Y).          % Quien es abuelo de quien?
% ?- factorial(5, F).       % Cual es el factorial de 5?
% ?- miembro(2, [1,2,3]).   % Esta 2 en la lista [1,2,3]?