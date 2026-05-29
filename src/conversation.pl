%  Seccion 2.7 - Flujo Conversacional Completo

% --- Punto de entrada ---
inicio :-
    write('=================================================\n'),
    write('   ChatBot Prolog - Razonamiento Logico\n'),
    write('=================================================\n'),
    write('Bot: Hola! Soy un chatbot que razona con logica y legalmente si piensa.\n'),
    write('     Escribe "ayuda" para ver los comandos.\n\n'),
    conversar.


% Loop de conversacion
conversar :-
    write('Tu: '),
    leer_entrada(Entrada),
    ( es_despedida(Entrada) ->
        despedirse
    ;
        procesar(Entrada),
        nl,
        conversar
    ).


% Procesador de entrada
%
% Primero intenta con detectar_intencion (patrones exactos).
% Si la intencion resulta "desconocido", intenta con
% interpreta_variacion (patrones flexibles de variaciones.pl).
% Solo si ambos fallan, responde con el mensaje de fallback.

procesar(Entrada) :-
    detectar_intencion(Entrada, Intencion, Dato),
    Intencion \= desconocido,
    !,
    manejar(Intencion, Dato).

procesar(Entrada) :-
    interpreta_variacion(Entrada, Intencion, Dato),
    !,
    manejar(Intencion, Dato).

procesar(_) :-
    manejar(desconocido, _).


% =========================================================
%  DETECCION DE INTENCIONES
% =========================================================

% Preguntas de definicion
detectar_intencion(E, definir, C) :-
    contiene_alguna(E, ["que es ","explique ","defina ","define ","describe "]),
    extraer_concepto(E, C).

% Preguntas de uso
detectar_intencion(E, uso, C) :-
    contiene_alguna(E, ["para que sirve","para que se usa","como se usa"]),
    extraer_concepto(E, C).

% Preguntas de categoria
detectar_intencion(E, tipo, C) :-
    contiene_alguna(E, ["que tipo es","que clase es","que categoria es"]),
    extraer_concepto(E, C).

% Preguntas de propiedades
detectar_intencion(E, propiedades, C) :-
    contiene_alguna(E, ["que tiene ","propiedades de ","caracteristicas de "]),
    extraer_concepto(E, C).

% UFC: Campeon por division
detectar_intencion(E, campeon_division, D) :-
    contiene_alguna(E, [
        "quien es el campeon de ","quién es el campeon de ",
        "quien es el campeón de ","quién es el campeón de ",
        "campeon de ","campeón de ",
        "campeon actual de ","campeón actual de "
    ]),
    extraer_division(E, D).

% Quien es X (personas)
detectar_intencion(E, definir, C) :-
    contiene_alguna(E, ["quien es ","quién es "]),
    extraer_concepto(E, C).

% UFC: Top N por division
detectar_intencion(E, top_division, info(N, D)) :-
    contiene_alguna(E, ["top ","top de ","top 5", "top5"]),
    extraer_top_y_division(E, N, D).

% UFC: Rankeado especifico
detectar_intencion(E, rankeado_division, info(Pos, D)) :-
    contiene_alguna(E, ["rankeado ","ranking "]),
    extraer_posicion_y_division(E, Pos, D).

% UFC: Listar eventos
detectar_intencion(E, listar_eventos, _) :-
    contiene_alguna(E, ["ultimos eventos","últimos eventos","ultimos 5 eventos","eventos ufc","eventos de ufc"]).

% UFC: Peleas de un evento
detectar_intencion(E, peleas_evento, Num) :-
    contiene_alguna(E, ["peleas de ufc","peleas ufc","cartelera ufc"]),
    extraer_numero_evento(E, Num).

% UFC: Detalle de evento
detectar_intencion(E, detalle_evento, Num) :-
    contiene_alguna(E, ["que paso en ufc","qué pasó en ufc","evento ufc","informacion de ufc","ufc "]),
    extraer_numero_evento(E, Num).

