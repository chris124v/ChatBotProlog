%  Seccion 2.7 - Flujo Conversacional Completo

% --- Punto de entrada ---
% El usuario inicia el chatbot ejecutando: ?- inicio.
 
inicio :-
    write('=================================================\n'),
    write('   ChatBot Prolog - Razonamiento Logico\n'),
    write('=================================================\n'),
    write('Bot: Hola! Soy un chatbot que razona con logica y legalmente si piensa.\n'),
    write('     Escribe "ayuda" para ver los comandos.\n\n'),
    conversar.
 
 
% Loop de conversacion inicial
%
% Flujo:
% 1. Muestra prompt y lee entrada del usuario
% 2. Si el usuario se despide, termina
% 3. Si no, procesa la entrada y vuelve a llamarse a si mismo
 
conversar :-
    write('Tu: '),
    leer_entrada(Entrada),
    ( es_despedida(Entrada) ->
        despedirse
    ;
        procesar(Entrada),
        nl,
        conversar        % Llamada recursiva para seguir conversando
    ).
 
 
% Procesador de entrada
% Detecta la intencion del usuario (que quiere hacer) y la delega
% al manejador correspondiente. El corte (!) asegura que solo se
% use la primera intencion detectada.
 
procesar(Entrada) :-
    detectar_intencion(Entrada, Intencion, Dato),
    !,
    manejar(Intencion, Dato).
 
 
% Deteccion de intenciones
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

% UFC: Campeon actual por division: "quien es el campeon de X"
detectar_intencion(E, campeon_division, D) :-
    contiene_alguna(E, [
        "quien es el campeon de ","quién es el campeon de ",
        "quien es el campeón de ","quién es el campeón de ",
        "campeon de ","campeón de ",
        "campeon actual de ","campeón actual de "
    ]),
    extraer_division(E, D).

% Preguntas de definicion por persona: "quien es X"
detectar_intencion(E, definir, C) :-
    contiene_alguna(E, ["quien es ","quién es "]),
    extraer_concepto(E, C).

% UFC: Ranking top N por division: "top 5 de X" / "top de X"
detectar_intencion(E, top_division, info(N, D)) :-
    contiene_alguna(E, ["top ","top de ","top 5", "top5"]),
    extraer_top_y_division(E, N, D).

% UFC: Un rankeado especifico: "rankeado 3 de X"
detectar_intencion(E, rankeado_division, info(Pos, D)) :-
    contiene_alguna(E, ["rankeado ","ranking "]),
    extraer_posicion_y_division(E, Pos, D).

% UFC: Listar eventos conocidos
detectar_intencion(E, listar_eventos, _) :-
    contiene_alguna(E, ["ultimos eventos","últimos eventos","ultimos 5 eventos","últimos 5 eventos","eventos ufc","eventos de ufc"]).

% UFC: Peleas de un evento: "peleas de ufc 328"
detectar_intencion(E, peleas_evento, Num) :-
    contiene_alguna(E, ["peleas de ufc","peleas ufc","cartelera ufc"]),
    extraer_numero_evento(E, Num).

% UFC: Detalle de un evento: "que paso en ufc 328" / "evento ufc 328"
detectar_intencion(E, detalle_evento, Num) :-
    contiene_alguna(E, ["que paso en ufc","qué pasó en ufc","evento ufc","informacion de ufc","información de ufc","ufc "]),
    extraer_numero_evento(E, Num).

% UFC: Record de un luchador: "record de X" / "récord de X"
detectar_intencion(E, record_luchador, Nombre) :-
    contiene_alguna(E, ["record de ","récord de "]),
    extraer_nombre_luchador(E, ["record de ","récord de "], Nombre).

% UFC: Estilo de un luchador: "estilo de X"
detectar_intencion(E, estilo_luchador, Nombre) :-
    contiene_alguna(E, ["estilo de ","estilo de pelea de "]),
    extraer_nombre_luchador(E, ["estilo de pelea de ","estilo de "], Nombre).
 
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
 
% Olvidar un concepto: "olvidar X" 
detectar_intencion(E, olvidar, C) :-
    contiene_alguna(E, ["olvidar ","eliminar concepto ","borrar "]),
    extraer_concepto(E, C).
 
% Solicitud de ayuda
detectar_intencion(E, ayuda, _) :-
    contiene_alguna(E, ["ayuda","help","comandos","que puedes"]).
 
% Fallback: si ninguna clausula anterior hizo match
detectar_intencion(_, desconocido, _).
 
 
% Manejadores de respuesta
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
        aprender_nuevo_uso(C)
    ).
 
% Responder: que tipo de cosa es X (usa inferencia transitiva)
manejar(tipo, C) :-
    findall(T, es_tipo(C, T), Tipos),
    ( Tipos \= [] ->
        format("Bot: '~w' es de tipo: ", [C]),
        escribir_lista(Tipos)
    ;
        aprender_nuevo_tipo(C)
    ).
 
% Responder: que propiedades tiene X (usa herencia de propiedades)
manejar(propiedades, C) :-
    findall(P, tiene_inferido(C, P), Props),
    ( Props \= [] ->
        format("Bot: '~w' tiene: ", [C]),
        escribir_lista(Props)
    ;
        aprender_nueva_propiedad(C)
    ).
 
% Responder: estan relacionados X e Y (usa inferencia de relaciones)
manejar(relacionar, info(X, Y)) :-
    ( relacionados(X, Y) ->
        format("Bot: Si, '~w' y '~w' estan relacionados: comparten al menos una categoria en comun.~n", [X, Y])
    ;
        format("Bot: '~w' y '~w' no parecen estar relacionados segun mi conocimiento actual.~n", [X, Y])
    ).

