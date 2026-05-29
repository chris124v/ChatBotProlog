
%  Tema: Slang, Memes y Vocabulario Coloquial de Internet.
%  Autor: Grupo de Estudiantes
%  Base de Conocimiento B - Enfocada en cultura digital moderna


%  Declaraciones Dinamicas y Multifile
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
:- dynamic contexto_uso/2.
:- multifile contexto_uso/2.
:- dynamic contrario/2.
:- multifile contrario/2.


%  Organizada en cinco tipos de hechos:
%    concepto/2        - define que ES algo
%    es_un/2           - establece jerarquias de categoria
%    tiene/2           - describe propiedades de un concepto
%    sinonimo/2        - equivalencias entre terminos
%    contexto_uso/2    - contextos donde se usa
%    contrario/2       - antonimos y conceptos opuestos


%  ========== DEFINICIONES DE CONCEPTOS ==========
%  Cada hecho responde "que es" para un termino especifico.

%  Conceptos sobre Apariencia y Atractivo
concepto(looksmaxxing,
    'practica de optimizar la apariencia fisica mediante dieta, ejercicio, ropa y cuidado personal').
concepto(mewing,
    'tecnica de posicionamiento de la lengua para supuestamente mejorar la estructura facial').
concepto(aura,
    'presencia o carisma personal que emana de alguien, energia que proyecta').
concepto(glow_up,
    'transformacion positiva en la apariencia o en la vida de una persona').
concepto(mogging,
    'cuando alguien supera o domina la apariencia de otra persona en comparacion directa').

%  Conceptos sobre Tipos de Personas
concepto(sigma,
    'personalidad independiente y autosuficiente, que no sigue normas sociales convencionales').
concepto(chad,
    'estereotipo de hombre atractivo, confiado y sexualmente exitoso').
concepto(stacey,
    'estereotipo de mujer atractiva, popular y deseable en la cultura de internet').
concepto(simp,
    'persona que gasta dinero o esfuerzo excesivo en complacer a una persona que le atrae').
concepto(incel,
    'comunidad de hombres que se identifican como involuntariamente celebes e resentidos').
concepto(npc,
    'persona que se percibe como sin personalidad propia, que solo sigue ordenes').
concepto(normie,
    'persona que sigue las normas sociales convencionales sin desviarse').
concepto(beta_male,
    'termino coloquial para referirse a un hombre de baja jerarquia social segun la teoria alpha').
concepto(zoomer,
    'persona nacida entre 1997 y 2012, nativa digital de redes sociales').
concepto(boomer,
    'persona de edad avanzada, a menudo critica con la cultura digital').

%  Conceptos sobre Actitudes y Estados Mentales
concepto(brainrot,
    'estado mental de degeneracion por sobreexposicion a contenido de internet y memes').
concepto(no_cap,
    'afirmacion sincera sin mentiras, expresion de veracidad absoluta').
concepto(cope,
    'mecanismo de defensa psicologica para negar o minimizar una realidad desagradable').
concepto(seethe,
    'estado de furia, resentimiento o rabia intensa sin poder expresarla abiertamente').
concepto(salty,
    'estar molesto, resentido o amargado por una situacion o resultado negativo').
concepto(based,
    'ser autentico, sincero y sin filtros en las opiniones sin importar la aceptacion social').
concepto(cringe,
    'sensacion de verguenza ajena, incomodidad o rechazo ante algo socialmente inapropiado').
concepto(ratio,
    'respuesta que refuta o domina un argumento anterior, ganando mas interacciones').
concepto(sarcasm,
    'expresion ionica donde se dice algo opuesto a lo que se quiere dar a entender').

%  Conceptos sobre Evaluacion y Jerarquia
concepto(mid,
    'calificacion que denota algo mediocre, ni bueno ni malo, ordinario').
concepto(top_tier,
    'clasificacion de lo mejor en su categoria, excelencia maxima').
concepto(low_tier,
    'clasificacion de lo peor en su categoria, calidad baja').
concepto(goated,
    'calificativo de algo excelente, el mas grande en su tipo (Greatest Of All Time)').
concepto('W',
    'victoria, exito o resultado positivo en cualquier situacion').
concepto('L',
    'derrota, fracaso o resultado negativo en cualquier situacion').
concepto(sus,
    'termino que significa sospechoso, cuando algo parece raro o fuera de lugar').

%  Conceptos sobre Comportamiento Online
concepto(doom_scrolling,
    'habito de desplazarse continuamente por redes sociales viendo contenido negativo').
concepto(ghosting,
    'desaparicion repentina sin comunicacion, ignorar completamente a alguien').
concepto(stan,
    'ser un seguidor devoted y apasionado de una celebridad o personalidad').
