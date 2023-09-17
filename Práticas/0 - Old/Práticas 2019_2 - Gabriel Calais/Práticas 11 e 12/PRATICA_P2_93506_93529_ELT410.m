%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

%% Práticas 11 e 12

% Coerência

time = 0:0.0005:2; %Vetor de tempo
sinal_A = sin(2*pi*2*time) + 0.5*sin(2*pi*8*time) + 0.1*randn; %Senoide ruidosa
sinal_B = sin(2*pi*2*time) + 0.5*sin(2*pi*8*time+(pi/2)) + 0.1*randn; %Senoide ruidosa defasada

[C,F] = mscohere(sinal_A,sinal_B,boxcar(1024),[],1024,1/0.0005); %Coerência entre as senoides
figure; plot(F,C); axis([0 100 0 1.1]);
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Coerência entre os sinais');

%% WAV e MP3

[wav, fs1] = audioread('bird.wav'); %Arquivo de áudio .wav
[mp3, fs2] = audioread('birdmp3towav.wav'); %Arquivo de áudio convertido de .wav para .mp3 e de volta para .wav

sound(wav, fs1); sound(mp3, fs2);

[C,F] = mscohere(wav,mp3,boxcar(1024),[],1024,fs1); %Coerência entre os sons
figure; plot(F,C); 
xlabel('Frequência (Hz)'); ylabel('Amplitude'); title('Coerência entre os sinais de som');

%% Reamostragem de sinal

t1 = 0:1/10000:0.02; %Vetor de tempo 1
s1 = cos(2*pi*1000*t1); %Cossenoide de frequência 1000 Hz
figure; subplot(311); plot(t1,s1); xlabel('Tempo (s)'); ylabel('Amplitude'); title('Sinal sobre-amostrado (Fs = 10000 Hz)');

t2 = 0:1/2000:0.02; %Vetor de tempo 2
s2 = cos(2*pi*1000*t2); %Cossenoide de frequência 1000 Hz
subplot(312); plot(t2,s2); xlabel('Tempo (s)'); ylabel('Amplitude'); title('Sinal criticamente amostrado (Fs = 2000 Hz)');

t3 = 0:1/1500:0.02; %Vetor de tempo 3
s3 = cos(2*pi*1000*t3); %Cossenoide de frequência 1000 Hz
subplot(313); plot(t3,s3); xlabel('Tempo (s)'); ylabel('Amplitude'); title('Sinal sub-amostrado (Fs = 1500 Hz)');

%% Aliasing temporal

x = imread('spokes','tif');

%Girando Sentido Horário

%Variáveis auxiliares
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

movie2avi(F,'wheel - 60 graus por frame','FPS',fps,'COMPRESSION','None'); %Geração do vídeo com 60 graus por frame

%Sem girar

%Variáveis auxiliares
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

movie2avi(F,'wheel - 90 graus por frame','FPS',fps,'COMPRESSION','None'); %Geração do vídeo com 90 graus por frame

%Girando Sentido Antihorário

%Variáveis auxiliares
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

movie2avi(F,'wheel - 120 graus por frame','FPS',fps,'COMPRESSION','None'); %Geração do vídeo com 120 graus por frame