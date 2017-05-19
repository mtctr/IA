function finalRad = PU2_bin(HAL9000)

%leitura das regras binarias
x=org.jpl7.Query('consult(''C:/Users/Mateus/Desktop/IA/PU2/PU2.pl'')');
x.hasSolution;

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
   
   %execuçao das regras 
   c = strcat('mov(',num2str(sf),',', num2str(sd),',', num2str(se),',RD,RE).');
   x = org.jpl7.Query(c);
   r = x.allSolutions;
   %conversao dos valores de java para matlab e string
   w = r(1).values.toArray; 
   re = w(1).toString;
   rd = w(2).toString;
   %conversao para double
   rd = str2double(rd);
   re = str2double(re);
   
   %movimentaçao do robo
   SetDriveWheelsCreate(HAL9000,rd,re);
   %mostrar por onde o robo andou
   [x y] = OverheadLocalizationCreate(HAL9000);
   plot(x,y,'.')
       
   pause(0.3);
    
end
