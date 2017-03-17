
% carga dos dados

vX1 = [0.00:0.25:10.00];
vYd = [2.000, 2.2197, 2.3811, 2.5136, 2.7310, 2.7827, 2.8327, 3.0351, 2.9551 ...
, 3.3973, 3.5117, 3.5909, 3.7345, 3.8419, 4.0952, 4.2879, 4.4000, 4.8764, 5.2843 ...
, 5.9241, 6.3302, 6.9608, 7.3044, 7.6791, 8.2819, 9.0139, 9.3387, 10.0420, 10.4000 ...
, 10.6437, 10.4786, 10.4928, 10.7082, 10.6233, 10.8862, 10.6830, 10.8393, 10.9186 ...
, 10.8814, 10.9979, 11.0000];

Np = 41;

NN = 3; % numero de neuronios
err_tol = 0.001; % valor de parada do erro

% inicalizacao aleatoria dos pesos e bias da rede
V11 = 2*rand-1;
V12 = 2*rand-1;
V13 = 2*rand-1;
B01 = 2*rand-1;
B02 = 2*rand-1;
B03 = 2*rand-1;
W11 = 2*rand-1;
W21 = 2*rand-1;
W31 = 2*rand-1;
B0 = 2*rand-1;

% valores de offset das entradas da rede neural
C1 = 1;
C2 = 1;

contdisp = 0;       % contador de visualizacao do erro
flagdisp = 100;     % dado de impressao do erro
max_epoc = 200;  % numero maximo de epocas
fa = 0.005;         % fator de aprendizado

for epoc = 1:max_epoc    % etapa de treinamento
  for n = 1:Np
    X1 = vX1(n); % padrao fornecido a rede
    Yd = vYd(n);
    
    % processamento dos dados da camada escondida
    Z1in = B01*C1 + V11*X1;
    Z2in = B02*C1 + V12*X1;
    Z3in = B03*C1 + V13*X1;
    
    % funcoes de ativacao da camada escondida
    Z1 = 2/(1 + exp(-2*Z1in)) - 1;
    Z2 = 2/(1 + exp(-2*Z2in)) - 1;
    Z3 = 2/(1 + exp(-2*Z3in)) - 1;
    
    % processamento dos dados da camada de saida
    O1 = B0*C2 + W11*Z1 + W21*Z2 + W31*Z3;
    Y = O1; % funcao de ativacao linear
    
    % treinamento por retropropagacao
    
    e = Yd - Y; % erro entre o valor desejado e a saida
    E(n) = e;
    
    % ajuste dos pesos da camada de saida    
    de = e;
    dW11 = fa*de*Z1;    dW21 = fa*de*Z2;    dW31 = fa*de*Z3;
    dB0 = fa*de;
    W11 = W11+dW11;     W21 = W21+dW21;     W31 = W31+dW31;
    B0 = B0+dB0;
    
    % ajuste dos pesos da camada escondida
    d = de*(W11+W21+W31);
    d1 = d*(1 - (2/(1+exp(-2*Z1in)) - 1)^2);
    d2 = d*(1 - (2/(1+exp(-2*Z2in)) - 1)^2);
    d3 = d*(1 - (2/(1+exp(-2*Z3in)) - 1)^2);
    
    dV11 = fa*d1*X1; dV12 = fa*d2*X1; dV13 = fa*d3*X1;
    dB01 = fa*d1; dB02 = fa*d2; dB03 = fa*d3;
    
    V11 = V11 + dV11; V12 = V12 + dV12; V13 = V13 + dV13;
    B01 = B01 + dB01; B02 = B02 + dB02; B03 = B03 + dB03;
    
  end
    
 SSE = (sum(sum(E.*E)))/2; % somatorio do erro
 
 % testar se o erro esta na faixa de tolerancia
 if SSE < err_tol, break, end
 contdisp = contdisp + 1;
 if contdisp >= flagdisp
  contdisp = 0;
  fprintf('Epoca Treinam. = %.0f    Som. Erro Quad. Treinam. = %g\n\n', epoc, SSE);
 end
end % final do treinamento

% imprimir numero de treinamento e erro obtido

fprintf('Epoca Treinam. = %.0f  Som.Erro Quad. = %g\n\n', epoc, SSE);

for n=1:Np % teste da rede treinada
  
  X1 = vX1(n);
  
  % processamento dos dados da camada escondida
  Z1in = B01*C1 + V11*X1;
  Z2in = B02*C1 + V12*X1;
  Z3in = B03*C1 + V13*X1;
  
  % funcoes de ativacao da camada escondida
  Z1 = 2/(1 + exp(-2*Z1in)) - 1;
  Z2 = 2/(1 + exp(-2*Z2in)) - 1;
  Z3 = 2/(1 + exp(-2*Z3in)) - 1;
  
  % processamento dos dados da camada de saida
  O1 = B0*C2 + W11*Z1 + W21*Z2 + W31*Z3;
  Y = O1; % funcao de ativacao linear
  VetYr(n) = Y;
  
end

% graficos dos dados de treinamento e do modelo neural obtido
plot(vX1, vYd, 'k.', vX1, VetYr, 'k+'); grid;
xlabel('x1'); ylabel('y: "+" = Dados Originais; "." = Valores do treinamento');
figure  

for n=1:Np % teste da rede treinada
    
  X1 = vX1(n);
  
  % processamento dos dados da camada escondida
  Z1in = B01*C1 + V11*X1; 
  Z2in = B02*C1 + V12*X1;
  Z3in = B03*C1 + V13*X1;
  
  % funcoes de ativacao da camada escondida
  Z1 = 2/(1 + exp(-2*Z1in)) - 1;
  Z2 = 2/(1 + exp(-2*Z2in)) - 1;
  Z3 = 2/(1 + exp(-2*Z3in)) - 1;
  
  % processamento dos dados da camada de saida
  O1 = B0*C2 + W11*Z1 + W21*Z2 + W31*Z3;
  Y = O1; % funcao de ativacao linear
  VetYr(n) = Y;
  
end

% graficos do dados originais e de valores estimados pela rede
plot(vX1, 'k.', vX1, VetYr, 'k'); grid;
xlabel('x1'); ylabel('y: "+" = Dados Originais; "." = Valores do estimados pela MLP');  
    