%  ChatBot Prolog con Programacion Logica
%
%  Este archivo es el punto de entrada del chatbot.
%  Carga todos los módulos y bases de conocimiento.
% 

 
% Cargar módulos de utilidades
:- use_module(library(apply)).
 
% Cargamos el resto de modulo
:- [inference].      % Motor de inferencias 
:- [conversation].   % Flujo conversacional 
:- [utils].          % Utilidades de procesamiento de texto
:- [sinonimos].      % Aprendizaje de sinonimos    
:- [variaciones].    % Interpretacion de variaciones 
 
% Cargamos las bases de conocimiento
:- prolog_load_context(directory, SrcDir),
   directory_file_path(SrcDir, '..', RootDir),
   directory_file_path(RootDir, 'BasesConocimiento', KBDir),
   directory_file_path(KBDir, 'base_conocimiento_a.pl', KBA),
   directory_file_path(KBDir, 'base_conocimiento_b.pl', KBB),
   directory_file_path(KBDir, 'base_conocimiento_c.pl', KBC),
   directory_file_path(KBDir, 'base_conocimiento_d.pl', KBD),
   consult(KBA),                                            % Base Andrey (50+ hechos - Lenguajes)
   consult(KBB),                                            % Base Isaac (50+ hechos - Slang Internet)
   consult(KBC),                                            % Base de Chris (50+ hechos - UFC)
   consult(KBD).                                            % Base de Daniel (50+ hechos - Ciencias)
 
% El archivo carga automaticamente todos los modulos y
% bases de conocimiento cuando se abre en SWI-Prolog.