% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT 410 - SINAIS E SISTEMAS 
% JOÃO PEDRO ROSSI (90102) & THIAGO MENDES (93505)
% PRÁTICA 11

clc
clear all
close all

%% Reamostragem de sinal (Fs --> Sampling Rate)

%SINAL SOBRE-AMOSTRADO
f = 1000;
T = 1/f;
Fs_SOBRE = 10000; 
t_SOBRE = 0:1/Fs_SOBRE:20*T;
y_SOBRE = cos(2*pi*f*t_SOBRE);
figure,
subplot(311)
plot(t_SOBRE,y_SOBRE)
title('Sinal Sobre-Amostrado com Fs = 10kHz','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')

%SINAL AMOSTRADO NA FREQUENCIA DE NYQUIST
Fs_NY = 2000;
t_NY = 0:1/Fs_NY:20*T;
y_NY = cos(2*pi*f*t_NY);
subplot(312),plot(t_NY,y_NY,'r')
title('Sinal Amostrado com Fs = 2kHz (Nyquist)','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')

%SINAL SUB-AMOSTRADO 
Fs_SUB = 1500;
t_SUB = 0:1/Fs_SUB:20*T;
y_SUB = cos(2*pi*f*t_SUB);
subplot(313),plot(t_SUB,y_SUB,'k')
title('Sinal Sub-Amostrado com Fs = 1,5kHz','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')

%% Aliasing Temporal 

clear all
close all
clc

x = imread('spokes','tif');
n = 2.5;
fps = 24; %FRAMES POR SEGUNDO
t_final = 3;%DURAÇÃO DO VIDEO
graus = 0;%POSIÇÃO INICAL
gpf = 12*n;%GRAUS POR FRAME

for i=1:fps*t_final
    c = imrotate(x,-graus,'bilinear','crop');
    imshow(c);
    title(sprintf('FPS, angulo => %d,%d.',fps,gpf));
    pause(1/fps)
    graus = graus + gpf;
end
