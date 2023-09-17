%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

% Roteiro Prática 7

%% Parte 3: Tempo <-> Frequência

Fs = 8000; %Frequência (para definir a taxa de amostragem)
L = 8000; %Variável auxiliar para definir o tamanho de alguns vetores
t = 0:1/Fs:(L-1)/Fs; %Define o vetor tempo
x = 0.7*sin(2*pi*500*t)+sin(2*pi*2000*t)+2*randn(1,L); %Onda periódica com ruído
figure;
plot(t,x); xlabel('Amostra'); ylabel('Amplitude'); title('Onda periódica com ruído');

X = fft(x); %Calcula a Transformada de Fourier do sinal
freq = [-(L/2-1):L/2]*Fs/L; %Define o vetor de frequências
pfreq = [0:L/2]*Fs/L; %Vetor de frequências somente com o espectro positivo
figure;
subplot(3,1,1), plot(freq,abs(X)); %Plota a resposta em frequência (amplitude) descentralizada
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Espectro em frequência (amplitude) descentralizada');
subplot(3,1,2), plot(freq,abs(fftshift(X))); %Plota a resposta em frequência (amplitude) centralizada
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Espectro em frequência (amplitude) centralizada');
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1))); %Plota a resposta em frequência (amplitude) para frequências positivas
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Espectro em frequência (amplitude) para frequências positivas');

xnew = real(ifft(X)); %Calcula a parte real da transformada inversa de Fourier do sinal
figure;
plot(t,xnew); %Plota o sinal coincidente com o original
xlabel('Amostra'); ylabel('Amplitude'); title('Sinal após a Transformada Inversa de Fourier');

%% Parte 3.1: Filtragem passa-baixa

a = 1000; %Frequência de corte
H = a./(a+j*freq); %Filtro passa-baixas
figure;
subplot(3,1,1); plot(freq,abs(H)); %Resposta em frequência do filtro
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Resposta em frequência (amplitude) do filtro');

Hshift = fftshift(H); %Centraliza o filtro na frequência zero
Y = X.*Hshift; %Filtragem do sinal
subplot(3,1,2); plot(freq,abs(fftshift(Y))); xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Sinal filtrado x Frequência');

y = real(ifft(Y)); %Transformada Inversa de Fourier do sinal filtrado
subplot(3,1,3); plot(t,y); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal filtrado x Tempo'); axis([0 1 -5 5]);

%% Parte 3.2: Filtragem passa-alta

a = 500; %Frequência de corte
HH = 1 - a./(a+j*freq); %Filtro passa-altas
figure;
subplot(3,1,1); plot(freq,abs(HH)); %Resposta em frequência do filtro
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Resposta em frequência (amplitude) do filtro');

HHshift = fftshift(HH); %Centraliza o filtro na frequência zero
YY = X.*HHshift; %Filtragem do sinal
subplot(3,1,2); plot(freq,abs(fftshift(YY))); xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Sinal filtrado x Frequência');

yy = real(ifft(YY)); %Transformada Inversa de Fourier do sinal filtrado
subplot(3,1,3); plot(t,yy); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal filtrado x Tempo');

%% 4.1: Aplicação dos filtros passa-alta e passa-baixa:

[C , Fs] = audioread('castanets44m.wav'); %Carrega o arquivo de som
sound(C); %Reproduz o arquivo de som

%%

freq = [-(length(C)/2-1):length(C)/2]*Fs/length(C); %Vetor de frequências
a = 500; %Frequência de corte do filtro
H1 = a./(a+j*freq); %Filtro passa-baixas
H1shift = fftshift(H1); %Centraliza
Y1 = fft(C).*H1shift'; %Realiza a filtragem do sinal
y1 = real(ifft(Y1));  %Realiza a transformada inversa de Fourier do sinal
sound(y1); %Reproduz o sinal de som

%%

a = 500; %Frequência de corte do filtro
H2 = 1 - a./(a+j*freq); %Filtro passa-altas
H2shift = fftshift(H2);
Y2 = fft(C).*H2shift'; %Realiza a filtragem do sinal
y2 = real(ifft(Y2));  %Realiza a transformada inversa de Fourier do sinal
sound(y2); %Reproduz o sinal de som

%%

figure;
subplot(3,1,1); plot(C); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som original');
subplot(3,1,2); plot(y1); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som após filtragem passa-baixas');
subplot(3,1,3); plot(y2); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som após filtragem passa-altas');

%%

a = 10; %Frequência de corte do filtro
H1 = a./(a+j*freq); %Filtro passa-baixas
H1shift = fftshift(H1);
Y1 = fft(C).*H1shift'; %Realiza a filtragem do sinal
y1 = real(ifft(Y1));  %Realiza a transformada inversa de Fourier do sinal
sound(y1); %Reproduz o sinal de som

