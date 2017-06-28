function [y1 y2] = roulette(pop, popsize, fitness)

slice = rand()*sum(fitness);
total = 0;
for i=1:popsize
    total = total + fitness(i);
    if(total >= slice);
        y1 = i;
        break
    end
end

slice = rand()*sum(fitness);
total = 0;
for i=1:popsize
    total = total + fitness(i);    
    if(total >= slice);
        y2 = i;
        break
    end
end

end
