%% UNIVERSIDADE FEDERAL DE VI�OSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e M�rcio Von Rondow Campos

clc
clear all;
close all;

%% Pr�ticas 11 e 12

% Coer�ncia

time = 0:0.0005:2; %Vetor de tempo
sinal_A = sin(2*pi*2*time) + 0.5*sin(2*pi*8*time) + 0.1*randn; %Senoide ruidosa
sinal_B = sin(2*pi*2*time) + 0.5*sin(2*pi*8*time+(pi/2)) + 0.1*randn; %Senoide ruidosa defasada

[C,F] = mscohere(sinal_A,sinal_B,boxcar(1024),[],1024,1/0.0005); %Coer�ncia entre as senoides
figure; plot(F,C); axis([0 100 0 1.1]);
xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Coer�ncia entre os sinais');

%% WAV e MP3

[wav, fs1] = audioread('bird.wav'); %Arquivo de �udio .wav
[mp3, fs2] = audioread('birdmp3towav.wav'); %Arquivo de �udio convertido de .wav para .mp3 e de volta para .wav

sound(wav, fs1); sound(mp3, fs2);

[C,F] = mscohere(wav,mp3,boxcar(1024),[],1024,fs1); %Coer�ncia entre os sons
figure; plot(F,C); 
xlabel('Frequ�ncia (Hz)'); ylabel('Amplitude'); title('Coer�ncia entre os sinais de som');

%% Reamostragem de sinal

t1 = 0:1/10000:0.02; %Vetor de tempo 1
s1 = cos(2*pi*1000*t1); %Cossenoide de frequ�ncia 1000 Hz
figure; subplot(311); plot(t1,s1); xlabel('Tempo (s)'); ylabel('Amplitude'); title('Sinal sobre-amostrado (Fs = 10000 Hz)');

t2 = 0:1/2000:0.02; %Vetor de tempo 2
s2 = cos(2*pi*1000*t2); %Cossenoide de frequ�ncia 1000 Hz
subplot(312); plot(t2,s2); xlabel('Tempo (s)'); ylabel('Amplitude'); title('Sinal criticamente amostrado (Fs = 2000 Hz)');

t3 = 0:1/1500:0.02; %Vetor de tempo 3
s3 = cos(2*pi*1000*t3); %Cossenoide de frequ�ncia 1000 Hz
subplot(313); plot(t3,s3); xlabel('Tempo (s)'); ylabel('Amplitude'); title('Sinal sub-amostrado (Fs = 1500 Hz)');

%% Aliasing temporal

x = imread('spokes','tif');

%Girando Sentido Hor�rio

%Vari�veis auxiliares
fps = 24;
t_final = 3;
graus = 0;
gpf = 60;

for i=1:fps*t_final
    c = imrotate(x,-graus,'bilinear','crop');
    imshow(c);
    title(sprintf('FPS, angulo => d, %d.',fps,gpf));
    pause(1/fps)
    F(i) = getframe(gcf);
    graus = graus + gpf;
end

movie2avi(F,'wheel - 60 graus por frame','FPS',fps,'COMPRESSION','None'); %Gera��o do v�deo com 60 graus por frame

%Sem girar

%Vari�veis auxiliares
fps = 24;
t_final = 3;
graus = 0;
gpf = 90;

for i=1:fps*t_final
    c = imrotate(x,-graus,'bilinear','crop');
    imshow(c);
    title(sprintf('FPS, angulo => d, %d.',fps,gpf));
    pause(1/fps)
    F(i) = getframe(gcf);
    graus = graus + gpf;
end

movie2avi(F,'wheel - 90 graus por frame','FPS',fps,'COMPRESSION','None'); %Gera��o do v�deo com 90 graus por frame

%Girando Sentido Antihor�rio

%Vari�veis auxiliares
fps = 24;
t_final = 3;
graus = 0;
gpf = 120;

for i=1:fps*t_final
    c = imrotate(x,-graus,'bilinear','crop');
    imshow(c);
    title(sprintf('FPS, angulo => d, %d.',fps,gpf));
    pause(1/fps)
    F(i) = getframe(gcf);
    graus = graus + gpf;
end

movie2avi(F,'wheel - 120 graus por frame','FPS',fps,'COMPRESSION','None'); %Gera��o do v�deo com 120 graus por frame