% UFC: Campeon por division
manejar(campeon_division, D) :-
    ( campeon(D, Nombre) ->
        format("Bot: El campeon de '~w' es ~w.~n", [D, Nombre])
    ;
        format("Bot: No tengo registrado el campeon para la division '~w'.~n", [D])
    ).

% UFC: Top N por division
manejar(top_division, info(N, D)) :-
    ( top_ranking(D, N, Lista) ->
        format("Bot: Top ~d de '~w':~n", [N, D]),
        escribir_ranking(Lista)
    ;
        format("Bot: No tengo rankings para la division '~w'.~n", [D])
    ).

% UFC: Rankeado N por division
manejar(rankeado_division, info(Pos, D)) :-
    ( rankeado(D, Pos, Nombre) ->
        format("Bot: En '~w', el rankeado #~d es ~w.~n", [D, Pos, Nombre])
    ;
        format("Bot: No encuentro el rankeado #~d para '~w'.~n", [Pos, D])
    ).

% UFC: Listar eventos
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

% UFC: Detalle de evento (incluye peleas)
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

% UFC: Solo peleas de un evento
manejar(peleas_evento, Num) :-
    ( peleas_del_evento(Num, Peleas), Peleas \= [] ->
        format("Bot: Peleas registradas para UFC ~d:\n", [Num]),
        escribir_peleas(Peleas)
    ;
        format("Bot: No tengo peleas registradas para UFC ~d.~n", [Num])
    ).

% UFC: Record de un luchador
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

% UFC: Estilo de un luchador
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
 
 
% Aprendizaje dinamico interactivo 
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


% Aprendizaje dinamico interactivo para otras intenciones

aprender_nuevo_uso(C) :-
    format("Bot: No tengo informacion sobre el uso de '~w'. Para que sirve? (escribe el uso, sin 'sirve para', o Enter para omitir)~n", [C]),
    write('Tu: '),
    read_line_to_string(user_input, UsoStr),
    ( UsoStr \= "" ->
        quitar_prefijos(UsoStr, ["sirve para ","para ","sirve "], UsoStr0),
        normalize_space(string(UsoLimpio), UsoStr0),
        atom_string(UsoAtom, UsoLimpio),
        assertz(sirve_para(C, UsoAtom)),
        format("Bot: Perfecto! Ahora se que '~w' sirve para ~w~n", [C, UsoAtom])
    ;
        write("Bot: Sin problema. Si luego lo descubres, puedes volver a preguntar y ensenarmelo.\n")
    ).

aprender_nuevo_tipo(C) :-
    format("Bot: No se en que categoria esta '~w'. Que tipo/clase es? (escribe el tipo o Enter para omitir)~n", [C]),
    write('Tu: '),
    read_line_to_string(user_input, TipoStr),
    ( TipoStr \= "" ->
        normalizar_identificador(TipoStr, Tipo),
        assertz(es_un(C, Tipo)),
        format("Bot: Entendido! Aprendi que '~w' es un '~w'.~n", [C, Tipo])
    ;
        write("Bot: Sin problema. Si luego lo descubres, puedes volver a preguntar y ensenarmelo.\n")
    ).

aprender_nueva_propiedad(C) :-
    format("Bot: No conozco propiedades de '~w'. Dime una propiedad/caracteristica: (o Enter para omitir)~n", [C]),
    write('Tu: '),
    read_line_to_string(user_input, PropStr),
    ( PropStr \= "" ->
        normalizar_identificador(PropStr, Prop),
        assertz(tiene(C, Prop)),
        format("Bot: Listo! Ahora recordare que '~w' tiene '~w'.~n", [C, Prop])
    ;
        write("Bot: Sin problema. Puedes ensenarme despues si quieres.\n")
    ).
 
 
% Deteccion de despedida
%
% Lista de expresiones que indican que el usuario quiere terminar.
 
es_despedida(E) :-
    contiene_alguna(E, ["salir","adios","exit","bye","chao","hasta luego","finalizar"]).
 
 
% Salida formateada
 
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
    write("\n  --- Lenguajes de Programacion ---\n"),
    write("  que es prolog\n"),
    write("  explique recursion\n"),
    write("  para que sirve python\n"),
    write("  que tipo es java\n"),
    write("  que tiene haskell\n"),
    write("  relacionados prolog y haskell\n"),
    write("  js es sinonimo de javascript\n"),
    write("\n  --- UFC y Artes Marciales ---\n"),
    write("  que es boxeo\n"),
    write("  para que sirve wrestling\n"),
    write("  que tipo es khamzat chimaev\n"),
    write("  que tiene peso_pesado\n"),
    write("  relacionados boxeo y kickboxing\n"),
    write("  quien es el campeon de peso_pesado\n"),
    write("  top 5 de peso_ligero\n"),
    write("  rankeado 3 de peso_mosca\n"),
    write("  ultimos eventos\n"),
    write("  que paso en ufc 328\n"),
    write("  peleas de ufc 328\n"),
    write("  record de khamzat chimaev\n"),
    write("  estilo de alex pereira\n"),
    write("  bjj es sinonimo de jiu jitsu brasileno\n"),
    write("\n  --- Comandos Generales ---\n"),
    write("  aprender que X es Y\n"),
    write("  olvidar X\n"),
    write("  ayuda (ver este menu)\n"),
    write("  salir\n").


%  Helpers de impresion 

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
 
 
% Mensaje de despedida al terminar la sesion.
 
despedirse :-
    write("Bot: Hasta luego! Fue un placer conversar contigo.\n").