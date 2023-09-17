%% UNIVERSIDADE FEDERAL DE VI�OSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e M�rcio Von Rondow Campos

clc
clear all;
close all;

% Roteiro Pr�tica 7

%% Parte 3: Tempo <-> Frequ�ncia

Fs = 8000; %Frequ�ncia (para definir a taxa de amostragem)
L = 8000; %Vari�vel auxiliar para definir o tamanho de alguns vetores
t = 0:1/Fs:(L-1)/Fs; %Define o vetor tempo
x = 0.7*sin(2*pi*500*t)+sin(2*pi*2000*t)+2*randn(1,L); %Onda peri�dica com ru�do
figure;
plot(t,x); xlabel('Amostra'); ylabel('Amplitude'); title('Onda peri�dica com ru�do');

X = fft(x); %Calcula a Transformada de Fourier do sinal
freq = [-(L/2-1):L/2]*Fs/L; %Define o vetor de frequ�ncias
pfreq = [0:L/2]*Fs/L; %Vetor de frequ�ncias somente com o espectro positivo
figure;
subplot(3,1,1), plot(freq,abs(X)); %Plota a resposta em frequ�ncia (amplitude) descentralizada
xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Espectro em frequ�ncia (amplitude) descentralizada');
subplot(3,1,2), plot(freq,abs(fftshift(X))); %Plota a resposta em frequ�ncia (amplitude) centralizada
xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Espectro em frequ�ncia (amplitude) centralizada');
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1))); %Plota a resposta em frequ�ncia (amplitude) para frequ�ncias positivas
xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Espectro em frequ�ncia (amplitude) para frequ�ncias positivas');

xnew = real(ifft(X)); %Calcula a parte real da transformada inversa de Fourier do sinal
figure;
plot(t,xnew); %Plota o sinal coincidente com o original
xlabel('Amostra'); ylabel('Amplitude'); title('Sinal ap�s a Transformada Inversa de Fourier');

%% Parte 3.1: Filtragem passa-baixa

a = 1000; %Frequ�ncia de corte
H = a./(a+j*freq); %Filtro passa-baixas
figure;
subplot(3,1,1); plot(freq,abs(H)); %Resposta em frequ�ncia do filtro
xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Resposta em frequ�ncia (amplitude) do filtro');

Hshift = fftshift(H); %Centraliza o filtro na frequ�ncia zero
Y = X.*Hshift; %Filtragem do sinal
subplot(3,1,2); plot(freq,abs(fftshift(Y))); xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Sinal filtrado x Frequ�ncia');

y = real(ifft(Y)); %Transformada Inversa de Fourier do sinal filtrado
subplot(3,1,3); plot(t,y); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal filtrado x Tempo'); axis([0 1 -5 5]);

%% Parte 3.2: Filtragem passa-alta

a = 500; %Frequ�ncia de corte
HH = 1 - a./(a+j*freq); %Filtro passa-altas
figure;
subplot(3,1,1); plot(freq,abs(HH)); %Resposta em frequ�ncia do filtro
xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Resposta em frequ�ncia (amplitude) do filtro');

HHshift = fftshift(HH); %Centraliza o filtro na frequ�ncia zero
YY = X.*HHshift; %Filtragem do sinal
subplot(3,1,2); plot(freq,abs(fftshift(YY))); xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Sinal filtrado x Frequ�ncia');

yy = real(ifft(YY)); %Transformada Inversa de Fourier do sinal filtrado
subplot(3,1,3); plot(t,yy); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal filtrado x Tempo');

%% 4.1: Aplica��o dos filtros passa-alta e passa-baixa:

[C , Fs] = audioread('castanets44m.wav'); %Carrega o arquivo de som
sound(C); %Reproduz o arquivo de som

%%

freq = [-(length(C)/2-1):length(C)/2]*Fs/length(C); %Vetor de frequ�ncias
a = 500; %Frequ�ncia de corte do filtro
H1 = a./(a+j*freq); %Filtro passa-baixas
H1shift = fftshift(H1); %Centraliza
Y1 = fft(C).*H1shift'; %Realiza a filtragem do sinal
y1 = real(ifft(Y1));  %Realiza a transformada inversa de Fourier do sinal
sound(y1); %Reproduz o sinal de som

%%

