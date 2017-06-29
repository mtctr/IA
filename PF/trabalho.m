clear
clc
%%Capturando a imagem
A = saturar('A.png', 200);
B = saturar('B.png', 100);
D = saturar('D.png', 0);
E = saturar('E.png', 50);

%suptitle('Padrões Treinados')
subplot(2,2,1); image(A)
subplot(2,2,2); image(B)
subplot(2,2,3); image(D)
subplot(2,2,4); image(E)


%Vetorização
for i=1:3
    Ar(:,i) = reshape(A(:,:,i),16*16,1);
    Br(:,i) = reshape(B(:,:,i),16*16,1);
    Dr(:,i) = reshape(D(:,:,i),16*16,1);
    Er(:,i) = reshape(E(:,:,i),16*16,1);
end

P1 = double([Ar(:,1) Br(:,1) Dr(:,1) Er(:,1)]);
P1 = [P1 P1(:,1) P1(:,3) P1(:,2) P1(:,4)];
P1 = [P1 P1(:,2) P1(:,3) P1(:,1) P1(:,4)];
P1 = [P1 P1(:,2) P1(:,4) P1(:,3) P1(:,1)];
P1 = [P1 P1(:,3) P1(:,2) P1(:,2) P1(:,1)];

T = [1 2 3 4 1 3 2 4 2 3 1 4 2 4 3 1 3 2 2 1];

net1 = redeNeural(P1,T);


%Simulação
P1 = double([Ar(:,1) Br(:,1) Dr(:,1) Er(:,1)]);
T = [1 3 2 4 2 1 3 4 2 1 1 2 3 3 3 4];
Pv = shuffle(P1, length(T), T);
Pv = Pv + 0.1*rand(256,16);
Tv = sim(net1, Pv);
[round(Tv); T; (round(Tv) - T)]'


    