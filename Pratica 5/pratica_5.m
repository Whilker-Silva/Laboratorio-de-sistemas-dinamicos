%% Laboratório de Sistemas Dinâicos
% Prática 05
% 15/04/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
clear;
close all;
clc;

%% ex01 

num = [1];
den = [0.1 1];
bode(num,den);

%% ex02

num = [10];
den = [0.1 1];
bode(num,den);

%% ex03 

num = [1];
den = [0.1 1 0];
bode(num,den);

%% ex04

num = [1 0];
den = [0.1 1];
bode(num,den);

%% ex05 - a 

num = [2 2];
den = [1 2];
bode(num,den);

%% ex05 - b

num = [1];
den = [1 0.1 1];
bode(num,den);

%% ex05 - c 

num = [2 -2];
den = [1 2];
bode(num,den);

%% ex05 - d

num = [-2 2];
den = [1 2];
bode(num,den);

%% ex05 - e 

num = [-10 10];
den = conv([1 2],[1 5]);
bode(num,den);