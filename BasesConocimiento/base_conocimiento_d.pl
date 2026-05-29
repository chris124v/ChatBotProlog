%  Tema: Ciencias, Geografia, Historia y Arte/Cultura
%  Autor: Daniel Arce
%
%  Declaraciones dinamicas y multifile
%
%  Estas declaraciones le dicen a Prolog que los predicados
%  pueden cambiar durante la ejecucion (usando assertz/retract).
%  Sin esto, Prolog no permitiria agregar hechos en tiempo real.

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


%  Organizada en cinco tipos de hechos:
%    concepto/2    - define que ES algo
%    es_un/2       - establece jerarquias de categoria
%    tiene/2       - describe propiedades de un concepto
%    sinonimo/2    - equivalencias entre terminos
%    sirve_para/2  - usos principales de un concepto


% ============================================================
%  TECNOLOGIA E INFORMATICA
% ============================================================

concepto(inteligencia_artificial,
    'campo de la computacion que crea sistemas capaces de realizar tareas que requieren inteligencia humana').
concepto(machine_learning,
    'subcampo de la IA donde los sistemas aprenden de datos sin ser programados explicitamente para cada tarea').
concepto(red_neuronal,
    'modelo computacional inspirado en el sistema nervioso biologico para reconocimiento de patrones').
concepto(base_de_datos,
    'sistema organizado para almacenar, gestionar y recuperar informacion de forma estructurada').
concepto(algoritmo,
    'secuencia finita de pasos bien definidos para resolver un problema computacional').
concepto(compilador,
    'herramienta que traduce codigo fuente completo a codigo maquina antes de ejecutarlo').
concepto(recursividad,
    'tecnica donde una funcion se llama a si misma para resolver subproblemas mas pequenos').
concepto(backtracking,
    'tecnica de busqueda que explora caminos posibles y retrocede cuando encuentra un callejon sin salida').
concepto(paradigma_logico,
    'estilo de programacion basado en logica formal donde se declaran hechos y reglas, y el motor infiere conclusiones').

es_un(machine_learning,      inteligencia_artificial).
es_un(red_neuronal,          machine_learning).
es_un(inteligencia_artificial, campo_computacional).
es_un(base_de_datos,         herramienta_informatica).
es_un(compilador,            herramienta_informatica).
es_un(recursividad,          tecnica_programacion).
es_un(backtracking,          tecnica_programacion).
es_un(paradigma_logico,      paradigma_programacion).

tiene(inteligencia_artificial, razonamiento_automatico).
tiene(machine_learning,        aprendizaje_de_datos).
tiene(red_neuronal,            capas_de_procesamiento).
tiene(base_de_datos,           consultas_estructuradas).
tiene(algoritmo,               complejidad_temporal).
tiene(compilador,              deteccion_de_errores_en_compilacion).
tiene(recursividad,            caso_base_y_caso_recursivo).
tiene(backtracking,            exploracion_exhaustiva).

sinonimo(ia,                   inteligencia_artificial).
sinonimo(ml,                   machine_learning).
sinonimo(bd,                   base_de_datos).
sinonimo(pl,                   paradigma_logico).
sinonimo(programacion_logica,  paradigma_logico).

sirve_para(inteligencia_artificial,
    'reconocimiento de patrones, predicciones, procesamiento de lenguaje natural y automatizacion').
sirve_para(machine_learning,
    'clasificacion de datos, deteccion de anomalias y sistemas de recomendacion').
sirve_para(base_de_datos,
    'almacenar y consultar datos de forma eficiente en aplicaciones y sistemas').
sirve_para(algoritmo,
    'resolver problemas computacionales de forma sistematica y reproducible').


% ============================================================
%  CIENCIAS NATURALES
% ============================================================

concepto(fotosintesis,
    'proceso por el cual las plantas convierten luz solar, agua y CO2 en glucosa y oxigeno').
concepto(celula,
    'unidad estructural y funcional basica de todo ser vivo').
concepto(adn,
    'molecula que contiene la informacion genetica de los organismos vivos').