concepto(toxic,
    'comportamiento danino, abusivo o negativo que contamina el ambiente social').
concepto(gatekeeping,
    'practica de controlar quien tiene acceso a una comunidad o conocimiento').
concepto(cancel_culture,
    'fenomeno social de rechazo y boycott colectivo a una persona por sus acciones o palabras').

%  Conceptos sobre Resultados y Destino
concepto(redpill,
    'idea de aceptar una verdad amarga o desagradable sobre la realidad del mundo').
concepto(bluepill,
    'aceptar las versiones oficiales o convencionales de la realidad sin cuestionamiento').
concepto(copium,
    'falsa esperanza o consuelo ilusorio para lidiar con una situacion negativa').
concepto(hopium,
    'confianza infundada o esperanza irracional en un resultado positivo').
concepto(touch_grass,
    'invitacion ionica a desconectarse de internet y salir a la realidad').

%  Conceptos sobre Comunidades Online
concepto(echo_chamber,
    'ambiente donde solo se escuchan opiniones similares, reforzando creencias existentes').
concepto(circlejerk,
    'grupo que mutuamente se aprueba sin critica constructiva, validacion excesiva').
concepto(lurker,
    'usuario que observa sin participar activamente en una comunidad online').
concepto(troll,
    'usuario que provoca reacciones negativas de forma intencional para causar conflicto').
concepto(hater,
    'persona que critica o expresa desdén consistentemente hacia alguien o algo').

%  Conceptos sobre Resultados Financieros y Estatus
concepto(rizzz,
    'carisma o habilidad de seduccion, capacidad de atraer a alguien romanticamente').
concepto(down_bad,
    'estar en situacion dificil financiera, emocional o socialmente muy comprometida').
concepto(bread,
    'dinero, ganancias economicas, riqueza o recursos financieros').
concepto(broke,
    'estar sin dinero, en quiebra economica, sin recursos financieros').
concepto(flex,
    'mostrar ostentosamente los logros, posesiones o estatus personal').

%  Conceptos sobre Entretenimiento
concepto(streaming,
    'transmision en vivo de contenido multimedia a traves de plataformas digitales').
concepto(speedrun,
    'completar un videojuego o tarea en el menor tiempo posible utilizando tecnicas optimizadas').
concepto(clutch,
    'logro ultimo momento sorprendente que revierte una situacion negativa').
concepto(gaming,
    'actividad de jugar videojuegos como pasatiempo, profesion o competicion').

%  Conceptos Temporales y de Estilo de Vida
concepto(era,
    'periodo de tiempo definido por caracteristicas culturales, modas o eventos especificos').
concepto(vibe,
    'sensacion atmosferica o ambiental que transmite una persona, lugar o contenido').
concepto(aesthetic,
    'estilo visual o atmosferico consistente que define la imagen de alguien o algo').
concepto(drip,
    'estilo de moda personal distintivo, combinacion de ropa y accesorios con confianza').

%  Conceptos sobre Realidad Alternativa
concepto(metaverse,
    'universo virtual compartido donde usuarios interactuan en mundo digital inmersivo').
concepto('NFT',
    'activo digital unico no fungible, certificado mediante blockchain para coleccionismo').


%  ========== JERARQUIAS DE CATEGORIAS ==========
%  es_un/2 establece relaciones taxonomicas permitiendo inferencia transitiva

%  Tipos de Personas
es_un(sigma,         personalidad_social).
es_un(chad,          estereotipo_masculino).
es_un(stacey,        estereotipo_femenino).
es_un(simp,          comportamiento_obsesivo).
es_un(incel,         comunidad_social).
es_un(npc,           arquetipo_personalidad).
es_un(normie,        tipo_persona).
es_un(beta_male,     estereotipo_masculino).
es_un(zoomer,        generacion).
es_un(boomer,        generacion).

%  Estados Mentales
es_un(brainrot,      estado_mental).
es_un(cope,          mecanismo_psicologico).
es_un(seethe,        estado_emocional).
es_un(salty,         estado_emocional).
es_un(based,         actitud_personal).
es_un(cringe,        reaccion_emocional).

%  Evaluaciones
es_un(mid,           calificacion).
es_un(top_tier,      calificacion).
es_un(low_tier,      calificacion).
es_un(goated,        calificacion).
es_un('W',             resultado).
es_un('L',             resultado).
es_un(sus,           sospecha).

%  Comportamiento Online
es_un(doom_scrolling, habito_digital).
es_un(ghosting,       comportamiento_social).
es_un(stan,           seguimiento_celebrities).
es_un(toxic,          comportamiento_negativo).
es_un(gatekeeping,    practica_exclusion).

