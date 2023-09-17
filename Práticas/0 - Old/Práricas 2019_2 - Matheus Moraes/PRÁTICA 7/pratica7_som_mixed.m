% Universidade Federal de Viçosa - UFV
% Departamento de Engenharia Elétrica - DEL
% ELT 410 - PROCESSAMENTO DIGITAL DE SINAIS
% Thiago Mendes Ávila(93505) & João Pedro Rossi (90102)
% PRÁTICA 7
close all
clear all
clc

%% EXERCÍCIO 4.2
Amostra = [];
mixed.amostra = audioread('mixed.wav')';
bassd.amostra = audioread('bassdrum.wav')';
hatc.amostra = audioread('hatclosed.wav')
shake = load('shake.mat');

shake.amostra = shake.shake;
Fs = 8000;
% ESPECTROS DOS SONS
bassd.FFT = fft(bassd.amostra);
bassd.L = 4000;
bassd.freq = ((-(bassd.L/2-1):bassd.L/2)/bassd.L)*Fs;
figure,
subplot (211)
plot(bassd.freq,abs(fftshift(bassd.FFT)),'r')
title('Som BASSDRUM','FontSize',15)
xlabel('Frequência(Hz)')
ylabel('Amplitude')

shake.FFT = fft(shake.amostra);
shake.L = 24000;
shake.freq = ((-(shake.L/2-1):shake.L/2)/shake.L)*Fs;
subplot (212);
plot(shake.freq,abs(fftshift(shake.FFT)));
title('Som SHAKE','FontSize',15)
xlabel('Frequência(Hz)')
ylabel('Amplitude')

mixed.FFT = fft(mixed.amostra);
mixed.L = 24000;
mixed.freq = ((-(mixed.L/2-1):mixed.L/2)/mixed.L)*Fs;
figure;
subplot (211)
plot(mixed.freq,abs(fftshift(mixed.FFT)),'k')
title('Som MIXED','FontSize',15)
xlabel('Frequência(Hz)')
ylabel('Amplitude')

hatc.FFT = fft(hatc.amostra);
hatc.L = length(hatc.amostra);
hatc.freq = ((-(hatc.L/2-1):hatc.L/2)/hatc.L)*Fs;
subplot (212);
plot(hatc.freq,abs(fftshift(hatc.FFT)),'k');
title('Som HATCLOSED','FontSize',15);
xlabel('Frequência(Hz)');
ylabel('Amplitude');

%DEFINIÇÃO DAS FREQUÊNCIAS DE CORTE
mixed.FFT = fft(mixed.amostra);
mixed.L = 24000;
mixed.freq = ((-(mixed.L/2-1):mixed.L/2)/mixed.L)*Fs;
figure;
subplot(211);
plot(mixed.freq,abs(fftshift(mixed.FFT)),'k');
title('Som MIXED','FontSize',15);
xlabel('Frequência(Hz)');
ylabel('Amplitude');
subplot(212);
plot(mixed.freq,abs(fftshift(mixed.FFT)),'k');
title('Faixa selecionada','FontSize',15);
xlabel('Frequência(Hz)');
ylabel('Amplitude');
%%
% FILTRAR SOM DA BATERIA - REJEITA FAIXA 
a_L = 40;
a_H = 300

Hb = a_L./(a_L+1i*mixed.freq); % a -> Frequencia de corte
Ha = 1 - a_H./(a_H+1i*mixed.freq);
Hb_shift = fftshift(Hb); %Descentralizar o filtro
Ha_shift = fftshift(Ha); %Descentralizar o filtro

Y_bat = mixed.FFT.*Hb_shift + mixed.FFT.*Ha_shift;
y_bat = real(ifft(Y_bat));
sound(y_bat,Fs)

% FILTRAR SOM DO TRUMPET - PASSA FAIXA
a_L = 600;
a_H = 900;

Hb = a_L./(a_L+1i*mixed.freq);
Ha = 1 - a_H./(a_H+1i*mixed.freq);
Hb_shift = fftshift(Hb);
Ha_shift = fftshift(Ha);

Y_trum = mixed.FFT.*Hb_shift.*Ha_shift.*Hb_shift.*Ha_shift.*Hb_shift.*Ha_shift.*Hb_shift.*Ha_shift;
Y_trum_shift = fftshift(Y_trum);
y_trum = real(ifft(fftshift(Y_trum_shift)));
sound(10*y_trum,Fs)
%%
figure,
subplot (211)
plot(mixed.freq,abs(fftshift(Y_bat)),'g')
title('Som MIXED filtrado - bateria (na frequência)','FontSize',15)
xlabel('Frequência(Hz)')
ylabel('Amplitude')

subplot(212)
plot(y_bat,'m')
title('Som MIXED filtrado - bateria (no tempo)','FontSize',15)
xlabel('Tempo')
ylabel('Amplitude')

figure,
subplot (211)
plot(mixed.freq,abs(Y_trum_shift),'c')
title('Som MIXED filtrado - trumpet (na frequência)','FontSize',15)
xlabel('Frequência(Hz)')
ylabel('Amplitude')

subplot(212)
plot(y_trum,'r')
title('Som MIXED filtrado - trumpet (no tempo)','FontSize',15)
xlabel('Tempo')
ylabel('Amplitude')