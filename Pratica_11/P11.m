%% Laboratório de Sistemas Dinâicos
% Pratica 11
% 22/08/2024
% Autores: Victor Hugo Daia Lorenzato e Whilker Henrique Santos Silva

%% Limpar workspcade
close all;
clear;
clc;

%% Exercício 1

data = load('ensaio_prbs.txt');
time = data (:, 1);
input = data (:, 2);
output = data (:, 3);

[acf, lags] = xcorr(output, 'coeff');

positive_lags = lags(lags > 0);
positive_acf = acf(lags > 0);

[min_acf, min_idx] = min(positive_acf);
lag_value = positive_lags(min_idx);

if lag_value >= 5 && lag_value <= 25
    disp('Período de amostragem adequado.');
else
    disp('Período de amostragem não adequado. Realizando decimação...');
   
    desired_lag = 15;  
    factor = ceil(lag_value / desired_lag);

    new_length = ceil(length(time) / factor);
    
    time_dec = interp1(1:length(time), time, linspace(1, length(time), new_length));
    input_dec = interp1(1:length(input), input, linspace(1, length(input), new_length));
    output_dec = interp1(1:length(output), output, linspace(1, length(output), new_length));
    
    disp(['Fator de decimação aplicado: ', num2str(factor)]);
    disp(['Novo número de pontos: ', num2str(length(time_dec))]);
end

N = length(output);

na = 2;  
nb = 2; 
nk = 1;  

Phi = zeros(N-max(na, nb+nk-1), na + nb);
for i = 1:na
    Phi(:, i) = -output(max(na, nb+nk-1) + 1 - i : N - i);
end
for j = 1:nb
    Phi(:, na + j) = input(max(na, nb+nk-1) + 1 - (j + nk - 1) : N - (j + nk - 1));
end

Y = output(max(na, nb+nk-1) + 1:N);

theta = Phi \ Y;

a = theta(1:na);
b = theta(na+1:end);

disp('Coeficientes do modelo ARX:');
disp('a:');
disp(a);
disp('b:');
disp(b);

output_pred = filter([0; b], [1; a], input);

time_adj = time(max(na, nb+nk-1) + 1:end);

figure;
plot(time_adj, output(max(na, nb+nk-1) + 1:end), 'b', 'DisplayName', 'Saída Real');
hold on;
plot(time_adj, output_pred(max(na, nb+nk-1) + 1:end), 'r--', 'DisplayName', 'Saída Estimada');
legend;
xlabel('Tempo');
ylabel('Saída');
title('Comparação entre Saída Real e Saída Estimada');
grid on;

a = [-1.3172; 0.3711];
b = [0.0509; 4.3421];

output_pred_sim = filter([0; b], [1; a], input);

error = output(max(na, nb+nk-1) + 1:end) - output_pred_sim(max(na, nb+nk-1) + 1:end);

EMQ = mean(error.^2);

disp(['Erro Médio Quadrático (EMQ) em Simulação Livre: ', num2str(EMQ)]);

figure;
plot(time_adj, output(max(na, nb+nk-1) + 1:end), 'b', 'DisplayName', 'Saída Real');
hold on;
plot(time_adj, output_pred_sim(max(na, nb+nk-1) + 1:end), 'r--', 'DisplayName', 'Saída Estimada');
legend;
xlabel('Tempo');
ylabel('Saída');
title('Comparação entre Saída Real e Saída Estimada');
grid on;