%  Apariencia y Atractivo
es_un(looksmaxxing,  optimizacion_personal).
es_un(mewing,        tecnica_belleza).
es_un(aura,          presencia_personal).
es_un(glow_up,       transformacion).
es_un(mogging,       comparacion_apariencia).
es_un(rizzz,         atractivo_personal).

%  Hierarquia de Categorias
es_un(estereotipo_masculino,    tipo_persona).
es_un(estereotipo_femenino,     tipo_persona).
es_un(personalidad_social,      caracteristica_personal).
es_un(tipo_persona,             concepto_social).
es_un(generacion,               clasificacion_demografica).
es_un(arquetipo_personalidad,   tipo_persona).
es_un(estado_mental,            psicologia).
es_un(estado_emocional,         psicologia).
es_un(mecanismo_psicologico,    psicologia).
es_un(habito_digital,           comportamiento).
es_un(comportamiento_social,    comportamiento).
es_un(comportamiento_obsesivo,  comportamiento_negativo).
es_un(comportamiento_negativo,  comportamiento).


%  ========== PROPIEDADES ==========
%  tiene/2 describe caracteristicas y atributos inherentes

%  Propiedades de Sigma
tiene(sigma,        mentalidad_independiente).
tiene(sigma,        confianza_alta).
tiene(sigma,        desprecio_normas_sociales).

%  Propiedades de Chad
tiene(chad,         atractivo_fisico).
tiene(chad,         confianza_extrema).
tiene(chad,         exito_sexual).

%  Propiedades de Brainrot
tiene(brainrot,     exposicion_excesiva_contenido).
tiene(brainrot,     decaimiento_mental).
tiene(brainrot,     adicion_redes_sociales).

%  Propiedades de Based
tiene(based,        autenticidad).
tiene(based,        falta_filtros).
tiene(based,        independencia_pensamiento).

%  Propiedades de Aura
tiene(aura,         carisma).
tiene(aura,         presencia_magnetica).
tiene(aura,         influencia_social).

%  Propiedades de Looksmaxxing
tiene(looksmaxxing, enfoque_ejercicio).
tiene(looksmaxxing, dieta_controlada).
tiene(looksmaxxing, cuidado_personal).

%  Propiedades de Cope
tiene(cope,         negacion_realidad).
tiene(cope,         autoengano).
tiene(cope,         racionalizacion_excusa).

%  Propiedades de Toxic
tiene(toxic,        comportamiento_abusivo).
tiene(toxic,        negatividad_contagiosa).
tiene(toxic,        dano_ambiental).


%  ========== SINONIMOS ==========
%  Permiten entender variantes y abreviaciones

sinonimo(sigma,             sigma_male).
sinonimo(chad,              chadwick).
sinonimo(stacey,            stacy).
sinonimo(simp,              simper).
sinonimo(npc,               zombi_social).
sinonimo('W',                 victoria).
sinonimo('W',                 exito).
sinonimo('L',                 perdida).
sinonimo('L',                 fracaso).
sinonimo(sus,               sospechoso).
sinonimo(sus,               raro).
sinonimo(rizzz,             carisma).
sinonimo(rizzz,             sex_appeal).
sinonimo(mid,               mediocre).
sinonimo(mid,               ordinario).
sinonimo(brainrot,          mental_decay).
sinonimo(no_cap,            sin_mentira).
sinonimo(no_cap,            de_verdad).
sinonimo(based,             autentico).
sinonimo(cringe,            vergonzoso).
sinonimo(cringe,            incomodo).
sinonimo(salty,             amargado).
sinonimo(salty,             resentido).
sinonimo(seethe,            furibundo).
sinonimo(toxic,             toxico).
sinonimo(ghosting,          desaparicion).
sinonimo(stan,              ser_fan).
sinonimo(doom_scrolling,    doomscroll).
sinonimo(touch_grass,       salir_realidad).
sinonimo(goated,            lo_mejor).
sinonimo(goated,            'GOAT').
sinonimo(ratio,             refutacion).
sinonimo(copium,            falsa_esperanza).
sinonimo(aura,              presencia).
sinonimo(glow_up,           transformacion_positiva).
sinonimo(down_bad,          muy_mal).
sinonimo(bread,             dinero).
sinonimo(broke,             pobre).
sinonimo(flex,              presumir).
sinonimo(streaming,         transmision_viva).


%  ========== CONTEXTOS DE USO ==========
%  contexto_uso/2 describe donde y como se utiliza cada termino

