% Universidade Federal de Viçosa - UFV
% Departamento de Engenharia Elétrica - DEL
% ELT 410 - PROCESSAMENTO DIGITAL DE SINAIS
% Thiago Mendes Ávila(93505) & João Pedro Rossi (90102)
% PRÁTICA 7
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
title 'Espectro não centralizado'
xlabel 'Frequência (Hz)'
ylabel 'Amplitude'
subplot(3,1,2), plot(freq,abs(fftshift(X)))
title 'Espectro centralizado'
xlabel 'Frequência (Hz)'
ylabel 'Amplitude'
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1)))
title 'Espectro referente à parte positiva da freqência'
xlabel 'Frequência (Hz)'
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
xlabel('Frequência(Hz)')
ylabel('Amplitude')

subplot(312)
plot(freq,abs(fftshift(Y_b)),'r') %Plot do espectro do sinal filtrado de forma centralizada
title('Sinal filtrado com Filtro Passa-baixa','FontSize',15)
xlabel('Frequência(Hz)')
ylabel('Amplitude')

subplot(313)
plot(t,y_b,'k')
title('Sinal reconstruído após Filtro Passa-baixa','FontSize',15)
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
xlabel('Frequência(Hz)')
ylabel('Amplitude')

subplot(312)
plot(freq,abs(fftshift(Y_a)),'r') %Plot do espectro do sinal filtrado de forma centralizada
title('Sinal filtrado com Filtro Passa-alta','FontSize',15)
xlabel('Frequência(Hz)')
ylabel('Amplitude')

subplot(313)
plot(t,y_a,'k')
title('Sinal reconstruído após Filtro Passa-alta','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')


%%
% 4.1 Aplicação dos filtros passa-baixa 
[x,z]=audioread('castanets44m.wav');
Fs = z;
L = length(x);
t = 0:1/Fs:(L-1)/Fs;
figure(1)
plot(t,x)
title 'Sinal de áudio (castanets44m)';
xlabel 'Tempo';
ylabel 'Amplitude';
X = fft(x);

%Centralizando ftt
freq = [-(L/2-1):L/2]*Fs/L;
pfreq = [0:L/2]*Fs/L;
figure(2)
subplot(3,1,1), plot(freq,abs(X))
title 'Espectro não centralizado';
xlabel 'Frequência (Hz)';
ylabel 'Amplitude';
subplot(3,1,2), plot(freq,abs(fftshift(X)))
title 'Espectro centralizado';
xlabel 'Frequência (Hz)';
ylabel 'Amplitude';
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1)))
title 'Espectro referente à parte positiva da frequência';
xlabel 'Frequência (Hz)';
ylabel 'Amplitude';
%%
% 4.1 Aplicação dos filtros passa-baixa
a = 500;

H = a./(a+1i*freq);
figure(3)
subplot (311)
plot(freq,abs(H))
title 'Aplicação do filtro passa-baixa';
xlabel 'Frequência (Hz)';
ylabel 'Amplitude';
Hshift = fftshift(H);
Y = X.* Hshift';
subplot (312)
plot(freq,abs(fftshift(Y)))
title 'Sinal filtrado no dominio da frequência';
xlabel 'Frequência (Hz)';
ylabel 'Amplitude';
y = real(ifft(Y));
subplot(313);
plot(y);
title 'Sinal filtrado no dominio do tempo';
xlabel 'Tempo';
ylabel 'Amplitude';

sound(y,Fs)

% 4.1 Aplicação dos filtros passa-alta

H = 1-(a./(a+1i*freq));
figure(4)
subplot (311)
plot(freq,abs(H))
title 'Aplicação do filtro passa-alta';
xlabel 'Frequência (Hz)';
ylabel 'Amplitude';
Hshift = fftshift(H);
Y = X.* Hshift';
subplot (312)
plot(freq,abs(fftshift(Y)))
title 'Sinal filtrado no dominio da frequência';
xlabel 'Frequência (Hz)';
ylabel 'Amplitude';
y = real(ifft(Y));
subplot(313);
plot(y);
title 'Sinal filtrado no dominio do tempo';
xlabel 'Tempo';
ylabel 'Amplitude';

sound(y,Fs)
