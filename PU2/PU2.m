function finalRad = PU2(obj)


a = readfis('fuzzy.fis');
while(1)
    %Sonar direito
    sd = ReadSonar(obj,1);
    if(isempty(sd))
        sd = 3;
    end
    
    %Sonar frontal
    sf = ReadSonar(obj,2);
    if(isempty(sf))
        sf = 3;
    end
    
    %Sonar esquerdo
    se = ReadSonar(obj,3);
    if(isempty(se))
        se = 3;
    end
   
   
   w = evalfis([sf sd se],a);
   
   SetDriveWheelsCreate(obj,w(1),w(2));

   pause(0.1);
    
end
