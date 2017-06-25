function finalRad = PU3(HAL9000)

%definicao de constantes
crossoverRate = 0.7;
mutationRate = 0.001;
popSize = 50;
chromoLength = 300;
geneLength = 4;
randomNum = rand();


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
  
   
   %movimentaçao do robo
   SetDriveWheelsCreate(HAL9000,w(1),w(2));
   
   %mostrar por onde o robo andou
   [x y] = OverheadLocalizationCreate(HAL9000);
   plot(x,y,'.')
   pause(0.3);
    
end
