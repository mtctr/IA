function finalRad = PU2(HAL9000)

%leitura do arquivo com o sistema fuzzy
a = readfis('fuzzy.fis');
while(1)
    %Sonar direito
    sd = ReadSonar(HAL9000,1);
    if(isempty(sd))
        sd = 3;
    end
    
    %Sonar frontal
    sf = ReadSonar(HAL9000,2);
    if(isempty(sf))
        sf = 3;
    end
    
    %Sonar esquerdo
    se = ReadSonar(HAL9000,3);
    if(isempty(se))
        se = 3;
    end
   
   %execuçao do sistema
   w = evalfis([sf sd se],a);
   
   %movimentaçao do robo
   SetDriveWheelsCreate(HAL9000,w(1),w(2));
   
   %mostrar por onde o robo andou
   [x y] = OverheadLocalizationCreate(HAL9000);
   plot(x,y,'.')
   pause(0.3);
    
end
