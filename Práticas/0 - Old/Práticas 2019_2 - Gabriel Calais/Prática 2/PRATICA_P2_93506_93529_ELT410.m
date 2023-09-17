%% UNIVERSIDADE FEDERAL DE VI�OSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e M�rcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Pr�tica 2

%a
x = 0:0.2:3;
y = exp(-x) + sin(x);
z = [x' y'];
save('z.mat', 'z');
clear all;
load('z.mat');

%b
A = 100*randn(6);
M = A(3:4,3:4);

%c
clear all;
close all;
clc;
% Fun��o que calcula ra�zes de uma equa��o de segundo grau

disp('==== Entre com a, b e c ====');
a = input('Coeficiente de x^2: ');
while a == 0
    disp('==== A equacao n�o � de segundo grau ====')
    a = input('Coeficiente de x^2: ');
end
b = input('Coeficiente de x: ');
c = input('Termo independente de x: ');


[x1, x2, delta] = polinomio2grau(a,b,c);

if delta == 0;
    disp('Ra�zes reais e iguais.'); disp(['x1 = x2 = ', num2str(x1)]);
end

if delta < 0
    disp('Ra�zes complexas conjugadas.'); disp(['x1 = ', num2str(x1)]); disp(['x2 = ', num2str(x2)]);
end

if delta > 0
    disp('Ra�zes reais e distintas.'); disp(['x1 = ', num2str(x1)]); disp(['x2 = ', num2str(x2)]);
end

%% Quest�es a serem tratadas no relat�rio

%Exerc�cio

x = 1:10;
X = (x.*x);
Y = (x.^2);
X == Y %Retornou um vetor de "uns", ou seja, a igualdade � verdadeira!

A = [1 5 4; 3 0 0; 1 0 2];
A^2 == A.^2 %Retornou um vetor de zeros, ou seja, a igualdade � falsa!

any((x.^3) > (3*x)) %Retornou 1, logo � verdadeiro pelo menos uma vez!
all((x./(x+ 1))>((x+ 1)./(x+ 1.5))) %Retornou zero, logo � falso pelo menos uma vez!
                                    %(Para retornar 1, todos teriam que ser verdadeiros!)

%Fun��o que calcula o fatorial de um n�mero

clear all;
close all;
clc;

n = input('Digite o n�mero desejado: ');
while n < 0
    disp('O n�mero deve ser n�o negativo!');
    n = input('Digite o n�mero desejado: ');
end

x = fatorial(n);

disp(' ');
disp([num2str(n), '! = ', num2str(x)]);

%Fun��o que calcula a soma de duas matrizes

clear all;
close all;
clc;
C = soma;
disp('A matriz resultante �: ');
disp('C = '); disp(C);

%Fun��o que calcula a multiplica��o de duas matrizes

clear all;
close all;
clc;
C = multiplicacao;
disp('A matriz resultante �: ');
disp('C = '); disp(C);

%Fun��o que retorna a solu��o de um sistema linear de ordem 3

clear all;
close all;
clc;
X = sistema;
if X == [0; 0; 0]
    disp('Sistema poss�vel indeterminado ou imposs�vel!');
else
    disp('A solu��o do sistema linear �: ');
    disp('X = '); disp(X);
end