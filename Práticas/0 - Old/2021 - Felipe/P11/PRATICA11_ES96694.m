clear all; close all; clc;

%% Prática 11
% Felipe dos Anjos Rezende
% ES=96694

%%  Roteiro
% I

time = [0:0.0005:2];
sinal_A = sin(2*pi*2*time) + 0.5*sin(2*pi*8*time);
sinal_B = sin(2*pi*2*time) + 0.5*sin(2*pi*8*time+pi/2);
fs = 1/0.0005;

figure
subplot(211);plot(time,sinal_A,'g'); title('Sinal A'); xlabel('time')
subplot(212);plot(time,sinal_B,'y'); title('Sinal B'); xlabel('time')

[Cxy,F] = mscohere(sinal_A,sinal_B,boxcar(1024),0,1024,fs);
figure;plot(F,Cxy,'r');title('Coerência') ;xlabel('frequência');
axis([0 15 0 1.5]);

%% II

[audio1,fs1] = audioread('bird.wav');
[audio2,fs2] = audioread('birdmp3towav.wav');
figure;
subplot(2,1,1);plot(audio1,'g'); title('WAV');
subplot(2,1,2);plot(audio2,'y'); title('mp3');

%sound(audio1,fs1);
%pause(25);
%sound(audio2,fs2);
%%
[Cxy,F] = mscohere(audio1,audio2,boxcar(1024),0,50000,fs1);
figure;plot(F,Cxy,'r');title('Coerência entre os áudios'); xlabel('frequência')
axis([0 10000 0 0.5])