% UFC: Record de luchador
detectar_intencion(E, record_luchador, Nombre) :-
    contiene_alguna(E, ["record de ","récord de "]),
    extraer_nombre_luchador(E, ["record de ","récord de "], Nombre).

% UFC: Estilo de luchador
detectar_intencion(E, estilo_luchador, Nombre) :-
    contiene_alguna(E, ["estilo de ","estilo de pelea de "]),
    extraer_nombre_luchador(E, ["estilo de pelea de ","estilo de "], Nombre).

% Verificar relacion entre conceptos
detectar_intencion(E, relacionar, info(X, Y)) :-
    contiene_alguna(E, ["relacionados","se relacionan","tienen relacion"]),
    extraer_dos_conceptos(E, X, Y).

% Aprendizaje de concepto
detectar_intencion(E, aprender, info(C, D)) :-
    sub_string(E, _, _, _, "aprender que "),
    extraer_aprendizaje(E, C, D).

% Aprendizaje de sinonimo: "X es sinonimo de Y" o "X significa Y"
% Nota: se excluyen frases de pregunta como "que significa X"
% para que sean manejadas por interpreta_variacion como definicion.
detectar_intencion(E, nuevo_sinonimo, info(A, B)) :-
    contiene_alguna(E, ["es sinonimo de","significa "]),
    extraer_sinonimo(E, A, B),
    % Validar que A no sea una palabra de pregunta
    \+ member(A, [que, cual, como, quien, donde, cuando, cuales]).

% Olvidar sinonimo: "olvidar sinonimo X de Y"   <-- SECCION 2.4
detectar_intencion(E, olvidar_sinonimo, info(A, B)) :-
    contiene_alguna(E, ["olvidar sinonimo ","eliminar sinonimo ","borrar sinonimo "]),
    extraer_par_sinonimos(E, A, B).

% Listar sinonimos: "sinonimos de X"             <-- SECCION 2.4
detectar_intencion(E, listar_sinonimos, C) :-
    contiene_alguna(E, ["sinonimos de ","que sinonimos tiene ","sinonimos tiene "]),
    extraer_despues_de_prefijos(E, ["sinonimos de ","que sinonimos tiene ","sinonimos tiene "], Resto),
    normalizar_identificador(Resto, C).

% Verificar si son sinonimos: "son sinonimos X y Y"   <-- SECCION 2.4
detectar_intencion(E, verificar_sinonimo, info(A, B)) :-
    contiene_alguna(E, ["son sinonimos "]),
    extraer_despues_de_prefijos(E, ["son sinonimos "], Par),
    extraer_par_desde_frase(Par, A, B).

% Olvidar concepto
detectar_intencion(E, olvidar, C) :-
    contiene_alguna(E, ["olvidar ","eliminar concepto ","borrar "]),
    extraer_concepto(E, C).

% Ayuda
detectar_intencion(E, ayuda, _) :-
    contiene_alguna(E, ["ayuda","help","comandos","que puedes"]).

% Fallback
detectar_intencion(_, desconocido, _).


% =========================================================
%  MANEJADORES DE RESPUESTA
% =========================================================

% Definir concepto
manejar(definir, C) :-
    ( concepto_resuelto(C, Def) ->
        format("Bot: ~w es ~w~n", [C, Def])
    ;
        aprender_nuevo_concepto(C)
    ).

% Uso
manejar(uso, C) :-
    ( sirve_para_inferido(C, Uso) ->
        format("Bot: ~w sirve para ~w~n", [C, Uso])
    ;
        aprender_nuevo_uso(C)
    ).

% Tipo
manejar(tipo, C) :-
    findall(T, es_tipo(C, T), Tipos),
    ( Tipos \= [] ->
        format("Bot: '~w' es de tipo: ", [C]),
        escribir_lista(Tipos)
    ;
        aprender_nuevo_tipo(C)
    ).

% Propiedades
manejar(propiedades, C) :-
    findall(P, tiene_inferido(C, P), Props),
    ( Props \= [] ->
        format("Bot: '~w' tiene: ", [C]),
        escribir_lista(Props)
    ;
        aprender_nueva_propiedad(C)
    ).

