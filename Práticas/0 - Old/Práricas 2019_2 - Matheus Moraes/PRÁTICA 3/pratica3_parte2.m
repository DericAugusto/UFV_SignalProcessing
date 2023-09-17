%% UNIVERSIDADE FEDERAL DE VIÇOSA
%  ELT - 410 SINAIS E SISTEMAS
%  JOÃO PEDRO NUNES ROSSI 90102
%  THIAGO MENDES DE ÁVILA 93505

clc;
close all;
clear all;
%%
%%PARTE 4 EX3
%a)audio normal
load('trumpet 30082019132152 (1).mat'); % carrega o arquivo trumpet no workspace
whos('trumpet 30082019132152 (1).mat');
figure(1);
subplot(3,1,1);%plota o arquivo trumpet na linha 1 coluna 1
stem(trumpet);%discretiza o sinal de entrada (trumpet)
title('Sinal de entrada discretizado')
xlabel('Tempo(s)')
ylabel('Amplitude')
h1 = [1 zeros(1,10000) 0.25 zeros(1,1000)]; % cria o vetor h1
subplot(3,1,2);
stem(h1);
title('vetor ''h1'' discretizado')
xlabel('Tempo(s)')
ylabel('Amplitude')
y1 = conv(trumpet,h1); %convolui h com o sinal de entrada
audiowrite('trumpet1.wav',y1,Fs); % converte o arquivo em .wav2
subplot(3,1,3);
stem(y1);
title('convolução do sinal de entrada com ''h1''')
xlabel('Tempo(s)')
ylabel('Amplitude')

%c)audio com eco
figure(2)
subplot(3,1,1);%plota o arquivo trumpet na linha 1 coluna 1
stem(trumpet);%discretiza o sinal de entrada (trumpet)
title('Sinal de entrada discretizado')
xlabel('Tempo(s)')
ylabel('Amplitude')
h2 = [1 zeros(1, round(Fs/4)) 0.25 zeros(1,1000)];% gera o impulso h2
subplot(3,1,2);
stem(h2);
title('vetor ''h2'' discretizado');
xlabel('Tempo(s)');
ylabel('Amplitude');
y2=conv(trumpet,h2);
subplot(3,1,3);
stem(y2);
title('convolução do sinal de entrada com ''h2''');
xlabel('Tempo(s)');
ylabel('Amplitude');
audiowrite('trumpet2.wav',y2,Fs); 

%%PARTE 4 EX3 impulso
figure(3);
subplot(3,1,1); 
stem(trumpet);
title('Sinal de entrada discretizado');
xlabel('Tempo(s)');
ylabel('Amplitude');
h3 = [ones(1,50)/50 zeros(1,20)]; % gera um impulso h3
subplot(3,1,2);
stem(h3);
title('Vetor ''h3'' discretizado');
xlabel('Tempo(s)');
ylabel('Amplitude');
y3=conv(trumpet,h3);
subplot(3,1,3);
stem(y3);
title('convolução do sinal de entrada com ''h3''');
xlabel('Tempo(s)');
ylabel('Amplitude');
audiowrite('trumpet3.wav',y3,Fs); % converte o arquivo em .wav
%%
%%%%%%%soma de convoluções pela definição%%%%%%%%%%%%

%função retangular
fs = 1;
t = -10:1/fs:10;
w = 4;
y = rectpuls(t-3,w);
subplot(2,1,1)
stem(t,y)
title('Função retangular');
xlabel('Tempo(s)');
ylabel('Amplitude');
%função triangular
fs = 1;
t = -10:1/fs:10;
w = 2;
z = tripuls(t-1.5,4*w);
figure(1);
subplot(2,1,2)
stem(t,z)
title('Função triangular');
xlabel('Tempo(s)');
ylabel('Amplitude');
%convolução
c=conv(z,y);
figure(2);
subplot(2,1,1);
stem(c);
title('Convolução usando o comando conv()');
xlabel('Tempo(s)');
ylabel('Amplitude');

m = length(y);
n = length(z);
A=[y zeros(1,n-1)];
B=[z zeros(1,m-1)];
for i= 1:m+n-1
    Q(i)=0;
 for j= 1:m
     if((i-j+1)>0)  
        Q(i)= Q(i)+(A(j)*B(i-j+1));
     end
 end
end
subplot(2,1,2);
stem(Q);
title('Convolução usando a definição');
xlabel('Tempo(s)');
ylabel('Amplitude');
