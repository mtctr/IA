function y = toDouble(x1, mantissa)
s = x1(1);
y = bi2de(x1(2:end),'left-msb');
y = (1-s)*(y / mantissa);