% Relacion entre conceptos
manejar(relacionar, info(X, Y)) :-
    ( relacionados(X, Y) ->
        format("Bot: Si, '~w' y '~w' estan relacionados: comparten al menos una categoria en comun.~n", [X, Y])
    ;
        format("Bot: '~w' y '~w' no parecen estar relacionados segun mi conocimiento actual.~n", [X, Y])
    ).

% UFC: Campeon
manejar(campeon_division, D) :-
    ( campeon(D, Nombre) ->
        format("Bot: El campeon de '~w' es ~w.~n", [D, Nombre])
    ;
        format("Bot: No tengo registrado el campeon para la division '~w'.~n", [D])
    ).

% UFC: Top N
manejar(top_division, info(N, D)) :-
    ( top_ranking(D, N, Lista) ->
        format("Bot: Top ~d de '~w':~n", [N, D]),
        escribir_ranking(Lista)
    ;
        format("Bot: No tengo rankings para la division '~w'.~n", [D])
    ).

% UFC: Rankeado
manejar(rankeado_division, info(Pos, D)) :-
    ( rankeado(D, Pos, Nombre) ->
        format("Bot: En '~w', el rankeado #~d es ~w.~n", [D, Pos, Nombre])
    ;
        format("Bot: No encuentro el rankeado #~d para '~w'.~n", [Pos, D])
    ).

% UFC: Eventos
manejar(listar_eventos, _) :-
    findall(Num-Titulo-Fecha-Ganador, evento_ufc(Num, Titulo, Fecha, Ganador), Eventos0),
    ( Eventos0 \= [] ->
        keysort(Eventos0, EventosAsc),
        reverse(EventosAsc, Eventos),
        write('Bot: Eventos conocidos:\n'),
        escribir_eventos(Eventos)
    ;
        write('Bot: No tengo eventos registrados.\n')
    ).

% UFC: Detalle evento
manejar(detalle_evento, Num) :-
    ( evento_ufc(Num, Titulo, Fecha, Ganador) ->
        format("Bot: UFC ~d - ~w (~w). Ganador estelar: ~w.~n", [Num, Titulo, Fecha, Ganador]),
        ( peleas_del_evento(Num, Peleas), Peleas \= [] ->
            write('Bot: Peleas registradas:\n'),
            escribir_peleas(Peleas)
        ;
            write('Bot: No tengo peleas registradas para ese evento.\n')
        )
    ;
        format("Bot: No encuentro el evento UFC ~d en mi base de conocimiento.~n", [Num])
    ).

% UFC: Peleas evento
manejar(peleas_evento, Num) :-
    ( peleas_del_evento(Num, Peleas), Peleas \= [] ->
        format("Bot: Peleas registradas para UFC ~d:\n", [Num]),
        escribir_peleas(Peleas)
    ;
        format("Bot: No tengo peleas registradas para UFC ~d.~n", [Num])
    ).

% UFC: Record
manejar(record_luchador, NombreEntrada) :-
    ( resolver_luchador(NombreEntrada, NombreCanon) ->
        ( record_luchador(NombreCanon, V, D) ->
            format("Bot: Record de ~w: ~d-~d (victorias-derrotas).~n", [NombreCanon, V, D])
        ;
            format("Bot: No tengo el record de ~w registrado.~n", [NombreCanon])
        )
    ;
        write("Bot: No pude identificar a ese luchador. Prueba con el nombre completo (ej: 'khamzat chimaev').\n")
    ).

% UFC: Estilo
manejar(estilo_luchador, NombreEntrada) :-
    ( resolver_luchador(NombreEntrada, NombreCanon) ->
        ( estilo_lucha(NombreCanon, Estilo) ->
            format("Bot: Estilo de ~w: ~w.~n", [NombreCanon, Estilo])
        ;
            format("Bot: No tengo el estilo de ~w registrado.~n", [NombreCanon])
        )
    ;
        write("Bot: No pude identificar a ese luchador. Prueba con el nombre completo (ej: 'alex pereira').\n")
    ).

