%% Laboratório de Sistemas Dinâicos
% Prática 01
% 11/03/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
clear all;
close all;
clc;

%% ex01 a

A=[1 1 6;5 -2 1;8 2 -3];
B=[2 9;-5 -1;9 2];

tamA =size(A);

if tamA(1,1) == tamA(1,2)
    disp('A matriz A é quadrada');
else
    disp('A matriz A não é quadrada');
end

tamB =size(B);

if tamB(1,1) == tamB(1,2)
    disp('A matriz B é quadrada');
else
    disp('A matriz B não é quadrada');
end

%% ex01 b

for i = 1:tamA(1,1)
    for j = 1:tamA(1,2)
        if A(i,j) == 2
            fprintf('posicao A %d,%d\n',i,j);
        end
    end
end

for i = 1:tamB(1,1)
    for j = 1:tamB(1,2)
        if B(i,j) == 2
            fprintf('posicao B %d,%d\n',i,j);
        end
    end
end

%% ex01 c

for i = 1:tamA(1,1)
    for j = 1:tamA(1,2)
        if A(i,j) < 0
            fprintf('posicao A %d,%d\n',i,j);
        end
    end
end

for i = 1:tamB(1,1)
    for j = 1:tamB(1,2)
        if B(i,j) < 0
            fprintf('posicao B %d,%d\n',i,j);
        end
    end
end

%% ex02

%% ex03

t = 0:0.3:100;
x = cos(t).* sin(20*t);
 
plot(t,x);

%% ex04

[R,P,K]=residue([6 6],[1, 4.59 0.5798 0]);


