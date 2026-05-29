% =========================================================
%  Aprendizaje de Sinonimos
%
%  Predicados exportados (usados desde conversation.pl):
%    son_sinonimos/2       - verifica si dos terminos son sinonimos
%    sinonimos_de/2        - lista todos los sinonimos de un termino
%    aprender_sinonimo/2   - guarda un sinonimo nuevo con validacion
%    olvidar_sinonimo/2    - elimina un sinonimo existente
% =========================================================


%  1. Verificar si dos terminos son sinonimos

son_sinonimos(A, B) :-
    sinonimo(A, B).
son_sinonimos(A, B) :-
    sinonimo(B, A).
son_sinonimos(A, B) :-
    A \= B,
    sinonimo(A, C),
    sinonimo(B, C).

%  2. Listar sinonimos de un termino

sinonimos_de(Termino, Lista) :-
    findall(S, sinonimo(S, Termino), L1),
    findall(S, sinonimo(Termino, S), L2),
    append(L1, L2, Todos),
    sort(Todos, Lista).

%  3. Aprender un sinonimo nuevo con validacion

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

%  4. Eliminar un sinonimo existente

olvidar_sinonimo(A, B) :-
    ( retract(sinonimo(A, B)) ->
        format("Bot: Listo, olvide que '~w' y '~w' eran sinonimos.~n", [A, B])
    ; retract(sinonimo(B, A)) ->
        format("Bot: Listo, olvide que '~w' y '~w' eran sinonimos.~n", [A, B])
    ;
        format("Bot: No tenia registrado que '~w' y '~w' fueran sinonimos.~n", [A, B])
    ).

%  Predicado auxiliar para validar que un termino es conocido

termino_conocido(T) :- concepto(T, _).
termino_conocido(T) :- sinonimo(T, _).
termino_conocido(T) :- sinonimo(_, T).