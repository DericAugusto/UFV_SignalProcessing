%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

%% Trabalho Prático Final 

% Analisando o sinal e seu espectro em frequência

[x, Fs] = audioread('T2G2.wav'); %Carrega o arquivo de som
% sound(x,Fs); %Reproduz o arquivo de som
t = 0:1/Fs:(length(x)-1)/Fs;
L = length(x); %Calcula o tamanho do sinal

X = fft(x); %Calcula a Transformada de Fourier do sinal
pfreq = (0:L/2)*Fs/L; %Vetor de frequências somente com o espectro positivo
figure; plot(pfreq,abs(X(1:L/2+1))); %Plota a resposta em frequência (amplitude) para frequências positivas
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Espectro em frequência para frequências positivas');

[S,F,T] = spectrogram(x,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma do áudio');

%% Parte 1

w = x(1:386252,:); %Primeira parte do vetor de áudio

[S,F,T] = spectrogram(w,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - parte 1 do áudio');

%Filtragem corta-faixa do "apito"

[N, Wn] = buttord([600/(Fs/2) 1000/(Fs/2)], [700/(Fs/2) 900/(Fs/2)], 1, 10);
[B,A] = butter(N,Wn,'stop');
figure; freqz(B,A,1024,Fs); title('Diagrama de Bode Filtro Rejeita-Faixa (apito)');
w1 = filtfilt(B,A,w);

[S,F,T] = spectrogram(w1,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma do áudio');

%Filtragem corta-faixa do "chiado"

[N, Wn] = buttord([1800/(Fs/2) 5000/(Fs/2)], [2000/(Fs/2) 4800/(Fs/2)], 3, 5);
[B,A] = butter(N,Wn,'stop');
figure; freqz(B,A,1024,Fs); title('Diagrama de Bode Filtro Rejeita-Faixa (chiado)');
w2 = filtfilt(B,A,w1);

[S,F,T] = spectrogram(w2,512,80,512,Fs); %Faz o espectrograma do sinal 1
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - parte 1 após filtragem');

%% Parte 2
y = x(386253:772460,:); %Segunda parte do vetor de áudio

[S,F,T] = spectrogram(y,512,160,512,Fs); %Faz o espectrograma do sinal 1
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - parte 2 do áudio');

%Filtragem corta-faixa do "apito"

[N, Wn] = buttord([100/(Fs/2) 550/(Fs/2)], [200/(Fs/2) 450/(Fs/2)], 2, 5);
[B,A] = butter(N,Wn,'stop');
figure; freqz(B,A,1024,Fs); title('Diagrama de Bode Filtro Rejeita-Faixa (apito)');
y1 = filtfilt(B,A,y);

[S,F,T] = spectrogram(y1,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma do áudio');

%Filtragem corta-faixa do "chiado"

[N, Wn] = buttord([4500/(Fs/2) 8500/(Fs/2)], [4750/(Fs/2) 8250/(Fs/2)], 3, 10);
[B,A] = butter(N,Wn,'stop');
figure; freqz(B,A,1024,Fs); title('Diagrama de Bode Filtro Rejeita-Faixa (chiado)');
y2 = filtfilt(B,A,y1);

[S,F,T] = spectrogram(y2,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - parte 2 após filtragem');

%% Parte 3
z = x(772461:858240,:); %Terceira parte do vetor de áudio

[S,F,T] = spectrogram(z,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - parte 3 do áudio');

z1 = z; z2 = z; z3 = z; %Vetores auxiliares

%Filtragem do chirp

n=0.1; %Intervalo de passo dos loop's

%Primeira filtragem corta-faixa do chirp

for t = 0:n:1.8
    ww = 2900 - 1550*t;
    if t+n >= 1.8
         t1 = round(t*Fs+1:1.936*Fs);
    else
        t1 = round(t*Fs+1:(t+n)*Fs);
    end
    [N, Wn] = buttord([(ww-100)/(Fs/2) (ww+180)/(Fs/2)], [(ww-90)/(Fs/2) (ww+150)/(Fs/2)],5, 6.5);
    [B,A] = butter(N,Wn,'stop');
    z1(t1) = filtfilt(B,A,z(t1));
end

%Filtragem corta-faixa do chirp deslocada meio passo

for t = 0:n:1.8
    ww = 3000 - 1550*t;
    if t+n >= 1.8
        t1 = round(t*Fs+1:1.936*Fs);
    else
        t1 = round((t+0.05)*Fs+1:(t+0.05+n)*Fs);
    end
    [N, Wn] = buttord([(ww-109)/(Fs/2) (ww+180)/(Fs/2)], [(ww-104)/(Fs/2) (ww+150)/(Fs/2)],5, 6);
    [B,A] = butter(N,Wn,'stop');
    z2(t1) = filtfilt(B,A,z1(t1));
end

%Filtragem corta-faixa final do chirp

for t = 0:n:1.8
    ww = 2900 - 1550*t;
    if t+n >= 1.8
         t1 = round(t*Fs+1:1.936*Fs);
    else
        t1 = round(t*Fs+1:(t+n)*Fs);
    end
    [N, Wn] = buttord([(ww-100)/(Fs/2) (ww+180)/(Fs/2)], [(ww-90)/(Fs/2) (ww+150)/(Fs/2)],5, 6.5);
    [B,A] = butter(N,Wn,'stop');
    z3(t1) = filtfilt(B,A,z2(t1));
end

[S,F,T] = spectrogram(z3,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma - parte 3 após filtragem');

%% Final

a = [w2;y2;z3]; %Áudio completo concatenando os vetores filtrados

[S,F,T] = spectrogram(a,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma do áudio completo');

%Filtragem passa-faixa para atenuar o ruído branco

[N, Wn] = buttord([100/(Fs/2) 2500/(Fs/2)], [350/(Fs/2) 2000/(Fs/2)], 10,25);
[B,A] = butter(N,Wn,'bandpass');
figure; freqz(B,A,1024,Fs); title('Diagrama de Bode - Filtro Passa-Faixa');
aa = filtfilt(B,A,a);
sound(aa,Fs); %Reproduz o áudio
audiowrite('T2G2_filtrado.wav',aa,Fs); %Salva o arquivo de áudio em formato .wav

A = fft(aa); %Calcula a Transformada de Fourier do sinal
pfreq = (0:L/2)*Fs/L; %Vetor de frequências somente com o espectro positivo
figure; plot(pfreq,abs(A(1:L/2+1))); %Plota a resposta em frequência (amplitude) para frequências positivas
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Espectro em frequência para frequências positivas');

[S,F,T] = spectrogram(aa,512,80,512,Fs); %Faz o espectrograma do sinal
figure; surf(T,F,10*log10(abs(S)),'EdgeColor','none'); %Plota o espectrograma
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)'); ylabel('Frequencia (Hz)'); title('Espectrograma final do áudio');

s = audioread('let-it-be.wav'); %Importação do áudio sem ruído

%Cálculo e plotagem da coerência entre sinal sem ruído e sinal após a filtragem

[C,F] = mscohere(aa,s,boxcar(1024),[],1024,Fs);
figure; plot(F,C); axis([0 22000 0 1]);
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Coerência entre o sinal após a filtragem e a música original');