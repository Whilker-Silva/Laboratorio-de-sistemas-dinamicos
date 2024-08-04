%% Laboratório de Sistemas Dinâicos
% Prática 06
% 08/07/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
close all;
clear;
clc;

%% Ex01 A

syms R C S;
G1_S = 1/(R*C*S + 1);

[num, den] = numden(G1_S);

fprintf("     %s    \n" + ...
        "-----------\n" + ...
            "%s\n"   ,num, den);

%% Ex01 B

r = 100;
c = 1*10^-6;
s = tf('s');

G1_S = 1/(r*c*s + 1);

printsys(G1_S.num{1}, G1_S.den{1});
step(G1_S);
grid('on');


%% Ex01 C

step(G1_S.num{1}, G1_S.den{1});
hold on;

r = 2*r;
G1_S = 1/(r*c*s + 1);

step(G1_S.num{1}, G1_S.den{1});

grid('on');
legend('R=100', 'R=200');
hold off;


%% Ex01 D

syms R C S;
G2_S = C*S/(R*C*S + 1);

[num, den] = numden(G2_S);
num = simplify(num);
den = simplify(den);

fprintf("    %s    \n" + ...
        "-----------\n" + ...
           " %s\n"   ,num, den);

%% Ex01 E

r = 100;
c = 1*10^-6;
s = tf('s');

G2_S = c*s/(r*c*s + 1);

step(G2_S.num{1}, G2_S.den{1});
grid('on');

%% Ex01 F


%% Ex01 G


%% Ex01 H

R = 100;
C = 1*10^-6;
Ve = 1;

A = -1/R*C;
B = 1/R*C;
C = [1; -1/R];
D = [0; 1/R];

sistema = ss(A, B, C, D);

%% Ex01 H

step(sistema);





