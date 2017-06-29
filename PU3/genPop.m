%funcao para obter a populacao a partir dos pontos em um certo raio do robo
function pop = genPop(r,px,py,popSize)
    pop = 2*r+rand(popSize,2);
    pop(:,1) = round(pop(:,1)+px);
    pop(:,2) = round(pop(:,2)+py);
end

