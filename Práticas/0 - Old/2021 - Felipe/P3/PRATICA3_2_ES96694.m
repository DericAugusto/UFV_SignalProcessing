clear all; close all; clc;

%% Pr�tica 3
% Felipe dos Anjos Rezende
% ES=96694

%% Exerc�cio
% II

load('trumpet.mat');
whos

% i

%audiowrite('trumpetoriginal.wav',y,Fs); % Criando arquivo de audio(por�m,
                                         % ocorreu um erro de permiss�o)
figure; % Cria a figura de plotagem
subplot(2,2,1); % Adiciona uma forma de onda
plot(y); % Sinal de entrada
title('Original');

h = [1 zeros(1,10000) 0.25 zeros(1,1000)]; % Primeiro impulso
y1 = conv(y,h); %Primeira convolu��o
%audiowrite('trumpetmodificado01.wav',y1,Fs);
subplot(2,2,2); % Adiciona uma forma de onda
plot(y1); % Primeira convolu��o
title('Primeira Convolu��o');

% ii
h1 = [1 zeros(1,10000) 0.5 zeros(1,1000)]; % Segundo impulso
y1 = conv(y,h1); % Segunda convolu��o
%audiowrite('trumpet02.wav',y1,Fs) 
subplot(2,2,3); % Adiciona uma forma de onda
plot(y1);% Segunda convolu��o
title(' Segunda Convolu��o')

% iii
h1 = [1 zeros(1,round(Fs/4)) 0.5 zeros(1,1000)]; % Terceiro impulso
y1 = conv(y,h1); % Terceira convolu��o
%audiowrite('trumpet03.wav',y1,Fs) 
subplot(2,2,4); % Adiciona uma forma de onda
plot(y1);% Terceira convolu��o
title(' Terceira Convolu��o');

%% II

h2 = [ones(1,50)/50 zeros(1,20)]; %  Resposta ao impulso
y2 = conv(y,h2); % Covolu�ao entre trumpet e h2
%audiowrite('trumpet04.wav',y2,Fs)
figure; % Cria a figura de plotagem
subplot(2,1,1); % Adiciona o sinal a figura
plot(y); % Plota a entrada
title('Entrada');
subplot(2,1,2); % Adiciona o sinal a figura
plot(y2); % Plota a sa�da
title('Sa�da');