% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT 410 - SINAIS E SISTEMAS 
% JOÃO PEDRO ROSSI (90102) & THIAGO MENDES (93505)
% PRÁTICA 10

%%
%Exercício 4.1: filtro digital passa-baixa 400 Hz
close all;
clear all;
clc;

fs = 2000;
t = 0:1/fs:5;
s = sin(2*pi*262.62*t);
n = 0.1*randn(size(s));
sn = s + n;
subplot (211)
plot(t,sn)
title 'Senoide ruidosa'
xlabel 'tempo'

[N, Wn] = buttord(400/(fs/2), 600/(fs/2), 1, 35);
[B,A] = butter(N,Wn,'low');

y = filter(B,A,sn);
;subplot (212);plot(t,y);axis([0 0.04 -1.1 1.1]);title('Senoide filtrada')

[N, Wn] = buttord(400/(fs/2), 600/(fs/2), 1, 35)
[B,A] = butter(N,Wn,'low')

freqz(B,A,1024,fs)
title('Bode Filtro Butter')

y = filter(B,A,sn);
figure;plot(t,y);axis([0 0.04 -1.1 1.1]);title('Senoide filtrada')
soundsc(y,fs)

B = fir1(30,400/(fs/2))
freqz(B,1,1024,2000);
y = filter(B,1,sn);
figure;
figure;plot(t,y);; axis([0 0.04 -1.1 1.1])
soundsc(y,fs)

%OTIMIZAÇÃO COM KEISERORD
dev =[0.1 900]
fcuts=[30 400]
b=[2000000 0]
[n,Wn,beta,ftype] = kaiserord(fcuts,b,dev,fs)
hh = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');
figure;
freqz(hh,1,1024,fs)

%%

%2.2 Limpeza do áudio 1

clear all
close all
clc

sinal_R = audioread('1.wav');                  %SINAL RUIDOSO A SER TRABALHADO
Fs = 44100;                                           %FREQUÊNCIA DE AMOSTRAGEM
t = (0:1/Fs:20)';                                     %EIXO DO TEMPO DE ACORDO COM A FREQUENCIA DE AMOSTRAGEM

figure,plot(t,sinal_R,'r')                 %PLOT DO SINAL NO DOMINIO DO TEMPO
title('SINAL RUIDOSO')
xlabel('Tempo(s)')
ylabel('Magnitude')

L = length(sinal_R);                                  %TAMANHO DO SINAL
freq = (((-(L/2-1):L/2)/L)*Fs)';                      %DETERMINANDO O EIXO DA FREQUENCIA

SINAL_R = fft(sinal_R);                               %TRANSFORMADA FOURIER DO SINAL RUIDOSO
SINAL_R_SHIFT = fftshift(SINAL_R);                    %ESPECTRO DE FOURIER CENTRALIZADO

figure,plot(freq,abs(SINAL_R_SHIFT),'r')              %PLOT DO ESPECTRO DE FOURIER DO SINAL
title('SINAL RUIDOSO')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% ESPECTROGRAMA DO SINAL RUIDOSO
[S_sinal,F_sinal,T_sinal] = spectrogram(sinal_R,256,0,256,Fs);
figure,surf(T_sinal,F_sinal,10*log10(abs(S_sinal)),'EdgeColor','none');colorbar;
axis xy; axis tight; view(0,90);
title('SINAL RUIDOSO')
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')


parte_A = sinal_R(1:20*Fs);                          %PARTE A DA AMOSTRA COMPLETA 
L_A = length(parte_A);                                %TAMANHO DA AMOSTRA A
freq_A = (((-(L_A/2-1):L_A/2)/L_A)*Fs)';              %DETERMINANDO O EIXO DA FREQUENCIA

PARTE_A = fft(parte_A);                               %TRANSFORMADA FOURIER DA AMOSTRA A
PARTE_A_SHIFT = fftshift(PARTE_A);                    %ESPECTRO DE FOURIER CENTRALIZADO

