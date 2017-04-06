% Exemplo de mapeamento da função XOR via RNA-MLP.

clear all;

% Dados da funcao XOR
%X = [0 0 1 1; 0 1 0 1]; D = [0 1 1 0];
%X = [0 0 1 1 0 1 0 1; 1 1 1 0 0 0 1 1];


%Dados dos sensores
%X = [D;F;E;T]
X = [2 3 3 3 3 2; 3 2 3 3 3 2; 3 3 2 3 3 2; 3 3 3 1 3 3]; 
D = [.2 .35 .15 .1 .5 -.3; .15 .05 .2 .3 .5 .1];
D = D + .5;



NN = 10; % Número de neurônios.
erroMax = 1e-10; % Tolerância do erro.
fa = .75;
maxEpoc = 20000;
alpha = 2e-5;


  
treinamMLP(X,D, erroMax, maxEpoc, NN, fa, alpha); 

Y = MLP(X) - .5;

  