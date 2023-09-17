%ELT 410 - SINAIS E SISTEMAS
%JOÂO PEDRO NUNES ROSSI -90102
%THIAGO MENDES DE ÁVILA - 93505
%PRATICA 4
%%
% Correlação entre senóide e cossenoide
fs = 256;
fo = 8; tmax = 16;
t = 0:1/fs:tmax;
x1 = sin(2*pi*fo*t);
x2 = cos(2*pi*fo*t);
[Rx1x2,lags] = xcorr(x1,x2,'coeff');
figure;
subplot(311);plot(t,x1,'b')
title('Senóide f=8Hz');
xlabel('tempo(s)');
ylabel('amplitude');
subplot(312);plot(t,x2,'r')
title('Cossenóide f=8Hz');
xlabel('tempo(s)');
ylabel('amplitude');
subplot(313);plot(lags,Rx1x2,'k');
title('Correlação entre Senóide e cossenóide');
xlabel('tempo(s)');
ylabel('amplitude');
axis([-1000 1000 -1 1])
%%
% Correlaçao entre ruídos
r1 = randn(size(t));
r2 = randn(size(t));
Rr1r2 = xcorr(r1,r2,'coeff');
figure
subplot(311);plot(t,r1,'b')
title('Ruído 1');
xlabel('tempo(s)');
ylabel('amplitude');
subplot(312);plot(t,r2,'r')
title('Ruído 2');
xlabel('tempo(s)');
ylabel('amplitude');
subplot(313);plot(lags,Rr1r2,'k');
title('Correlação entre R1 e R2');
xlabel('tempo(s)');
ylabel('amplitude');
axis([-1000 1000 -1 1])
%%
% Correlaçao entre senoide livre e senoide ruidosa
xn = x1 + sqrt(0.5)*r1;
Rxx = xcorr(x1,xn,'coeff');
figure(1)
subplot(311);plot(t,x1,'b')
title('Senóide não ruidosa');
xlabel('tempo(s)');
ylabel('amplitude');
subplot(312);plot(t,xn,'r');axis tight
title('Senóide ruidosa');
xlabel('tempo(s)');
ylabel('amplitude');
subplot(313);plot(lags,Rxx,'k');
title('Correlação entre as senóides com e sem rúido');
xlabel('tempo(s)');
ylabel('amplitude');
axis([-1000 1000 -1 1])

%%
%Filtragem
F = 5;
f = ones(1,F)./F;
xc = conv(xn,f);
figure(3)
subplot(211);
plot(t,xc(1:length(t)))
title('Sinal Xn');
xlabel('tempo(s)');
ylabel('amplitude');

a = xcorr(xc(1:length(t)),x1,'coeff')
subplot(212);
plot(lags,a);
title('Correlação entre Xc e X1 com F=5');
xlabel('tempo(s)');
ylabel('amplitude');



%%
%PARTE 2: Promedição
M = 16;
xp = xn(1:tmax*fs/M);

figure(4);
for k = 1:(M-1)
xp = xp+xn(k*tmax*fs/M+1:(k+1)*tmax*fs/M);
end
xp = xp./M;
subplot(211);
plot(t(1:tmax*fs/M),xp)
title('Sinal Xp');
xlabel('tempo(s)');
ylabel('amplitude');


[b,lags] = xcorr(x1(1:tmax*fs/M),xp,'coeff');
subplot(212);
plot(lags,b)
title('Correlação entre Xp e X1 com M=16');
xlabel('tempo(s)');
ylabel('amplitude');
%%
% Correlação em Imagens
ind1 = imread('dig1.jpg');
ind2 = imread('dig2.jpg');
ind3 = imread('dig3.jpg');
ind4 = imread('dig4.jpg');
ind5 = imread('dig5.jpg');
ind6 = imread('dig6.jpg');
ind7 = imread('dig7.jpg');
ind8 = imread('dig8.jpg');
alvo = imread('digital.jpg');

res1 = max(max(xcorr2(alvo,ind1)));
res2 = max(max(xcorr2(alvo,ind2)));
res3 = max(max(xcorr2(alvo,ind3)));
res4 = max(max(xcorr2(alvo,ind4)));
res5 = max(max(xcorr2(alvo,ind5)));
res6 = max(max(xcorr2(alvo,ind6)));
res7 = max(max(xcorr2(alvo,ind7)));
res8 = max(max(xcorr2(alvo,ind8)));

figure
subplot(241)
plot(xcorr2(alvo,ind1))
subplot(242)
plot(xcorr2(alvo,ind2))
subplot(243)
plot(xcorr2(alvo,ind3))
subplot(244)
plot(xcorr2(alvo,ind4))
subplot(245)
plot(xcorr2(alvo,ind5))
subplot(246)
plot(xcorr2(alvo,ind6))
subplot(247)
plot(xcorr2(alvo,ind7))
subplot(248)
plot(xcorr2(alvo,ind8))


A=[res1 res2 res3 res4 res5 res6 res7 res8]
maior=0;
for i=1:8
    if A(1,i)>maior
        maior=A(1,i);
        suspeito = i;
        
    end
end
disp('suspeito principal:')
disp(suspeito)