figure,
plot(freq_A,abs(PARTE_A_SHIFT))                       %PLOT DO ESPECTRO DE FOURIER DA AMOSTRA A
title('PARTE A DO SINAL ANALISADA')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% ESPECTROGRAMA DO SINAL A FILTRADO
[S_parte_A,F_parte_A,T_parte_A] = spectrogram(parte_A,256,10,256,Fs);
figure,surf(T_parte_A,F_parte_A,10*log10(abs(S_parte_A)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
title('PARTE A')
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')

% FILTRAGEM

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_1 = 50/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_1 = 200/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_1,a_1] = cheby1(3,1,[rp_1 rs_1],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_1,a_1,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_1,a_1,parte_A);                      %APLICAÇÃO DO FILTRO

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_2 = 280/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_2 = 310/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_2,a_2] = cheby1(3,1,[rp_2 rs_2],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_2,a_2,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_2,a_2,parte_A);                      %APLICAÇÃO DO FILTRO

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_3 = 310/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_3 = 390/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_3,a_3] = cheby1(3,1,[rp_3 rs_3],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_3,a_3,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_3,a_3,parte_A);                      %APLICAÇÃO DO FILTRO

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_4 = 400/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_4 = 450/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_4,a_4] = cheby1(3,1,[rp_4 rs_4],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_4,a_4,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_4,a_4,parte_A);  

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 

rp_5 = 465/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_5 = 540/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_5,a_5] = cheby1(3,1,[rp_5 rs_5],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_5,a_5,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_5,a_5,parte_A); 

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 

rp_6 = 620/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_6 = 680/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_6,a_6] = cheby1(3,1,[rp_6 rs_6],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_6,a_6,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_6,a_6,parte_A); 

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 

rp_7 = 750/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_7 = 820/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_7,a_7] = cheby1(3,1,[rp_7 rs_7],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_7,a_7,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_7,a_7,parte_A); 

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 

rp_8 = 1350/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_8 = 1700/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_8,a_8] = cheby1(3,1,[rp_8 rs_8],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_8,a_8,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_8,a_8,parte_A); 

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 

rp_9 = 3500/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_9 = 4000/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_9,a_9] = cheby1(3,1,[rp_9 rs_9],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_9,a_9,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_9,a_9,parte_A); 

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_10 = 7000/(Fs/2);                                   %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_10 = 9500/(Fs/2);                                   %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_10,a_10] = cheby1(3,1,[rp_10 rs_10],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_10,a_10,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_10,a_10,y_A);                          %APLICAÇÃO DO FILTRO

% RESULTADO A
Y_A = fft(y_A);                                       %TRANSFORMADA FOURIER DA AMOSTRA FILTRADA
Y_A_SHIFT = fftshift(Y_A);                            %ESPECTRO DE FOURIER CENTRALIZADO

