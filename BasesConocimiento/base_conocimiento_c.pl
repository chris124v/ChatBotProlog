%  Tema: Ultimate Fighting Championship - MMA (UFC)
%  Autor: Christopher Vargas
 
%  Declaraciones dinamicas
 
:- dynamic concepto/2.
:- multifile concepto/2.
:- dynamic es_un/2.
:- multifile es_un/2.
:- dynamic tiene/2.
:- multifile tiene/2.
:- dynamic sinonimo/2.
:- multifile sinonimo/2.
:- dynamic sirve_para/2.
:- multifile sirve_para/2.
:- dynamic campeon/2.
:- multifile campeon/2.
:- dynamic rankeado/3.
:- multifile rankeado/3.
:- dynamic evento_ufc/4.
:- multifile evento_ufc/4.
:- dynamic estilo_lucha/2.
:- multifile estilo_lucha/2.
:- dynamic record_luchador/3.
:- multifile record_luchador/3.
:- dynamic pelea/5.
:- multifile pelea/5.
 
 
%  Conceptos Generales de la UFC y MMA
 
% Definiciones
concepto(ufc,
    'Ultimate Fighting Championship - organizacion de artes marciales mixtas mas grande del mundo').
concepto(mma,
    'Artes Marciales Mixtas - deporte de combate que combina tecnicas de boxeo, lucha, judo y BJJ').
concepto(luchador_mma,
    'atleta profesional que compite en artes marciales mixtas combinando multiples estilos de lucha').
concepto(campeon_ufc,
    'luchador que ha ganado el titulo en su division de peso en la UFC').
concepto(division_peso,
    'categoria de competencia en UFC basada en el peso corporal del luchador').
 
concepto(boxeo,
    'arte marcial de combate con punos, con tecnicas de movimiento de pies y defensa de cabeza').
concepto(kickboxing,
    'arte marcial que combina boxeo con patadas y golpes con rodillas y codos').
concepto(judo,
    'arte marcial japones basado en tecnicas de lanzamiento y control del oponente').
concepto(jiu_jitsu_brasileno,
    'arte marcial brasileno basado en tecnicas de sumision y control en el suelo').
concepto(lucha_libre,
    'tecnica de combate que usa lanzamientos, derribos y control sin golpes en el suelo').
concepto(muay_thai,
    'arte marcial tailandes que utiliza punos, codos, rodillas y patadas como armas principales').
concepto(wrestling,
    'tecnica de combate estadounidense enfocada en derribos y control del oponente en el suelo').
 
concepto(nocaut,
    'victoria por que el oponente esta inconsciente o el arbitro detiene la pelea por golpes').
concepto(sumision,
    'victoria por que el oponente se rinde o el arbitro detiene la pelea por golpes o tecnicas de sumision').
concepto(decision,
    'victoria determinada por los jueces basada en desempenio durante los tres asaltos').
concepto(decision_unanime,
    'los tres jueces votan a favor del mismo luchador').
concepto(decision_dividida,
    'dos jueces votan por un luchador y uno por el otro').
 
concepto(evento_ufc,
    'competencia oficial de UFC donde multiples peleas tienen lugar en una fecha').
concepto(pelea_titular,
    'combate por el titulo de campeon de una division de peso').
concepto(pelea_numero_1,
    'combate preliminar para determinar el proximo retador al campeon').
concepto(peso_pesado,
    'division de peso mas pesada en UFC, para luchadores sobre 265 libras').
concepto(peso_semipesado,
    'segunda division de peso mas pesada, entre 205 y 265 libras').
concepto(peso_medio,
    'division central, entre 170 y 185 libras').
concepto(peso_semimedio,
    'division intermedia, entre 155 y 170 libras').
concepto(peso_ligero,
    'division que va de 145 a 155 libras').
concepto(peso_gallo,
    'division menor, entre 135 y 145 libras').
concepto(peso_mosca,
    'division mas pequena de UFC, bajo 135 libras').
 
 
% Jerarquias de Categorías (es_un/2)
es_un(boxeo, estilo_lucha_de_pie).
es_un(kickboxing, estilo_lucha_de_pie).
es_un(muay_thai, estilo_lucha_de_pie).
es_un(judo, estilo_lucha_proyeccion).
es_un(wrestling, estilo_lucha_proyeccion).
es_un(lucha_libre, estilo_lucha_proyeccion).
es_un(jiu_jitsu_brasileno, estilo_lucha_suelo).
 
