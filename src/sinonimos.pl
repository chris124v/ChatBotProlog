% =========================================================
%  SECCION 2.4 - APRENDIZAJE DE SINONIMOS
%  Autor: Daniel Arce
%
%  Este modulo gestiona el aprendizaje y consulta de
%  sinonimos de forma dinamica durante la ejecucion.
%
%  Predicados exportados (usados desde conversation.pl):
%    son_sinonimos/2       - verifica si dos terminos son sinonimos
%    sinonimos_de/2        - lista todos los sinonimos de un termino
%    aprender_sinonimo/2   - guarda un sinonimo nuevo con validacion
%    olvidar_sinonimo/2    - elimina un sinonimo existente
% =========================================================


% =========================================================
%  1. VERIFICAR SI DOS TERMINOS SON SINONIMOS
%
%  Comprueba la relacion en tres casos:
%    a) sinonimo(A, B) declarado directamente
%    b) sinonimo(B, A) declarado en orden inverso
%    c) A y B apuntan al mismo termino canonico
%
%  Ejemplos:
%    son_sinonimos(ia, inteligencia_artificial) => true
%    son_sinonimos(sgm, wwii)                  => true (ambos apuntan a segunda_guerra_mundial)
% =========================================================

son_sinonimos(A, B) :-
    sinonimo(A, B).
son_sinonimos(A, B) :-
    sinonimo(B, A).
son_sinonimos(A, B) :-
    A \= B,
    sinonimo(A, C),
    sinonimo(B, C).


% =========================================================
%  2. LISTAR SINONIMOS CONOCIDOS DE UN TERMINO
%
%  Busca en ambas direcciones del predicado sinonimo/2.
%
%  Ejemplo:
%    sinonimos_de(adn, Lista)
%    => Lista = [acido_desoxirribonucleico, genetica_molecular]
%
%    sinonimos_de(segunda_guerra_mundial, Lista)
%    => Lista = [sgm, wwii]
% =========================================================

sinonimos_de(Termino, Lista) :-
    findall(S, sinonimo(S, Termino), L1),
    findall(S, sinonimo(Termino, S), L2),
    append(L1, L2, Todos),
    sort(Todos, Lista).


% =========================================================
%  3. APRENDER UN SINONIMO NUEVO CON VALIDACION
%
%  Valida antes de guardar:
%    a) Los dos terminos no son identicos
%    b) El sinonimo no existe ya en ninguna direccion
%    c) Al menos uno de los terminos existe en la base
%
%  Si pasa, guarda con assertz para disponibilidad inmediata.
% =========================================================

aprender_sinonimo(A, B) :-
    ( A == B ->
        format("Bot: '~w' y '~w' son el mismo termino, no tiene sentido como sinonimo.~n", [A, B])
    ; son_sinonimos(A, B) ->
        format("Bot: Ya sabia que '~w' y '~w' son sinonimos.~n", [A, B])
    ; \+ termino_conocido(A), \+ termino_conocido(B) ->
        format("Bot: No conozco ni '~w' ni '~w'. Ensename primero que son con: aprender que X es Y~n", [A, B])
    ;
        assertz(sinonimo(A, B)),
        format("Bot: Anotado! Ahora se que '~w' es sinonimo de '~w'.~n", [A, B])
    ).


% =========================================================
%  4. ELIMINAR UN SINONIMO EXISTENTE
%
%  Intenta retract en ambas direcciones.
% =========================================================

olvidar_sinonimo(A, B) :-
    ( retract(sinonimo(A, B)) ->
        format("Bot: Listo, olvide que '~w' y '~w' eran sinonimos.~n", [A, B])
    ; retract(sinonimo(B, A)) ->
        format("Bot: Listo, olvide que '~w' y '~w' eran sinonimos.~n", [A, B])
    ;
        format("Bot: No tenia registrado que '~w' y '~w' fueran sinonimos.~n", [A, B])
    ).


% =========================================================
%  AUXILIAR: VERIFICAR SI UN TERMINO ES CONOCIDO
% =========================================================

termino_conocido(T) :- concepto(T, _).
termino_conocido(T) :- sinonimo(T, _).
termino_conocido(T) :- sinonimo(_, T).