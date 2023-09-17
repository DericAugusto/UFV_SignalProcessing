%% UNIVERSIDADE FEDERAL DE VI�OSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e M�rcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Pr�tica 5

%Fun��o de Correla��o Cruzada

%Correla��o entre senoide e cossenoide

fs = 256;
fo = 8;
tmax = 16;
t = 0:1/fs:tmax;
x1 = sin(2*pi*fo*t); %Cria sinal de senoide
x2 = cos(2*pi*fo*t); %Cria sinal de cossenoide
[Rx1x2,lags] = xcorr(x1,x2,'coeff'); %Calcula a correla��o entre a senoide e a cossenoide
figure;
subplot(3,1,1); plot(t,x1,'b'); xlabel('Amostra (s)'); ylabel('Amplitude'); title('Senoide');
axis([0 3 -1 1]); %Define o tamanho dos eixos plotados
subplot(3,1,2); plot(t,x2,'r'); xlabel('Amostra (s)'); ylabel('Amplitude'); title('Cossenoide');
axis([0 3 -1 1]);
subplot(3,1,3); plot(lags,Rx1x2,'k'); xlabel('Posi��o do dado'); ylabel('Amplitude'); title('Correla��o');
axis([-1000 1000 -1 1]);

%Correla��o entre dois ru�dos diferentes

r1 = randn(size(t)); %Cria um ru�do
r2 = randn(size(t));
Rr1r2 = xcorr(r1,r2,'coeff'); %Correlaciona os dois ru�dos
figure;
subplot(3,1,1);plot(t,r1,'b'); xlabel('Amostra (s)'); ylabel('Amplitude'); title('Ru�do 1');
axis([0 3 -3 3]);
subplot(3,1,2);plot(t,r2,'r'); xlabel('Amostra (s)'); ylabel('Amplitude'); title('Ru�do 2');
axis([0 3 -3 3]);
subplot(3,1,3);plot(lags,Rr1r2,'k'); xlabel('Posi��o do dado'); ylabel('Amplitude'); title('Correla��o');
axis([-1000 1000 -1 1]);

%Correla��o entre senoide pura e senoide ruidosa

xn = x1 + sqrt(0.5)*r1; %Cria uma senoide ruidosa; %Vari�ncia menor
Rxx = xcorr(x1,xn,'coeff'); %Correlaciona a senoide pura com a ruidosa
figure;
subplot(3,1,1);plot(t,x1,'b'); xlabel('Amostra (s)'); ylabel('Amplitude'); title('Senoide Pura');
axis([0 3 -1 1]);
subplot(3,1,2);plot(t,xn,'r'); axis tight %Ajusta o gr�fico ao tamanho do vetor
xlabel('Amostra (s)'); ylabel('Amplitude'); title('Senoide Ruidosa');
axis([0 3 -3 3]);
subplot(3,1,3);plot(lags,Rxx,'k'); xlabel('Posi��o do dado'); ylabel('Amplitude'); title('Correla��o');
axis([-1000 1000 -1 1]);

xn2 = x1 + sqrt(2)*r1; %Cria uma senoide ruidosa; %Vari�ncia maior
Rxx = xcorr(x1,xn2,'coeff'); %Correlaciona a senoide pura com a ruidosa
figure;
subplot(3,1,1);plot(t,x1,'b'); xlabel('Amostra (s)'); ylabel('Amplitude'); title('Senoide Pura');
axis([0 3 -1 1]);
subplot(3,1,2);plot(t,xn2,'r'); axis tight %Ajusta o gr�fico ao tamanho do vetor
xlabel('Amostra (s)'); ylabel('Amplitude'); title('Senoide Ruidosa');
axis([0 3 -3 3]);
subplot(3,1,3);plot(lags,Rxx,'k'); xlabel('Posi��o do dado'); ylabel('Amplitude'); title('Correla��o');
axis([-1000 1000 -1 1]);

%An�lise do comportamento da correla��o de uma senoide pura com uma senoide
%ruidosa com a varia��o da amplitude do ru�do

for k = 1:20
    a = xcorr(x1,x1+k*r1,'coeff');
    R(k) = max(a);
end
figure;
plot(R);
xlabel('Amplitude do Ru�do');
ylabel('Correla��o entre senoide pura e senoide ruidosa');
title('Correla��o x Amplitude de Ru�do');

%Autocorrela�ao

n1 = 0:19;
x1 = zeros(1,length(n1));
for i = 0:19
    x1(i+1) = 0.1^i; %Cria a fun��o x[n]=0.1^n