% Aprender concepto
manejar(aprender, info(C, D)) :-
    assertz(concepto(C, D)),
    format("Bot: Entendido! Aprendi que '~w' es ~w~n", [C, D]).

% Aprender sinonimo (con validacion de sinonimos.pl)
manejar(nuevo_sinonimo, info(A, B)) :-
    aprender_sinonimo(A, B).

% Listar sinonimos                                <-- SECCION 2.4
manejar(listar_sinonimos, C) :-
    sinonimos_de(C, Lista),
    ( Lista \= [] ->
        format("Bot: Los sinonimos que conozco de '~w' son: ", [C]),
        escribir_lista(Lista)
    ;
        format("Bot: No conozco sinonimos para '~w'.~n", [C])
    ).

% Verificar sinonimos                             <-- SECCION 2.4
manejar(verificar_sinonimo, info(A, B)) :-
    ( son_sinonimos(A, B) ->
        format("Bot: Si, '~w' y '~w' son sinonimos.~n", [A, B])
    ;
        format("Bot: No, '~w' y '~w' no son sinonimos segun mi conocimiento.~n", [A, B])
    ).

% Olvidar sinonimo                                <-- SECCION 2.4
manejar(olvidar_sinonimo, info(A, B)) :-
    olvidar_sinonimo(A, B).

% Olvidar concepto
manejar(olvidar, C) :-
    ( retract(concepto(C, _)) ->
        format("Bot: Listo, olvide todo lo que sabia sobre '~w'.~n", [C])
    ;
        format("Bot: No tenia ningun concepto guardado para '~w'.~n", [C])
    ).

% Ayuda
manejar(ayuda, _) :-
    mostrar_ayuda.

% Fallback
manejar(desconocido, _) :-
    write("Bot: No entendi eso. Escribe 'ayuda' para ver los comandos disponibles.\n").


% =========================================================
%  APRENDIZAJE DINAMICO INTERACTIVO
% =========================================================

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

aprender_nuevo_uso(C) :-
    format("Bot: No tengo informacion sobre el uso de '~w'. Para que sirve? (o Enter para omitir)~n", [C]),
    write('Tu: '),
    read_line_to_string(user_input, UsoStr),
    ( UsoStr \= "" ->
        quitar_prefijos(UsoStr, ["sirve para ","para ","sirve "], UsoStr0),
        normalize_space(string(UsoLimpio), UsoStr0),
        atom_string(UsoAtom, UsoLimpio),
        assertz(sirve_para(C, UsoAtom)),
        format("Bot: Perfecto! Ahora se que '~w' sirve para ~w~n", [C, UsoAtom])
    ;
        write("Bot: Sin problema.\n")
    ).

aprender_nuevo_tipo(C) :-
    format("Bot: No se en que categoria esta '~w'. Que tipo es? (o Enter para omitir)~n", [C]),
    write('Tu: '),
    read_line_to_string(user_input, TipoStr),
    ( TipoStr \= "" ->
        normalizar_identificador(TipoStr, Tipo),
        assertz(es_un(C, Tipo)),
        format("Bot: Entendido! Aprendi que '~w' es un '~w'.~n", [C, Tipo])
    ;
        write("Bot: Sin problema.\n")
    ).

aprender_nueva_propiedad(C) :-
    format("Bot: No conozco propiedades de '~w'. Dime una: (o Enter para omitir)~n", [C]),
    write('Tu: '),
    read_line_to_string(user_input, PropStr),
    ( PropStr \= "" ->
        normalizar_identificador(PropStr, Prop),
        assertz(tiene(C, Prop)),
        format("Bot: Listo! Ahora recordare que '~w' tiene '~w'.~n", [C, Prop])
    ;
        write("Bot: Sin problema.\n")
    ).


% =========================================================
%  DESPEDIDA Y AYUDA
% =========================================================

es_despedida(E) :-
    contiene_alguna(E, ["salir","adios","exit","bye","chao","hasta luego","finalizar"]).

