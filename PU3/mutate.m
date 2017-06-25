function mutate(chromo,mutrate)
s = size(chromo);

for i = 1:s
    if(rand() <= mutrate)
        swap(chromo[i]);
    end
end
           
end