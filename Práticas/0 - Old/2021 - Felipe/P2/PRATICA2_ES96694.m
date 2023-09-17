clear all; close all; clc;

%% Prática 2
% Felipe dos Anjos Rezende
% ES=96694

%% Roteiro
% I
x = 0:0.2:3;
y = exp(-x) + sin(x);
z = [x',y'];

% II
A = randn(6);
for i = 1:2;
    for j = 1:2;
        b(i,j) = A(i,j);
    end
end

A, b

%% Exercício
% Teste 1
% (x.^2) == (x.*x) 

x = 1:10;
y = (x.^2);
z = (x.*x);
if y == z;
    teste1 = 'verdadeiro';
else
    teste1 = 'falso';
end

teste1

% Teste 2
% A = [123; 456; 789];A^2 == A.^2

A = [123; 456; 789];
b = A^2;
c = A.^2;
if b == c;
    teste2 = 'verdadeiro';
else
    teste2 = 'falso';
end

teste2

% Teste 3
% any((x.^3) > (3*x))

y = x.^3;
z = 3 * x;
if any(y > z);
    teste3 = 'verdadeiro';
else
    teste3 = 'falso';
end

teste3

% Teste 4
% all((x./(x + 1)) > ((x + 1)./(x + 1:5)))

y = (x./(x + 1)); 
z = (x + 1)./(x + 1.5);
if all(y > z);
    teste4 = 'verdadeiro';
else 
    teste4 = 'falso';
end

teste4    
