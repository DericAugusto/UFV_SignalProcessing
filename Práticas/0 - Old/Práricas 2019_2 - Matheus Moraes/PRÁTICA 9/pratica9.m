% Universidade Federal de Viçosa - UFV
% Departamento de Engenharia Elétrica - DEL
% ELT 410 - PROCESSAMENTO DIGITAL DE SINAIS
% Thiago Mendes de Ávila 93505
% João Pedro Rossi 90102
% PRÁTICA 9

%% EXERCICIO 2
clc
clear all
close all

fs = 1000;
t = 0:1/fs:3;
f0 = 150;
t1 = 3;
f1 = 450;
B = (f1-f0)/t1;

y = cos(2*pi*(f0*t + B/2*t.^2));
Y = abs(fft(y));
F = linspace(0,fs/2,round(length(y)/2));

plot(F,Y(1:round(length(y)/2)),'k')
title 'Sinal Y plotado no domínio da frequência '
xlabel('Frequência (Hz)')
ylabel('Magnitude')

[S,F,T] = spectrogram(y,256,20,256,fs);
figure,surf(T,F,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; %view(90,0);
title 'Espectograma do sinal Y'
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')

%% EXERCICIO 3.1
[a,F] = audioread('lena.wav');
% sound(a,F)

[S,F,T] = spectrogram(a,256,20,256,fs);

figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')
colormap gray
%% ouvindo imagens
% alphix
[a,fs] = audioread('02AphexTwin.wav');
whos('02AphexTwin.wav')



% sound(a,F)

[S,F,T] = spectrogram(a,256,20,256,fs);

figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none');

axis xy; axis tight; view(0,90);
axis([326 338 0 22050]);
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')
colormap gray
%%
% Look
[a,F] = audioread('VenetianSnaresLook.wav');
o=a(:,1);
% sound(a,F)

[S,F,T] = spectrogram(o,256,20,256,fs);

figure
surf(T,F,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')
colormap gray

%% EXERCICIO 3.1 
%close all
whale = load('whalecalls.mat');

canto1 = [whale.X1(1,:) whale.X1(2,:) whale.X1(3,:) whale.X1(4,:) whale.X1(5,:)];
canto2 = [whale.X2(1,:) whale.X2(2,:) whale.X2(3,:) whale.X2(4,:) whale.X2(5,:)];


[S_canto1,F_canto1,T_canto1] = spectrogram(canto1,256,20,256,whale.fs);

figure
surf(T_canto1,F_canto1,10*log10(abs(S_canto1)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
title 'Canto 1'
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')
%colormap gray

[S_canto2,F_canto2,T_canto2] = spectrogram(canto2,256,20,256,whale.fs);

figure
surf(T_canto2,F_canto2,10*log10(abs(S_canto2)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
title 'Canto 2'
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')
%colormap gray
