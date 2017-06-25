% A entrada tem que ser um numero binario
function y = mutacao(num, tx)
z = rand;
if z < tx
    n = length(num);
    m = 1+round(-0.5+rand*n);
    num(m) = not(num(m));
    y = num;
else
    y = num;
end