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