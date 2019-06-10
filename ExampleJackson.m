%Example of a Jackson's Network

clc; %Clears the console
P=[0 0 1; 0.5 0 0.5; 0 0.7 0];
gamma=[2 3 0];
servers=[1 2 -1];
mu=[10 15 2];
[ L, Lq, Ls, W, Wq, Ws ] = jacksonNetwork( gamma, P , servers, mu);