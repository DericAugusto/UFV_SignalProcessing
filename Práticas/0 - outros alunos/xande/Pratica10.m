%%
clearvars;clc;close all;

%% Reamostragem
f   = 1000;
fs1 = 10000;
numCiclos = 20;
n1= 0:1/fs1:numCiclos/f;
sinal = cos(2*pi*f.*n1);

fs2 = 2000;
n2 = 0:1/fs2:numCiclos/f;
amostrado = cos(2*pi*f.*n2);

fs3 = 300;
n3 = 0:1/fs3:numCiclos/f;
subamostrado = cos(2*pi*f.*n3);

fs4 = 1100;
n4 = 0:1/fs4:numCiclos/f;
subamostrado2 = cos(2*pi*f.*n4);

figure(1)
subplot(411)
plot(n1*10^3,sinal)
legend(['f_{s1} = ', num2str(fs1),' Hz'],'Location','Southeast')
title('Amostragem de sinais temporais')
ylabel('cos(\omega t)')
axis tight
ylim([-1,1])
grid on

subplot(412)
plot(n2*10^3,amostrado)
legend(['f_{s2} = ', num2str(fs2),' Hz'],'Location','Southeast')
ylabel('cos(\omega t)')
axis tight
ylim([-1,1])
grid on

subplot(413)
plot(n3*10^3,subamostrado)
legend(['f_{s3} = ', num2str(fs3),' Hz'],'Location','Southeast')
ylabel('cos(\omega t)')
xlabel('Tempo [ms]')
axis tight
ylim([-1,1])
grid on

subplot(414)
plot(n4*10^3,subamostrado2)
legend(['f_{s4} = ', num2str(fs4),' Hz'],'Location','Southeast')
ylabel('cos(\omega t)')
xlabel('Tempo [ms]')
axis tight
ylim([-1,1])
grid on
%%
y1 = sinal;
y2 = amostrado;
y3 = subamostrado;
y4 = subamostrado2;

Y1 = abs(fft(y1));
F1 = linspace(0,fs1/2,round(length(y1)/2));

Y2 = abs(fft(y1));
F2 = linspace(0,fs2/2,round(length(y2)/2));

Y3 = abs(fft(y1));
F3 = linspace(0,fs3/2,round(length(y3)/2));

Y4 = abs(fft(y1));
F4 = linspace(0,fs4/2,round(length(y4)/2));

figure(2)
subplot(411)
plot(F1,Y1(1:round(length(y1)/2)))
legend(['f_{s1} = ', num2str(fs1),' Hz'],'Location','Southeast')
title('Impacto da amostragem na frequência')
ylabel('cos(\omega t)')
axis tight

subplot(412)
plot(F2,Y2(1:round(length(y2)/2)))
legend(['f_{s2} = ', num2str(fs2),' Hz'],'Location','Southeast')
ylabel('cos(\omega t)')
axis tight

subplot(413)
plot(F3,Y3(1:round(length(y3)/2)))
legend(['f_{s3} = ', num2str(fs3),' Hz'],'Location','Southeast')
ylabel('cos(\omega t)')
xlabel('Tempo [ms]')
axis tight
ylim([-1,1])

subplot(414)
plot(F4,Y4(1:round(length(y4)/2)))
legend(['f_{s4} = ', num2str(fs4),' Hz'],'Location','Southeast')
ylabel('cos(\omega t)')
xlabel('Tempo [ms]')
axis tight
%% Aliasing temporal

figure(3)
x = imread('spokes','tif');
fps = 120;
t_final = 2;
graus = 0;
gpf = 30;
for i=1:fps*t_final
    c = imrotate(x,graus,'bilinear','crop');
    imshow(c);
    title(sprintf('FPS, angulo => %d,%d,%d.',graus,fps,gpf));
    drawnow
    pause(1/fps)
    graus = graus + gpf;
end