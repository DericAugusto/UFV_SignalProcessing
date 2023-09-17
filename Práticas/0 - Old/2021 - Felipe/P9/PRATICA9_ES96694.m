clear all; close all; clc;

%% Prática 9
% Felipe dos Anjos Rezende
% ES=96694

%% I

fs = 1000; % Frequencia de amostragem
t = 0:1/fs:3; % Vetor tempo
f0 = 150; % Define f0
t1 = 3; % Define t1
f1 = 450; % Define f1
B = (f1-f0)/t1; % Define B
y = cos(2*pi*(f0*t+B/2*t.^2)); % Cria um sinal y
Y = abs(fft(y)); % Módulo da transformada de y
F = linspace(0,fs/2,round(length(y)/2)); % Vetor linear
plot(F,Y(1:round(length(y)/2))) % Plota a transformada
xlabel('Frequencia (Hz)')
ylabel('Magnitude')

[S,F,T] = espectrograma(y,256,20,256,fs); % Calcula o espectrograma
figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none'); % Plota a imagem do espectrograma
axis xy; axis tight; view(0,90); % visualizção 2D
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');

%% II

fs = 1000; 
x = audioread('lena.wav'); 
[S,F,T] = espectrograma(x,1024,100,1024,fs);
figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
colormap(gray);
xlabel('Tempo (s)');
ylabel('Frequência (Hz)');
pause(1)

%% III

load('whalecalls.mat')
A = X1(5,:);
B = X2(5,:);
sound(A,fs);
pause(5)
sound(B,fs);
[S,F,T] = espectrograma(X1,1024,100,1024,fs);
figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90); 
xlabel('Tempo (s)');
ylabel('Frequência (Hz)');
[S,F,T] = espectrograma(X2,1024,100,1024,fs);
figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90); 
xlabel('Tempo (s)');
ylabel('Frequência (Hz)');