despedirse :-
    write("Bot: Hasta luego! Fue un placer conversar contigo.\n").

mostrar_ayuda :-
    write("Bot: Puedo responder preguntas como:\n"),
    write("\n  --- Lenguajes de Programacion ---\n"),
    write("  que es prolog\n"),
    write("  para que sirve python\n"),
    write("  que tipo es java\n"),
    write("  que tiene haskell\n"),
    write("  relacionados prolog y haskell\n"),
    write("\n  --- UFC y Artes Marciales ---\n"),
    write("  quien es el campeon de peso_pesado\n"),
    write("  top 5 de peso_ligero\n"),
    write("  rankeado 3 de peso_mosca\n"),
    write("  ultimos eventos\n"),
    write("  que paso en ufc 328\n"),
    write("  record de khamzat chimaev\n"),
    write("  estilo de alex pereira\n"),
    write("\n  --- Sinonimos (2.4) ---\n"),
    write("  sinonimos de adn\n"),
    write("  son sinonimos ia y inteligencia_artificial\n"),
    write("  cr es sinonimo de costa_rica\n"),
    write("  olvidar sinonimo cr de costa_rica\n"),
    write("\n  --- Comandos Generales ---\n"),
    write("  aprender que X es Y\n"),
    write("  olvidar X\n"),
    write("  ayuda\n"),
    write("  salir\n").


% =========================================================
%  HELPERS DE IMPRESION
% =========================================================

escribir_lista([H]) :-
    write(H), nl.
escribir_lista([H|T]) :-
    write(H), write(', '),
    escribir_lista(T).

top_ranking(Division, N, Lista) :-
    findall(Pos-Nombre, rankeado(Division, Pos, Nombre), Pairs),
    Pairs \= [],
    keysort(Pairs, Sorted),
    tomar(N, Sorted, Lista).

tomar(0, _, []) :- !.
tomar(_, [], []) :- !.
tomar(N, [H|T], [H|R]) :-
    N1 is N - 1,
    tomar(N1, T, R).

escribir_ranking([]).
escribir_ranking([Pos-Nombre|T]) :-
    format("  #~d ~w~n", [Pos, Nombre]),
    escribir_ranking(T).

escribir_eventos([]).
escribir_eventos([Num-Titulo-Fecha-Ganador|T]) :-
    format("  UFC ~d: ~w (~w) - ganador estelar: ~w~n", [Num, Titulo, Fecha, Ganador]),
    escribir_eventos(T).

peleas_del_evento(Num, Peleas) :-
    findall(A-B-Ganador-Metodo, pelea(Num, A, B, Ganador, Metodo), Peleas).

escribir_peleas([]).
escribir_peleas([A-B-Ganador-Metodo|T]) :-
    format("  ~w vs ~w -> ~w (~w)~n", [A, B, Ganador, Metodo]),
    escribir_peleas(T).


% =========================================================
%  AUXILIAR: EXTRAER PAR DE TERMINOS PARA SINONIMOS
%  Parsea "son sinonimos ia y inteligencia_artificial"
%  o "olvidar sinonimo cr de costa_rica"
% =========================================================

extraer_par_sinonimos(Entrada, A, B) :-
    extraer_despues_de_prefijos(Entrada,
        ["olvidar sinonimo ","eliminar sinonimo ","borrar sinonimo ","son sinonimos "], Par),
    extraer_par_desde_frase(Par, A, B).

% Extrae par desde frase limpia "X y Y" o "X de Y"
extraer_par_desde_frase(Par, A, B) :-
    Separadores = [" y ", " e ", " de "],
    member(Sep, Separadores),
    sub_string(Par, PosSep, LargoSep, _, Sep),
    InicioB is PosSep + LargoSep,
    sub_string(Par, 0, PosSep, _, StrA),
    sub_string(Par, InicioB, _, 0, StrB),
    normalizar_identificador(StrA, A),
    normalizar_identificador(StrB, B),
    A \= '',
    B \= '',
    !.