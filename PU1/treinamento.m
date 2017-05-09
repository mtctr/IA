% Exemplo de mapeamento da função XOR via RNA-MLP.

clear all;

% Dados da funcao XOR
%X = [0 0 1 1; 0 1 0 1]; D = [0 1 1 0];
%X = [0 0 1 1 0 1 0 1; 1 1 1 0 0 0 1 1];


%Dados dos sensores
%X = [D;F;E;T]
X = [4 1 1 1; 1 4 1 1; 1 1 4 1; 1 1 1 4];
D = [.2 .3 .4 -.2 ; .4 .3 .2 -.1];
D = D + .5;



NN = 10; % Número de neurônios.
erroMax = 1e-10; % Tolerância do erro.
fa = .75;
maxEpoc = 1370;
alpha = 2e-5;


  
treinamMLP(X,D, erroMax, maxEpoc, NN, fa, alpha); 

Y = MLP(X) - .5;

  