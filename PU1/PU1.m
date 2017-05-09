function finalRad = PU1(obj)

while(1)
    %Sonar direito
    sd = ReadSonar(obj,1);
    if(isempty(sd))
        sd = 1;
    end
    
    %Sonar frontal
    sf = ReadSonar(obj,2);
    if(isempty(sf))
        sf = 1;
    end
    
    %Sonar esquerdo
    se = ReadSonar(obj,3);
    if(isempty(se))
        se = 1;
    end
   
 
    X = [sd;sf;se;st];
    Y = MLP(X) - .5;
    
    
    SetDriveWheelsCreate(obj,Y(1),Y(2));
    
   pause(1);
    
end