%%

a = 100000; %Frequência de corte do filtro
H2 = 1 - a./(a+j*freq); %Filtro passa-altas
H2shift = fftshift(H2);
Y2 = fft(C).*H2shift'; %Realiza a filtragem do sinal
y2 = real(ifft(Y2));  %Realiza a transformada inversa de Fourier do sinal
sound(y2); %Reproduz o sinal de som

%%

figure;
subplot(3,1,1); plot(C); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som original');
subplot(3,1,2); plot(y1); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som após filtragem passa-baixas (fc = 10)');
subplot(3,1,3); plot(y2); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som após filtragem passa-altas (fc = 100000)');

%% 4.2: Eliminação de Instrumentos Musicais:

Fs = 8000;
BD = audioread('bassdrum.wav');
HC = audioread('hatclosed.wav');
load('shake.mat');
[M, F] = audioread('mixed.wav');

freq = [-(length(M)/2-1):length(M)/2]*Fs/length(M);
fBD = [-(length(BD)/2-1):length(BD)/2]*Fs/length(BD);
fHC = [-(length(HC)/2-1):length(HC)/2]*Fs/length(HC);
fshake = [-(length(shake)/2-1):length(shake)/2]*Fs/length(shake);

figure;
subplot(4,1,1); plot(fBD,abs(fftshift(fft(BD)))); axis([0 4000 0 150]);
xlabel('Tempo (s)'); ylabel('Amplitude'); title('BassDrum');
subplot(4,1,2); plot(fHC,abs(fftshift(fft(HC)))); axis([0 4000 0 20]);
xlabel('Tempo (s)'); ylabel('Amplitude'); title('Hatclosed');
subplot(4,1,3); plot(fshake,abs(fftshift(fft(shake)))); axis([0 4000 0 500]);
xlabel('Tempo (s)'); ylabel('Amplitude'); title('Shake');
subplot(4,1,4); plot(freq,abs(fftshift(fft(M)))); axis([0 4000 0 500]);
xlabel('Tempo (s)'); ylabel('Amplitude'); title('Mixed');

%% FILTRO REJEITA-FAIXA PARA TROMPETE

b = 500; %Frequência de corte superior
Hb = b./(b+j*freq); %Filtro passa-baixa
a = 30; %Frequência de corte inferior
Ha = 1 - (a./(a+j*freq)); %Filtro passa-alta
H1 = Hb.*Ha;
H = 1-H1;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y1 = fft(M).*(Hshift.*Hshift.*Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f5=abs(fftshift(Y1));
y1 = real(ifft(Y1)); %Voltando o espectro para o domínio do tempo
sound(y1,F) %Reproduzindo o som

%% FILTRO PASSA-BAIXA PARA TROMPETE

b = 2700; %Frequência de corte superior
Hb = b./(b+j*freq); %Filtro passa-baixa
H = Hb;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y2 = Y1.*(Hshift.*Hshift.*Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f6=abs(fftshift(Y2));
y2 = real(ifft(Y2)); %Voltando o espectro para o domínio do tempo
sound(y2,F) %Reproduzindo o som

%% FILTRO PASSA-FAIXA PARA TROMPETE

b = 900; %Frequência de corte superior
Hb = b./(b+j*freq); %Filtro passa-baixa
a = 600; %Frequência de corte inferior
Ha = 1 - (a./(a+j*freq)); %Filtro passa-alta
H = Hb.*Ha;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y1 = fft(y2).*(Hshift.*Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f5=abs(fftshift(Y1));

figure;
plot(freq(length(M)/2:end),f5(length(M)/2:end)) %Plotando sinal filtrado
title('Sinal do trompete filtrado');ylabel('Amplitude');xlabel('Frequência')

y3 = real(ifft(Y1)); %Voltando o espectro para o domínio do tempo
sound(10*y3,F) %Reproduzindo o som

%% FILTRO PARA BATERIA

b = 300; %Frequência de corte superior
Hb = b./(b+j*freq); %Filtro passa-baixa
a = 40; %Frequência de corte inferior
Ha = 1 - (a./(a+j*freq)); %Filtro passa-alta
H = Hb.*Ha;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y3 = fft(M).*(Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f7=abs(fftshift(Y3));
figure;
plot(freq(length(M)/2:end),f7(length(M)/2:end)) %Plotando sinal filtrado
title('Sinal da bateria filtrado');ylabel('Amplitude');xlabel('Frequência')
y3 = real(ifft(Y3)); %Voltando o espectro para o domínio do tempo
sound(20*y3,F) %Reproduzindo o som