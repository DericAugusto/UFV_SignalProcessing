%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Prática 6

%Fenômeno Gibbs

kmax=10;
k = -kmax:kmax; %Define o vetor k
q = ak(k); %Chama a função ak que calcula o k-ésimo termo da série de Fourier para a onda quadrada

figure;
subplot(2,1,1); stem(k,abs(q)); %Plota o módulo de ak
xlabel('k'); ylabel('Módulo'); title('Módulo de ak');
subplot(2,1,2); stem(k,angle(q)); %Plota a fase de ak
xlabel('k'); ylabel('Fase'); title('Fase de ak');

%Onda quadrada para k=5
kmax=5;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+q(i)*cos(2*pi*k(i)*0.25*(t(j))); %Série de Fourier para a onda quadrada
    end
    x(j) = 4*x(j)+1;
end
figure;
subplot(3,1,1);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=5'); axis([-10 10 -0.5 2.5]);

%Onda quadrada para k=15
kmax=15;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(3,1,2);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=15'); axis([-10 10 -0.5 2.5]);

%Onda quadrada para k=30
kmax=30;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(3,1,3);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=30'); axis([-10 10 -0.5 2.5]);

%% Minimização do Efeito Gibbs

%Para k=2
u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)]; %Função para a onda quadrada perfeita
figure;
plot(u,sq,'r','linewidth',1);
xlabel('t');
ylabel('x(t)');
axis([-10 10 -0.5 2.5]);
title('Onda quadrada');
grid on;
hold on;

kmax=2; %Define a onda quadrada para 2 iterações
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=2');
legend('Onda Ideal', 'Onda Aproximada');

%Para k=5
u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)];
figure;
plot(u,sq,'r','linewidth',1);
xlabel('t');
ylabel('x(t)');
axis([-10 10 -0.5 2.5]);
title('Onda quadrada');
grid on;
hold on;

kmax=5; %Define a onda quadrada para 5 iterações
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=5');
legend('Onda Ideal', 'Onda Aproximada');

%Para k=10
u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)];
figure;
plot(u,sq,'r','linewidth',1);
xlabel('t');
ylabel('x(t)');
axis([-10 10 -0.5 2.5]);
title('Onda quadrada');
grid on;
hold on;

kmax=10; %Define a onda quadrada para 10 iterações
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=10');
legend('Onda Ideal', 'Onda Aproximada');

%Para k=50
u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)];
figure;
plot(u,sq,'r','linewidth',1.5);
xlabel('t');
ylabel('x(t)');
axis([-10 10 -0.5 2.5]);
title('Onda quadrada');
grid on;
hold on;

kmax=50; %Define a onda quadrada para 50 iterações
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=50');
legend('Onda Ideal', 'Onda Aproximada');

%Para k=100
u=linspace(-10,10,10000);
sq=[zeros(1,500),2*ones(1,1000),zeros(1,1000),2*ones(1,1000),zeros(1,1000),...
2*ones(1,1000), zeros(1,1000),2*ones(1,1000), zeros(1,1000),2*ones(1,1000),...
zeros(1,500)];
figure;
plot(u,sq,'r','linewidth',1.5);
xlabel('t');
ylabel('x(t)');
axis([-10 10 -0.5 2.5]);
title('Onda quadrada');
grid on;
hold on;

kmax=100; %Define a onda quadrada para 100 iterações
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=100');
legend('Onda Ideal', 'Onda Aproximada');

%Janelamento Fejér
%O termo (kmax-k(i))/kmax é responsável pelo janelamento

%Para k=2
kmax=2;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+((kmax-k(i))/kmax)*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
figure;
subplot(5,1,1);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=2'); axis([-10 10 -0.5 2.5]);

%Para k=5
kmax=5;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+((kmax-k(i))/kmax)*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(5,1,2);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=5'); axis([-10 10 -0.5 2.5]);

%Para k=10
kmax=10;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+((kmax-k(i))/kmax)*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(5,1,3);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=10'); axis([-10 10 -0.5 2.5]);

%Para k=50
kmax=50;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+((kmax-k(i))/kmax)*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(5,1,4);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=50'); axis([-10 10 -0.5 2.5]);

%Para k=100
kmax=100;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+((kmax-k(i))/kmax)*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(5,1,5);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=100'); axis([-10 10 -0.5 2.5]);

%Aproximação Sigma
%O termo sinc(k(i)/kmax) é responsável pela aproximação

%Para k=2
kmax=2;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+(sinc(k(i)/kmax))*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
figure; subplot(5,1,1);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=2'); axis([-10 10 -0.5 2.5]);

%Para k=5
kmax=5;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+(sinc(k(i)/kmax))*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(5,1,2);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=5'); axis([-10 10 -0.5 2.5]);

%Para k=10
kmax=10;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+(sinc(k(i)/kmax))*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(5,1,3);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=10'); axis([-10 10 -0.5 2.5]);

%Para k=50
kmax=50;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+(sinc(k(i)/kmax))*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(5,1,4);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=50'); axis([-10 10 -0.5 2.5]);

%Para k=100
kmax=100;
k = 1:kmax;
q = ak(k);
t = -10:0.01:10;
x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(k)
        x(j) = x(j)+(sinc(k(i)/kmax))*q(i)*cos(2*pi*k(i)*0.25*(t(j)));
    end
    x(j) = 4*x(j)+1;
