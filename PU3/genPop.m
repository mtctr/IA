%funcao para obter a populacao a partir dos pontos em um certo raio do robo
function pop = genPop(r,px,py,popSize)
    pop = -r+(2*r)*rand(popSize,2);
    pop(:,1) = round((pop(:,1)+px)*1000)/1000;
    pop(:,2) = round((pop(:,2)+py)*1000)/1000;
end

