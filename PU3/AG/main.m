clear
clc
n = 100;
%Gerando a sequencia inicial
X = -5 + 10*rand(n,2);
%Avaliando os indivíduos
F = f(X(:,1), X(:,2));
%Apresnentando os cromossomos e a fenótipoo genótipo e fenótipo
pop = [F X funcao(X(:,1),X(:,2))];
%Ordenando as soluções
sortPop = sortrows(pop);

y = vpa(sort(roleta(F)*100));
