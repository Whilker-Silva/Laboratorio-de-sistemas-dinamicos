%%trabalho final modelagem

%% Limpar Workspace

clear all
close all
clc
warning off

%% Importando dados do LabView

dados_degrau = load('test.lvm');

%% Encontrando o ganho (K)

Ganho = mean(dados_degrau(end-50:end))