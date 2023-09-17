%% Parte 1
Fs = 8000; %Define a frequencia
L = 8000; % Largura da faixa
t = 0:1/Fs:(L-1)/Fs; % vetor de tempo
x = 0.7*sin(2*pi*500*t)+sin(2*pi*2000*t)+2*randn(1,L); %função de exemplo
figure()
plot(t,x) %plota a função no tempo
title('Função no tempo');
xlabel('t');
ylabel('x(t)');

X = fft(x); %Realiza a transformada rápida

freq = (-(L/2-1):L/2)*Fs/L;  %Vetor de frequencia para plotagem
pfreq = (0:L/2)*Fs/L;
xnew = real(ifft(X)); %realiza a transformada inversa 
figure()
subplot(3,1,1), plot(freq,abs(X)) %plota  a função no domínio da frequencia
title('Função no domínio da frequencia');
xlabel('Frequencia');
ylabel('X');
subplot(3,1,2), plot(freq,abs(fftshift(X))) %plota a função centralizada
title('Função no domínio da frequencia centralizado');
xlabel('Frequencia');
ylabel('X');
subplot(3,1,3), plot(pfreq,abs(X(1:L/2+1)))
title('Função no domínio da frequencia (sem a parte repetida)');
xlabel('Frequencia');
ylabel('X');
%% Filtro passa baixa

a = 1000; % frequencia de corte
H = a./(a+1i*freq); %define o filtro

figure()
plot(freq,abs(H))%Plota o filtro
title('Filtro passa-baixa');
xlabel('Frequencia');
ylabel('H');
Hshift1 = fftshift(H); %Centraliza o filtro
Y1 = X.* Hshift1; %Aplica o filtro na função
figure()
plot(freq,abs(fftshift(Y1))) %plota a função filtrada na frequencia
title('Função filtrada no domínio da frequencia');
xlabel('Frequencia');
ylabel('Y');
y1 = real(ifft(Y1));% volta a função filtrada ao dominio da frequencia
figure()
plot(y1) %Plota a função no tempo
title('Função filtrada no domínio do tempo');
xlabel('tempo');
ylabel('Y');

%% Filtro Passa-alta

H1 = 1-a./(a+1i*freq); % define o filtro passa alta
figure()
plot(freq,abs(H1)) % plota o filtro passa alta
title('Filtro passa-alta');
xlabel('Frequencia');
ylabel('X');
Hshift2 = fftshift(H1); %centraliza o filtro
Y2 = X.* Hshift2; % aplica o filtro
figure()
plot(freq,abs(fftshift(Y2))) %Plota a função filtrada no dominio da frequencia
title('Função filtrada no domínio da frequencia');
xlabel('Frequencia');
ylabel('Y');

y2 = real(ifft(Y2)); %Volta a função para o domínio do tempo
figure()
plot(y2) %Plota a função no tempo 
title('Função filtrada no domínio do tempo');
xlabel('tempo');
ylabel('X');

%% 4.1 Aplicação dos Filtros passa-baixa e passa-alta
% Aplicação Filtro Passa-baixa
a=500; %define a frequencia de corte
[audio,Fs] = audioread('castanets44m.wav');
freq = (-(length(audio)/2-1):length(audio)/2)*Fs/length(audio); %cria um vetor de frequencia
H = a./(a+1i.*freq); %cria um filtro passa baixa
Hshift = fftshift(H); %centraliza o filtro
M1 = fft(audio).* Hshift'; % aplica o filtro
figure()
subplot(212)
plot(freq,abs(fftshift(M1))) %Plota a função filtrada no dominio da frequencia
title('Audio filtrado no domínio da frequencia');
xlabel('Frequencia');
ylabel('Amplitude');
m1 = real(ifft(M1));
subplot(212)
plot(m1) %Plota audio no dominio do tempo
title('Audio filtrado no dominio do tempo');
xlabel('tempo');
ylabel('amplitude');

