clear all; close all; clc;

%% Prática 1
% Felipe dos Anjos Rezende
% ES=96694

%% Roteiro
% I
A = [10 5 36 4 25; 65 21 30 22 80; 6 31 25 26 40; 10 2 64 22 11; 13 14 24 35 2];
B = [11 6 37 5 26; 66 22 31 23 81; 7 32 26 27 41; 11 3 65 23 12; 14 15 25 36 3];
C = A+B;
D = A-B;
E = A*B;
F = A/B;
G = A^2;
H = B^2;
I = A';
J = B';

A, B, C, D, E, F, G, H, I, J

% II
Zero = zeros(3);
Identidade = eye(3);
Aleatoria = randn(3);

Zero, Identidade, Aleatoria

% III
x = [0:0.1:6*pi];
y = sin(x);
figure();
plot(x,y);
title('Função Senoidal');
xlabel('Tempo');
ylabel('Sinal');

%% EXECICÍOS
% a)
t = [-10:0.1:10];
funcao = 10*sin(3*t);

% b)
ruido = randn(1,length(t));
onda = funcao + ruido;

% c)
figure();
plot(t,funcao,'g');
hold on
plot(t,onda,'r');
title('Função senoidal com e sem ruído');
xlabel('Tempo');
ylabel('Sinal');
hold off