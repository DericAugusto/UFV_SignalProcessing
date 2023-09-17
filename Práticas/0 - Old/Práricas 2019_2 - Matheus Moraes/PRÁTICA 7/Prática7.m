% Universidade Federal de Vi�osa - UFV
% Departamento de Engenharia El�trica - DEL
% ELT 410 - PROCESSAMENTO DIGITAL DE SINAIS
% Thiago Mendes �vila(93505) & Jo�o Pedro Rossi (90102)
% PR�TICA 7
%%
%PARTE 3
clc;
clear all;
close all;

% FAST FOURIER TRANSFORM
Fs = 8000;
L = 8000;
t = 0:1/Fs:(L-1)/Fs;
x = 0.7*sin(2*pi*500*t)+sin(2*pi*2000*t)+2*randn(1,L);
figure(1)
plot(t,x)
title 'Sinal x'
xlabel 'Tempo'
ylabel 'Amplitude'
X = fft(x);

%Centralizando ftt
freq = [-(L/2-1):L/2]*Fs/L;
pfreq = [0:L/2]*Fs/L;
figure(2)
subplot(3,1,1), plot(freq,abs(X))
title 'Espectro n�o centralizado'
xlabel 'Frequ�ncia (Hz)'
ylabel 'Amplitude'
subplot(3,1,2), plot(freq,abs(fftshift(X)))
title 'Espectro centralizado'
xlabel 'Frequ�ncia (Hz)'
ylabel 'Amplitude'
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1)))
title 'Espectro referente � parte positiva da freq�ncia'
xlabel 'Frequ�ncia (Hz)'
ylabel 'Amplitude'

%%
% 3.1 Filtragem passa-baixa


a = 1000; 
Hb = a./(a+1i*freq); % a -> Frequencia de corte

Hb_shift = fftshift(Hb); %Descentralizar o filtro
Y_b = X.*Hb_shift;
y_b = real(ifft(Y_b));

figure,
subplot(311)
plot(freq,abs(Hb),'LineWidth',3)
title('Filtro Passa-baixa com a = 1000','FontSize',15)
xlabel('Frequ�ncia(Hz)')
ylabel('Amplitude')

subplot(312)
plot(freq,abs(fftshift(Y_b)),'r') %Plot do espectro do sinal filtrado de forma centralizada
title('Sinal filtrado com Filtro Passa-baixa','FontSize',15)
xlabel('Frequ�ncia(Hz)')
ylabel('Amplitude')

subplot(313)
plot(t,y_b,'k')
title('Sinal reconstru�do ap�s Filtro Passa-baixa','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')


% 3.2 Filtragem passa-alta

a = 500;
Ha = 1- Hb;
Ha_shift = fftshift(Ha);
Y_a = X.*Ha_shift;
y_a = real(ifft(Y_a));

figure,
subplot(311)
plot(freq,abs(Ha),'LineWidth',3)
title('Filtro Passa-alta com a = 500','FontSize',15)
xlabel('Frequ�ncia(Hz)')
ylabel('Amplitude')

subplot(312)
plot(freq,abs(fftshift(Y_a)),'r') %Plot do espectro do sinal filtrado de forma centralizada
title('Sinal filtrado com Filtro Passa-alta','FontSize',15)
xlabel('Frequ�ncia(Hz)')
ylabel('Amplitude')

subplot(313)
plot(t,y_a,'k')
title('Sinal reconstru�do ap�s Filtro Passa-alta','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')


%%
% 4.1 Aplica��o dos filtros passa-baixa 
[x,z]=audioread('castanets44m.wav');
Fs = z;
L = length(x);
t = 0:1/Fs:(L-1)/Fs;
figure(1)
plot(t,x)
title 'Sinal de �udio (castanets44m)';
xlabel 'Tempo';
ylabel 'Amplitude';
X = fft(x);

%Centralizando ftt
freq = [-(L/2-1):L/2]*Fs/L;
pfreq = [0:L/2]*Fs/L;
figure(2)
subplot(3,1,1), plot(freq,abs(X))
title 'Espectro n�o centralizado';
xlabel 'Frequ�ncia (Hz)';
ylabel 'Amplitude';
subplot(3,1,2), plot(freq,abs(fftshift(X)))
title 'Espectro centralizado';
xlabel 'Frequ�ncia (Hz)';
ylabel 'Amplitude';
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1)))
title 'Espectro referente � parte positiva da frequ�ncia';
xlabel 'Frequ�ncia (Hz)';
ylabel 'Amplitude';
%%
% 4.1 Aplica��o dos filtros passa-baixa
a = 500;

H = a./(a+1i*freq);
figure(3)
subplot (311)
plot(freq,abs(H))
title 'Aplica��o do filtro passa-baixa';
xlabel 'Frequ�ncia (Hz)';
ylabel 'Amplitude';
Hshift = fftshift(H);
Y = X.* Hshift';
subplot (312)
plot(freq,abs(fftshift(Y)))
title 'Sinal filtrado no dominio da frequ�ncia';
xlabel 'Frequ�ncia (Hz)';
ylabel 'Amplitude';
y = real(ifft(Y));
subplot(313);
plot(y);
title 'Sinal filtrado no dominio do tempo';
xlabel 'Tempo';
ylabel 'Amplitude';

sound(y,Fs)

% 4.1 Aplica��o dos filtros passa-alta

H = 1-(a./(a+1i*freq));
figure(4)
subplot (311)
plot(freq,abs(H))
title 'Aplica��o do filtro passa-alta';
xlabel 'Frequ�ncia (Hz)';
ylabel 'Amplitude';
Hshift = fftshift(H);
Y = X.* Hshift';
subplot (312)
plot(freq,abs(fftshift(Y)))
title 'Sinal filtrado no dominio da frequ�ncia';
xlabel 'Frequ�ncia (Hz)';
ylabel 'Amplitude';
y = real(ifft(Y));
subplot(313);
plot(y);
title 'Sinal filtrado no dominio do tempo';
xlabel 'Tempo';
ylabel 'Amplitude';

sound(y,Fs)
