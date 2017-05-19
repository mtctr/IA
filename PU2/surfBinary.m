
x=org.jpl7.Query('consult(''C:/Users/Mateus/Desktop/IA/PU2/PU2.pl'')');
x.hasSolution;

[X,Y] = meshgrid(linspace(-1,1,50), linspace(-1,1,50));

[n,m] = size(X);
Z = zeros(n,m);

for i=1:n
    for j=1:m
        s = ['valor(X,' num2str(X(i,j)) ',' num2str(Y(i,j)) ').'];
        x=org.jpl7.Query(s);
        a=x.allSolutions;
        Z(i,j)=str2double(a(1).values);
    end
end

surf(X,Y,Z);