contexto_uso(brainrot,      'redes sociales, TikTok, YouTube Shorts').
contexto_uso(sigma,         'comunidades de autoayuda masculina, sigma grindset').
contexto_uso(aura,          'describe presencia de personas influyentes o celebridades').
contexto_uso(no_cap,        'conversaciones casual online, expresion de sinceridad').
contexto_uso(based,         'debates politicos, redes sociales, foros online').
contexto_uso('W',             'videojuegos, competiciones, comparaciones').
contexto_uso('L',             'videojuegos, competiciones, critica de fracasos').
contexto_uso(simp,          'critica de seguidores de contenido creadores').
contexto_uso(sus,           'videojuegos tipo Among Us, deteccion de mentiras').
contexto_uso(rizzz,         'cortejo, atractivo romantico, seduccion').
contexto_uso(doom_scrolling, 'habitos de redes sociales dañinos').
contexto_uso(ghosting,      'relaciones romanticas, citas online').
contexto_uso(ratio,         'Twitter, debates online, dominio argumentativo').
contexto_uso(touch_grass,   'invitacion ironica a desconectarse de internet').
contexto_uso(looksmaxxing,  'comunidades de mejora personal, gym culture').
contexto_uso(mid,           'evaluacion de contenido, peliculas, musica').
contexto_uso(toxic,         'ambientes online, videojuegos competitivos').
contexto_uso(cringe,        'reaccion a contenido socialmente incomodo').
contexto_uso(mewing,        'comunidades de belleza y atractivo').
contexto_uso(copium,        'cuando alguien se consuela con falsas esperanzas').


%  ========== CONCEPTOS OPUESTOS ==========
%  contrario/2 define antonimos y conceptos opuestos

contrario('W',           'L').
contrario('L',           'W').
contrario(based,       normie).
contrario(sigma,       npc).
contrario(npc,         sigma).
contrario(chad,        incel).
contrario(top_tier,    low_tier).
contrario(low_tier,    top_tier).
contrario(redpill,     bluepill).
contrario(bluepill,    redpill).
contrario(brainrot,    clarity_mental).
contrario(toxic,       supportive).
contrario(broke,       rich).
contrario(down_bad,    thriving).
contrario(cope,        aceptar_realidad).


%  ========== MÁS CONCEPTOS DE INTERNET CULTURE ==========

%  Conceptos sobre Memes y Trending
concepto(doge,
    'meme icónico de un perro Shiba Inu con texto en mala ortografia en colores vivos').
concepto(wojak,
    'meme basado en caricaturas de hombres mostrando diferentes estados emocionales y personalidades').
concepto(pepe,
    'personaje de rana verde de un comic que se convirtio en meme de internet').
concepto(troll_face,
    'caricatura con expresion burlona utilizada para indicar que alguien esta trolleando').
concepto(floor_gang,
    'tendencia de humor de estar en el piso, asociada con creador de contenido PewDiePie').
concepto(poggers,
    'expresion de entusiasmo y excitacion ante algo positivo o increible en vivo').
concepto(monkas,
    'cara de Pepe nerviosa indicando ansiedad o preocupacion ante algo que esta sucediendo').
concepto('OMEGALUL',
    'version exagerada de risa, indicando que algo es extremadamente comico').
concepto(based_and_redpilled,
    'combinacion de dos terminos indicando que alguien tiene opiniones autenticas pero controvertidas').
concepto(seething,
    'estar extremadamente enojado pero conteniendose, rabia reprimida').

%  Conceptos sobre Comportamiento Online Avanzado
concepto(doomposting,
    'tendencia de compartir constantemente noticias negativas y predicciones apocalipticas').
concepto(ratioed,
    'cuando las respuestas a un tweet superan los likes del tweet original en reacciones negativas').
concepto(quote_tweet,
    'respuesta critica a un tweet original anadiendo comentario sarcastico o refutacion').
concepto(stan_account,
    'cuenta dedicada exclusivamente a un celebridad o personalidad repostando su contenido').
concepto(alt_account,
    'cuenta alternativa secreta donde usuarios publican sin revelador su identidad real').
concepto(lurker,
    'usuario que observa y consume contenido sin participar en discusiones publicamente').
concepto(baiter,
    'persona que intenta provocar reacciones exageradas publicando contenido sensacionalista').
concepto(shill,
    'usuario pagado o incentivado para promover algo secretamente sin revelar conflicto de interes').
concepto(doxx,
    'practica ilegal de revelar informacion personal privada de alguien publicamente').

%  Conceptos sobre Economía Digital y Valor
concepto(clout,
    'influencia social y credibilidad acumulada en redes sociales y comunidades online').
concepto(grift,
    'estafa o engano para obtener dinero o beneficios mediante manipulacion').
concepto(hustle,
    'esfuerzo constante en actividades legales para ganar dinero y progresar economicamente').
concepto(grindset,
    'mentalidad de trabajo constante y disciplinado para alcanzar objetivos personales').
concepto(exit_scam,
    'cuando un proyecto o negocio desaparece de repente con los fondos de los inversores').
concepto(baghodler,
    'persona que compra criptomonedas o activos caros que pierden valor drasticamente').
