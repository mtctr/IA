function secGoal = GA(posx, posy, mainGoal, sonars)
%definicao de constantes
crossoverRate = 0.7;
mutationRate = 0.001;
mutation = 0.5;
popSize = 30;
generations = 30;
radius = .5;

%gerar populacao e prox geracao
pop = genPop(radius,posx,posy,popSize);
nextGen = zeros(popSize,2);
menorDist = zeros(popSize,1);
bestGuy = zeros(popSize,1);

for i=1:generations
    
    %fitness
    fitnessValue = fitness(pop,posx,posy, mainGoal, sonars);
    popCross = floor(popSize*crossoverRate);
    for j = 1:popCross
        
        %seleçao por roleta
        [y1 y2] = tournament(pop, popSize, fitnessValue);
        
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
    
    [menorDist(i),bestGuy(i)] = max(fitnessValue);
end
menorDist(popSize); %Melhor fitness
bestGuy(popSize);   %Indice do sujeito de melhor fitness


secGoal =  pop(bestGuy(popSize),:);
end