es_un(estilo_lucha_de_pie, estilo_lucha).
es_un(estilo_lucha_proyeccion, estilo_lucha).
es_un(estilo_lucha_suelo, estilo_lucha).
 
es_un(peso_pesado, division_peso).
es_un(peso_semipesado, division_peso).
es_un(peso_medio, division_peso).
es_un(peso_semimedio, division_peso).
es_un(peso_ligero, division_peso).
es_un(peso_gallo, division_peso).
es_un(peso_mosca, division_peso).
 
es_un(pelea_titular, pelea_ufc).
es_un(pelea_numero_1, pelea_ufc).
es_un(evento_ufc, competencia_deportiva).
 
es_un(nocaut, metodo_victoria).
es_un(sumision, metodo_victoria).
es_un(decision_unanime, metodo_victoria).
es_un(decision_dividida, metodo_victoria).
 
es_un(ufc, organizacion_mma).
es_un(luchador_mma, atleta_profesional).
es_un(campeon_ufc, luchador_mma).
 
 
% Propiedades y hechos (tiene/2)
tiene(ufc, transmisiones_globales).
tiene(ufc, eventos_mensuales).
tiene(ufc, multiples_divisiones).
tiene(luchador_mma, record_victoria_derrota).
tiene(luchador_mma, estilo_lucha_preferido).
tiene(campeon_ufc, titulo_activo).
tiene(campeon_ufc, contendiente_numero_1).
 
tiene(boxeo, tecnicas_punio).
tiene(boxeo, movimiento_pies_defensivo).
tiene(kickboxing, tecnicas_patadas).
tiene(kickboxing, rodillas_y_codos).
tiene(jiu_jitsu_brasileno, sumisiones).
tiene(jiu_jitsu_brasileno, control_suelo).
tiene(judo, lanzamientos).
tiene(judo, proyecciones_cuerpo).
tiene(wrestling, derribos).
tiene(wrestling, control_posicion).
tiene(muay_thai, golpes_cuerpo_completo).
tiene(muay_thai, defensa_clinch).
 
tiene(peso_pesado, potencia_maxima).
tiene(peso_semipesado, alcance_largo).
tiene(peso_medio, balance_completo).
tiene(peso_semimedio, velocidad_resistencia).
tiene(peso_ligero, cardio_explosivo).
tiene(peso_gallo, agilidad_tecnica).
tiene(peso_mosca, velocidad_maxima).
 
 
% Algunos sinonimos
sinonimo(mma, artes_marciales_mixtas).
sinonimo(bjj, jiu_jitsu_brasileno).
sinonimo(striking, lucha_de_pie).
sinonimo(grappling, lucha_proyeccion).
sinonimo(ko, nocaut).
sinonimo(tko, nocaut_tecnico).
sinonimo(submission, sumision).
sinonimo(champ, campeon).
sinonimo(fighter, luchador_mma).
 
 
% Usos
sirve_para(ufc, 'entretenimiento deportivo, competencia de alto nivel, desarrollo de atletas').
sirve_para(boxeo, 'defensa personal, acondicionamiento cardiovascular, tecnicas de golpeo precisas').
sirve_para(kickboxing, 'combinacion de golpes y patadas, defensa integral de cuerpo').
sirve_para(jiu_jitsu_brasileno, 'control del oponente, sumisiones, defensa contra oponentes mas fuertes').
sirve_para(judo, 'lanzamientos y derribos, control de posicion, defensa sin golpes').
sirve_para(wrestling, 'derribos y control posicional, dominio en el suelo').
sirve_para(muay_thai, 'combinaciones de golpes, rodillas y codos, clinch defensivo').

% Info extra sobre la UFC
 
%  Campeones actuales por division 

campeon(peso_pesado, 'Tom Aspinall').
campeon(peso_semipesado, 'Alex Pereira').
campeon(peso_medio, 'Sean Strickland').
campeon(peso_welter, 'Islam Makhachev').
campeon(peso_ligero, 'Ilia Topuria').
campeon(peso_pluma, 'Alexander Volkanovski').
campeon(peso_gallo, 'Petr Yan').
campeon(peso_mosca, 'Joshua Van').
 

%  TOP 5 Rankeados por division
 
% Peso Pesado (265+ libras)
rankeado(peso_pesado, 1, 'Ciryl Gane').
rankeado(peso_pesado, 2, 'Sergei Pavlovich').
rankeado(peso_pesado, 3, 'Alexander Volkov').
rankeado(peso_pesado, 4, 'Curtis Blaydes').
rankeado(peso_pesado, 5, 'Jailton Almeida').
 
