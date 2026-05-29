% =========================================================
%  ChatBot Prolog - ARCHIVO PRINCIPAL
%  Autor: [Nombres de los Miembros del Grupo]
%  Curso: Lenguajes de Programacion - IC 4700
%  Proyecto: Chatbot Inteligente con Programacion Logica
%
%  Este archivo es el punto de entrada del chatbot.
%  Carga todos los módulos y bases de conocimiento.
%
%  Para iniciar: swipl main.pl  luego  ?- inicio.
% =========================================================

% Cargar módulos de utilidades
:- use_module(library(apply)).

% Cargar módulos compartidos (iguales para todos)
:- [inference].      % Motor de inferencias (Sección 2.6)
:- [conversation].   % Flujo conversacional (Sección 2.7)
:- [utils].          % Utilidades de procesamiento de texto

% Cargar bases de conocimiento de cada miembro del grupo
:- prolog_load_context(directory, SrcDir),
   directory_file_path(SrcDir, '..', RootDir),
   directory_file_path(RootDir, 'BasesConocimiento', KBDir),
   directory_file_path(KBDir, 'base_conocimiento_a.pl', KBA),
   directory_file_path(KBDir, 'base_conocimiento_c.pl', KBC),
   directory_file_path(KBDir, 'base_conocimiento_d.pl', KBD),
   consult(KBA),   % Base Miembro 1 - Andrey      (Lenguajes de programacion)
   consult(KBC),   % Base Miembro 2 - Christopher  (UFC)
   consult(KBD).   % Base Miembro 3 - [Tu nombre]  (Ciencias, Geografia, Historia, Arte)
% :- consult('BasesConocimiento/base_conocimiento_i.pl').   % Base Miembro 4 (pendiente)

% Punto de entrada: ejecutar ?- inicio.
% El archivo carga automaticamente todos los modulos y
% bases de conocimiento cuando se abre en SWI-Prolog.