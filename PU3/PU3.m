function finalRad = PU3(HAL9000)

mainGoal = [4.000 3.000];


while(1)
    
    s = HAL9000.genSonar();
    
    if(isempty(s(2)))
        s(2) = 3;
    end
    
    if(isempty(s(1)))
        s(1) = 3;
    end
    
    if(isempty(s(4)))
        s(4) = 3;
    end
    
    SONARS = [s(2); s(1); s(4)];
    %mostrar por onde o robo andou
    [x y th] = OverheadLocalizationCreate(HAL9000);
    plot(x,y,'*')    
    
    secGoal = GA(x, y, mainGoal, SONARS);
    
    
    dy = secGoal(2)-y;
    dx = secGoal(1)-x;
    tang = dy/dx;
    d = sqrt((dx)^2+(dy)^2);
    
    
    if d > 0.5
        plot(secGoal(1),secGoal(2),'r.');
        d = 0.3;
        if atan(tang) > 0 && dy>= 0            
            rot = th - atan(tang);
            HAL9000.turnAngle(0.2, -rot*180/pi);
            HAL9000.travelDist(0.5,d);
            
        elseif atan(tang) < 0 && (dy) >= 0            
            rot = 3.14 + atan(tang) - th;
            HAL9000.turnAngle(0.2, rot*180/pi);
            HAL9000.travelDist(0.5,d);
            
        elseif atan(tang) > 0 && (dy) < 0        
            rot = -3.14 - th + atan(tang);
            HAL9000.turnAngle(0.2, +rot*180/pi);
            HAL9000.travelDist(0.5,d);
            
        elseif atan(tang) < 0 && (dy) < 0            
            rot = th - atan(tang);
            HAL9000.turnAngle(0.2, -rot*180/pi);
            HAL9000.travelDist(0.5,d);
            
        end
    
    end    
   
    if sqrt((mainGoal(1)- x)^2+(mainGoal(2)- y)^2)< 1
        break
    end
    pause(0.1);
 
        

end

end
