function [y1 y2] = tournament(pop, popSize, fitness)
id = [randi(popSize) randi(popSize)];

if(fitness(id(1))>fitness(id(2)))
    y1 = id(1);
else
    y1 = id(2);
end
    
id = [randi(popSize) randi(popSize)];

if(fitness(id(1))>fitness(id(2)))
    y2 = id(1);
else
    y2 = id(2);
end
end