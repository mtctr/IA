function crossover(chromo, crossrate)
s = size(chromo)
cross = randi(s)
if(rand()< crossrate)
    for i = cross:s
        swap(chromo[i]);
    end
end
end