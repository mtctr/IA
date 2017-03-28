% Exemplo de mapeamento da função XOR via RNA-MLP.

clear all;

% Dados da funcao XOR

X = [0 0 1 1; 0 1 0 1]; D = [0 1 1 0];

NN = 20; % Número de neurônios.
erroMax = 1e-20; % Tolerância do erro.
fa = 0.75;
maxEpoc = 20000;
alpha = 0.001;


  
treinamMLP(X,D, erroMax, maxEpoc, NN, fa, alpha); 

Y = MLP(X);
  
  