concepto(hodl,
    'estrategia de no vender activos digitales a pesar de volatilidad, esperando recuperacion').

%  Conceptos sobre Viralidad y Tendencias
concepto(viral,
    'contenido que se propaga rapidamente alcanzando millones de visualizaciones en corto tiempo').
concepto(algorithm,
    'sistema automatizado que decide que contenido mostrar a cada usuario en redes sociales').
concepto(shadow_ban,
    'restriccion secreta de visibilidad de una cuenta sin notificar al usuario explicitamente').
concepto(engagement,
    'metrica de interaccion midiendo likes, comentarios, compartidas en redes sociales').
concepto(reach,
    'numero total de usuarios que han visto un contenido en una plataforma de redes sociales').
concepto(impressions,
    'numero total de veces que un contenido ha sido mostrado en las pantallas de usuarios').
concepto(clickbait,
    'titulo o thumbnail diseñado para atraer clics exagerando o engañando sobre el contenido real').

%  Conceptos sobre Tendencias Sociales Negativas
concepto(outrage_culture,
    'fenomeno donde grupos se molestan colectivamente por contenido buscando consecuencias').
concepto(call_out_culture,
    'practica de identificar y criticar publicamente comportamientos considerados ofensivos').
concepto(virtue_signaling,
    'expresion publica de valores morales principalmente para ganar aprobacion social').
concepto(performative_activism,
    'activismo superficial enfocado en apariencia de apoyo sin acciones concretas').
concepto(piling_on,
    'cuando multiples usuarios atacan colectivamente a una persona por una razon').

%  Conceptos sobre Relaciones Digitales
concepto(orbiting,
    'seguir de cerca sin interactuar directamente a alguien a quien le atrae romanticamente').
concepto(benching,
    'mantener a alguien interesado sin compromiso serio dejandolo en espera').
concepto(stashing,
    'ocultar una relacion romantica no publicandola en redes sociales').
concepto(breadcrumbing,
    'enviar mensajes minimos ocasionales para mantener alguien emocionalmente disponible').
concepto(roaching,
    'esconder multiples relaciones simultaneas de parejas sin su consentimiento').

%  Conceptos sobre Gaming Culture
concepto(pwn,
    'derrotar completamente a un oponente en videojuegos, dominio total').
concepto(noob,
    'jugador principiante sin experiencia en un videojuego o comunidad gaming').
concepto(griefing,
    'acosar intencionalmente a otros jugadores interrumpiendo su experiencia de juego').
concepto(gank,
    'grupo de jugadores atacando a un jugador solitario de forma coordinada').
concepto(camping,
    'estrategia de esperar escondido en ubicacion para emboscar oponentes sorpresivamente').
concepto(trash_talk,
    'insultos y provocaciones verbales entre jugadores durante competicion online').
concepto(carry,
    'jugador que rendimiento excepcional ayuda a su equipo a ganar a pesar de otros debiles').
concepto(throw,
    'perder una victoria casi asegurada por errores en momento critico del juego').
concepto(clutch,
    'momento donde alguien logra revertir una derrota inminente con rendimiento excepcional').

%  Conceptos sobre Fandom Culture
concepto(shipping,
    'desear romanticamente que dos personajes de ficcion terminen juntos como pareja').
concepto(headcanon,
    'interpretacion personal de un canon que los fans creen que deberia ser verdadera').
concepto(fan_fiction,
    'historias creadas por fans usando personajes y mundos de media existente').
concepto(fanart,
    'arte original creado por fans basado en personajes o universos de media existente').
concepto(slash,
    'genero de fan fiction que romanticiza relaciones entre personajes del mismo genero').
concepto(canon,
    'informacion oficial reconocida por creadores como parte del universo ficticio').
concepto(waifu,
    'personaje ficticio femenino del cual alguien es muy seguidor afirmando seria o bromista').
concepto(husbando,
    'personaje ficticio masculino del cual alguien es muy seguidor afirmando seria o bromista').

%  Conceptos sobre Memes Avanzados
concepto(deep_fried,
    'meme altamente comprimido y degradado visualmente para efecto conico').
concepto(loss,
    'referencia a comic de 2008 donde cambio de tono permitiendo infinitas variaciones').
concepto(surrogate,
    'meme que usa imagenes no relacionadas para transmitir mensajes de forma indirecta').
concepto(shitpost,
    'contenido deliberadamente absurdo, ofensivo o de baja calidad para generar reacciones').
concepto(dank_meme,
    'meme que usa humor oscuro, absurdo o irónico entendido por comunidades especificas').

%  Conceptos sobre Autenticidad Online
concepto(authentic_self,
    'la verdadera personalidad de alguien sin influencia de expectativas sociales online').
