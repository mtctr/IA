clc
clear all;

% Dados das imagens
X = rrg('2reais_resized.jpg');
D = rrg('target2.png');

X = edge(X,'Prewitt')
D = edge(D,'Prewitt');


NN = 12; % Número de neurônios.
erroMax = 1e-10; % Tolerância do erro.
fa = .75;
maxEpoc = 5000;
alpha = 2e-2;
 
treinamMLP(X, D, erroMax, maxEpoc, NN, fa, alpha); 
%X = rrg('teste.jpg');
Y = MLP(X, 'pesos.mat');

  