end
[C1,c1] = xcorr(x1,x1,'coeff'); %Realiza a autocorrela��o do sinal
figure;
subplot(3,1,1); plot(c1,C1,'b');
title('Autocorrela��o de x[n]=0.1^n');
xlabel('Amostra (s)');
ylabel('Amplitude');

n2 = 0:19;
x2 = zeros(1,length(n2));
for i = 0:19
    x2(i+1) = 0.5^i; %Cria a fun��o x[n]=0.5^n
end
[C2,c2] = xcorr(x2,x2,'coeff'); %Realiza a autocorrela��o do sinal
subplot(3,1,2); plot(c2,C2,'k');
title('Autocorrela��o de x[n]=0.5^n');
xlabel('Amostra (s)');
ylabel('Amplitude');

n3 = 0:19;
x3 = zeros(1,length(n3));
for i = 0:19
    x3(i+1) = 0.8^i; %Cria a fun��o x[n]=0.8^n
end
[C3,c3] = xcorr(x3,x3,'coeff'); %Realiza a autocorrela��o do sinal
subplot(3,1,3); plot(c3,C3,'r');
title('Autocorrela��o de x[n]=0.8^n');
xlabel('Amostra (s)');
ylabel('Amplitude');

%Filtragem com convolu��o

x1 = sin(2*pi*fo*t);
F = 5;
f = ones(1,F)./F; %Cria um vetor filtro
xc = conv(xn,f); %Filtra o sinal, convoluindo-o
figure;
plot(t,xc(1:length(t)));
title('Convolu��o de xn com f'); xlabel('Amostra (s)'); ylabel('Amplitude');
axis([0 3 -2 2]);
[Rxx,c] = xcorr(xc(1:length(t)),x1); %Correlaciona o sinal original com o sinal filtrado
figure;
subplot(3,1,1);plot(t,xc(1:length(t)),'b');
title('Sinal convolu�do (xc)'); xlabel('Amostra (s)'); ylabel('Amplitude');
axis([0 3 -1 1]);
subplot(3,1,2);plot(t(1:length(x1)),x1,'r');
title('Sinal x1'); xlabel('Amostra (s)'); ylabel('Amplitude');
axis([0 3 -1 1]);
subplot(3,1,3);plot(c,Rxx,'k');
title('Correla��o de x1 e xc'); xlabel('Amostra (s)'); ylabel('Amplitude');
axis([-4000 4000 -2000 2000]);

%Alterando F

F = 50; %F com valor maior
f = ones(1,F)./F; %Cria um vetor filtro
xc = conv(xn,f); %Filtra o sinal, convoluindo-o
figure;
plot(t,xc(1:length(t)));
title('Convolu��o de xn com f'); xlabel('Amostra (s)'); ylabel('Amplitude');
axis([0 3 -0.6 0.6]);
[Rxx,c] = xcorr(xc(1:length(t)),x1); %Correlaciona o sinal original com o sinal filtrado
figure;
subplot(3,1,1);plot(t,xc(1:length(t)),'b');
title('Sinal convolu�do (xc)'); xlabel('Amostra (s)'); ylabel('Amplitude');
axis([0 3 -1 1]);
subplot(3,1,2);plot(t(1:length(x1)),x1,'r');
title('Sinal x1'); xlabel('Amostra (s)'); ylabel('Amplitude');
axis([0 3 -1 1]);
subplot(3,1,3);plot(c,Rxx,'k');
title('Correla��o de x1 e xc'); xlabel('Amostra (s)'); ylabel('Amplitude');
axis([-4000 4000 -500 500]);

%Promedia��o

M = 16; %Define o n�mero de janelas da promedia��o
xp = xn(1:tmax*fs/M);
for k = 1:(M-1)
    xp = xp+xn((k*tmax*fs/M+1):((k+1)*tmax*fs/M)); %Somat�rio que realiza a promedia��o
end
xp = xp./M;
figure;
plot(t(1:tmax*fs/M),xp);
title('Sinal Promediado');xlabel('Amostra (s)');ylabel('Amplitude');

[Rxx,v] = xcorr(xp,x1(1:tmax*fs/M),'coeff'); %Correlaciona o sinal original com o sinal promediado
figure;
subplot(3,1,1);plot(t(1:length(xp)),xp,'b');
title('Sinal Promediado');xlabel('Amostra (s)');ylabel('Amplitude');
subplot(3,1,2);plot(t(1:length(x1)),x1,'r');
title('Sinal Original');xlabel('Amostra (s)');ylabel('Amplitude');
axis([0 1 -1 1]);
subplot(3,1,3);plot(v,Rxx,'k');
title('Correla��o');xlabel('Amostra (s)');ylabel('Amplitude');
axis([-250 250 -1 1]);

