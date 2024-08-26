%% Trabalho Final Modelagem de Sistemas Dinâmicos

% Alunos: Victor Hugo Daia Lorenzato - 202210739
%         Whilker Henrique dos Santos Silva - 202020597

% Data: 21/08/2024

%% Limpar Workspace

clear all
close all
clc
warning off

%% Importando dados do LabView

dados_degrau = load('test.lvm');
dados_prbs = load('ensaio_prbs.lvm');

%% Encontrando o ganho (K)

Ganho = mean(dados_degrau(end-50:end))

%% Parte 1 - Métodos Determinísticos

% Exercício 1)- a)




%% Exercício 1)- b)



%% Exercício 1)- c)



%% Exercício 2)-




%% Exercício 3)- 



%% Parte 2 - Métodos não-paramétricos

% Exercício 1)- a)

% Encontrando a FAC
fac = xcorr(dados_prbs, 'biased');

% Calculando e exibindo valores
fac_max = max(fac);
fac_min = min(fac);
fac_zero = fac(length(dados_prbs));

% Plotando a FAC
figure;
plot(fac);
title('Função de Autocorrelação Cruzada (FAC)');
xlabel('Lags');
ylabel('Autocorrelação');

% Discutindo sobre as propriedades da FAC:
% O padrão formado é característico de uma sequência de entrada que
% alta correlação consigo mesma em diferentes lags. O pico central (lag=0)é
% o maior valor de autocorrelação. A FAC é simétrica em torno do lag zero.
% A medida que o lag se afasta do zero, a mesma mostra um declínio linear.


%% Exercício 1)- b)

% Encontrando a FCC
fcc = xcorr(dados_degrau,dados_prbs,'biased');

% Encontrar o lag correspondente ao valor máximo da FCC
[~,maxIdx] = max(fcc);
lags = -length(dados_degrau)+1:length(dados_prbs)-1;
tempo_morto = lags(maxIdx);

% Exibir tempo morto
fprintf('Tempo morto do sistema: %d samples\n', tempo_morto);

% Plotar a FCC
figure;
plot(lags, fcc);
title('Função de Correlação Cruzada (FCC)');
xlabel('Lags');
ylabel('Correlação Cruzada');
grid on;


%% Exercício 1)- c)



%% Exercício 1)- d)


%% Parte 3 - Modelos discretos ARX

% Exercício 1)- a)



%% Exercício 1)- b)


%% Exercício 2)-