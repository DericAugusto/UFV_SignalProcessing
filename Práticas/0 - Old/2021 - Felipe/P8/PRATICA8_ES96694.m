clear all; close all; clc;

%% Prática 8
% Felipe dos Anjos Rezende
% ES=96694

%% Função de correlação cruzada

fs = 1000; % frequencia de amostragem
t = 0:1/fs:1; % vetor tempo
x1 = sin(2*pi*10*t); % primeiro sinal
x2 = cos(2*pi*10*t); % segundo sinal
[Rx1x2,lags] = xcorr(x1,x2,'coeff'); % correlação cruzada entre x1 e x2
figure;
subplot(221);plot(t,x1,'b') % plota x1
subplot(222);plot(t,x2,'r') % plota x2
subplot(223);plot(lags,Rx1x2,'k'); % plota a correlação cruzada
axis([-1000 1000 -1 1]) % limita o tamanho do plot

r1 = randn(size(t)); % ruido1
r2 = randn(size(t)); % ruido2
Rr1r2 = xcorr(r1,r2,'coeff'); % correlação cruzada entre r1 e r2
figure
subplot(221);plot(t,r1,'b') % plota r1
subplot(222);plot(t,r2,'r') % plota r2
subplot(223);plot(lags,Rr1r2,'k'); % plota a correlação cruzada
axis([-1000 1000 -1 1]) % limita o tamanho do plot

mix = x1 + 3*r1; % Primeiro sinal acrescido do  ruído r1 
Rxx = xcorr(x1,mix,'coeff'); % correlação entre x1, com e sem ruído
figure
subplot(221);plot(t,x1,'b') % plota x1
subplot(222);plot(t,mix,'r');axis tight % plota mix
subplot(223);plot(lags,Rxx,'k'); % plota a correlação cruzada
axis([-1000 1000 -1 1]) % limita o tamanho do plot

%% Função de coerência

fs = 1024; % frequencia de amostragem
t = 0:1/fs:30; % vetor tempo
F = linspace(0,fs/2,length(t)/2); % Vetor linear do tempo
x = sin(2*pi*3*t) + sin(2*pi*7*t) + 3*randn(size(t)); % primeiro sinal
y = sin(2*pi*7*t) + sin(2*pi*11*t) + 3*randn(size(t)); % segundo sinal
X = abs(fft(x)); % modulo da transformada de x
Y = abs(fft(y)); % modulo da transformada de y

figure;
subplot(221);plot(t,x,'b') % Plota x
subplot(222);plot(t,y,'r') % Plota y
subplot(223);plot(F,X(1:length(F)),'b') % Plota a transformada de x
axis([0 20 0 max(X)]) % limita os eixos
subplot(224);plot(F,Y(1:length(F)),'r') % Plota a transformada de y
axis([0 20 0 max(Y)]) % limita os eixos

[Cxy,F] = mscohere(x,y,boxcar(1024),0,1024,fs); % Analisa a coerencia entre os sinais
figure;
plot(F,Cxy) % Plota a coerencia
axis([0 20 0 1])% Limita os eixos

%% Exercício
% I

alfa = 0.65;
T = 32;
x = 0;
n = 0:255;
for i = 1:length(n)
    if n(i)>=0 && n(i)<=1
        x(i) = 5;
    else
        x(i) = 0;
    end
end
for i = 1:length(n)
    if (n(i)-T)>=0 && (n(i)-T)<=1
        xd(i) = alfa*5;
    else
        xd(i) = 0;
    end
end

r = xd+randn(1,length(n));

figure
subplot(311); plot(n,x,'r'); title('Sinal de origem'); xlabel('tempo'); ylabel('Magnitude'); grid;
subplot(312); plot(n,xd,'y'); title('Sinal atenuado e atrasado'); xlabel('tempo'); ylabel('Magnitude'); grid;
subplot(313); plot(n,r,'g'); title('Sinal recebido'); xlabel('tempo'); ylabel('Magnitude'); grid;

figure
[Y,lags] = xcorr(r,x,'coeff');
Y = fliplr(Y);
R = Y(1:length(n));
Rrx = fliplr(R);
plot(n,Rrx); title('Correlação Cruzada: sinal recebido X Sinal de origem')

%% II

FS=2500;
f=[0 250 500 750 1000 1250];
m0=[1 1 1 0 0 0];
FH=f/(FS/2);
[b,a]=yulewalk(4,FH,m0);
[h,f]=freqz(b,a,1024);

% encontrando a resposta ao impulso
N=32;
delta=[1,zeros(1,N)];
h=filter(b,a,delta);
figure
subplot(211);
plot(h/max(h));
title('Resposta real ao impulso');
grid;

soma = 0;
for i = 1:150
    ruido = wgn(1,N,1);
    s = filter(b,a,ruido);
    [Y,lags] = xcorr(s,ruido,'coeff');
    soma = soma + Y;
end
Y = soma./150;
subplot(212);
plot(Y(32:63)/max(Y)); title('Correlação cruzada entre saida e entrada')
grid;