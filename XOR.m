% Exemplo de mapeamento da função XOR via RNA-MLP.

clear all;

% Dados da funcao XOR

X = [0 0 1 1; 0 1 0 1]; D = [0 1 1 0];

%Dados dos sensores

%X = [3 2 3 3; 3 3 2 3; 3 3 3 2]; 
%D = [0.5 -0.5 0.5 0.2; 0.5 0.5 0.2 -0.5];


NN = 4; % Número de neurônios.
erroMax = 1e-20; % Tolerância do erro.
fa = 0.75;
maxEpoc = 20000;
alpha = 1e-3;


  
treinamMLP(X,D, erroMax, maxEpoc, NN, fa, alpha); 

Y = MLP(X);

  