%UNIVERSIDADE FEDERAL DE VIÇOSA
%ELT 410 - SINAIS E SISTEMAS
%PRÁTICA 6
%JOÃO PEDRO ROSSI E THIAGO MENDES 
%90102 93505
%SÉRIE DE FOURIER
clc
clear all
close all

%% Primeira parte - termos da Série de Fourier
kmax = 10;
tak = ak(-kmax:kmax);
figure;
subplot(211);
stem(abs(tak));
title({'Módulo de ak';'k \in [-kmax,kmax] com kmax = 10'},'FontSize',15);
xlabel 'amostra';
ylabel 'amplitude';
subplot(212);
stem(angle(tak),'r');
xlabel 'amostra';
ylabel 'amplitude';
title({'Fase de ak';'k \in [-kmax,kmax] com kmax = 10'},'FontSize',15);
%% Segunda parte - recontruir o sinal a partir dos termos de fourier
figure
t = -10:0.01:10;
%k = 5;
k1 = 0:5; % explicar o fenomeno de Gibbs
tak1 = ak(k1);
for i = 1:length(t)
    x1(i) = tak1(1) + sum(2*abs(tak1(2:end)).*cos(k1(2:end)*t(i) + angle(tak1(2:end))));
end
subplot(311)
plot(t,x1)
title({'Onda Quadrada obtida pela Série de Fourier';'k = 0,1,2 ... 5'},'FontSize',15)
xlabel 'tempo';
ylabel 'amplitude';
axis tight

%k = 15;
k2 = 0:15; % explicar o fenomeno de Gibbs
tak2 = ak(k2);
for i = 1:length(t)
    x2(i) = tak2(1) + sum(2*abs(tak2(2:end)).*cos(k2(2:end)*t(i) + angle(tak2(2:end))));
end
subplot(312)
plot(t,x2,'r')
title({'Onda Quadrada obtida pela Série de Fourier';'k = 0,1,2 ... 15'},'FontSize',15)
axis tight

%k = 30;
k3 = 0:30; % explicar o fenomeno de Gibbs
tak3 = ak(k3);
for i = 1:length(t)
    x3(i) = tak3(1) + sum(2*abs(tak3(2:end)).*cos(k3(2:end)*t(i) + angle(tak3(2:end))));
end
subplot(313)
plot(t,x3,'k')
title({'Onda Quadrada obtida pela Série de Fourier';'k = 0,1,2 ... 30'},'FontSize',15)
axis tight
%% sobreposição 
clc;
clear all;
close all;
u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)];
subplot(211)
plot(u,sq,'r','linewidth',2)
xlabel('t')
ylabel('x(t)')
axis([-10 10 -0.5 2.5])
title('Onda quadrada')
grid on
hold on

%para k=2
t = -10:.1:10;
k1 = 0:2; 
tak1 = ak(k1);
for i = 1:length(t)
    x1(i) = tak1(1) + sum(2*abs(tak1(2:end)).*cos(k1(2:end)*t(i) + angle(tak1(2:end))));
end
plot(t,2*x1)
title({'Onda quadrada original e baseada na Série de Fourier';'k = 0,1,2 ... 2'},'FontSize',15)
axis tight
hold off

u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)];
subplot(212)
plot(u,sq,'r','linewidth',2)
xlabel('t')
ylabel('x(t)')
axis([-10 10 -0.5 2.5])
title('Onda quadrada')
grid on
hold on

%para k=5
t = -10:.1:10;
k1 = 0:5; 
tak1 = ak(k1);
for i = 1:length(t)
    x1(i) = tak1(1) + sum(2*abs(tak1(2:end)).*cos(k1(2:end)*t(i) + angle(tak1(2:end))));
end
plot(t,2*x1)
title({'Onda quadrada original e baseada na Série de Fourier';'k = 0,1,2 ... 5'},'FontSize',15)
axis tight
hold off

u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)];
figure
subplot(211)
plot(u,sq,'r','linewidth',2)
xlabel('t')
ylabel('x(t)')
axis([-10 10 -0.5 2.5])
title('Onda quadrada')
grid on
hold on

%para k=10
t = -10:.1:10;
k1 = 0:10; 
tak1 = ak(k1);
for i = 1:length(t)
    x1(i) = tak1(1) + sum(2*abs(tak1(2:end)).*cos(k1(2:end)*t(i) + angle(tak1(2:end))));
end
plot(t,2*x1)
title({'Onda quadrada original e baseada na Série de Fourier';'k = 0,1,2 ... 10'},'FontSize',15)
axis tight
hold off

u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)];
subplot(212)
plot(u,sq,'r','linewidth',2)
xlabel('t')
ylabel('x(t)')
axis([-10 10 -0.5 2.5])
title('Onda quadrada')
grid on
hold on

%para k=100
t = -10:.1:10;
k1 = 0:100; 
tak1 = ak(k1);
for i = 1:length(t)
    x1(i) = tak1(1) + sum(2*abs(tak1(2:end)).*cos(k1(2:end)*t(i) + angle(tak1(2:end))));
end
plot(t,2*x1)
title({'Onda quadrada original e baseada na Série de Fourier';'k = 0,1,2 ... 100'},'FontSize',15)
axis tight
hold off



%% Terceira Parte - Redução do Fenomeno de Gibs (k = 30)
figure
%Fejer
k3 = 0:30
tak3 = ak(k3);
Fwk3 = (k3(end) - k3)/k3(end);
for i = 1:length(t)
    x4(i) = Fwk3(1)*tak3(1) + sum(2*abs(tak3(2:end).*Fwk3(2:end)).*cos(k3(2:end)*t(i) + angle(Fwk3(2:end).*tak3(2:end))));
end
subplot(211)
plot(x4)
xlabel 'tempo';
ylabel 'amplitude';
title('Onda Quadrada após janelamento Fejér ','FontSize',15)
axis tight

%Aproximação Sigma
Awk3 = sinc(k3/k3(end));
for i = 1:length(t)
    x5(i) = Awk3(1)*tak3(1) + sum(2*abs(tak3(2:end).*Awk3(2:end)).*cos(k3(2:end)*t(i) + angle(Awk3(2:end).*tak3(2:end))));
end
subplot(212)
plot(x5,'r')
xlabel 'tempo';
ylabel 'amplitude';
title('Onda Quadrada após aproximação Sigma','FontSize',15)
axis tight
