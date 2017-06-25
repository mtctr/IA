function Y = trainRBF(X, D, H)

[xs1 xs2] = size(X)
[ds1 ds2] = size(D)


%obter os centros
C = zeros(xs1, H);
for i = 1:xs1
    for j = 1:H
        C(i,j) = getRandom(X);
    end
end

sigma = dmax(reshape(C,1,[]));

G = zeros(xs2,H);

G = gaussmf(X,[sigma, C]);
  

W = pinv(G)*B';

Y = W*G;
end

