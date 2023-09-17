clear all; close all; clc;

%% Prática 12
% Felipe dos Anjos Rezende
% ES=96694

%%  Roteiro
% I

fs = 2000; % Frequencia de amostragem
t = 0:1/fs:5; % Vetor tempo
s = sin(2*pi*262.62*t); % Sinal
n = 0.1*randn(size(s)); % Ruído
sn = s + n; % Soma o sinal com o ruído
figure;plot(t,sn);axis([0 0.04 -1.1 1.1]);title('Original'); % Plota sn
soundsc(sn,fs) % Ouve sn
pause(10); % Pausa o código

[N, Wn] = buttord(400/(fs/2), 600/(fs/2), 1, 35);% filto Butterworth
[B,A] = butter(N,Wn,'low');
figure; freqz(B,A,1024,fs); % Plota a resposta em frequencia

y = filter(B,A,sn); % Filtrando com filter
figure;plot(t,y);axis([0 0.04 -1.1 1.1]);title('Filtro filter'); % Plota y
soundsc(y,fs) % Ouve y
pause(10); % Pausa o código

y = filtfilt(B,A,sn); % Filtrando com filtfilt
figure;plot(t,y);axis([0 0.04 -1.1 1.1]);title('Filtro filtfilt'); % Plota y
soundsc(y,fs) % Ouve y
pause(10); % Pausa o código

B = fir1(30,400/1000); % Filtro FIR
figure; freqz(B,1,1024,2000); % Plota a resposta em frequencia
y = filter(B,A,sn); % Filtrando com filter
figure;plot(t,y); axis([0 0.04 -2 2]);title('Filtro FIR'); % Plota y
soundsc(y,fs) % Ouve y
pause(10); % Pausa o código


%% II
fs=20000;
[audio1,fs1] = audioread('1.wav');
soundsc(audio1,fs1);
pause(25);

[N, Wn] = buttord(400/(fs/2), 600/(fs/2), 1, 35);% filto Butterworth
[B,A] = butter(N,Wn,'low');

y = filter(B,A,audio1); % Filtrando com filter
soundsc(y,fs1); % Ouve y
pause(25);

[audio2,fs2] = audioread('7.wav');
soundsc(audio2,fs2);
pause(25);

[N, Wn] = buttord(400/(fs/2), 600/(fs/2), 1, 35);% filto Butterworth
[B,A] = butter(N,Wn,'low');

y = filter(B,A,audio2); % Filtrando com filter
soundsc(y,fs2); % Ouve y


