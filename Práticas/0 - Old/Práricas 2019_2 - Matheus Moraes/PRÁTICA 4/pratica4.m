%ELT 410 - SINAIS E SISTEMAS
%JOÂO PEDRO NUNES ROSSI E THIAGO MENDES DE ÁVILA
%PRATICA 4
clc;
clear all;
close all;
%%Parte 1%%%%%%%%%
%%1.1
%impulso
clear all;
close all;
n = 0:19;
x = @(n) n==0;
a = [1 -0.6 -0.16];
b = [5 0 0 ];
h = filter(b,a,x(n));
figure(1)
subplot(3,1,1)
stem(n,h)
title('Resposta ao impulso')
xlabel('amostragem')
ylabel('amplitude')
%Degral
n = 0:19;h
x2 = @(n) n>=0;
a = [1 -0.6 -0.16];
b = [5 0 0 ];
h = filter(b,a,x2(n));
subplot(3,1,2)
stem(n,h);
title('Resposta ao degrau')
xlabel('amostragem')
ylabel('amplitude')
%sen
n = 0:19;
x3 = @(n) (sin(n+eps)./(n+eps));%@define uma função com parametro n --- A função esta no ()
a = [1 -0.6 -0.16];
b = [5 0 0 ];
h = filter(b,a,x3(n)); % Funçao de tranfesrencia (a/b)*x(N) filtrada
subplot(3,1,3)
stem(n,h);
title('Resposta ao sen(n)/n')
xlabel('tempo(s)')
ylabel('amostragem')
%%
%1.2
%Convolução em 1D pela definição
conv_by_def() % chama a função de convolução

%%
%1.3
%Convolução em 2D pela definição
I = imread('lua 08092019155226.jpg')
imshow(I, [0 255])
