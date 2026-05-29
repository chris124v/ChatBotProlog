%  Utilidades para procesamiento de texto
%
%  Predicados auxiliares para leer, normalizar y analizar
%  el texto que ingresa el usuario.
 
 
% Lectura y normalizacion de entrada 
%
% Lee la linea completa del usuario y la convierte a minusculas
% para que las comparaciones no sean sensibles a mayusculas.
 
leer_entrada(EntradaNorm) :-
    read_line_to_string(user_input, Linea),
    string_lower(Linea, EntradaNorm).
 
 
% Deteccion de palabras clave
%
% Verifica si al menos una de las frases en la lista aparece en el texto.
% El corte evita seguir buscando cuando ya encontro una coincidencia.
 
contiene_alguna(Str, [H|_]) :-
    sub_string(Str, _, _, _, H), !.
contiene_alguna(Str, [_|T]) :-
    contiene_alguna(Str, T).
 
 
% Extraccion del concepto de una pregunta 
%
% Quita prefijos funcionales (verbos de pregunta, articulos) del inicio
% del texto y retorna el primer token significativo como atomo.
 
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
 
 
% Extraccion de par concepto+definicion para aprendizaje
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
 
 
% Extraccion de par de sinonimos
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
 
 
% Extraccion de dos conceptos para verificar relacion
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


%  Extenesiones de parseo para UFC
%
%  Estas utilidades permiten entender frases mas naturales
%  para consultar hechos como campeon/2, rankeado/3,
%  evento_ufc/4, pelea/5, record_luchador/3, estilo_lucha/2.


% Tokenizacion simple (quita puntuacion comun)

tokenizar(Str, Tokens) :-
    split_string(Str, " \t\n", " \t\n?!.,:;()[]{}\"", Raw),
    exclude(=(""), Raw, Tokens).


% Extraer substring despues de un prefijo (primer match)

extraer_despues_de_prefijos(Entrada, [P|_], Resto) :-
    sub_string(Entrada, Antes, Largo, _, P),
    Inicio is Antes + Largo,
    sub_string(Entrada, Inicio, _, 0, R0),
    normalize_space(string(Resto), R0),
    !.
extraer_despues_de_prefijos(Entrada, [_|T], Resto) :-
    extraer_despues_de_prefijos(Entrada, T, Resto).


% Join de tokens con '_' para mapear "peso pesado" -> peso_pesado 

join_tokens_con_guion_bajo([H], H) :- !.
join_tokens_con_guion_bajo([H|T], Out) :-
    join_tokens_con_guion_bajo(T, Tail),
    string_concat(H, "_", Tmp),
    string_concat(Tmp, Tail, Out).


% Resolver division desde una frase
% Acepta "peso_pesado" o "peso pesado".

resolver_division_desde_frase(Frase, Division) :-
    tokenizar(Frase, Tokens),
    Tokens \= [],
    join_tokens_con_guion_bajo(Tokens, DivStr0),
    string_lower(DivStr0, DivStr),
    atom_string(DivAtom, DivStr),
    ( campeon(DivAtom, _) ; rankeado(DivAtom, _, _) ; es_un(DivAtom, division_peso) ),
    !,
    Division = DivAtom.

% Extrae division desde la entrada completa (busca despues de "de ").
extraer_division(Entrada, Division) :-
    ( extraer_despues_de_prefijos(Entrada, ["de ","division ","división "], Resto) ->
        resolver_division_desde_frase(Resto, Division)
    ;
        fail
    ).


% Top N y division

extraer_top_y_division(Entrada, N, Division) :-
    tokenizar(Entrada, Tokens),
    ( append(_, ["top", TokenN|Rest], Tokens), number_string(N0, TokenN) ->
        N = N0,
        rest_a_division(Rest, Division)
    ;
        % Si no viene numero: default 5
        N = 5,
        ( append(_, ["top","de"|Rest], Tokens) -> rest_a_division(Rest, Division)
        ; append(_, ["top"|Rest], Tokens) -> rest_a_division(Rest, Division)
        )
    ).

rest_a_division(RestTokens, Division) :-
    % Si hay un "de", lo saltamos
    ( RestTokens = ["de"|T] -> Tokens = T ; Tokens = RestTokens ),
    Tokens \= [],
    join_tokens_con_guion_bajo(Tokens, DivStr),
    atom_string(DivAtom, DivStr),
    ( campeon(DivAtom, _) ; rankeado(DivAtom, _, _) ; es_un(DivAtom, division_peso) ),
    Division = DivAtom.


% Posicion de ranking y division
extraer_posicion_y_division(Entrada, Pos, Division) :-
    tokenizar(Entrada, Tokens),
    ( append(_, ["rankeado", TokenPos|Rest], Tokens)
    ; append(_, ["ranking", TokenPos|Rest], Tokens)
    ),
    number_string(Pos, TokenPos),
    rest_a_division(Rest, Division).


% Numero de evento UFC (ej: "ufc 328") 

extraer_numero_evento(Entrada, Num) :-
    tokenizar(Entrada, Tokens),
    append(_, ["ufc", TokenNum|_], Tokens),
    number_string(Num, TokenNum),
    !.


% Extraer nombre de luchador a partir de un prefijo 

extraer_nombre_luchador(Entrada, Prefijos, Nombre) :-
    extraer_despues_de_prefijos(Entrada, Prefijos, Nombre).


% Resolver luchador por nombre (case-insensitive)
% 1) Match exacto ignorando mayusculas
% 2) Si no hay exacto, permite substring SOLO si es unico

resolver_luchador(NombreEntrada, NombreCanon) :-
    normalize_space(string(N0), NombreEntrada),
    string_lower(N0, NL),
    ( candidato_luchador(NombreCanon, SL), SL = NL ->
        !
    ;
        findall(Cand, (candidato_luchador(Cand, SL2), sub_string(SL2, _, _, _, NL)), Cands0),
        sort(Cands0, Cands),
        Cands = [NombreCanon]
    ).

candidato_luchador(NombreCanon, NombreLower) :-
    ( record_luchador(NombreCanon, _, _) ; estilo_lucha(NombreCanon, _) ),
    atom_string(NombreCanon, S),
    string_lower(S, NombreLower).