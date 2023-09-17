clear all; close all; clc;

%% Prática 3
% Felipe dos Anjos Rezende
% ES=96694

%% Exercício
% I

% i
h = [1 zeros(1,20) 0.5 zeros(1,10)]; % Primeiro impulso

figure; % Cria a figura de plotagem
stem(h); % Plota o primeiro impulso
title('Resposta');
ylabel('h[n]');

% ii
x = [0 1:10 ones(1,5)*5 zeros(1,10)]; % Segundo impulso

figure; % Cria a figura de plotagem
stem(x); % Plota o segundo impulso
title('Entrada');
ylabel('x[n]');

% iii
y = conv(x,h); % Convoluindo x com h

while length(h)<length(y); % Deixa h do tamanho de y, adicionando zeros
    h(length(h)+1) = 0;    
end

while length(x)<length(y); % Deixa x do tamanho de y, adicionando zeros
    x(length(x)+1) = 0;    
end

figure; % Cria a figura de plotagem
subplot(3,1,1); % Plotando primeiro impulso
stem(h);
title('Resposta ao impulso');
ylabel('h[n]');

subplot(3,1,2); % Plotando segundo impulso
stem(x);
title('Entrada no sistema');
ylabel('x[n]');

subplot(3,1,3); % Plotando a convolução
stem(y);
title('Saida no sistema');
ylabel('y[n]');