concepto(persona,
    'version editada o exagerada de si mismo que alguien proyecta en redes sociales').
concepto(catfishing,
    'crear identidad falsa para engañar a alguien emocionalmente mediante relacion romantica').
concepto(fake_news,
    'informacion falsa deliberadamente diseñada para engañar y influenciar publico').

%  Conceptos sobre Economia Creador
concepto(content_creator,
    'persona que produce contenido digital regularmente para plataformas y gana ingresos').
concepto(influencer,
    'persona con muchos seguidores que monetiza influencia promocionando productos').
concepto(parasocial_relationship,
    'relacion asimetrica donde followers sienten conexion pero creator no los conoce').
concepto(demonetization,
    'restriccion de ganancias por publicidad en plataforma por violar reglas comunitarias').
concepto(sponsorship,
    'pago de empresa a creator para promover producto o servicio en contenido').

%  Conceptos sobre Política y Activismo Digital
concepto(blue_pilled,
    'termino que significa aceptar version oficial o mainsteam de eventos sin cuestionamiento').
concepto(black_pilled,
    'estado de pesimismo extremo creencia que cambio positivo es imposible').
concepto(orange_pilled,
    'conversion a adoptar criptomonedas como solucion a sistemas financieros tradicionales').
concepto(purple_pilled,
    'feminismo extremista que rechaza completamente interacciones heterosexuales').

%  Conceptos sobre Compras Digitales
concepto(scalp,
    'comprar items limitados rapidamente para revenderlos a precio inflado').
concepto(reseller,
    'persona que compra items por menor precio para revender con margen de ganancia').
concepto(drop,
    'lanzamiento limitado de producto que usualmente se agota en minutos').
concepto(hypebeast,
    'persona obsesionada con marcas de lujo y tendencias de moda corriente').
concepto(rarity,
    'item coleccionable que es escaso aumentando su valor en mercado secundario').


%  ========== MÁS JERARQUIAS DE CATEGORIAS ==========

es_un(doge,                 meme_iconico).
es_un(wojak,                meme_iconico).
es_un(pepe,                 meme_iconico).
es_un(troll_face,           meme_iconico).
es_un(floor_gang,           tendencia_humor).
es_un(poggers,              expresion_entusiasmo).
es_un(monkas,               expresion_ansiedad).
es_un('OMEGALUL',             expresion_risa).
es_un(meme_iconico,         cultura_internet).
es_un(tendencia_humor,      cultura_internet).
es_un(expresion_entusiasmo, emote_twitch).
es_un(expresion_ansiedad,   emote_twitch).
es_un(expresion_risa,       emote_twitch).
es_un(emote_twitch,         cultura_gaming).

es_un(doomposting,          comportamiento_negativo).
es_un(ratioed,              resultado_social).
es_un(quote_tweet,          tipo_interaccion).
es_un(stan_account,         tipo_cuenta).
es_un(alt_account,          tipo_cuenta).
es_un(lurker,               tipo_usuario).
es_un(baiter,               tipo_usuario_negativo).
es_un(shill,                tipo_usuario_negativo).
es_un(tipo_cuenta,          cuenta_redes_sociales).
es_un(tipo_usuario,         usuario_internet).
es_un(tipo_usuario_negativo, usuario_internet).

es_un(clout,                capital_social).
es_un(grift,                actividad_ilegal).
es_un(hustle,               actividad_economica).
es_un(grindset,             mentalidad_productiva).
es_un(hodl,                 estrategia_inversion).
es_un(baghodler,            tipo_inversor).
es_un(capital_social,       activo_digital).
es_un(mentalidad_productiva, psicologia_exito).

es_un(viral,                fenomeno_online).
es_un(algorithm,            sistema_digital).
es_un(shadow_ban,           restriccion_digital).
es_un(engagement,           metrica_digital).
es_un(reach,                metrica_digital).
es_un(impressions,          metrica_digital).
es_un(clickbait,            tactica_marketing).
es_un(fenomeno_online,      cultura_internet).
es_un(metrica_digital,      analisis_digital).
es_un(tactica_marketing,    estrategia_digital).

es_un(shipping,             comportamiento_fandom).
es_un(headcanon,            concepto_fandom).
es_un(fan_fiction,          contenido_fandom).
es_un(fanart,               contenido_fandom).
es_un(slash,                genero_ficcion).
es_un(comportamiento_fandom, cultura_fandom).
es_un(contenido_fandom,     produccion_creativa).

es_un(pwn,                  resultado_gaming).
es_un(noob,                 tipo_jugador).
es_un(griefing,             comportamiento_toxico_gaming).
es_un(gank,                 tactica_gaming).
es_un(camping,              estrategia_gaming).
es_un(throw,                error_gaming).
es_un(carry,                rendimiento_gaming).
es_un(clutch,               momento_Gaming).
es_un(resultado_gaming,     evento_gaming).
es_un(comportamiento_toxico_gaming, comportamiento_gaming).