%Aplicação Filtro Passa-alta
a=500;
freq = (-(length(audio)/2-1):length(audio)/2)*Fs/length(audio); %cria o vetor de frequencia
H = 1-a./(a+1i.*freq); %cria o filtro passa-alta
Hshift = fftshift(H); %centraliza o filtro
M2 = fft(audio).* Hshift'; %aplica o filtro
figure()
subplot(211)
plot(freq,abs(fftshift(M2))) %plota o filtro no domínio da frequencia
title('Função filtrada no domínio da frequencia');
xlabel('frequencia');
ylabel('amplitude');

m2 = real(ifft(M2)); % volta a função para o dominio do tempo
subplot(212)
plot(m2) % Plota a funçao no dominio do tempo
title('Audio filtrado no dominio do tempo');
xlabel('tempo');
ylabel('amplitude');

%% 4.2 Eliminação de instrumentos musicais
[r ,s] = audioread('bassdrum.wav');  %carrega o audio da bateria
[r1 ,s1] = audioread('hatclosed.wav');  %carrega o audio do prato
k = load('shake.mat');  % Carrega o arquivo shake
audiowrite('shake.wav',k.shake,s)
[r3, s3]= audioread('shake.wav');
[r2 ,s2] = audioread('mixed.wav');  % carrega o audio misturado
% cria os vetores de frequencia para cada um dos arquivos
freq1 = (-(length(r)/2-1):length(r)/2)*s/length(r); 
freq2 = (-(length(r1)/2-1):length(r1)/2)*s1/length(r1);
freq3 = (-(length(r2)/2-1):length(r2)/2)*s2/length(r2);

figure()
subplot(411)
plot(freq1,fftshift(fft(r))) %Plota o audio da bateria no dominio da frequencia
title('Bateria');
xlabel('Frenquencia');
ylabel('amplitude');
subplot(412)
plot(freq2,fftshift(fft(r1)))%Plota o audio dos pratos no dominio da frequencia
title('Prato');
xlabel('Frenquencia');
ylabel('amplitude');
subplot(414)
plot(freq3,fftshift(fft(r2)))
title('Audios misturados');
xlabel('Frenquencia');
ylabel('amplitude');
subplot(413)
plot(freq3,fftshift(fft(r2)))
title('Audios misturados');
xlabel('Frenquencia');
ylabel('amplitude');

%FILTRO PASSA-FAIXA PARA TROMPETE
b = 900; %Frequência de corte superior
Hb = b./(b+1i*freq3); %Filtro passa-baixa
a = 600; %Frequência de corte inferior
Ha = 1 - (a./(a+1i*freq3)); %Filtro passa-alta
H = Hb.*Ha;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y1 = fft(r2).*(Hshift.*Hshift.*Hshift.*Hshift.*Hshift)'; %Realizando filtragem
f5=abs(fftshift(Y1));
y1 = real(ifft(Y1)); %Voltando o espectro para o domínio do tempo
sound(10*y1,s) %Reproduzindo o som
figure();
subplot(211)
plot(freq3,fftshift(25*Y1))
title('Audio filtrado');
xlabel('Frequencia');
ylabel('Amplitude');
subplot(212)
plot(freq3,fftshift(fft(r3)))
title('Audio esperado');
xlabel('Frequencia');
ylabel('Amplitude');

% Filtro bateria
b = 300; %Frequência de corte superior 
Hb = b./(b+1i*freq3);%Filtro passa-baixa
a = 40; %Frequência de corte inferior
Ha = 1 - (a./(a+1i*freq3)); %Filtro passa-alta
H = Hb.*Ha;
Hshift = fftshift(H); %Troca as metades esquerda e direita de H
Y3 = fft(r2).*((Hshift).*(Hshift).*(Hshift))'; %Realizando filtragem 
f7=abs(fftshift(Y3)); 
figure()
plot(freq3,f7) %Plotando sinal filtrado
title('Sinal da bateria filtrado');
ylabel('Amplitude');
xlabel('Frequência') 
y3 = real(ifft(Y3)); %Voltando o espectro para o domínio do tempo
sound(40*y3,s3) %Reproduzindo o som 