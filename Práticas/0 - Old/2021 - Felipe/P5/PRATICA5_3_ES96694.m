clear all; close all; clc;

%% Prática 5
% Felipe dos Anjos Rezende
% ES=96694

%% Exercício
%III

trumpet = load ('trumpet.mat');
y = trumpet.y;
fs = trumpet.Fs;
sound(y,fs);

slice = floor(size(y)/3);
figure
subplot(3,1,1);
plot(y(1:slice(1)))
subplot(3,1,2);
plot(y(slice(1):size(y)-slice(1)))
subplot(3,1,3);
plot(y(size(y)-slice(1):end))

Fs = 11025;
Y = fft(trumpet.y, 512);
Ymag = abs(Y);
f = Fs * (0:256)/512;
figure
stem(f, Ymag(1:257));
xlabel('Frequência');
ylabel('Magnitude');
%%
mag = [0.2067 0.1887 0.0997 0.0961 0.0738];
freq = [21.53 86.13 43.07 0 107.7];
Fs = 11025;
t = 0:1/Fs:length(y)/Fs;
s=somacos(mag,freq,t);
figure
plot(t,s)
soundsc(s,Fs)