end
subplot(5,1,5);
plot(t,x); xlabel('t'); ylabel('x(t)'); title('Onda quadrada para k=100'); axis([-10 10 -0.5 2.5]);

%% Sintetizador de Som

load('trumpet 30082019132152.mat'); %Carrega o arquivo de som
sound(trumpet); %Reproduz o arquivo de som

%Plot de três diferentes partes do arquivo de som
figure;
subplot(3,1,1); stem(trumpet(1:11025,1)); axis([0 11025 -1.2 1.2]);
xlabel('Amostra'); ylabel('Amplitude'); title('Trompete (trecho 1 de 3)');
subplot(3,1,2); stem(trumpet(11025:22050,1)); axis([0 11025 -1.2 1.2]);
xlabel('Amostra'); ylabel('Amplitude'); title('Trompete (trecho 2 de 3)');
subplot(3,1,3); stem(trumpet(22050:33075,1)); axis([0 11025 -1.2 1.2]);
xlabel('Amostra'); ylabel('Amplitude'); title('Trompete (trecho 3 de 3)');

Fs = 11025;
Y = fft(trumpet,512); %Realiza a transformada rápida de Fourier do sinal de som
Ymag = abs(Y(1:257)); %Calcula os módulos (harmônicos) do sinal de som 
Yfas = angle(Y(1:257)); %Calcula as fases do sinal de som
f = Fs*(0:256)/512;
figure;
subplot(2,1,1), plot(f, Ymag); title('Módulo e Fase do sinal trumpet');
xlabel('Frequência (Hz)'); ylabel('Módulo');
subplot(2,1,2), plot(f, Yfas);
xlabel('Frequência (Hz)'); ylabel('Fase');

[m, n] = sort(Ymag); %Organiza as magnitudes em ordem crescente
t = 0:1/Fs:1;
freq = f(n(253:257)); %Separa as frequências correspondentes às maiores magnitudes
mag = m(253:257); %Separa as maiores magnitudes
fas = Yfas(n(253:257)); %Separa as fases correspondentes às maiores magnitudes

X = sintetizador(t, freq, mag); %Chama a função que sintetiza o áudio (usando 5 harmônicos)
sound(X);
figure;
subplot(2,1,1); plot(trumpet); axis([0 11025 -1 1]); xlabel('t'); ylabel('Amplitude'); title('Trompete Original');
subplot(2,1,2); plot(X); axis([0 11025 -1 1]); 
xlabel('t'); ylabel('Amplitude'); title('Trompete Sintetizado sem fase e com 5 harmônicos');
Y = sintetizadorfase(t, freq, mag, fas); %Chama a função que sintetiza o áudio com as fases (usando 5 harmônicos)
sound(Y);
figure;
subplot(2,1,1); plot(trumpet); axis([0 11025 -1 1]); xlabel('t'); ylabel('Amplitude'); title('Trompete Original');
subplot(2,1,2); plot(Y); axis([0 11025 -1 1]);
xlabel('t'); ylabel('Amplitude'); title('Trompete Sintetizado com fase e 5 harmônicos');

%Para menos harmônicos

t = 0:1/Fs:1;
freq = f(n(256:257));
mag = m(256:257);
fas = Yfas(n(256:257));

X = sintetizador(t, freq, mag); %Chama a função que sintetiza o áudio (usando 2 harmônicos)
sound(X);
figure;
subplot(2,1,1); plot(trumpet); axis([0 11025 -1 1]); xlabel('t'); ylabel('Amplitude'); title('Trompete Original');
subplot(2,1,2); plot(X); axis([0 11025 -1 1]); 
xlabel('t'); ylabel('Amplitude'); title('Trompete Sintetizado sem fase e com 2 harmônicos');
Y = sintetizadorfase(t, freq, mag, fas); %Chama a função que sintetiza o áudio com as fases (usando 2 harmônicos)
sound(Y);
figure;
subplot(2,1,1); plot(trumpet); axis([0 11025 -1 1]); xlabel('t'); ylabel('Amplitude'); title('Trompete Original');
subplot(2,1,2); plot(Y); axis([0 11025 -1 1]);
xlabel('t'); ylabel('Amplitude'); title('Trompete Sintetizado com fase e 2 harmônicos');

%Para mais harmônicos (todos)

t = 0:1/Fs:1;
freq = f(n(1:257));
mag = m(1:257);
fas = Yfas(n(1:257));

X = sintetizador(t, freq, mag); %Chama a função que sintetiza o áudio (usando todos os harmônicos)
sound(X);
figure;
subplot(2,1,1); plot(trumpet); axis([0 11025 -1 1]); xlabel('t'); ylabel('Amplitude'); title('Trompete Original');
subplot(2,1,2); plot(X); axis([0 11025 -1 1]); 
xlabel('t'); ylabel('Amplitude'); title('Trompete Sintetizado sem fase e com todos os harmônicos');
Y = sintetizadorfase(t, freq, mag, fas); %Chama a função que sintetiza o áudio com as fases (usando todos os harmônicos)
sound(Y);
figure;
subplot(2,1,1); plot(trumpet); axis([0 11025 -1 1]); xlabel('t'); ylabel('Amplitude'); title('Trompete Original');
subplot(2,1,2); plot(Y); axis([0 11025 -1 1]);
xlabel('t'); ylabel('Amplitude'); title('Trompete Sintetizado com fase e todos os harmônicos');