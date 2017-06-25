clc;
close all;
clear all;


X = reshape(I,size(I,1)*size(I,2),3);

coeff = pca(X);

Itransformed = X*coeff;

Ipc1 = reshape(Itransformed(:,1),size(I,1),size(I,2));
%Ipc2 = reshape(Itransformed(:,2),size(I,1),size(I,2));
%Ipc3 = reshape(Itransformed(:,3),size(I,1),size(I,2));

%c = kmeans(Ipc1(:), 2);
%p = reshape(c, size(Ipc1));

%imshow(Ipc1,[]);

%net1 = newrbe(Ipc1, [0 0 1]);

I = Ipc1;
%imshow(I,[]);
net = newpnn(I,[0 1]);

