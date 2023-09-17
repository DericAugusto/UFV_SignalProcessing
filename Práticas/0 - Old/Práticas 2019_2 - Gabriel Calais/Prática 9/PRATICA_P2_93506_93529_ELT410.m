%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Prática 9

%2.1  Transformada de Fourier de curta duração

fs = 1000; %Define a frequência
t = 0:1/fs:3; %Define o vetor tempo
f0 = 150; t1 = 3; f1 = 450; B = (f1-f0)/t1; %Define variáveis auxiliares
y = cos(2*pi*(f0*t+B/2*t.^2)); %Define o sinal cossenoidal y
figure; plot(t, y); xlabel('Tempo (s)'); ylabel('Amplitude');  title('Sinal x Tempo');
Y = abs(fft(y)); %Calcula a transformada de Fourier do sinal y
F = linspace(0,fs/2,round(length(y)/2));
figure; plot(F,Y(1:round(length(y)/2))); xlabel('Frequencia (Hz)'); ylabel('Magnitude'); title('Espectro em frequência do sinal');

[S,F,T] = espectrograma(y,256,20,256,fs); %Faz o espectrograma do sinal y
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma');

figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma num gráfico tridimensional
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); zlabel('Magnitude'); title('Espectrograma (visão tridimensional)');

%% 3  Espectrografias ou "Ouvindo imagens"

lena = audioread('lena.wav'); %Carrega o áudio para a workspace

LENA = abs(fft(lena)); %Faz a transformada de Fourier do áudio
F = linspace(0,fs/2,round(length(lena)/2));
figure; plot(F,LENA(1:round(length(lena)/2)));
xlabel('Frequencia (Hz)'); ylabel('Magnitude'); title('Espectro em frequência - Lena');

[S,F,T] = espectrograma(lena,1024,80,1024,fs); %Faz o espectrograma do áudio
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none');
colormap(gray); %Define as cores para uma escala de cinzas
axis xy; axis([0 700 0 400]); view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - Lena');

%% 3.1  Informações Escondidas em Sinais de Áudio

[a, FS] = audioread('02AphexTwin.wav'); %Carrega o áudio para a workspace

[S,F,T] = espectrograma(a,1024,80,1024,FS); %Faz o espectrograma do áudio
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90); axis([326 338 0 22050]);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - AphexTwin');

[b, Fs] = audioread('VenetianSnaresLook.wav'); %Carrega o áudio para a workspace

[S,F,T] = espectrograma(b,1024*2,80*2,1024*2,Fs); %Faz o espectrograma do áudio
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none');
colormap(gray);
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - VenetianSnaresLook');

%% 4  Canto das baleias

load('whalecalls.mat'); %Carrega o arquivo para a workspace
sound(X1(2,:)); %Reproduz uma linha da matriz (canto de uma baleia)
sound(X2(9,:)); %Reproduz uma linha da matriz (canto de uma baleia)

[S1,F1,T1] = espectrograma(X1(1,:),256,20,256,fs); %Faz o espectrograma do áudio
figure; subplot(211); surf(T1,F1,10*log10(abs(S1)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - Canto da espécie 1 de baleia');

[S2,F2,T2] = espectrograma(X1(3,:),256,20,256,fs); %Faz o espectrograma do áudio
subplot(212); surf(T2,F2,10*log10(abs(S2)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)');

[S3,F3,T3] = espectrograma(X2(1,:),256,20,256,fs); %Faz o espectrograma do áudio
figure; subplot(211); surf(T3,F3,10*log10(abs(S3)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - Canto da espécie 2 de baleia');

[S4,F4,T4] = espectrograma(X2(7,:),256,20,256,fs); %Faz o espectrograma do áudio
 subplot(212);surf(T4,F4,10*log10(abs(S4)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)');