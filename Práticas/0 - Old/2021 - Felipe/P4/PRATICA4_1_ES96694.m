clear all; close all; clc;

%% Prática 4
% Felipe dos Anjos Rezende
% ES=96694

%% Exercício
% I

% i
n = 0:19; % Cria o vetor n
x = @(n) n==0; % Função delta, assume valor unitário somente quando n é zero
a = [1 -0.6 -0.16]; % Constantes de x
b = [5 0 0 ]; % Constantes de y
h = filter(b,a,x(n)); % Filtra o vetor x a partir de a e b
subplot(3,1,1) % Figura com três linhas e uma coluna situado na linha 1
stem(n,h); 
title('Resposta da entrada n');

% ii
u =  @(n) n>=0; % Função degrau unitario
hu = filter(b,a,u(n)); % Resposta ao degrau unitario
subplot(3,1,2); % Figura com três linhas e uma coluna situado na linha 2
stem(n,hu);
title('Resposta da entrada u');

% iii
for i = n+1; % Função f
    f(i)=(sin(i)/(i)); 
end
hf = filter(b,a,f); % Resposta a função
subplot(3,1,3); % Figura com três linhas e uma coluna situado na linha 3
stem(n,hf);
title('Resposta da entrada f');