function finalRad = PU1(obj)

while(1)
    dd = ReadSonar(obj,1);
    if(isempty(dd))
        dd = 3;
    end
    df = ReadSonar(obj,2);
    if(isempty(df))
        df = 3;
    end
    de = ReadSonar(obj,3);
    if(isempty(de))
        de = 3;
    end
    
    X = [df;dd;de];
    Y = MLP(X);
    
    SetDriveWheelsCreate(obj,Y(1),Y(2));
    
    pause(1);
    
end
