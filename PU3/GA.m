function secGoal = GA(posx, posy, mainGoal)
%definicao de constantes
crossoverRate = 0.5;
mutationRate = 0.001;
mutation = 0.5;
popSize = 50;
generations = 50;
radius = 0.7;

%gerar populacao e prox geracao
pop = genPop(radius,posx,posy,popSize);
nextGen = zeros(popSize,2);

for i=1:generations
    
    %fitness
    fitnessValue = fitness(pop,posx,posy, mainGoal);
    popCross = floor(popSize*crossoverRate);
    for j = 1:popCross
        
        %seleçao por roleta
        [y1 y2] = roulette(pop, popSize, fitnessValue);
    
        %crossover
        cr = crossover(pop,y1,y2);
        
        %next gen
        nextGen(j,:) = cr;
    end
    
    %enviar pra prox geracao a populacao restante
    for j = popCross+1:popSize
        nextGen(j,:) = pop(j,:);
    end
    
    %mutacao
    mut = floor(mutationRate*popSize);
    for j = 1:mut
        m = randi(popSize);
        pop(m) = pop(m)+mutation;
    end
    
    %mudanca de geracao
    pop = nextGen;
    
end
    secGoal = [pop(y1,1) pop(y2,2)]
end