concepto(evolucion,
    'proceso de cambio gradual en las caracteristicas de las especies a lo largo de generaciones').
concepto(gravedad,
    'fuerza de atraccion mutua entre cuerpos con masa, descrita por Newton y Einstein').
concepto(atomo,
    'unidad mas pequena de un elemento quimico que conserva sus propiedades').
concepto(ecosistema,
    'conjunto de seres vivos que interactuan entre si y con su entorno fisico').
concepto(tabla_periodica,
    'organizacion sistematica de los elementos quimicos segun su numero atomico').
concepto(termodinamica,
    'rama de la fisica que estudia las relaciones entre calor, trabajo y energia').
concepto(relatividad,
    'teoria de Einstein que describe el espacio, tiempo y gravedad a escalas extremas').

es_un(fotosintesis,    proceso_biologico).
es_un(celula,          estructura_biologica).
es_un(adn,             molecula_biologica).
es_un(evolucion,       proceso_biologico).
es_un(gravedad,        fuerza_fisica).
es_un(atomo,           estructura_quimica).
es_un(ecosistema,      sistema_natural).
es_un(tabla_periodica, herramienta_quimica).
es_un(termodinamica,   rama_fisica).
es_un(relatividad,     teoria_fisica).

tiene(fotosintesis,    clorofila).
tiene(fotosintesis,    produccion_de_oxigeno).
tiene(celula,          membrana_celular).
tiene(celula,          nucleo).
tiene(adn,             doble_helice).
tiene(adn,             genes).
tiene(atomo,           protones).
tiene(atomo,           neutrones).
tiene(atomo,           electrones).
tiene(ecosistema,      cadena_trofica).
tiene(tabla_periodica, grupos_y_periodos).

sinonimo(acido_desoxirribonucleico, adn).
sinonimo(ley_de_gravedad,           gravedad).
sinonimo(genetica_molecular,        adn).
sinonimo(teoria_de_la_evolucion,    evolucion).

sirve_para(fotosintesis,
    'producir energia para la planta y liberar oxigeno al ambiente').
sirve_para(adn,
    'almacenar y transmitir informacion genetica entre generaciones').
sirve_para(tabla_periodica,
    'organizar los elementos quimicos y predecir sus propiedades').
sirve_para(termodinamica,
    'disenar motores, refrigeradores y analizar transferencia de energia').


% ============================================================
%  GEOGRAFIA
% ============================================================

concepto(costa_rica,
    'pais centroamericano conocido por su biodiversidad, areas protegidas y politicas ambientales').
concepto(rio_amazonas,
    'rio mas caudaloso del mundo, ubicado en America del Sur, vital para la biodiversidad').
concepto(everest,
    'montana mas alta del mundo con 8849 metros, ubicada en el Himalaya entre Nepal y Tibet').
concepto(antartida,
    'continente mas frio y ventoso de la Tierra, cubierto casi en su totalidad por hielo').
concepto(oceano_pacifico,
    'oceano mas grande del planeta, ubicado entre Asia, America y Oceania').
concepto(mesoamerica,
    'region historica y cultural que abarca desde Mexico hasta Costa Rica').

es_un(costa_rica,     pais_centroamericano).
es_un(rio_amazonas,   rio).
es_un(everest,        montana).
es_un(antartida,      continente).
es_un(oceano_pacifico,oceano).
es_un(mesoamerica,    region_geografica).
es_un(pais_centroamericano, pais).
es_un(rio,            accidente_geografico).
es_un(montana,        accidente_geografico).
es_un(oceano,         masa_de_agua).

tiene(costa_rica,      parques_nacionales).
tiene(costa_rica,      biodiversidad_alta).
tiene(rio_amazonas,    mayor_caudal_del_mundo).
tiene(everest,         zona_de_muerte_sobre_8000m).
tiene(antartida,       capa_de_hielo_permanente).
tiene(oceano_pacifico, anillo_de_fuego).

sinonimo(amazon,       rio_amazonas).
sinonimo(monte_everest,everest).
sinonimo(polo_sur,     antartida).
sinonimo(cr,           costa_rica).

