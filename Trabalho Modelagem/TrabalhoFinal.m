%% Trabalho Final Modelagem de sistemas dinâmicos

% Victor Hugo Daia Lorenzato - 202210739
% Whilker Henrique Dos Santos Silva - 202020597

%% Limpar Workspace

close all;
clear;
clc;
warning off;

%% Gerar Arquivos de Entrada

% Gerar entrada do tipo degrau
n_amostras = 3000;
degrau = ones(1,n_amostras);

fileID = fopen('degrau.txt','w');
fprintf(fileID,'%6.2f \n',degrau);
fclose(fileID);

% Gerar entrada PRBS
prbs = idinput(n_amostras,'prbs',[0 1],[0 1]);

fileID = fopen('prbs.txt','w');
fprintf(fileID,'%6.2f \n',prbs);
fclose(fileID);

%% Ler dados do Labview

dados_degrau = load('resposta_ao_degrau.txt');
dados_prbs = load('resposta_ao_prbs.txt');

tempo_degrau = dados_degrau(:,1);
entrada_degrau = dados_degrau(:,2);
resposta_degrau = dados_degrau(:,3);

tempo_prbs = dados_prbs (:,1);
entrada_prbs = dados_prbs (:,2);
resposta_prbs = dados_prbs (:,3);


plot(tempo_degrau, resposta_degrau);
title("Resposta ao degrau");
xlabel("Tempo(s)");
ylabel("Tensão (V)");
grid("on");

figure();
plot(tempo_prbs, resposta_prbs);
title("Resposta ao PRBS");
xlabel("Tempo(s)");
ylabel("Tensão (V)");
grid("on");


%% Cálculo Do Ganho

dy = mean(resposta_degrau(end-50:end));
du = mean(entrada_degrau(end-50:end));
k = dy/du;

%% Método das integrais

dados_normalizados =resposta_degrau/k;
A1 = trapz(tempo_degrau,entrada_degrau - dados_normalizados);

indice = find(tempo_degrau >= A1, 1, 'first' );
A2 = trapz(tempo_degrau(1:indice),dados_normalizados(1:indice));

tau = A2*exp(1);
theta = A1 - tau;

s = tf('s');
Hs_a = (k*exp(-theta*s))/(tau*s+1);
y = step(Hs_a,tempo_degrau);

plot(tempo_degrau, y);

%% Parte 2- Métodos não-paramétricos

% Exercício 1)- a)

dados_prbs = load('resposta_ao_prbs.txt');

u = dados_prbs(:,2);
y = dados_prbs(:,3);
t = dados_prbs(:,1);

figure;
autocorr(u);

% Análise:
% A correlação no lag 0 é sempre 1, pois a série temporal está
% perfeitamente correlacionada consigo mesma sem defasagem. Os valores das
% autocorrelações para lags diferente de 0 estão muito próximos de zero, o
% que indica que não há correlação significativa entre os valores da série
% temporal. Os pontos da FAC estão dentro dos limites de confiança.

%% Exercício 1)- b)

dados_prbs = load('resposta_ao_prbs.txt');

u = dados_prbs(:,2);
y = dados_prbs(:,3);
t = dados_prbs(:,1);

figure;
crosscorr(u,y,150);

%% Exercício 1)- c)

dados_prbs = load('resposta_ao_prbs.txt');

u = dados_prbs(:,2);
y = dados_prbs(:,3);
t = dados_prbs(:,1);

figure;
y = y(1:4:end);
autocorr(y,150);

%% Exercício 1)- d)

dados_prbs = load('resposta_ao_prbs.txt');

y = dados_prbs(:,3);
u = dados_prbs(:,2);
t = dados_prbs(:,1);

tamanho_u = length(u);

Matriz = zeros(tamanho_u/2, tamanho_u/2);

for i = 1:tamanho_u/2
    for j = 1:tamanho_u/2
        Matriz(i,j) = u(tamanho_u/2-j+i);
    end
end

H = inv(Matriz)*y(tamanho_u/2:end-1);

subplot(3,1,1);
plot(H);

y_fft = fft(y);
u_fft = fft(u);

h_jw = y_fft./u_fft;

fase = angle(h_jw);
fase = fase*180/pi;
ganho = abs(h_jw);

subplot(3,1,2);
plot(20*log10(ganho(1:end/2)));

subplot(3,1,3);
plot(fase(1:end/2));

