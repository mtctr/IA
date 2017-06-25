function sigma = dmax(Vec)

tam = numel(Vec);
sigma = 0;
for i = 1:tam
    for j = 2:tam
        value = (abs(Vec(i)-Vec(j)));
        if value > sigma
            sigma = value;
        end
    end
end


end