figure
plot(freq_A,abs(Y_A_SHIFT))                           %PLOT DO ESPECTRO DE FOURIER DO SINAL FILTRADO
title('SINAL FILTRADO NO DOMÍNIO DA FREQUÊNCIA')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% ESPECTROGRAMA DO SINAL A FILTRADO
[S_y_A,F_y_A,T_y_A] = spectrogram(y_A,256,10,256,Fs);
figure,surf(T_y_A,F_y_A,10*log10(abs(S_y_A)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
title('ESPECTROGRAMA DO SINAL FILTRADO')
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')
sound(y_A,Fs)


%%
% Limpeza audio 7


clear all
close all
clc

sinal_R = audioread('7.wav');                  %SINAL RUIDOSO A SER TRABALHADO
Fs = 44100;                                           %FREQUÊNCIA DE AMOSTRAGEM
t = (0:(1/Fs):20)';                                     %EIXO DO TEMPO DE ACORDO COM A FREQUENCIA DE AMOSTRAGEM
sinal_R = [sinal_R;0];
figure,plot(t,sinal_R,'r')                 %PLOT DO SINAL NO DOMINIO DO TEMPO
title('SINAL RUIDOSO')
xlabel('Tempo(s)')
ylabel('Magnitude')

L = length(sinal_R);                                  %TAMANHO DO SINAL
freq = (((-(L/2-1):L/2)/L)*Fs)';                      %DETERMINANDO O EIXO DA FREQUENCIA

SINAL_R = fft(sinal_R);                               %TRANSFORMADA FOURIER DO SINAL RUIDOSO
SINAL_R_SHIFT = fftshift(SINAL_R);                    %ESPECTRO DE FOURIER CENTRALIZADO

figure,plot(freq,abs(SINAL_R_SHIFT),'r')              %PLOT DO ESPECTRO DE FOURIER DO SINAL
title('SINAL RUIDOSO')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% ESPECTROGRAMA DO SINAL RUIDOSO
[S_sinal,F_sinal,T_sinal] = spectrogram(sinal_R,256,0,256,Fs);
figure,surf(T_sinal,F_sinal,10*log10(abs(S_sinal)),'EdgeColor','none');colorbar;
axis xy; axis tight; view(0,90);
title('SINAL RUIDOSO')
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')


parte_A = sinal_R(1:20*Fs);                          %PARTE A DA AMOSTRA COMPLETA 
L_A = length(parte_A);                                %TAMANHO DA AMOSTRA A
freq_A = (((-(L_A/2-1):L_A/2)/L_A)*Fs)';              %DETERMINANDO O EIXO DA FREQUENCIA

PARTE_A = fft(parte_A);                               %TRANSFORMADA FOURIER DA AMOSTRA A
PARTE_A_SHIFT = fftshift(PARTE_A);                    %ESPECTRO DE FOURIER CENTRALIZADO

figure,
plot(freq_A,abs(PARTE_A_SHIFT))                       %PLOT DO ESPECTRO DE FOURIER DA AMOSTRA A
title('PARTE A DO SINAL ANALISADA')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% ESPECTROGRAMA DO SINAL A FILTRADO
[S_parte_A,F_parte_A,T_parte_A] = spectrogram(parte_A,256,10,256,Fs);
figure,surf(T_parte_A,F_parte_A,10*log10(abs(S_parte_A)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
title('PARTE A')
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')

% FILTRAGEM

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_1 = 75/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_1 = 800/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_1,a_1] = cheby1(3,1,[rp_1 rs_1],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_1,a_1,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_1,a_1,parte_A);                      %APLICAÇÃO DO FILTRO


% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_2 = 4000/(Fs/2);                                    %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_2 = 10000/(Fs/2);                                    %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_2,a_2] = cheby1(3,1,[rp_2 rs_2],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_2,a_2,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_2,a_2,parte_A);  

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_3 = 9000/(Fs/2);                                   %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_3 = 11000/(Fs/2);                                   %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_3,a_3] = cheby1(3,1,[rp_3 rs_3],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_3,a_3,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_3,a_3,y_A);                          %APLICAÇÃO DO FILTRO

% FILTRO CHEBYSHEV1 - REJEITA FAIXA 
rp_4 = 3500/(Fs/2);                                   %FREQUENCIA DE CORTE INFERIOR NORMALIZADA
rs_4 = 4700/(Fs/2);                                   %FREQUENCIA DE CORTE SUPERIOR NORMALIZADA
[b_4,a_4] = cheby1(3,1,[rp_4 rs_4],'stop');           %DETERMINANDO OS PARAMENTROS DA FUNÇÃO TRANSFERENCIA DO FILTRO
figure,freqz(b_4,a_4,1024,Fs)                         %GRAFICO DE BODE DO FILTRO
title('FILTRO CHEBSHEV1 - REJEITA FAIXA')
y_A = filtfilt(b_4,a_4,y_A);

% RESULTADO A
Y_A = fft(y_A);                                       %TRANSFORMADA FOURIER DA AMOSTRA FILTRADA
Y_A_SHIFT = fftshift(Y_A);                            %ESPECTRO DE FOURIER CENTRALIZADO

figure
plot(freq_A,abs(Y_A_SHIFT))                           %PLOT DO ESPECTRO DE FOURIER DO SINAL FILTRADO
title('SINAL FILTRADO')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% ESPECTROGRAMA DO SINAL A FILTRADO
[S_y_A,F_y_A,T_y_A] = spectrogram(y_A,256,10,256,Fs);
figure,surf(T_y_A,F_y_A,10*log10(abs(S_y_A)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
title('ESPECTROGRAMA DO SINAL FILTRADO')
xlabel('Tempo(s)')
ylabel('Frequência (Hz)')
zlabel('Magnitude')
sound(y_A,Fs)