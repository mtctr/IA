function [Y] = MLP(X)
load pesos.mat;

[p N] = size(X);
bias = -1*ones(1,N);

X = [bias;X];

%Camada escondida   
Z = 1./(1+exp(-Wx*X));    

%Camada de saída 
Y = 1./(1+exp(-Wy*Z));

end
