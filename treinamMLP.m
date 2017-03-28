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

bias = -1*ones(1,N);
Wx = rand(NN+1, Np+1); %Pesos da camada esconida
Wy = rand(m,NN+1); %Pesos da camada de saída
WxOld = zeros(NN+1, Np+1);
WyOld = zeros(m, NN+1);

X = [bias; X];

for epoc = 1:maxEpoc    
  
    %Camada escondida   
    Z = 1./(1+exp(-Wx*X));    
       
    %Camada de saída 
    Y = 1./(1+exp(-Wy*Z));

    %Cálculo do erro
    E = D - Y;
    MSE = mean(mean(E.^2));

    %Testar se o erro está na faixa de tolerância

    if MSE< erroMax, break, end
    fprintf('Epoca Treinam. = %.0f MSE = %g\n\n', epoc, MSE);
    
    % **Ajuste dos pesos**
    % **Backpropagation**
    
    dY = Y.*(1-Y); %Derivada da função de ativação de saída
    deltay = dY.*E;
    
    %Ajuste dos pesos da camada de saída
    dWy = fa/N*deltay*(Z') + alpha*WyOld;
    WyOld = Wy;
    Wy = Wy + dWy;
   
    %Ajuste dos pesos da camada escondida
    dZ = Z.*(1-Z); %Derivada da função de ativação da cam. esc.
    dWx = fa/N*(dZ.*(Wy'*deltay))*X' + alpha*WxOld;
    WxOld = Wx;
    Wx = Wx + dWx;

end

save ('pesos.mat','Wx','Wy');
end