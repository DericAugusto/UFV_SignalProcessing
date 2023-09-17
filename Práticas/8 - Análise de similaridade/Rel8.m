%Função correlação cruzada

clc; close all; clear all;


fs = 1000;
t = 0:1/fs:1;
x1 = sin(2*pi*10*t);
x2 = cos(2*pi*10*t);
[Rx1x2,lags] = xcorr(x1,x2,'coeff');
figure;
subplot(221);plot(t,x1,'b')
subplot(222);plot(t,x2,'r')
subplot(223);plot(lags,Rx1x2,'k');
axis([-1000 1000 -1 1])

r1 = randn(size(t));
r2 = randn(size(t));
Rr1r2 = xcorr(r1,r2,'coeff');
%figure
%subplot(2,2,1);plot(t,r1,'b')
%subplot(2,2,2);plot(t,r2,'r')
%subplot(2,2,3);plot(lags,Rr1r2,'k');
%axis([-1000 1000 -1 1])

mix = x1 + 3*r1;
Rxx = xcorr(x1,mix,'coeff');
%figure
%subplot(2,2,1);plot(t,x1,'b')
%subplot(2,2,2);plot(t,mix,'r'); %axis tight
%subplot(2,2,3);plot(lags,Rxx,'k');
%axis([-1000 1000 -1 1])

%%

%Função de coerência%
clc; close all; clear all;
fs = 1024;
t = 0:1/fs:30;
F = linspace(0,fs/2,length(t)/2);
x = sin(2*pi*3*t) + sin(2*pi*7*t) + 3*randn(size(t));
y = sin(2*pi*7*t) + sin(2*pi*11*t) + 3*randn(size(t));
X = abs(fft(x));
Y = abs(fft(y));

figure;
subplot(2,2,1);plot(t,x)
subplot(2,2,2);plot(t,y)
subplot(2,2,3);plot(F,X(1:length(F)))
axis([0 20 0 max(X)])
subplot(2,2,4);plot(F,Y(1:length(F)))
axis([0 20 0 max(Y)])

[Cxy,F] = mscohere(x,y,boxcar(1024),0,1024,fs);
figure; subplot(2,1,1); plot(F,Cxy)
[Rxx,lagg] = xcorr(X,Y,'coeff');
subplot(2,1,2); plot(lagg, Rxx)
axis([0 20 0 1])

%%
%Exercício 1%
fs = 255;
t = 0:fs;
w0 = 3.5;
alfa = 0.65;
alfa2 = 1;
bin = 40;
r = randn(1,256);
x = zeros(1,256);
x(bin) = 20;
y = zeros(1,length(x));
y(33:256) = x(1:224)*alfa + r(33:256)*alfa2;
y(1:31) = r(1:31)*alfa2;

figure;
subplot(2,2,1); plot(t,x)
title('Sinal x'), xlabel('Amostras [n]'), ylabel('x[n]')
axis tight
grid on
subplot(2,2,3:4); plot(t,y)
title('Sinal atrasado em 32 amostras'), xlabel('Amostras [n]'), ylabel('y[n]')
axis tight
grid on
subplot(2,2,2); plot(t,r)
title('Ruido'), xlabel('Amostras [n]'), ylabel('r[n]')
axis tight
grid on

N = 256;
[Y,lag]=xcorr(y,x);
R=Y(1:N);
Rrx=fliplr(R);
figure;
plot(lag,Y)
axis tight
grid on
title('Correlação entre sinal enviado e recebido')
xlabel('Atraso')

%%
%Exercício 2%
% definindo um filtro passa-baixa simples
FS=2500;
fHz=[0 250 500 750 1000 1250];
m0=[1 1 1 0 0 0];
FH=fHz/(FS/2);
[b,a]=yulewalk(4,FH,m0);
[h,f]=freqz(b,a,1024);
% encontrando a resposta ao impulso
N=32;
delta=[1,zeros(1,N)]; % define o impulso
h=filter(b,a,delta); % inpulso como entrada
subplot(3,1,1);

plot(h/max(h)); % Plot resposta normalizada
ylabel('y[n]')
title('Resposta real ao impulso');
grid on;
axis tight

i = 1;
C = 0;
q = 0;
while i<=150
    r = randn(1,33); 
    hh=filter(b,a,r);
    C=xcorr(hh,r);
    R=C(33:end);
    q = R +q;
    i = i+1;
end
q = q./150;
subplot(3,1,2), plot(q/max(q))
ylabel('y[n]')
title('Resposta ao impulso pela correlação')
grid on 
axis tight
subplot(3,1,3), plot((h/max(h) - q/max(q))./(q/max(q)),'r')
xlabel('Amostras [n]'), ylabel('Erro [%]')
grid on 

