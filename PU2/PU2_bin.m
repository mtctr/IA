function finalRad = PU2_bin(obj)

%leitura das regras binarias
x=org.jpl7.Query('consult(''C:/Users/Mateus/Desktop/IA/PU2/PU2.pl'')');
x.hasSolution;

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
   SetDriveWheelsCreate(obj,rd,re);
    
   pause(0.1);
    
end
