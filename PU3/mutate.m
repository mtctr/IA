function mutate(pop,popsize,mutrate)

for i = 1:popsize
    if(rand() <= mutrate)
        pop(i,1) = pop(i,1) + .3;
        pop(i,2) = pop(i,2) + .3;
    end
end
           
end