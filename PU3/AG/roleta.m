%Retorna os valores em porcentagem dos melhores individuos
function y = roleta(fitness)
soma = sum(fitness);
y = fitness / soma;
