%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Prática 2

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
% Função que calcula raízes de uma equação de segundo grau

disp('==== Entre com a, b e c ====');
a = input('Coeficiente de x^2: ');
while a == 0
    disp('==== A equacao não é de segundo grau ====')
    a = input('Coeficiente de x^2: ');
end
b = input('Coeficiente de x: ');
c = input('Termo independente de x: ');


[x1, x2, delta] = polinomio2grau(a,b,c);

if delta == 0;
    disp('Raízes reais e iguais.'); disp(['x1 = x2 = ', num2str(x1)]);
end

if delta < 0
    disp('Raízes complexas conjugadas.'); disp(['x1 = ', num2str(x1)]); disp(['x2 = ', num2str(x2)]);
end

if delta > 0
    disp('Raízes reais e distintas.'); disp(['x1 = ', num2str(x1)]); disp(['x2 = ', num2str(x2)]);
end

%% Questões a serem tratadas no relatório

%Exercício

x = 1:10;
X = (x.*x);
Y = (x.^2);
X == Y %Retornou um vetor de "uns", ou seja, a igualdade é verdadeira!

A = [1 5 4; 3 0 0; 1 0 2];
A^2 == A.^2 %Retornou um vetor de zeros, ou seja, a igualdade é falsa!

any((x.^3) > (3*x)) %Retornou 1, logo é verdadeiro pelo menos uma vez!
all((x./(x+ 1))>((x+ 1)./(x+ 1.5))) %Retornou zero, logo é falso pelo menos uma vez!
                                    %(Para retornar 1, todos teriam que ser verdadeiros!)

%Função que calcula o fatorial de um número

clear all;
close all;
clc;

n = input('Digite o número desejado: ');
while n < 0
    disp('O número deve ser não negativo!');
    n = input('Digite o número desejado: ');
end

x = fatorial(n);

disp(' ');
disp([num2str(n), '! = ', num2str(x)]);

%Função que calcula a soma de duas matrizes

clear all;
close all;
clc;
C = soma;
disp('A matriz resultante é: ');
disp('C = '); disp(C);

%Função que calcula a multiplicação de duas matrizes

clear all;
close all;
clc;
C = multiplicacao;
disp('A matriz resultante é: ');
disp('C = '); disp(C);

%Função que retorna a solução de um sistema linear de ordem 3

clear all;
close all;
clc;
X = sistema;
if X == [0; 0; 0]
    disp('Sistema possível indeterminado ou impossível!');
else
    disp('A solução do sistema linear é: ');
    disp('X = '); disp(X);
end