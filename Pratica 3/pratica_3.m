%% Laboratório de Sistemas Dinâicos
% Prática 03
% 01/04/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
close all;
clear;
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

%% Ex02 D

s = tf('s');

rampa = 1/(s^2);

T = series(C,rampa);

t = 0:0.1:10;
R = impulse(T,t);

figure;
plot(t, R);
title('Resposta a rampa de C(s)');

%% Ex03 A

C = 1/(s+1);
G = (1/3)/(1/3*s + 1);

[Kc, Zc, Pc] = tfdata(C,'v');
[Kg, Zg, Pg] = tfdata(G,'v');


disp('Parâmetro C(s)');
fprintf('ganho: %f\n',Kc(2));
fprintf('constante de tempo: %f\n',-1/pole(C));
fprintf('tempo morto: %f\n',0);
fprintf('polo: %f\n',pole(C));
fprintf('zero: %f\n\n\n',zero(C));


disp('Parâmetro G(s)')
fprintf('ganho: %f\n',Kg(2));
fprintf('constante de tempo: %f\n',-1/pole(G));
fprintf('tempo morto: %f\n',0);
fprintf('polo: %f\n',pole(G));
fprintf('zero: %f\n',zero(C));

%% Ex03 B