es_un(outrage_culture,      fenomeno_social).
es_un(call_out_culture,     practica_social).
es_un(virtue_signaling,     comportamiento_social).
es_un(performative_activism, activismo_falso).
es_un(piling_on,            acoso_colectivo).
es_un(fenomeno_social,      dinamica_societal).
es_un(practica_social,      comportamiento_colectivo).

es_un(orbiting,             tactica_romance).
es_un(benching,             comportamiento_romantico).
es_un(stashing,             ocultamiento_relacion).
es_un(breadcrumbing,        manipulacion_romance).
es_un(roaching,             infidelidad_encubierta).
es_un(tactica_romance,      comportamiento_toxico_romance).
es_un(comportamiento_toxico_romance, comportamiento_negativo).

es_un(deep_fried,           tipo_meme).
es_un(loss,                 meme_referencial).
es_un(surrogate,            tecnica_meme).
es_un(shitpost,             tipo_post).
es_un(dank_meme,            tipo_meme_avanzado).
es_un(tipo_meme,            meme).
es_un(tipo_meme_avanzado,   meme).

es_un(authentic_self,       identidad_digital).
es_un(persona,              identidad_digital).
es_un(catfishing,           engano_digital).
es_un(fake_news,            desinformacion).
es_un(identidad_digital,    presencia_online).

es_un(content_creator,      profesion_digital).
es_un(influencer,           profesion_digital).
es_un(blue_pilled,          estado_politico).
es_un(black_pilled,         estado_politico).
es_un(profesion_digital,    carrera_internet).

es_un(scalp,                practica_compra).
es_un(reseller,             tipo_comerciante).
es_un(drop,                 evento_comercial).
es_un(hypebeast,            tipo_comprador).
es_un(practica_compra,      comportamiento_comprador).


%  ========== MÁS PROPIEDADES ==========

tiene(brainrot,             exposicion_constante_contenido).
tiene(brainrot,             deterioro_atencion).
tiene(brainrot,             adiccion_memes).

tiene(viral,                rapidez_propagacion).
tiene(viral,                alcance_masivo).
tiene(viral,                impacto_cultural).

tiene(influencer,           seguidores_numerosos).
tiene(influencer,           capacidad_monetizacion).
tiene(influencer,           poder_persuasion).

tiene(sigma,                independencia_total).
tiene(sigma,                rechazo_jerarquia).

tiene(incel,                resentimiento_womens).
tiene(incel,                victimizacion).
tiene(incel,                misoginia_frecuente).

tiene(gaming,               competitividad).
tiene(gaming,               estrategia_mental).
tiene(gaming,               coordinacion_equipo).

tiene(grift,                intento_engano).
tiene(grift,                beneficio_personal).
tiene(grift,                falta_transparencia).

tiene(alt_account,          anonimato_relativo).
tiene(alt_account,          libertad_expresion).
tiene(alt_account,          posibilidad_abusos).

tiene(fandom,               pasion_contenido).
tiene(fandom,               creatividad_community).
tiene(fandom,               intesidad_dedicacion).

tiene(algorithm,            no_transparencia).
tiene(algorithm,            poder_decisional).
tiene(algorithm,            influencia_contenido).

tiene(cancel_culture,       poder_colectivo).
tiene(cancel_culture,       posible_injusticia).
tiene(cancel_culture,       castigo_social).


%  ========== MÁS SINONIMOS ==========

sinonimo(poggers,           pog).
sinonimo('OMEGALUL',          'OMEGALUL_laugh').
sinonimo(monkas,            monkas_nervous).
sinonimo(clout,             influencia_social).
sinonimo(hustle,            trabajo_duro).
sinonimo(grindset,          mentalidad_hustle).
sinonimo(content_creator,   creator).
sinonimo(influencer,        micro_influencer).
sinonimo(shipping,          rooting_for_couple).
sinonimo(fanart,            fan_drawing).
sinonimo(pwn,               dominar).
sinonimo(pwn,               destruir_enemy).
sinonimo(noob,              novato).
sinonimo(noob,              principiante).
sinonimo(gank,              ataque_coordinado).
sinonimo(carry,             llevar_equipo).
sinonimo(clutch,            momento_critico).
sinonimo(throw,             fracaso_critico).
sinonimo(virtue_signaling,  activismo_falso).
sinonimo(catfishing,        identidad_falsa).
sinonimo(fake_news,         noticias_falsas).
sinonimo(blue_pilled,       conformista).
sinonimo(black_pilled,      pesimista_extremo).
sinonimo(scalp,             comprar_revender).
sinonimo(reseller,          reventa_comercial).
sinonimo(hypebeast,         adicto_moda).
sinonimo(rarity,            articulo_escaso).
sinonimo(doxx,              revelar_identidad).
sinonimo(shill,             vendedor_deshonesto).
sinonimo(baiter,            provocador_online).
sinonimo(orbit,             orbiting).
sinonimo(stan,              seguidor_devoted).
sinonimo(meme,              contenido_conico).


