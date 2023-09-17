clear all; close all; clc;

%% Prática 6
% Felipe dos Anjos Rezende
% ES=96694

%% I

Fs = 8000; 
L = 8000; 
t = 0:1/Fs:(L-1)/Fs;
x = 0.7*sin(2*pi*500*t)+sin(2*pi*2000*t)+2*randn(1,L);
figure
plot(t,x)
X = fft(x);

freq = [-(L/2-1):L/2]*Fs/L;
pfreq = [0:L/2]*Fs/L;
subplot(3,1,1), plot(freq,abs(X)), title('Transformada Descentralizada I');
subplot(3,1,2), plot(freq,abs(fftshift(X))), title('Transformada Centralizada I');
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1))), title('Transformada Positiva I');

xnew = real(ifft(X));

%% Filtro passa baixa

a = 1000;  
H = a./(a+1j*freq);  
figure 
subplot(3,1,1);
plot(freq,abs(H))
title('Resposta Centralizada passa-baixa');

Hshift = fftshift(H);  
Y = X.* Hshift;  
subplot(3,1,2);
plot(freq,abs(fftshift(Y)))
title('Resposta Descentralizada passa-baixa');

y = real(ifft(Y)); 
subplot(3,1,3);
plot(t,y)
title('Resposta no tempo passa-baixa');

%% Filtro passa alta 

a = 1000;  
H = 1-(a./(a+1j*freq));  
figure
subplot(3,1,1);
plot(freq,abs(H))
title('Resposta Centralizada passa-alta');

Hshift = fftshift(H);  
Y = X.* Hshift;  
subplot(3,1,2);
plot(freq,abs(fftshift(Y)))
title('Resposta Descentralizada passa-alta');

y = real(ifft(Y)); 
subplot(3,1,3);
plot(t,y)
title('Resposta no tempo passa-alta');

%% Roteiro
% I

x = audioread('castanets44m.wav');
X = fft(x); 
L = length(X);
Fs = floor(L/6.6);
t = 0:1/Fs:(L-1)/Fs;
freq = [-(L/2-1):L/2]*Fs/L;
pfreq = [0:L/2]*Fs/L; 

figure
subplot(3,1,1), plot(freq,abs(X)), title('Transformada Descentralizada II');
subplot(3,1,2), plot(freq,abs(fftshift(X))), title('Transformada Centralizada II');
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1))), title('Transformada Positiva II');

% Aplicando o filtro passa-baixa:
a = 500;
H = a./(a+1j*freq); 
figure;
subplot(3,1,1);
plot(freq,abs(H))
title('Resposta Centralizada');

Hshift = fftshift(H); 
Y = X.* Hshift';
subplot(3,1,2);
plot(freq,abs(fftshift(Y)))
title('Resposta Descentralizada');

y = real(ifft(Y)); 
subplot(3,1,3);
plot(t,y)
title('Resposta no tempo');

%audiowrite('castanets44m_passabaixa.wav',y,Fs) %Salva um arquivo como o novo sinal 

% Aplicando o filtro passa-alta:
a = 500;
H = 1-(a./(a+1j*freq));  
figure;
subplot(3,1,1);
plot(freq,abs(H))
title('Resposta Centralizada');

Hshift = fftshift(H);  
Y = X.* Hshift';
subplot(3,1,2);
plot(freq,abs(fftshift(Y)))
title('Resposta Descentralizada');


y = real(ifft(Y)); 
subplot(3,1,3);
plot(t,y)
title('Resposta no tempo');

%audiowrite('castanets44m_passaalta.wav',y,Fs) %Salva um arquivo como o novo sinal 

%% II

x = audioread('mixed.wav');
X = fft(x);
L = length(X);
Fs = floor(L/3);
t = 0:1/Fs:(L-1)/Fs;
freq = [-(L/2-1):L/2]*Fs/L;
pfreq = [0:L/2]*Fs/L;
figure
plot(t,x), title('Aúdio Original')

figure
subplot(3,1,1), plot(freq,abs(X)), title('Transformada Descentralizada III');
subplot(3,1,2), plot(freq,abs(fftshift(X))), title('Transformada Centralizada III');
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1))),title('Parte Positiva III');

%% Bateria

a = 500;
H1 = 1./sqrt(1+(freq./a).^(2*200));
b = 400;
H2 = 1-1./sqrt(1+(freq./b).^(2*200));
H = H1.*H2;

Hshift = fftshift(H);
Y21 = X.* Hshift';

a = 1000;
H3 = 1./sqrt(1+(freq./a).^(2*200));
b = 900;
H4 = 1-1./sqrt(1+(freq./b).^(2*200));
H = H3.*H4;

Hshift = fftshift(H);
Y22 = X.* Hshift';

a = 1500;
H5 = 1./sqrt(1+(freq./a).^(2*200));
b = 1400;
H6 = 1-1./sqrt(1+(freq./b).^(2*200));
H = H5.*H6;

Hshift = fftshift(H);
Y23 = X.* Hshift';

Y2 = Y21+Y22+Y23;

figure
subplot(2,1,1)
plot(freq,abs(fftshift(Y2))), title('Domínio da Frequencia sem Bateria');

y2 = real(ifft(Y2));
subplot(2,1,2)
plot(t,y2), title('Domínio do Tempo sem Bateria');

%audiowrite('mixed_sembateria.wav',y2,Fs)

%% Trompete

a = 500;
H1 = 1./sqrt(1+(freq./a).^(2*200));
b = 900;
H2 = 1-1./sqrt(1+(freq./b).^(2*200));
Ha = H1+H2;

a = 1000;
H1 = 1./sqrt(1+(freq./a).^(2*200));
b = 1600;
H2 = 1-1./sqrt(1+(freq./b).^(2*200));
Hb = H1+H2;

a = 1500;
H1 = 1./sqrt(1+(freq./a).^(2*200));
b = 2000;
H2 = 1-1./sqrt(1+(freq./b).^(2*200));
Hc = H1+H2;

H = Ha.*Hb.*Hc;

Hshift = fftshift(H);
Y3 = X.* Hshift';

figure
subplot(2,1,1)
plot(freq,abs(fftshift(Y3))), title('Domínio da Frequencia sem Trompete');


y3 = real(ifft(Y3));
subplot(2,1,2)
plot(t,y3), title('Domínio do Tempo sem Trompete');


%audiowrite('mixed_semtrompete.wav',y3,Fs)