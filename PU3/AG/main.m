clear
clc
n = 100;
%Gerando a sequencia inicial
X = -5 + 10*rand(n,2);
%Avaliando os indiv�duos
F = f(X(:,1), X(:,2));
%Apresnentando os cromossomos e a fen�tipoo gen�tipo e fen�tipo
pop = [F X funcao(X(:,1),X(:,2))];
%Ordenando as solu��es
sortPop = sortrows(pop);

y = vpa(sort(roleta(F)*100));
