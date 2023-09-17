%% Boas praticas
clearvars;close all; close all;


%% 2.1 Comparando dois sinais
time = [0:0.0005:2];
sinal_A = sin(2*pi*2*time) + 0.5*sin(2*pi*8*time);
sinal_B = sin(2*pi*2*time) + 0.5*sin(2*pi*8*time+90*pi/180);

fs = 1/0.0005;
F = linspace(0,fs/2,length(time)/2);
% 0:fs/s:length(time)/2

A = abs(fft(sinal_A));
B = abs(fft(sinal_B));


[Cab,Fc]  = mscohere(A,B, numel(time));
% , 500, 1024, fs);

A = A(1:round(length(sinal_A)/2-1));
B = B(1:round(length(sinal_B)/2-1));
%% sinais no tempo
figure(1)
subplot(211)
plot(time, sinal_A)
title('sin(2\pi\cdot 2t) + 0.5sin(2\pi\cdot 8t)')
ylabel('Original')
grid on
axis tight
subplot(212)
plot(time, sinal_B)
ylabel('Defasada')
xlabel('Tempo [s]')
grid on
axis tight

%% sinais na freq e coe.
figure(2)
subplot(311)
plot(F,A)
title('Coerência entre sinais defasados')
ylabel('Magnitude A')
axis tight
xlim([0,10])
grid on

subplot(312)
plot(F,B)
ylabel('Magnitude B')
axis tight
xlim([0,10])
grid on

subplot(313)
plot(Fc,Cab)
ylabel('Coerência')
xlabel('Frequência [Hz]')
axis tight
ylim([0.9999 1.0001])
% xlim([0,10])
grid on

%% mag e fas
A2 = fft(sinal_A);
B2 = fft(sinal_B);

magA = abs(A2);
magB = abs(B2);
fasA = (angle(A2))*180/pi;
fasB = (angle(A2))*180/pi;

magA = magA(1:round(length(sinal_A)/2-1));
magB = magB(1:round(length(sinal_A)/2-1));
fasA = fasB(1:round(length(sinal_B)/2-1));
fasB = fasB(1:round(length(sinal_B)/2-1));

F = linspace(0,fs/2,length(time)/2);

figure(3)
subplot(221)
plot(F,magA)
title('Sinal A')
ylabel('Magnitude A')
axis tight
xlim([0,10])
grid on 

subplot(223)
plot(F,fasA)
ylabel('Fase A [ º]')
axis tight
xlim([0,10])
ylim([-1,1].*100)
grid on 

subplot(222)
plot(F,magB)
title('Sinal B')
ylabel('Magnitude B')
axis tight
xlim([0,10])
grid on 

subplot(224)
plot(F,fasB)
ylabel('Fase B [ º]')
axis tight
xlim([0,10])
    ylim([-1,1].*100)
grid on 

%% 2.2 Diferença WAV e MP3
filename = 'bird.wav';
[y,Fs] = audioread(filename);
% sound(y,Fs)

%%
filename2 = 'birdmp3towav.wav';
[y2,Fs2] = audioread(filename2);
% sound(y2,Fs2)

%%
Fy = linspace(0,Fs/2,length(y)/2);

Y = abs(fft(y));
Y2 = abs(fft(y2));

[Cyy2,Fcy]  = mscohere(Y,Y2,512);

Y = Y(1:round(length(y)/2-1));
Y2 = Y2(1:round(length(y2)/2-1));

%%
figure(4)
subplot(311)
plot(Fy,Y)
title('Coerência entre os áudios')
ylabel('Magnitude')
axis tight
% xlim([0,10])
legend('original')
grid on

subplot(312)
plot(Fy,Y2)
ylabel('Magnitude')
axis tight
% xlim([0,10])
legend('reconvertido')
grid on

subplot(313)
plot(Fcy,Cyy2)
ylabel('Coerência')
xlabel('Frequência [Hz]')

% ylim([0.9999 1.0001])
% xlim([0,10])
axis tight
grid on

figure(5)
plot(Fy,abs(Y-Y2))
title('Diferença absoluta entre os áudios')
ylabel('Magnitude')
axis tight
legend('original')
grid on
xlabel('Frequência [Hz]')






%% 
figure(6)
[C,LAGS] = xcorr(A,B);
stem(LAGS,C)
xlim([0,100])
grid on




















