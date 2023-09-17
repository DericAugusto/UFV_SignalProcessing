%% UNIVERSIDADE FEDERAL DE VIÇOSA
%  ELT - 410 SINAIS E SISTEMAS
%  JOÃO PEDRO NUNES ROSSI 90102
%  THIAGO MENDES DE ÁVILA 93505

clc;
close all;
clear all;
%%
%ROTEIRO
%PARTE 1
%PARTE 2
x = 0 : 0.2 : 3;
y = exp(-x) + sin(x);
z = [(x') (y')];
save('z.mat','z');
A=25*rand(6,6);
B=[A(1,1) A(5,6);A(6,6) A(4,6)];
disp(B)
clear all

%%
disp(' ==== Entre com a, b e c ==== ');
a = input(' Coeficiente de x^2: ');
b = input(' Coeficiente de x: ');
c = input(' Termo independente de x: ');

segundograu(a,b,c)
%%
%%PARTE 3
%a)
x = 1:10 
if ((x.^2) == (x.*x))
    disp('V')
else
    disp('F')
end
%b)
A = [1 2 3; 4 5 6; 7 8 9]; 
if(  A^2 == A.^2)
    disp('V');
else
    disp('F');
end
%c)
if any((x.^3) > (3 * x));
    disp('V')
else
    disp('F')
end
%d)
if all((x./(x + 1)) > ((x + 1)./(x + 1.5)))
    disp('V')
else disp('F')
end
%e)
%fatorial
n =input('entre com um número inteiro:');
fat(n)

%soma de matrizes
A=input('entre com a matriz A:')
B=input('entre com a matriz B:')
soma_matriz(A,B)

%multiplicação de matrizes

A=input('entre com a matriz A:')
B=input('entre com a matriz B:')
multpl_matriz(A,B)

%sistema linear
s_lin()