%calculo da aptidao usando distancia euclidiana
function fit = fitness(pop, posx, posy, mainGoal)
fit = sqrt((mainGoal(1) - pop).^2+(mainGoal(2)-pop).^2);
fit = [flip(fit(:,1)) flip(fit(:,2))];
end



