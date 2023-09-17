%%
clearvars;close all;clc;

%%

figure(1)
fs = 1000;
t = 0:1/fs:3;
f0 = 150;
t1 = 3;
f1 = 450;
B = (f1-f0)/t1;
y = cos(2*pi*(f0*t+B/2*t.^2));
Y = abs(fft(y));
F = linspace(0,fs/2,round(length(y)/2));
plot(F,Y(1:round(length(y)/2)))
xlabel('Frequencia (Hz)')
grid on
ylabel('Magnitude')

%%

% [S,F,T] = espectrograma(y,256,20,256,fs);
[S,F2,T] = espectrograma(y,256,1,20*256,fs);

figure(2)
subplot(121)
surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');
zlabel('Magnitude')
grid on

subplot(122)
surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');
zlabel('Magnitude')
grid on
%%
figure(3)
subplot(211)
plot(t,y)
title('cos(2*\pi*(450*t+100/2*t.^2))')
ylabel('Amplitude')
xlabel('Tempo')
subplot(212)
plot(F,Y(1:round(length(y)/2)))
ylabel('Magnitude')
xlabel('Frequência')
grid on
%%

[Y, FS]= audioread('lena.wav');
% sound(Y,FS)
figure(4)
% [S,F2,T] = espectrograma(Y,256,254,10^3*256,FS);
[S,F2,T] = espectrograma(Y,1024,20,1024,FS);
surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)');
ylim([0,1.8*10^4])
ylabel('Frequencia (Hz)');

%%
load('whalecalls.mat')


figure(5)
for ii = 1:5
    subplot(5,5,ii)
    n = ii;
%     sound(X1(n,:),fs)
    [S,F2,T] = espectrograma(X1(n,:),128,100,128,fs);
%     figure(2)
    surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
    axis xy; axis tight; view(0,90);
%     xlabel('Tempo (s)');
%     ylabel('Frequencia (Hz)');
    title(['Áudio ' num2str(ii) ', baleia 1'])
end

for ii = 6:10
    subplot(5,5,ii)
    n = ii;
%     sound(X1(n,:),fs)
    [S,F2,T] = espectrograma(X1(n,:),128,100,128,fs);
%     figure(2)
    surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
    axis xy; axis tight; view(0,90);
%     xlabel('Tempo (s)');
%     ylabel('Frequencia (Hz)');
    title(['Áudio ' num2str(ii) ', baleia 1'])
end

for ii = 11:15
    subplot(5,5,ii)
    n = ii;
%     sound(X1(n,:),fs)
    [S,F2,T] = espectrograma(X1(n,:),128,100,128,fs);
%     figure(2)
    surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
    axis xy; axis tight; view(0,90);
%     xlabel('Tempo (s)');
%     ylabel('Frequencia (Hz)');
   title(['Áudio ' num2str(ii) ', baleia 1'])
end

for ii = 1:9
    subplot(5,5,15+ii)
    n = ii;
%     sound(X2(n,:),fs)
    [S,F2,T] = espectrograma(X2(n,:),128,100,128,fs);
%     figure(2)
    surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
    axis xy; axis tight; view(0,90);
%     xlabel('Tempo (s)');
%     ylabel('Frequencia (Hz)');
    title(['Áudio ' num2str(ii) ', baleia 2'])
end


%%
figure(665)
ii = 1;
    subplot(2,1,1)
    n = 2;
    [S,F2,T] = espectrograma(X1(n,:),128,100,128,fs);
    surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
    axis xy; axis tight; view(0,90);
    xlabel('Tempo (s)');
    ylabel('Frequencia (Hz)');
    title(['Áudio ' num2str(ii) ', baleia 1'])
    

subplot(2,1,2)
    n = 2;
    [S,F2,T] = espectrograma(X2(n,:),128,100,128,fs);
    surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
    axis xy; axis tight; view(0,90);
    xlabel('Tempo (s)');
    ylabel('Frequencia (Hz)');
    title(['Áudio ' num2str(ii) ', baleia 2'])
%%

figure(666)
[Y, FS]= audioread('02AphexTwin.wav');
[S,F2,T] = espectrograma(Y,3470,100,3470,FS);
surf(T,F2,10*log10(abs(S)),'EdgeColor','none');
axis xy; axis tight; view(0,90);
xlabel('Tempo (s)');
ylabel('Frequencia (Hz)');
title('Aphex Twin')
xlim([(5*60+27),(5*60+37)])
ylim([10^2 2*10^4])
set(gca,'yscale','log')







