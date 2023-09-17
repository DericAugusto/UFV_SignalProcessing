% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Thiago Mendes de Ávila e Joao Pedro Nunes Rossi

clc;
clear all;
close all;

%% Roteiro - parte 1

A=[1 2 3 4 5;6 7 8 9 10;11 12 13 14 15; 16 17 18 19 20; 21 22 23 24 25]
B=[26 27 28 29 30; 31 32 33 34 35; 36 37 38 39 40; 41 42 43 44 45; 46 47 48 49 50]
A/B
A+B
A-B
A*B
A.*B
A./B
A/B
A'
B'
A^2
B^2

rot90(A,2) %rotaciona a matriz em 90 graus
tril(A) % escalona a matriz em triangular inferior
triu(A) % transforma a matriz em triangular superior
flipud(A)% espelha a matriz
fliplr(A)%espelha a matriz
repmat(A,1,3)%repete os termos da matriz em linha x coluna

% FUNÇAO SENOIDAL
f = 3;
t=0:1e-3:3/f
x = 100*sin(2*pi*f*t);
figure(1);
plot(t,x,'b','linewidth',1);
title('Senóide')
legend('SENÓIDE')
xlabel('Tempo(s)')
ylabel('Amplitude')

%SENOIDE COM 6 CICLOS
f = 6;
t=0:1e-3:6/f
x = 100*sin(2*pi*f*t);
figure(2);
plot(t,x,'b','linewidth',1);
title('Senóide com 6 ciclos')
legend('SENÓIDE')
xlabel('Tempo(s)')
ylabel('Amplitude')


%RUIDO
z = 5*randn(1, length(x));
figure(3)
plot(t,x+z)
title('Senóide com ruído')
legend('SENÓIDE')
xlabel('Tempo(s)')
ylabel('Amplitude')

%% Exercicio 4:
w=3
t2=-10:1e-3:10;
k = 10*sin(w*t2);
figure(3);
plot(t2,k,'b','linewidth',1);
title('Senóide com w=3 rad/s')
legend('SENÓIDE')
xlabel('Tempo(s)')
ylabel('Amplitude')
%b) 

z = 1*randn(1, length(k));
figure(4)
plot(t2,k+z,'red','linewidth',1)

%c)
hold on
plot(t2,k+z,'red','linewidth',1)
plot(t2,k,'b','linewidth',1)
title('Comparação das 2 senóides')
xlabel('Tempo(s)')
ylabel('Amplitude')
legend('com ruido','sem ruido')
hold off

