%% Laboratório de Sistemas Dinâicos
% Prática 02
% 18/03/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
close all;
clear;
clc;

%% Ex01
syms a b c d;
M=[a b; c d];

determinante = det(M);
inversa = inv(M);
traco = trace(M);

% Exibe os resultados
disp('Determinante:');
disp(determinante);

disp('Inversa:');
disp(inversa);

disp('Traço:');
disp(traco);

%% Ex02 A

n = 0:10;
x_n = sym((-1).^n);

figure;
stem(x_n);
title('stem');

figure;
stairs(x_n);
title('stairs');

figure;
bar(x_n);
title('bar');

%% Ex02 B

n = 0:10;
x_n = sym(cos(pi.*n/12 + pi/4));

figure;
stem(x_n);
title('stem');

figure;
stairs(x_n);
title('stairs');

figure;
bar(x_n);
title('bar');

%% Ex03