sirve_para(rio_amazonas,
    'sostener la mayor biodiversidad fluvial del mundo y regular el clima regional').
sirve_para(oceano_pacifico,
    'regular el clima global, proveer recursos pesqueros y conectar continentes').


% ============================================================
%  HISTORIA
% ============================================================

concepto(revolucion_francesa,
    'periodo de transformacion politica y social en Francia entre 1789 y 1799').
concepto(segunda_guerra_mundial,
    'conflicto belico global entre 1939 y 1945 que involucro a la mayoria de las naciones del mundo').
concepto(renaissance,
    'movimiento cultural europeo del siglo XIV-XVII que marco la transicion del Medioevo a la modernidad').
concepto(independencia_cr,
    'proceso por el cual Costa Rica obtuvo su independencia de Espana el 15 de septiembre de 1821').
concepto(guerra_fria,
    'tension geopolitica entre EE.UU. y la URSS entre 1947 y 1991 sin confrontacion militar directa').

es_un(revolucion_francesa,   evento_historico).
es_un(segunda_guerra_mundial, conflicto_belico).
es_un(renaissance,           movimiento_cultural).
es_un(independencia_cr,      evento_historico).
es_un(guerra_fria,           conflicto_geopolitico).
es_un(conflicto_belico,      evento_historico).
es_un(conflicto_geopolitico, evento_historico).

tiene(revolucion_francesa,    declaracion_de_derechos_del_hombre).
tiene(segunda_guerra_mundial, holocausto).
tiene(segunda_guerra_mundial, uso_de_bomba_atomica).
tiene(renaissance,            humanismo).
tiene(renaissance,            resurgimiento_del_arte_clasico).
tiene(guerra_fria,            carrera_armamentista).
tiene(guerra_fria,            carrera_espacial).

sinonimo(sgm,        segunda_guerra_mundial).
sinonimo(wwii,       segunda_guerra_mundial).
sinonimo(renacimiento, renaissance).

sirve_para(revolucion_francesa,
    'sentar las bases de los derechos humanos y la democracia moderna').
sirve_para(renaissance,
    'impulsar el arte, la ciencia y el pensamiento critico en Europa').


% ============================================================
%  ARTE Y CULTURA
% ============================================================

concepto(impresionismo,
    'movimiento pictorico del siglo XIX caracterizado por capturar la luz y el instante sobre formas definidas').
concepto(jazz,
    'genero musical originado en comunidades afroamericanas de Nueva Orleans a finales del siglo XIX').
concepto(literatura,
    'arte que usa el lenguaje escrito o hablado para expresar ideas, emociones y narrativas').
concepto(arquitectura,
    'disciplina que combina arte y ciencia para disenar y construir espacios habitables').
concepto(folklore,
    'conjunto de tradiciones, costumbres y expresiones culturales propias de un pueblo').

es_un(impresionismo, movimiento_artistico).
es_un(jazz,          genero_musical).
es_un(literatura,    expresion_artistica).
es_un(arquitectura,  disciplina_artistica).
es_un(folklore,      expresion_cultural).
es_un(movimiento_artistico,  expresion_artistica).
es_un(genero_musical,        expresion_artistica).

tiene(impresionismo, uso_de_pinceladas_sueltas).
tiene(impresionismo, representacion_de_la_luz).
tiene(jazz,          improvisacion).
tiene(jazz,          ritmos_sincopados).
tiene(literatura,    narrativa).
tiene(literatura,    poesia).
tiene(arquitectura,  diseno_estructural).
tiene(folklore,      tradicion_oral).

sinonimo(pintura_impresionista, impresionismo).
sinonimo(musica_jazz,           jazz).

sirve_para(jazz,
    'expresion artistica, entretenimiento e influencia en generos musicales modernos').
sirve_para(literatura,
    'preservar cultura, transmitir conocimiento y generar empatia a traves de la narrativa').
sirve_para(arquitectura,
    'disenar espacios funcionales, esteticos y seguros para la vida humana').