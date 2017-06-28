function finalRad = PU3(HAL9000)

mainGoal = [0.000 0.000];


while(1)
    
    s = HAL9000.genSonar();
    SONARS = [s(2); s(1); s(4)];
    
    %mostrar por onde o robo andou
    [x y th] = OverheadLocalizationCreate(HAL9000);
    plot(x,y,'.')    
    
    secGoal = GA(x, y, mainGoal);
    plot(secGoal(1),secGoal(2),'r.-');
    
    dy = secGoal(2)-y;
    dx = secGoal(1)-x;
    tang = dy/dx;
    
    
    if sqrt((dx)^2+(dy)^2) > 0.5
        plot(secGoal(1),secGoal(2),'r.-');
        
        if atan(tang) > 0 && dy>= 0            
            rot = th - atan(tang);
            HAL9000.turnAngle(0.2, -rot*180/pi);
            HAL9000.travelDist(0.5,0.4);
            
        elseif atan(tang) < 0 && (dy) >= 0            
            rot = 3.14 + atan(tang) - th;
            HAL9000.turnAngle(0.2, rot*180/pi);
            HAL9000.travelDist(0.5,0.4);
            
        elseif atan(tang) > 0 && (dy) < 0        
            rot = -3.14 - th + atan(tang);
            HAL9000.turnAngle(0.2, +rot*180/pi);
            HAL9000.travelDist(0.5,0.4);
            
        elseif atan(tang) < 0 && (dy) < 0            
            rot = th - atan(tang);
            HAL9000.turnAngle(0.2, -rot*180/pi);
            HAL9000.travelDist(0.5,0.4);
            
        end
    end    
             
    pause(0.3);
 
        

end

end
