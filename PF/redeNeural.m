function net = redeNeural( p, t )
%% Rede neural
% p = rand(9,1000);
% t = sum(p);

net = newff(p,t,20);
net.trainParam.epochs = 50;
net.trainParam.goal = 10^-4;
net = train(net,p,t);



end

