function finalRad = PU2_bin(obj)

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
   
   c = strcat('mov(',num2str(sf),',', num2str(sd),',', num2str(se),',RD,RE).');
   x = org.jpl7.Query(c);
   r = x.allSolutions;
   w = r(1).values.toArray; 
   re = w(1).toString;
   rd = w(2).toString;
   rd = str2double(rd);
   re = str2double(re);
   
   SetDriveWheelsCreate(obj,rd,re);
    
   pause(0.1);
    
end
