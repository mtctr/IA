%{
%calculo da aptidao usando distancia euclidiana
function fit = fitness(pop, posx, posy, mainGoal)
fit = sqrt((mainGoal(1) - pop).^2+(mainGoal(2)-pop).^2);
fit = [flip(fit(:,1)) flip(fit(:,2))];
end
%}

function fit = fitness(pop, px, py,goal,sonars)
    %distancia euclidiana até o objetivo    
    fit = sqrt((goal(1)-pop(:,1)).^2+(goal(2)-pop(:,2)).^2);
    [vs,s] = max(sonars);
     
    d = sqrt((px + sonars(s) - pop(:,1)).^2 + (py+sonars(s)- pop(:,2)).^2);
    
    fit = fit + d.^2;
end