% Peso semipesado (205 libras)
rankeado(peso_semipesado, 1, 'Magomed Ankalaev').
rankeado(peso_semipesado, 2, 'Jiri Prochazka').
rankeado(peso_semipesado, 3, 'Jamahal Hill').
rankeado(peso_semipesado, 4, 'Aleksandar Rakic').
rankeado(peso_semipesado, 5, 'Khalil Rountree Jr').

% Peso Medio (185 libras)
rankeado(peso_medio, 1, 'Sean Strickland').
rankeado(peso_medio, 2, 'Khamzat Chimaev').
rankeado(peso_medio, 3, 'Israel Adesanya').
rankeado(peso_medio, 4, 'Robert Whittaker').
rankeado(peso_medio, 5, 'Nassourdine Imavov').

% Peso Welter (170 libras)
rankeado(peso_welter, 1, 'Belal Muhammad').
rankeado(peso_welter, 2, 'Shavkat Rakhmonov').
rankeado(peso_welter, 3, 'Leon Edwards').
rankeado(peso_welter, 4, 'Jack Della Maddalena').
rankeado(peso_welter, 5, 'Ian Machado Garry').

% Peso ligero (155 libras)
rankeado(peso_ligero, 1, 'Arman Tsarukyan').
rankeado(peso_ligero, 2, 'Charles Oliveira').
rankeado(peso_ligero, 3, 'Justin Gaethje').
rankeado(peso_ligero, 4, 'Dustin Poirier').
rankeado(peso_ligero, 5, 'Mateusz Gamrot').

% Peso Pluma (145 libras)
rankeado(peso_pluma, 1, 'Max Holloway').
rankeado(peso_pluma, 2, 'Diego Lopes').
rankeado(peso_pluma, 3, 'Movsar Evloev').
rankeado(peso_pluma, 4, 'Yair Rodriguez').
rankeado(peso_pluma, 5, 'Brian Ortega').

% Peso Gallo (135 libras)
rankeado(peso_gallo, 1, 'Merab Dvalishvili').
rankeado(peso_gallo, 2, 'Umar Nurmagomedov').
rankeado(peso_gallo, 3, 'Cory Sandhagen').
rankeado(peso_gallo, 4, 'Sean OMalley').
rankeado(peso_gallo, 5, 'Song Yadong').

% Peso Mosca (125 libras)
rankeado(peso_mosca, 1, 'Tatsuro Taira').
rankeado(peso_mosca, 2, 'Brandon Royval').
rankeado(peso_mosca, 3, 'Kai Kara-France').
rankeado(peso_mosca, 4, 'Brandon Moreno').
rankeado(peso_mosca, 5, 'Amir Albazi').

 
% Ultimos eventos de UFC (2025-2026)
 
evento_ufc(324, 'UFC 324: Gaethje vs. Pimblett', '2025-01-25', 'Justin Gaethje').
evento_ufc(325, 'UFC 325: Volkanovski vs. Lopes', '2025-02-15', 'Alexander Volkanovski').
evento_ufc(326, 'UFC 326: Holloway vs. Oliveira', '2025-03-22', 'Charles Oliveira').
evento_ufc(327, 'UFC 327: Prochazka vs. Ulberg', '2025-04-19', 'Carlos Ulberg').
evento_ufc(328, 'UFC 328: Chimaev vs. Strickland', '2026-05-09', 'Sean Strickland').
 
 
% Peleas principales y resultados de los ultimos eventos
 
% UFC 324 - Main Card
pelea(324, 'Justin Gaethje', 'Paddy Pimblett', 'Justin Gaethje', 'decision_unanime').
pelea(324, 'Sean OMalley', 'Song Yadong', 'Sean OMalley', 'decision_unanime').
 
% UFC 325 - Main Card
pelea(325, 'Alexander Volkanovski', 'Diego Lopes', 'Alexander Volkanovski', 'decision_unanime').
pelea(325, 'Dan Hooker', 'Benoit Saint Denis', 'Benoit Saint Denis', 'nocaut_ronda1').
 
% UFC 326 - Main Card
pelea(326, 'Max Holloway', 'Charles Oliveira', 'Charles Oliveira', 'decision_unanime').
pelea(326, 'Caio Borralho', 'Reineir De Ridder', 'Caio Borralho', 'decision_unanime').
 
