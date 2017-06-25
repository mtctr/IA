function x = getRandom(A)
[s1 s2] = size(A);

r1 = randi(s1);
r2 = randi(s2);

x = A(r1,r2);

end