a = 500; %Frequ�ncia de corte do filtro
H2 = 1 - a./(a+j*freq); %Filtro passa-altas
H2shift = fftshift(H2);
Y2 = fft(C).*H2shift'; %Realiza a filtragem do sinal
y2 = real(ifft(Y2));  %Realiza a transformada inversa de Fourier do sinal
sound(y2); %Reproduz o sinal de som

%%

figure;
subplot(3,1,1); plot(C); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som original');
subplot(3,1,2); plot(y1); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som ap�s filtragem passa-baixas');
subplot(3,1,3); plot(y2); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som ap�s filtragem passa-altas');

%%

a = 10; %Frequ�ncia de corte do filtro
H1 = a./(a+j*freq); %Filtro passa-baixas
H1shift = fftshift(H1);
Y1 = fft(C).*H1shift'; %Realiza a filtragem do sinal
y1 = real(ifft(Y1));  %Realiza a transformada inversa de Fourier do sinal
sound(y1); %Reproduz o sinal de som

%%

a = 100000; %Frequ�ncia de corte do filtro
H2 = 1 - a./(a+j*freq); %Filtro passa-altas
H2shift = fftshift(H2);
Y2 = fft(C).*H2shift'; %Realiza a filtragem do sinal
y2 = real(ifft(Y2));  %Realiza a transformada inversa de Fourier do sinal
sound(y2); %Reproduz o sinal de som

%%

figure;
subplot(3,1,1); plot(C); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som original');
subplot(3,1,2); plot(y1); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som ap�s filtragem passa-baixas (fc = 10)');
subplot(3,1,3); plot(y2); xlabel('Amostra'); ylabel('Amplitude'); title('Sinal de som ap�s filtragem passa-altas (fc = 100000)');

%% 4.2: Elimina��o de Instrumentos Musicais:

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

b = 500; %Frequ�ncia de corte superior
Hb = b./(b+j*freq); %Filtro passa-baixa
a = 30; %Frequ�ncia de corte inferior
Ha = 1 - (a./(a+j*freq)); %Filtro passa-alta
H1 = Hb.*Ha;
H = 1-H1;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y1 = fft(M).*(Hshift.*Hshift.*Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f5=abs(fftshift(Y1));
y1 = real(ifft(Y1)); %Voltando o espectro para o dom�nio do tempo
sound(y1,F) %Reproduzindo o som

%% FILTRO PASSA-BAIXA PARA TROMPETE

b = 2700; %Frequ�ncia de corte superior
Hb = b./(b+j*freq); %Filtro passa-baixa
H = Hb;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y2 = Y1.*(Hshift.*Hshift.*Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f6=abs(fftshift(Y2));
y2 = real(ifft(Y2)); %Voltando o espectro para o dom�nio do tempo
sound(y2,F) %Reproduzindo o som

%% FILTRO PASSA-FAIXA PARA TROMPETE

b = 900; %Frequ�ncia de corte superior
Hb = b./(b+j*freq); %Filtro passa-baixa
a = 600; %Frequ�ncia de corte inferior
Ha = 1 - (a./(a+j*freq)); %Filtro passa-alta
H = Hb.*Ha;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y1 = fft(y2).*(Hshift.*Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f5=abs(fftshift(Y1));

figure;
plot(freq(length(M)/2:end),f5(length(M)/2:end)) %Plotando sinal filtrado
title('Sinal do trompete filtrado');ylabel('Amplitude');xlabel('Frequ�ncia')

y3 = real(ifft(Y1)); %Voltando o espectro para o dom�nio do tempo
sound(10*y3,F) %Reproduzindo o som

%% FILTRO PARA BATERIA

b = 300; %Frequ�ncia de corte superior
Hb = b./(b+j*freq); %Filtro passa-baixa
a = 40; %Frequ�ncia de corte inferior
Ha = 1 - (a./(a+j*freq)); %Filtro passa-alta
H = Hb.*Ha;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y3 = fft(M).*(Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f7=abs(fftshift(Y3));
figure;
plot(freq(length(M)/2:end),f7(length(M)/2:end)) %Plotando sinal filtrado
title('Sinal da bateria filtrado');ylabel('Amplitude');xlabel('Frequ�ncia')
y3 = real(ifft(Y3)); %Voltando o espectro para o dom�nio do tempo
sound(20*y3,F) %Reproduzindo o som