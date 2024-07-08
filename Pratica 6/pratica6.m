%% Laboratório de Sistemas Dinâicos
% Prática 06
% 08/07/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
close all;
clear;
clc;
%% Ex01 A

R = 100;
C = 1*10^-6;

s = tf('s');
G1_S = 1/(R*C*s + 1);


printsys(G1_S.num{1}, G1_S.den{1});

%% Ex01 B

step(G1_S);
hold on;

%% Ex01 C

R = 2*R;
G1_S = 1/(R*C*s + 1);
step(G1_S);
legend('R=100', 'R=200');