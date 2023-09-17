clear all; close all; clc;

%% Pr�tica 4
% Felipe dos Anjos Rezende
% ES=96694

%% Exerc�cio
% II

n = 0:19; % Cria o vetor n
x = @(n) n==0; % Fun��o delta, assume valor unit�rio somente quando n � zero
a = [1 -0.6 -0.16]; % Constantes de x
b = [5 0 0 ]; % Constantes de y
h = filter(b,a,x(n)); % Filtra o vetor x a partir de a e b

for i = n+1; % Fun��o f
    f(i)=(sin(i)/(i)); 
end

%Calculo do tempo de processamento cada fun��o
tic % Contagem se inicia
convolucao1 = Convolucao(f,h);                   
t1 = toc; % Contagem termina
tic % Contagem se inicia
convolucao2 = conv(f,h);                          
t2 = toc; % Contagem termina
fprintf('Tempo para processamento da fun��o criada: %is', t1);
fprintf('\nTempo para processamento da fun��o existente: %is\n', t2);