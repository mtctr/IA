% Funcao a minimizar
function y = funcao(x1, x2)
y = x1.^2 - 2.*x1.*x2 + 6.*x1 + x2.^2 - 6.*x2;