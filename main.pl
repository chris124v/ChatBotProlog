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
:- consult('BasesConocimiento/base_conocimiento_a.pl').     % Base del Miembro 1 (50+ hechos - Lenguajes)
:- consult('BasesConocimiento/base_conocimiento_c.pl').     % Base del Miembro 2 (50+ hechos - UFC)
% :- consult('BasesConocimiento/base_conocimiento_d.pl').   % Base del Miembro 3 (50+ hechos - Por crear)
% :- consult('BasesConocimiento/base_conocimiento_i.pl').   % Base del Miembro 4 (50+ hechos - Por crear)
 
% Punto de entrada: ejecutar ?- inicio.
% El archivo carga automáticamente todos los módulos y
% bases de conocimiento cuando se abre en SWI-Prolog.