%% UNIVERSIDADE FEDERAL DE VIÇOSA
%  ELT - 410 SINAIS E SISTEMAS
%  JOÃO PEDRO NUNES ROSSI 90102
%  THIAGO MENDES DE ÁVILA 93505

clc;
close all;
clear all;
%%
%PARTE 3
%ROTEIRO
%a)
h = [1 zeros(1,20) 0.5 zeros(1,10) zeros(1,25)]; % acresentou-se 25 zeros
figure(1);
subplot(3,1,1);
stem(h);% discretiza o sinal
title('Vetor ''h'' discretizado');
xlabel('Tempo(s)');
ylabel('Amplitude');

%b)
x = [0 1:10 ones(1,5)*5 zeros(1,10) zeros(1,31)]; %acresentou 31 zeros
subplot(3,1,2);
stem(x);
title('Vetor ''x'' discretizado');
xlabel('Tempo(s)');
ylabel('Amplitude');

%c)     
y = conv(x,h);
subplot(3,1,3); 
stem(y);
title('Convolução de ''h'' com ''x''');
xlabel('Tempo(s)');
ylabel('Amplitude');