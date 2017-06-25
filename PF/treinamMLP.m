function treinamMLP(X,D,erroMax, maxEpoc, NN, fa, alpha)
%Função que realiza o treinamento via Backpropagation
%Inputs: 
%   X = Matriz com os valores de entrada
%   D = Matriz com a saída desejada
%   erroMax = Tolerância máxima do erro
%   maxEpoc = Quantidade máxima de épocas
%   NN = Número de neurônios
%   fa = Fator de aprendizado
%   alpha = momentum

[Np N] = size(X);
[m n1] = size(D);

bias = -1;
Wx = rand(NN, Np); %Pesos da camada esconida
Wy = rand(m,NN); %Pesos da camada de saída
WxOld = zeros(NN, Np);
WyOld = zeros(m, NN);

for epoc = 1:maxEpoc    
    
    
    %Camada escondida
    z = bias+Wx*X;
  	Z = 1./(1+exp(-z));     
 
    
    %Camada de saída
    y = bias+Wy*Z;
    Y = 1./(1+exp(-y));      

    
    %Cálculo do erro
    E = D - Y;
    MSE = mean(mean(E.^2));
    MSETot(epoc) = MSE;
    %Testar se o erro está na faixa de tolerância

    if MSE< erroMax, break, end
    fprintf('Epoca Treinam. = %.0f MSE = %g\n\n', epoc, MSE);
    
    % **Ajuste dos pesos**
    % **Backpropagation**
    
    dY = Y.*(1-Y); %Derivada da função de ativação de saída
    deltay = dY.*E;   
    
    %Ajuste dos pesos da camada de saída
    dWy = fa*deltay*(Z') + alpha*WyOld ;
    WyOld = Wy;
    Wy = Wy + dWy;
   
    %Ajuste dos pesos da camada escondida
    dZ = Z.*(1-Z); %Derivada da função de ativação da cam. esc. 
    deltax = dZ.*(Wy'*deltay); 
    
    dWx = fa*deltax*X' + alpha*WxOld;
    WxOld = Wx;
    Wx = Wx + dWx;
    
    

end

semilogy(MSETot);
save ('pesos.mat','Wx','Wy');

end