%% Prática 12 - Alexandre Caldeira
clearvars;close all; clc;

%% 

fs = 2000;
t = 0:1/fs:5;
s = sin(2*pi*262.62*t);
n = 0.1*randn(size(s));
sn = s + n;

figure(6)
plot(t(1:80),s(1:80))
title('Sinal original')

[N, Wn] = buttord(400/(fs/2), 600/(fs/2), 1, 35);
[B,A] = butter(N,Wn,'low');

figure(1)
freqz(B,A,1024,fs)
title('Butterworth')
% Filtrando com filter

y = filter(B,A,sn);
figure(2);
plot(t,y);axis([0 0.04 -1.1 1.1]);title('Butterworth usando filter')
soundsc(y,fs)

% Filtrando com filtfilt
y = filtfilt(B,A,sn);

figure(3);
plot(t,y);axis([0 0.04 -1.1 1.1]);title('Butterworth usando filtfilt')
soundsc(y,fs)

% passa-baixa FIR de ordem 20 e corte em 400 Hz
B = fir1(30,400/1000);

figure(4)
freqz(B,1,1024,2000)
title('firl')
y = filter(B,A,sn);

figure(5);
plot(t,y); axis([0 0.04 -1.1 1.1])
title('firl')
soundsc(y,fs)

%%pendente
% Tente agora otimizar a ordem do FIR equivalente ao IIR acima. Use,
% por exemplo, a função kaiserord.

    
%%
filename1 = '1.wav';
filename2 = '7.wav';
[y1, fs1]= audioread(filename1);
[y2, fs2]= audioread(filename2);

%%
% sound(y1,fs1)

%%
sound(y2,fs2)

%%
[S,F2,T] = espectrograma(y1,256,1,20*256,fs1);

figure(4)
surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');
zlabel('Magnitude')
title('Espectrograma Sinal 1.wav Original')
grid on

%%
[S7,F7,T7] = espectrograma(y2,256,1,20*256,fs2);

figure(5)
surf(T7,F7,10*log10(abs(S7)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');
zlabel('Magnitude')
title('Espectrograma Sinal 7.wav Original')
grid on

%%
Rp = 1; Rs = 12;
Ws = (10^4).*[0.75 0.95]./(fs1/2); Wp = (10^4).*[.7 1]./(fs1/2);
[N, Wn] = buttord(Wp, Ws, Rp, Rs);
[B,A] = butter(N,Wn,'stop');
    
%%pendente
% filtrar ruido que acontece somente em parte do sinal no tempo

figure(11)
freqz(B,A,1024,fs1)
title('Butterworth')

y11 = filtfilt(B,A,y1);
figure(12);
plot(y11);title('Butterworth usando filter')
% axis([0 0.04 -1.1 1.1]);
soundsc(y11,fs1)
%%
figure(13);
[S7,F7,T7] = espectrograma(y11,256,1,20*256,fs1);
surf(T7,F7,10*log10(abs(S7)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');
zlabel('Magnitude')
title('Espectrograma Sinal 1.wav Filtrado')
grid on



%%
Rp = 1; Rs = 12;
Ws = (10^4).*[0.3 1.3]./(fs2/2); Wp = (10^4).*[.25 1.5]./(fs2/2);
[N, Wn] = buttord(Wp, Ws, Rp, Rs);
[B,A] = butter(N,Wn,'stop');


figure(21)
freqz(B,A,1024,fs2)
title('Butterworth aplicado no Sinal 7.wav')

y21 = filter(B,A,y2);
% figure(22);
% plot(y21);title('Butterworth usando filter')
% axis([0 0.04 -1.1 1.1]);
% soundsc(y21,fs2)

figure(23);
[S7,F7,T7] = espectrograma(y21,256,1,20*256,fs2);
surf(T7,F7,10*log10(abs(S7)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');
zlabel('Magnitude')
title('Espectrograma Sinal 7.wav Filtrado')
grid on