% UFC 327 - Main Card
pelea(327, 'Jiri Prochazka', 'Carlos Ulberg', 'Carlos Ulberg', 'nocaut_ronda1').
pelea(327, 'Azamat Murzakanov', 'Paulo Costa', 'Paulo Costa', 'nocaut_ronda3').
 
% UFC 328 - Main Card 
pelea(328, 'Khamzat Chimaev', 'Sean Strickland', 'Sean Strickland', 'decision_dividida').
pelea(328, 'Joshua Van', 'Tatsuro Taira', 'Joshua Van', 'nocaut_ronda3').

 
 
% Records y estilos de combate
 
% Estilos de combate de luchadores destacados
estilo_lucha('Khamzat Chimaev', 'wrestling_grappling').
estilo_lucha('Sean Strickland', 'boxeo_striking').
estilo_lucha('Joshua Van', 'striking_wrestling').
estilo_lucha('Tatsuro Taira', 'bjj_sumision').
estilo_lucha('Max Holloway', 'striking_boxeo').
estilo_lucha('Charles Oliveira', 'bjj_sumision').
estilo_lucha('Alexander Volkanovski', 'striking_tecnico').
estilo_lucha('Diego Lopes', 'striking_kickboxing').
estilo_lucha('Jiri Prochazka', 'striking_wrestling').
estilo_lucha('Carlos Ulberg', 'boxing_versatil').
estilo_lucha('Justin Gaethje', 'striking_wrestling').
estilo_lucha('Paddy Pimblett', 'bjj_wrestling').
estilo_lucha('Belal Muhammad', 'wrestling_grappling').
estilo_lucha('Kamaru Usman', 'wrestling_control').
estilo_lucha('Kai Kara-France', 'striking_versatil').
estilo_lucha('Morales Gutierrez', 'striking_tecnico').
estilo_lucha('Alex Pereira', 'kickboxing_striking').
estilo_lucha('Dricus du Plessis', 'striking_wrestling').
estilo_lucha('Islam Makhachev', 'wrestling_grappling').
estilo_lucha('Tom Aspinall', 'wrestling_striking').
estilo_lucha('Movsar Evloev', 'wrestling_grappling').
estilo_lucha('Calvin Kattar', 'boxing_resistencia').
estilo_lucha('Ilia Topuria', 'striking_rapido').
estilo_lucha('Arman Tsarukyan', 'striking_grappling').
estilo_lucha('Waldo Cortes-Acosta', 'striking_versatil').
estilo_lucha('Yaroslav Amosov', 'wrestling_invicto').
estilo_lucha('Joel Alvarez', 'boxeo_rapido').
 
 
% Records de luchadores prominentes 
record_luchador('Khamzat Chimaev', 15, 1).
record_luchador('Sean Strickland', 29, 7).
record_luchador('Joshua Van', 21, 2).
record_luchador('Tatsuro Taira', 13, 1).
record_luchador('Max Holloway', 27, 7).
record_luchador('Charles Oliveira', 34, 10).
record_luchador('Alexander Volkanovski', 25, 3).
record_luchador('Diego Lopes', 23, 2).
record_luchador('Jiri Prochazka', 30, 5).
record_luchador('Carlos Ulberg', 16, 3).
record_luchador('Justin Gaethje', 24, 5).
record_luchador('Paddy Pimblett', 19, 3).
record_luchador('Belal Muhammad', 23, 3).
record_luchador('Kamaru Usman', 18, 4).
record_luchador('Kai Kara-France', 25, 6).
record_luchador('Morales Gutierrez', 21, 4).
record_luchador('Alex Pereira', 12, 2).
record_luchador('Dricus du Plessis', 20, 2).
record_luchador('Islam Makhachev', 25, 1).
record_luchador('Tom Aspinall', 22, 3).
record_luchador('Movsar Evloev', 17, 0).
record_luchador('Calvin Kattar', 25, 7).
record_luchador('Waldo Cortes-Acosta', 12, 2).
record_luchador('Yaroslav Amosov', 21, 0).
record_luchador('Joel Alvarez', 18, 2).
record_luchador('Ilia Topuria', 16, 0).
record_luchador('Arman Tsarukyan', 18, 1).
record_luchador('Ciryl Gane', 18, 2).
record_luchador('Stipe Miocic', 20, 4).
record_luchador('Paulo Costa', 13, 2).
record_luchador('Robert Whittaker', 23, 5).