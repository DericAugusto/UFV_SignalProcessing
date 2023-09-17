clear all; close all; clc;

%% Prática 4
% Felipe dos Anjos Rezende
% ES=96694

%% Exercício
% II

n = 0:19; % Cria o vetor n
x = @(n) n==0; % Função delta, assume valor unitário somente quando n é zero
a = [1 -0.6 -0.16]; % Constantes de x
b = [5 0 0 ]; % Constantes de y
h = filter(b,a,x(n)); % Filtra o vetor x a partir de a e b

for i = n+1; % Função f
    f(i)=(sin(i)/(i)); 
end

%Calculo do tempo de processamento cada função
tic % Contagem se inicia
convolucao1 = Convolucao(f,h);                   
t1 = toc; % Contagem termina
tic % Contagem se inicia
convolucao2 = conv(f,h);                          
t2 = toc; % Contagem termina
fprintf('Tempo para processamento da função criada: %is', t1);
fprintf('\nTempo para processamento da função existente: %is\n', t2);