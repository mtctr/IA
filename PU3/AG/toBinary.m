function y = toBinary(x1, mantissa)
x1 = floor(mantissa*x1);
y = [(1-sign(x1))/2 de2bi(abs(x1),'left-msb')];