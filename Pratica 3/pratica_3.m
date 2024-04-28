%% Laboratório de Sistemas Dinâicos
% Prática 03
% 01/04/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
clear;
close all;
clc;

%% Ex01 A

s = tf('s');
p = s^2 + 2*s + 1;
q = s + 1;

G = p*q;

printsys(G.num{1}, G.den{1});

%% Ex01 B

G = q/p;

fprintf('polo: %d\n',pole(G));
fprintf('zero: %d\n',zero(G));

%% Ex01 C

s = tf('s');

p = s^2+2*s+1;
q = s+1;

disp(evalfr(p,-1));

%% Ex01 D

G = q/p;
pzmap(G);

%% Ex02 A

s = tf('s');
C = 1/(s+1);
G = 1/(s+3);

T = series(C,G);
printsys(T.num{1},T.den{1});

%% Ex02 B

ltiview(T);

%% Ex02 C

t = 0:0.1:10;
c=step(C,t);
g=step(G,t);


plot(t,c,'r');
hold on;
plot(t,g,'b');
hold off;
legend('C(s)', 'G(s)');