%  ========== MÁS CONTEXTOS DE USO ==========

contexto_uso(poggers,           'Twitch chat, reacciones a momentos increibles, entusiasmo gaming').
contexto_uso(monkas,            'Twitch chat, expresar nerviosismo antes de momento importante').
contexto_uso('OMEGALUL',          'Twitch chat, reacciones extremas a momentos comicos').
contexto_uso(gaming,            'Discord, Twitch, YouTube, Reddit comunidades gaming').
contexto_uso(clout,             'redes sociales, economia creador, influenciadores').
contexto_uso(hustle,            'motivational posts, entrepreneurship, sigma content').
contexto_uso(grindset,          'auto mejora, contenido motivacional, finanzas personales').
contexto_uso(viral,             'TikTok, Twitter, YouTube, cualquier red social').
contexto_uso(algorithm,         'critica de redes sociales, teoria conspiradora online').
contexto_uso(engagement,        'analisis de redes sociales, marketing digital').
contexto_uso(clickbait,         'YouTube, TikTok, articulos online').
contexto_uso(shipping,          'fandoms de series, peliculas, animes').
contexto_uso(fanart,            'DeviantArt, Twitter, comunidades fandom').
contexto_uso(fan_fiction,       'Archive of Our Own, Fanfiction.net, Wattpad').
contexto_uso(pwn,              'videojuegos competitivos, mensajes de victoria').
contexto_uso(griefing,          'servidores de juegos multijugador, reporte de infracciones').
contexto_uso(gank,              'MOBA games, videojuegos por equipo').
contexto_uso(carry,             'League of Legends, Dota 2, videojuegos competitivos').
contexto_uso(clutch,            'esports, momentos dramáticos finales de partidas').
contexto_uso(virtue_signaling,  'redes sociales, posts sobre causas sociales').
contexto_uso(shadow_ban,        'Twitter, Instagram, TikTok sobre restricciones').
contexto_uso(doxx,              '4chan, imageboard, ciberacoso').
contexto_uso(shill,             'criptomonedas, esquemas piramidales, estafas online').
contexto_uso(outrage_culture,   'redes sociales, campañas de cancelacion colectiva').
contexto_uso(gatekeeping,       'comunidades fandom, juegos, musica, cultura nerd').
contexto_uso(orbiting,          'redes sociales, relaciones romanticas falidas').
contexto_uso(benching,          'aplicaciones citas, relaciones casuales').
contexto_uso(breadcrumbing,     'mensajeria privada, relaciones ambiguas').
contexto_uso(alt_account,       'Twitter, Reddit, cualquier plataforma anonima').
contexto_uso(content_creator,   'YouTube, Twitch, TikTok, Instagram').
contexto_uso(drop,              'Fashion, coleccionables, videojuegos limitados').
contexto_uso(scalp,             'Nike drops, PlayStation 5, items limitados').
contexto_uso(hypebeast,         'Instagram, TikTok, comunidades fashion').
contexto_uso(blue_pilled,       'debates politicos conservadores vs progresista').
contexto_uso(black_pilled,      'incel communities, extremismo online').
contexto_uso(catfishing,        'aplicaciones de citas, Facebook, Instagram').
contexto_uso(deep_fried,        'memes avanzados, comunidades memeing').
contexto_uso(shitpost,          '4chan, Reddit, Twitter, cualquier red social').
contexto_uso(dank_meme,         'Reddit, Instagram meme accounts, comunidades meme').


%  ========== MÁS CONCEPTOS OPUESTOS ==========

contrario(creator,         lurker).
contrario(lurker,          creator).
contrario(authentic_self,  persona_falsa).
contrario(persona_falsa,   authentic_self).
contrario(viral,           obscuro).
contrario(influencer,      desconocido).
contrario(hustle,          procrastinacion).
contrario(hodl,            panic_sell).
contrario(chad,            simp).
contrario(simp,            chad).
contrario(noob,            pro_player).
contrario(pro_player,      noob).
contrario(carry,           feeder).
contrario(throw,           clutch).
contrario(virtue_signaling, genuine_activism).
contrario(fake_news,       fact_checked).
contrario(catfishing,      authentic_meeting).
contrario(hypebeast,       minimalist).
contrario(scalp,           fair_price).
contrario(outrage,         understanding).

