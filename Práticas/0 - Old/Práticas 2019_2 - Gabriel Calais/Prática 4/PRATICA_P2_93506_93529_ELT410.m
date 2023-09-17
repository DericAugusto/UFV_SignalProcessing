%% UNIVERSIDADE FEDERAL DE VI�OSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e M�rcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Pr�tica 4

%Exerc�cio 1

%Impulso
clc
clear all;
close all;
n1 = 0:19;
x1 = @(n) n==0; %Cria a fun��o impulso
a = [1 -0.6 -0.16];
b = [5 0 0];
h = filter(b,a,x1(n1)); %Determina a resposta ao impulso
figure();
subplot(3,1,1);
stem(n1,h);
title('Resposta ao Impulso');
xlabel('Amostragem (s)');
ylabel('Amplitude');

%Degrau

n2 = 0:19;
x2 = inline('n>=0'); %Cria a fun��o degrau
a = [1 -0.6 -0.16];
b = [5 0 0];
h = filter(b,a,x2(n2)); %Determina a resposta ao degrau
subplot(3,1,2);
stem(n2,h);
title('Resposta ao Degrau');
xlabel('Amostragem (s)');
ylabel('Amplitude');

%Seno

n3 = 0:19;
x3 = inline('(sin(n+eps))./(n+eps)'); %Cria a fun��o (sen(n))/n
a = [1 -0.6 -0.16];
b = [5 0 0];
h = filter(b,a,x3(n3)); %Determina a resposta a fun��o (sen(n))/n
subplot(3,1,3);
stem(n3,h);
title('Resposta a (sen(n))/n');
xlabel('Amostragem (s)');
ylabel('Amplitude');

%Exerc�cio 2

%Convolu��o discreta 1D

x = input('Entre com o vetor x (valores espa�ados entre colchetes): ');
h = input('Entre com o vetor h (valores espa�ados entre colchetes): ');
tic %In�cio do tempo de processamento da fun��o convolu��o
Y = convolucao(x,h);
t1 = toc %Fim do tempo de processamento da fun��o convolu��o
figure();
stem(Y);
title('Convolu��o com a fun��o implementada');
xlabel('Amostragem (s)');
ylabel('Amplitude');
tic 
Z = conv(x,h);
t2 = toc
figure();
stem(Z);
title('Convolu��o com "conv"');
xlabel('Amostragem (s)');
ylabel('Amplitude');

%Convolu��o discreta 2D

disp('Entre com o tamanho das matrizes que ser�o geradas aleatoriamente:');
disp(' ');

m = input('N�mero de linhas da matriz A: ');
disp(' ');
n = input('N�mero de colunas da matriz A: ');
disp(' ');
o = input('N�mero de linhas da matriz B: ');
disp(' ');
p = input('N�mero de colunas da matriz B: ');
disp(' ');

A = randn(m,n);
B = randn(o,p);

tic
X = convolucao2D(A,B)
t3 = toc

tic
W = conv2(A,B)
t4 = toc

%Exerc�cio 3

%Carregando a imagem para o workspace
I = imread('lua 08092019155226.jpg'); %Carrega uma imagem como matriz para a workspace
figure(1);
imshow(I, [0 255]); %Plota uma figura com uma imagem

%Filtro passa-altas real�ando a imagem
F = [-1 -1 -1; -1 8 -1; -1 -1 -1];
C = conv2(I, F); %Realiza a convolu��o bidimensional
figure(2);
imshow(C);
S = uint8(double(I) + imresize(conv2(I,F), size(I))); %Soma da imagem original com o filtro redimensionado
figure(3);
imshow(S);

%Filtro passa-baixas suavizando a imagem
F1 = (1/9)*[1 1 1; 1 1 1; 1 1 1];
C1 = conv2(I,F1);
figure(4);
imshow(C1);
S1 = uint8(double(I) + imresize(conv2(I,F1), size(I)));
figure(5);
imshow(S1);

%Filtro intensificando a imagem (deixando mais clara)
F2 = 2*[1 1 1; 1 -4 1; 1 1 1];
C2 = conv2(I,F2);
figure(6);
imshow(C2);
SA = uint8(double(I) + imresize(conv2(I,F2), size(I)));
figure(7);
imshow(SA);
figure;
imshow(SA, [0 255]);

%Filtro passa-altas intensificador como combina��o de um passa-baixas e um
%intensificador
F3 = -F2 + 9*F1;
C3 = conv2(I,F3);
figure(8);
imshow(C3);
S3 = uint8(double(I) + imresize(conv2(I,F3), size(I)));
figure(9);
imshow(S3);

%Filtro (com zeros) intensificador
F4 = [-1 -1 0; -1 3 0; 0 0 0];
C4 = conv2(I,F4);
figure(10);
imshow(C4);
S4 = uint8(double(I) + imresize(conv2(I,F4), size(I)));
figure(11);
imshow(S4);
S5 = 0.5 + S4;
figure(12);
imshow(S5);

%Filtro passsa-baixas suavizando a imagem de texto
T = imread('texto 08092019155244.jpg');
figure();
imshow(T);
f = (1/9)*[1 1 1; 1 1 1; 1 1 1];
s = uint8(imresize(conv2(T,f), size(T)));
figure(13);
imshow(s);