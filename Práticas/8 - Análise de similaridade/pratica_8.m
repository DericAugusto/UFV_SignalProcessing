% Prática 8 - Laboratório de Sinais e Sistemas
% Iure Rosa, 90688
% @uthores Iure Rosa
%% Inicializar Script
clear all; close all; clc;

%% Exercício 1

n = 0:255;                % Cria um vetor discreto
x0 = @(n) n>=0;           % Define o degrau unitário
x00 = @(n) n>=3;          % Define o degrau unitário deslocado em n=3
h = 5*(x0(n) - x00(n));   % Define o sinal transmitido
subplot(3,1,1)            % Plota o gráfico em forma de matriz
plot(h);                  % Plota o gráfico
title('Sinal original')   % Título do gráfico gerado
xlabel('Tempo')           % Rótulo do eixo x
ylabel('x(n)')            % Rótulo do eixo y
grid on                   % Gráfico quadriculado
 
x1 = @(n) n>=32;                        % Define o degrau unitário deslocado em n=32
x2 = @(n) n>=35;                        % Define o degrau unitário deslocado em n=35
xdn = 5*5*(x1(n) - x2(n));               % Desloca o sinal transmitido em 32 unidades de tempo
subplot(3,1,2)                          % Plota o gráfico em forma de matriz
plot(xdn);                              % Plota o gráfico
title('Sinal Deslocado em 32 unidades') % Título do gráfico gerado
xlabel('Tempo')                         % Rótulo do eixo x
ylabel('xd(n)')                         % Rótulo do eixo y
grid on                                 % Gráfico quadriculado
 
w = randn(1,256);        % Cria um ruído gaussiano aleatório
r = xdn + w;             % Cria o sinal refletido
subplot(3,1,3)           % Plota o gráfico em forma de matriz
plot(r);                 % Plota o gráfico
title('Soma do sinal deslocado com os ruídos') % Título do gráfico gerado
xlabel('Tempo')          % Rótulo do eixo x
ylabel('r(n)')           % Rótulo do eixo y
grid on                  % Gráfico quadriculado

salvaGrafico("Sinais x(n) xd(n) e r(n)")
 
Y = xcorr(h,r);           % Faz a correlação entre o sinal transmitido e o sinal refletido
R = Y(1:256);             % Define o intervalo de tempo da correlação
Rrx=fliplr(R);           % Inverte o resultado no tempo, para obtermos a correlação no sentido correto
figure                   % Plota a figura
plot(n,Rrx);             % Plota o resultado da correlação como funçãoo de n
xlabel('Tempo')
ylabel('Correlação')

salvaGrafico("Correlação entre os sinais")



%% Exercício 2

% Aplicação de funções de correlação na análise de sistemas

% definindo um filtro passa-baixa simples dado pelo roteiro

FS = 2500;
fHz = [0 250 500 750 1000 1250];
m0 = [1 1 1 0 0 0];
FH = fHz/(FS/2);
[b,a] = yulewalk(4,FH,m0);
[h1,f] = freqz(b,a,1024);

% Encontrando a resposta ao impulso pelo filtro

N = 32;
delta = [1,zeros(1,N)];     % Define o impulso
h1 = filter(b,a,delta);       % Impulso como entrada
figure
subplot(2,1,1);
plot(h1/max(h1));           % Plot resposta normalizada
title('Resposta ao impulso utilizando o filtro');
xlabel('Tempo')             % Rótulo do eixo x
ylabel('h1')                % Rótulo do eixo y
grid on                     % Gráfico quadriculado
 
i = 1;       % Contador para fazer a iteração 150 vezes
C = 0;       % Valor inicial nulo para a correlação
q = 0;       % Valor inicial nulo para o vetor de correlação invertido

% O código será executado 150 vezes e entao será veito uma média da resposta

while i<=150            % Condição de iteração 
    r = randn(1,32);    % Cria ruído aleatório gaussiano
    h=filter(b,a,r);    % Aplica o filtro
    C=xcorr(h,r);       % Realiza correlação entre a saída do filtro e o ruído
    R=C(32:end);        % Desloca o vetor da correlação
    q = R +q;           % Vetor nulo b recebe a correlação invertida
    i = i+1;            % Aumenta um passo no contador
end
q = q./150;             % Realiza a média das 150 iterações
subplot(2,1,2)          % Plota em forma de matriz
plot(q/max(q))          % Plota a correlação normalizada
title('Resposta ao impulso pela Correlação')
xlabel('Tempo')
ylabel('h2')
grid on 

salvaGrafico("Resposta ao impulso pelo filtro e correlação")

%% Salvar as imagens

function salvaGrafico(nome)
% salvaGrafico Salva figura atual em pdf
%   Tomando nome como string de entrada, salva .pdf
%   vetorizando a figura aberta por último
    
    try 
    	cd imagens
    catch
        mkdir imagens
        cd imagens
    end 

    set(gcf,'Units','inches');
    screenposition = get(gcf,'Position');
    set(gcf,...
        'PaperPosition',[0 0 screenposition(3:4)],...
        'PaperSize',[screenposition(3:4)]);
    print(gcf,'-dpdf',nome)
    print(gcf,'-dsvg',nome)
    
    cd ..
end