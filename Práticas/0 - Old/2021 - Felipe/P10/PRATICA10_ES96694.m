clear all; close all; clc;

%% Prática 10
% Felipe dos Anjos Rezende
% ES=96694

%%  Roteiro
% I

fs1 = 10000; % frequência de amostragem
f = 1000; % frequência do sinal
t1 = 0:1/fs1:20/f; % tempo com os 20 periodos
x1 = cos(2*pi*f*t1); % sinal
figure
subplot(3,1,1);plot(t1,x1); title('Diferentes amostragens'); ylabel('10kHz')

fs2 = 5000; % frequência de amostragem
t2 = 0:1/fs2:20/f; % tempo com os 20 periodos
x2 = cos(2*pi*f*t2); % sinal
subplot(3,1,2); plot(t2,x2); ylabel('5kHz')

fs3 = 2500; % frequência de amostragem
t3 = 0:1/fs3:20/f; % tempo com os 20 periodos
x3 = cos(2*pi*f*t3); % sinal
subplot(3,1,3); plot(t3,x3); xlabel('Tempo(s)'); ylabel('2.5KHz')

figure
X1 = fft(x1); % transformada de Fourier de x1
X1 = fftshift(X1); % desloca a transformada
L = length(X1); % tamanho do vetor
freq1 = [-(L/2-1):L/2]*fs1/L; % frequência
subplot(311);
plot(freq1,abs(X1)); title('Espectros dos sinais'); ylabel('10kHz')

X2 = fft(x2); % transformada de Fourier de x2
X2 = fftshift(X2); % desloca a transformada
L = length(X2); % tamanho do vetor
freq2 = [-(L/2-1):L/2]*fs2/L; % frequência
subplot(312); plot(freq2,abs(X2)); ylabel('5kHz')

X3 = fft(x3); % transformada de Fourier de x3
X3 = fftshift(X3); % desloca a transformada
L = length(X3); % tamanho do vetor
freq3 = [-(L/2-1):L/2]*fs3/L; % frequência
subplot(313); plot(freq3,abs(X3)); xlabel('Frequência(Hz)'); ylabel('2.5KHz')

%% II

x = imread('spokes','tif'); % lê a imagem
fps = 24; % flames por segundo
t = 3; % tempo total
graus = 0; % ângulo inicial
gpf = 12; % passo do ângulo

figure
for i=1:fps*t
c = imrotate(x,-graus,'bilinear','crop'); % rotaciona a imagem
imshow(c); % imagem rotacionada
title(sprintf('FPS, angulo => %d;%d.',fps,gpf)); % titulo
pause(1/fps) % pausa
graus = graus + gpf; % adiciona o passo ao ângulo
end