%Alterando o n�mero de janelas M

M = 64; %N�mero maior de janelas
xp = xn(1:tmax*fs/M);
for k = 1:(M-1)
    xp = xp+xn(k*tmax*fs/M+1:((k+1)*tmax*fs/M)); %Somat�rio que realiza a promedia��o
end
xp = xp./M;
figure;
plot(t(1:tmax*fs/M),xp);
title('Sinal Promediado');xlabel('Amostra (s)');ylabel('Amplitude');

[Rxx,u] = xcorr(xp,x1(1:tmax*fs/M),'coeff'); %Correlaciona o sinal original com o sinal promediado
figure;
subplot(3,1,1);plot(t(1:length(xp)),xp,'b');
title('Sinal Promediado');xlabel('Amostra (s)');ylabel('Amplitude');
subplot(3,1,2);plot(t(1:length(x1)),x1,'r');
title('Sinal Original');xlabel('Amostra (s)');ylabel('Amplitude');
axis([0 1 -1 1]);
subplot(3,1,3);plot(u,Rxx,'k');
title('Correla��o');xlabel('Amostra (s)');ylabel('Amplitude');
axis([-40 40 -1 1]);

%Correla��o em imagens

dig1 = imread('dig1.jpg'); %Importa a digital do suspeito 1
dig2 = imread('dig2.jpg'); %Importa a digital do suspeito 2
dig3 = imread('dig3.jpg'); %Importa a digital do suspeito 3
dig4 = imread('dig4.jpg'); %Importa a digital do suspeito 4
dig5 = imread('dig5.jpg'); %Importa a digital do suspeito 5
dig6 = imread('dig6.jpg'); %Importa a digital do suspeito 6
dig7 = imread('dig7.jpg'); %Importa a digital do suspeito 7
dig8 = imread('dig8.jpg'); %Importa a digital do suspeito 8
digital = imread('digital.jpg'); %Importa a digital de amostra

figure;
subplot(2,2,1); title('Digital de amostra (alvo)'); plot(digital);
subplot(2,2,1); title('Digital do suspeito 4'); imshow(dig4);

S1 = xcorr2(dig1,digital); %Correlaciona a digital do suspeito 1 com a digital de amostra
S2 = xcorr2(dig2,digital); %Correlaciona a digital do suspeito 2 com a digital de amostra
S3 = xcorr2(dig3,digital); %Correlaciona a digital do suspeito 3 com a digital de amostra
S4 = xcorr2(dig4,digital); %Correlaciona a digital do suspeito 4 com a digital de amostra
S5 = xcorr2(dig5,digital); %Correlaciona a digital do suspeito 5 com a digital de amostra
S6 = xcorr2(dig6,digital); %Correlaciona a digital do suspeito 6 com a digital de amostra
S7 = xcorr2(dig7,digital); %Correlaciona a digital do suspeito 7 com a digital de amostra
S8 = xcorr2(dig8,digital); %Correlaciona a digital do suspeito 8 com a digital de amostra

m1 = max(S1); M1 = max(m1); %Associa a correla��o 1 a um valor m�ximo
m2 = max(S2); M2 = max(m2); %Associa a correla��o 2 a um valor m�ximo
m3 = max(S3); M3 = max(m3); %Associa a correla��o 3 a um valor m�ximo
m4 = max(S4); M4 = max(m4); %Associa a correla��o 4 a um valor m�ximo
m5 = max(S5); M5 = max(m5); %Associa a correla��o 5 a um valor m�ximo
m6 = max(S6); M6 = max(m6); %Associa a correla��o 6 a um valor m�ximo
m7 = max(S7); M7 = max(m7); %Associa a correla��o 7 a um valor m�ximo
m8 = max(S8); M8 = max(m8); %Associa a correla��o 8 a um valor m�ximo

m = [M1 M2 M3 M4 M5 M6 M7 M8]; %Cria um vetor com os valores m�ximos das correla��es
M = max(m);
for i=1:length(m) %Percorre o vetor de valores m�ximos
    if m(i) == M
        disp(['A digital do suspeito ', num2str(i), ' tem maior semelhan�a com a digital de amostra.']); %Mostra o resultado
    end
end