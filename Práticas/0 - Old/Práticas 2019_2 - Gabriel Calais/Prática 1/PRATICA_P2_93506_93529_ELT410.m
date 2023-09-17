%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Prática 2

x = 0:0.2:3;
y = exp(-x) + sin(x);
z = [x' y']
save('z.mat', 'z');
clear all;
load('z.mat');

%Senoide

w = 2*pi*1000;
t = 0:1e-6:(30/w);
x = -20*sin(w*t);
plot(t, x, 'r', 'linewidth', 1);
hold on;
y = 2*sin(w*t);
plot(t, y, 'b', 'linewidth', 1);
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Sinal de saída', 'Sinal de entrada');

%Exercício

%a
w = 3;
t = -10:1e-2:10;
x = 10*sin(w*t);

%b
ruido=randn(1, length(x));

%c
figure(1);
plot(t, x, 'r', 'linewidth', 2);
hold on;
plot(t, x+ruido, 'b', 'linewidth', 0.5);
title('Senoides com e sem ruído');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Sem ruído', 'Com ruído');