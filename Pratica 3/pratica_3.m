%% Laboratório de Sistemas Dinâicos
% Prática 03
% 01/04/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
clear;
close all;
clc;

%%  ex01
s = tf('s');

p = s^2 + 2*s + 1;
q = s + 1;

%% ex01 a

u = p*q;

printsys(u.num{1}, u.den{1});

%% ex02 b

G = q/p;

fprintf('polo: %d\n',pole(G));
fprintf('zero: %d\n',zero(G));

