%  ChatBot Prolog con Programacion Logica
%
%  Este archivo es el punto de entrada del chatbot.
%  Carga todos los módulos y bases de conocimiento.
%
%  Para iniciar: swipl src/main.pl y luego ?- inicio.
% =========================================================
 
% Cargar módulos de utilidades
:- use_module(library(apply)).
 
% Cargar módulos compartidos (iguales para todos)
:- [inference].      % Motor de inferencias (Sección 2.6)
:- [conversation].   % Flujo conversacional (Sección 2.7)
:- [utils].          % Utilidades de procesamiento de texto
:- [sinonimos].      % Aprendizaje de sinonimos    (Seccion 2.4)
 
% Cargar bases de conocimiento de cada miembro del grupo
:- prolog_load_context(directory, SrcDir),
   directory_file_path(SrcDir, '..', RootDir),
   directory_file_path(RootDir, 'BasesConocimiento', KBDir),
   directory_file_path(KBDir, 'base_conocimiento_a.pl', KBA),
   directory_file_path(KBDir, 'base_conocimiento_c.pl', KBC),
   directory_file_path(KBDir, 'base_conocimiento_d.pl', KBD),
   consult(KBA),                                            % Base del Miembro 1 (50+ hechos - Lenguajes)
   consult(KBC),                                            % Base del Miembro 2 (50+ hechos - UFC)
   consult(KBD).                                            % Base del Miembro 3 (50+ hechos - Ciencias)
% :- consult('BasesConocimiento/base_conocimiento_i.pl').   % Base del Miembro 4 (50+ hechos - Por crear)
 
% Punto de entrada: ejecutar ?- inicio.
% El archivo carga automaticamente todos los modulos y
% bases de conocimiento cuando se abre en SWI-Prolog.