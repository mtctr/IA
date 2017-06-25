function [Y] = MLP(X, pesos)
load pesos;

[p N] = size(X);
bias = -1;

%Camada escondida 
z = bias+Wx*X;
Z = 1./(1+exp(-z)); 


%Camada de saída
y = bias+Wy*Z;
Y = 1./(1+exp(-y));



end