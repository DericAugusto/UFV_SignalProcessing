% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT 410 - SINAIS E SISTEMAS 
% JOÃO PEDRO ROSSI (90102) & THIAGO MENDES (93505)
% PRÁTICA 11

clc
clear all
close all

%% PRIMEIRA PARTE
%ANALISE DOS SINAIS
clear all
close all
clc

fs = 1024;
t = 0:1/fs:20;
F12 = linspace(0,fs/2,length(t)/2);
x = sin(2*pi*3*t) + sin(2*pi*8*t) + 3*randn(size(t)); 
y = sin(2*pi*8*t) + sin(2*pi*11*t) + 3*randn(size(t));
X = abs(fft(x)); 
Y = abs(fft(y));

figure
subplot(211)
plot(t,x)
title('Sinal X ruidoso','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')

subplot(212)
plot(t,y,'k')
title('Sinal Y ruidoso','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')

figure
subplot(211)
plot(F12,X(1:length(F12)))
title('Espectro do sinal X ruidoso','FontSize',15)
axis([0 20 0 max(X)])
xlabel('Frequência(Hz)')
ylabel('Amplitude')

subplot(212)
plot(F12,Y(1:length(F12)),'k')
title('Espectro do sinal Y ruidoso','FontSize',15)
axis([0 20 0 max(Y)])
xlabel('Frequência(Hz)')
ylabel('Amplitude')

[Cxy,F12] = mscohere(x,y,boxcar(1024),0,1024,fs);
figure
subplot(211)
plot(F12,Cxy,'LineWidth',2)
title('Coerência entre os Sinais','FontSize',15)
xlabel('Frequência(Hz)')
ylabel('Amplitude')
axis([0 20 0 1])

[Rxy,lags12] = xcorr(x,y,'coeff');
subplot(212)
plot(lags12,Rxy,'r','LineWidth',2)
xlabel('Tempo(s)')
ylabel('Amplitude')
title('Correlação entre os Sinais','FontSize',15)
axis tight

%% SEGUNDA PARTE
clc
clear all
close all

bird1 = audioread('bird.wav');
bird2 = audioread('birdmp3towav.wav');

Fs = 44100;
t = 0:1/Fs:20;

figure
subplot(211)
plot(t,bird1)
xlabel('Tempo(s)')
ylabel('Amplitude')
title('Musica em WAV','FontSize',15)

subplot(212)
plot(t,bird2,'r')
xlabel('Tempo(s)')
ylabel('Amplitude')
title('Musica convertida do MP3 para WAV','FontSize',15)

L_1 = length(bird1); %TAMANHO DO SINAL
freq_1 = (((-(L_1/2-1):L_1/2)/L_1)*Fs)'; % DETERMINANDO O EIXO DA FREQUENCIA

BIRD1 = fft(bird1); %TRANSFORMADA FOURIER DO SINAL RUIDOSO
BIRD1_SHIFT = fftshift(BIRD1); %ESPECTRO DE FOURIER CENTRALIZADO

figure,
subplot(211)
plot(freq_1,abs(BIRD1_SHIFT)) %PLOT DO ESPECTRO DE FOURIER DO SINAL
title('ESPECTRO DO SINAL EM WAV','FontSize',15)
xlabel('Frequência (Hz)')
ylabel('Magnitude')

L_2 = length(bird2); %TAMANHO DO SINAL
freq_2 = (((-(L_2/2-1):L_2/2)/L_2)*Fs)'; % DETERMINANDO O EIXO DA FREQUENCIA

BIRD2 = fft(bird2); %TRANSFORMADA FOURIER DO SINAL RUIDOSO
BIRD2_SHIFT = fftshift(BIRD2); %ESPECTRO DE FOURIER CENTRALIZADO

subplot(212),plot(freq_2,abs(BIRD2_SHIFT),'r') %PLOT DO ESPECTRO DE FOURIER DO SINAL
title('ESPECTRO DO SINAL EM MP3->WAV','FontSize',15)
xlabel('Frequência (Hz)')
ylabel('Magnitude')

[C12,F12] = mscohere(bird1,bird2,boxcar(512),0,512,Fs);
figure
plot(F12,C12,'k')
title('Coerência entre as Músicas','FontSize',15)
xlabel('Frequência (Hz)')
ylabel('Magnitude')
