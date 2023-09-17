%UNIVERSIDADE FEDERAL DE VIÇOSA
%ELT 410 - SINAIS E SISTEMAS
%PRÁTICA 6
%JOÃO PEDRO ROSSI E THIAGO MENDES 
%90102 93505
%%
%SINTEZIDOR DE SOM
clc
clear all
close all

load('trumpet.mat'); % carrega trumpet
whos('trumpet.mat');
Fs=11025;
audiowrite('trumpet.wav',trumpet,Fs)

clc
clear all
close all
Fs=11025;
trumpet = load('trumpet.mat')
trumpet = trumpet.trumpet;

figure,plot(trumpet,'g')
title('Som Trumpet','FontSize',15)
axis tight

trumpet_1 = trumpet(1:11025);
trumpet_2 = trumpet(11025:22050);
trumpet_3 = trumpet(22050:33075);

audiowrite('trumpet_1.wav',trumpet_1,Fs);
audiowrite('trumpet_2.wav',trumpet_2,Fs);
audiowrite('trumpet_3.wav',trumpet_3,Fs);

figure,
subplot(311)
plot(trumpet_1)
title('Trecho 1 do Som Trumpet','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
axis tight
subplot(312)
plot(trumpet_2,'k')
title('Trecho 2 do Som Trumpet','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
axis tight
subplot(313)
plot(trumpet_3,'r')
title('Trecho 3 do Som Trumpet','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
axis tight
%%
% Trumpet no dominio da Frequencia
Fs = 11025; 
t = 0:1/Fs:1;
Y = fft(trumpet,512);
Ymag = abs(Y(1:257)); 
Yfas = angle(Y(1:257)); 
f = Fs*(0:256)/512; 
subplot(2,1,1)
plot(f, Ymag)
title('Espectro do Sinal no Dominio da Frequência')
xlabel('Frequência (Hz)')
ylabel('Módulo')
subplot(2,1,2)
plot(f, Yfas,'r')
title('Espectro do Sinal no Dominio da Frequência')
xlabel('Frequência (Hz)')
ylabel('Fase');

%%
%Pegando os CINCO picos de maiores valores e suas respectivas frequências. 
P5_Ymag = [37.75 65.11 52.24 52.59 38.99]';
P5_f =  [538.3 796.7 1055 1335 1593]';
Sinal_P5 = SomaFourierNorm(t,P5_f,P5_Ymag);

figure,
subplot(311)
plot(t,Sinal_P5,'k')
audiowrite('Sinal_P5.wav',Sinal_P5,Fs)
title('Sinal Reconstruido a partir dos 5 maiores picos','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
subplot(312)
plot(trumpet_1)
audiowrite('trumpet_1.wav',trumpet_1,Fs)
title('Trecho 1 do Som Trumpet','FontSize',15)
axis tight
subplot(313)
plot(trumpet_3,'r')
audiowrite('trumpet_3.wav',trumpet_3,Fs)
title('Trecho 3 do Som Trumpet','FontSize',15)
axis tight
%%
%Pegando os TRES E OS SETE picos de maiores valores e suas respectivas frequências. 
P3_Mag = P5_Ymag(1:3);
P3_f = P5_f(1:3);
Sinal_P3 = SomaFourierNorm(t,P3_f,P3_Mag);
P7_Mag = [P5_Ymag' 28.31 15.72]';
P7_f = [P5_f' 1852 2390]';
Sinal_P7 = SomaFourierNorm(t,P7_f,P7_Mag);

figure,
subplot(311)
plot(t,Sinal_P3)
audiowrite('Sinal_P3.wav',Sinal_P3,Fs)
title('Sinal Reconstruido a partir dos 3 maiores picos','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
subplot(312)
plot(t,Sinal_P5,'k')
title('Sinal Reconstruido a partir dos 5 maiores picos','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
subplot(313)
plot(t,Sinal_P7,'r')
audiowrite('Sinal_P7.wav',Sinal_P7,Fs)
title('Sinal Reconstruido a partir dos 7 maiores picos','FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
%%
%Adicionando Valores de Fase na Reconstrução do Sinal
P5_Fase = [0.8927 -1.71 1.73 2.24 -1.179]';
Sinal_P5_Fase_Unitario = SomaFourierNorm(t,P5_f,ones(length(P5_Fase),1),P5_Fase);
Sinal_P5_Fase = SomaFourierNorm(t,P5_f,P5_Ymag,P5_Fase);

figure,
subplot(311)
plot(t,Sinal_P5)
title({'Sinal Reconstruido a partir dos 5 maiores picos';'Sem Utilizar Fase'},'FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
subplot(312)
plot(t,Sinal_P5_Fase_Unitario,'r')
audiowrite('Sinal_P5_Fase_Unitario.wav',Sinal_P5_Fase_Unitario,Fs)
title({'Sinal Reconstruido a partir dos 5 maiores picos';'Utilizando Fase com Módulo Unitário'},'FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')
subplot(313)
plot(t,Sinal_P5_Fase,'k')
audiowrite('Sinal_P5_Fase.wav',Sinal_P5_Fase,Fs)
title({'Sinal Reconstruido a partir dos 5 maiores picos';'Utilizando Fase Normalmente'},'FontSize',15)
xlabel('Tempo(s)')
ylabel('Amplitude')