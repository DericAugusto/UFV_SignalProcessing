%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Prática 3

% Exercício 1

%a
h = [1 zeros(1,20) 0.5 zeros(1,10)];
figure(1);
stem(h); %Plota gráficos de sinais discretos
title('Resposta ao impulso');
xlabel('t');
ylabel('h');

%b
x = [0 1:10 ones(1,5)*5 zeros(1,10)];
figure(2);
stem(x);
title('Entrada');
xlabel('t');
ylabel('x');

%c
h = [1 zeros(1,20) 0.5 zeros(1,10)];
x = [0 1:10 ones(1,5)*5 zeros(1,16)];
y = conv(x,h); %Realiza a conolução de x e h
figure(3)
subplot(3,1,1);
stem(x);
title('Entrada');
xlabel('t');
ylabel('x');
subplot(3,1,2);
stem(h);
title('Resposta ao impulso');
xlabel('t');
ylabel('h');
subplot(3,1,3);
stem(y);
title('Saída');
xlabel('t');
ylabel('y');

% Exercício 2

load('trumpet 30082019132152.mat'); %Carrega um arquivo para a workspace
whos('Fs', 'trumpet'); %Exibe as variáveis que estão no workspace
figure(4)
subplot(4,1,1);
stem(trumpet);
title('Sinal original');
xlabel('t');
ylabel('Amplitude');

%a
h1 = [1 zeros(1,10000) 0.25 zeros(1,1000)];
y1 = conv(trumpet,h1);
sound(trumpet); %Reproduz o sinal de áudio
audiowrite('trumpet_antes.wav', trumpet, Fs); %Salva o sinal como arquivo .wav de áudio
audiowrite('trumpet_conv_a.wav', y1, Fs);
subplot(4,1,2);
stem(y1);
title('Sinal Convoluído (a)');
xlabel('t');
ylabel('Amplitude');

%b
h2 = [1 zeros(1,10000) -0.25 zeros(1,1000)];
y2 = conv(trumpet,h2);
audiowrite('trumpet_conv_b.wav', y2, Fs);
subplot(4,1,3);
stem(y2);
title('Sinal Convoluído (b)');
xlabel('t');
ylabel('Amplitude');

%c
h3 = [1 zeros(1, round(Fs/4)) 0.25 zeros(1,1000)];
y3 = conv(trumpet,h3);
audiowrite('trumpet_conv_c.wav', y3, Fs);
subplot(4,1,4);
stem(y3);
title('Sinal Convoluído (c)');
xlabel('t');
ylabel('Amplitude');

% Exercício 3

h4 = [ones(1,50)/50 zeros(1,20)];
y4 = conv(trumpet,h4);
audiowrite('trumpet_conv_3a.wav', y4, Fs);
figure(5);
subplot(3,1,1);
stem(y4);
title('Sinal Convoluído (padrão)');
xlabel('t');
ylabel('Amplitude');

h5 = [ones(1,50)/50 zeros(1,20000)];
y5 = conv(trumpet,h5);
audiowrite('trumpet_conv_3b.wav', y5, Fs);
subplot(3,1,2);
stem(y5);
title('Sinal Convoluído (mais zeros)');
xlabel('t');
ylabel('Amplitude');

h6 = [ones(1,500)/50 zeros(1,20)];
y6 = conv(trumpet,h6);
audiowrite('trumpet_conv_3c.wav', y6, Fs);
subplot(3,1,3);
stem(y6);
title('Sinal Convoluído (mais uns)');
xlabel('t');
ylabel('Amplitude');

%Exercício 4

clc;
clear all;
close all;

%Função Retangular
fs1 = 1;
t1 = -10:1/fs1:10;
w1 = 4;
x = rectpuls(t1-3,w1); %Cria um pulso retangular
figure(6);
subplot(2,1,1);
stem(t1,x);
title('Pulso Retangular');
xlabel('t');
ylabel('Amplitude');

%Função Triangular
fs2 = 100;
t2 = -10:1/fs2:10;
w2 = 2;
h = tripuls(t2-1.5,4*w2); %Cria um pulso triangular
subplot(2,1,2);
stem(t2,h);
title('Pulso Triangular');
xlabel('t');
ylabel('Amplitude');

%Convolução
y = conv(x,h);
figure(7);
subplot(2,1,1);
stem(y);
title('Sinal Convoluído pela função "conv"');
xlabel('t');
ylabel('Amplitude');

z1 = [x zeros(1,2000)];
z2 = [h zeros(1,20)];

m=length(x); %Calcula o comprimento do vetor
n=length(h);

%Código implementado para realizar a convoluçao de x e h percorrendo os
%vetores z1 e z2 (os quais têm tamanho equivalente).

for i=1:n+m-1
    Y(i)=0;
    for j=1:m
        if((i-j+1)>0)
            Y(i)=Y(i)+(z1(j)*z2(i-j+1));
        else
        end
    end
end
subplot(2,1,2);
stem(Y);
title('Sinal Convoluído pela função criada');
xlabel('t');
ylabel('Amplitude');