%% Laboratório de Sistemas Dinâicos
% Prática 08
% 28/07/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
close all;
clear;
clc;

%% Exercício 1

% Carregar os dados do arquivo
data = load('ensaio_prbs.txt');
time = data(:, 1); % Coluna 1: tempo
input = data(:, 2); % Coluna 2: entrada
output = data(:, 3); % Coluna 3: saída

% a) Verificação do período de amostragem
% Calcular a Função de Autocorrelação (FAC) da saída
[acf, lags] = xcorr(output, 'coeff');

% Encontrar o primeiro mínimo da FAC para determinar o período de amostragem adequado
[min_acf, min_idx] = min(acf(lags > 0)); % Posição do mínimo

% Verificar se o mínimo está no intervalo adequado
lag_value = lags(min_idx);
if lag_value >= 5 && lag_value <= 25
    disp('Período de amostragem adequado.');
else
    disp('Período de amostragem não adequado. Realizando decimação...');
    % Decimação dos dados para ajustar o período de amostragem
    factor = floor(lag_value / 10); % Fator de decimação
    time = downsample(time, factor);
    input = downsample(input, factor);
    output = downsample(output, factor);
end

% b) Estimação dos parâmetros com MQ
% Modelos ARX
na1 = 1; nb1 = 1; nk1 = 1; % Modelo ARX(1,1)
na2 = 2; nb2 = 2; nk2 = 1; % Modelo ARX(2,2)

% Estimação dos parâmetros para o primeiro modelo ARX(1,1)
model1 = arx([output input], [na1 nb1 nk1]);

% Estimação dos parâmetros para o segundo modelo ARX(2,2)
model2 = arx([output input], [na2 nb2 nk2]);

% c) Comparação dos modelos
% Simulação livre para ambos os modelos
sim_output1 = sim(model1, input);
sim_output2 = sim(model2, input);

% Calcular o Erro Médio Quadrático (MSE) para ambos os modelos
mse1 = immse(output, sim_output1);
mse2 = immse(output, sim_output2);

% Exibir os resultados
disp(['MSE Modelo ARX(1,1): ', num2str(mse1)]);
disp(['MSE Modelo ARX(2,2): ', num2str(mse2)]);

% Comparar o desempenho dos modelos
if mse1 < mse2
    disp('O Modelo ARX(1,1) apresentou melhor desempenho.');
else
    disp('O Modelo ARX(2,2) apresentou melhor desempenho.');
end
