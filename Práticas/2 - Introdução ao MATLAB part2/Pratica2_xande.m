%% ELT 355 Prática 1 
% Aluno: Alexandre Caldeira - Matrícula: 96701
% Boas práticas:
clearvars;close all;clc;
%% Roteiro:
% Dado o trecho de código a seguir: 
% salve os dados em z, limpe o workspace e carregue  os valores salvos.

x = 0:0.2:3; 
y = exp(-x) + sin(x); 
z = [x' y'];
save('z.mat','z')
clearvars;
load('z.mat')

% É possível construir matrizes maiores a partir de matrizes menores:
% A = [1 2 3; 4 5 6; 7 8 9]; r = [13 3 25]; A = [A; r];
% Extraia uma matriz menor (2x2) de uma maior (6x6).

maior = randn(6,6);             % matriz (6x6) com números aleatórios
menor = nan(2,2);               % matriz (2x2) com números inválidos
disp('Número de valores invalidos na matriz menor:')
disp(sum(isnan(menor),'all'))   % menor possuir 4 números inválidos...
menor = maior(3:4,3:4);         % popula menor com parte da matriz maior
disp('menor = maior(3:4,3:4) implica:')
disp(menor)                     
disp('Número de valores invalidos na matriz menor:')
disp(sum(isnan(menor),'all'))   % menor não tem mais números inválidos!

% Crie uma função de teste para retornar o valor de um polinômio cúbico:
disp('Através de funções em script:')
x = 5;
disp('x = ')
disp(x)
disp('=> y = f(x) = x^3/4+x^2/3+x/2 =')
a0 = 0;
a1 = 1/2;
a2 = 1/3;
a3 = 1/4;
disp(avaliaPolinomioCubico(x,a0,a1,a2,a3))

disp('Através de Function handle:')
disp('f(x) = ')
f = @(x) (a3*x^3+a2*x^2+a1*x+a0); 
disp(f)
disp('=> y = f(x=5) = ')
disp(f(x))

%% Questões a serem tratadas no Relatório
% Seja o vetor x = 1:10; 
% Verifique as afirmativas:
%% 1)
x = 1:10;

disp('1) (x.^2) ==(x.*x) é:')
if (x.^2) ==(x.*x)
    fprintf('\t VERDADEIRO !\n\n')
else
    fprintf('\t FALSO !\n\n')
end

disp('Pois:')
disp('(x.^2) = ')
disp(x.^2)
disp('(x.*x) = ')
disp(x.*x)
fprintf('---\n\n')

%% 2)

A = [1 2 3; 4 5 6; 7 8 9]; 

% try
%     disp(A^2)
% catch ME
%     warning(ME.message)
%     disp('Então, calcularemos A^2 como A*A''...') 
% end

disp('2) A^2 == A.^2 é:')
if (A^2 == A.^2)
    fprintf('\t VERDADEIRO !\n\n')
else
    fprintf('\t FALSO !\n\n')
end

disp('Pois:')
disp('A^2 = ')
disp(A*A')
disp('A.^2 = ')
disp(A.^2)
fprintf('---\n\n')

%%
disp('3) any((x.3) > (3 ? x)) é:')
if any((x.^3) > (3 * x))
    fprintf('\t VERDADEIRO !\n\n')
else
    fprintf('\t FALSO !\n\n')
end

disp('Pois:')
disp('x.^3 = ')
disp(x.^3)
disp('3 * x = ')
disp(3 * x)
fprintf('---\n\n')

%%
disp('4) all((x./(x + 1)) > ((x + 1)./(x + 1.5))) é:')
if all((x./(x + 1)) > ((x + 1)./(x + 1.5)))
    fprintf('\t VERDADEIRO !\n\n')
else
    fprintf('\t FALSO !\n\n')
end

disp('Pois:')
disp('(x./(x + 1)) = ')
disp(x./(x + 1))
disp('((x + 1)./(x + 1.5)) = ')
disp((x + 1)./(x + 1.5))
fprintf('---\n\n')

%% Chamada das funções desejadas:
% Fatorial:
disp('0!')
disp(calculaFatorial(0))
disp('1!')
disp(calculaFatorial(1))
disp('2!')
disp(calculaFatorial(2))
disp('3!')
disp(calculaFatorial(3))
disp('5!')
disp(calculaFatorial(5))
disp('10!')
disp(calculaFatorial(10))

disp('Comparando com função do MATLAB:')
disp('calculaFatorial(10)==factorial(10) ?')
if (calculaFatorial(10)==factorial(10))
    disp('Verdadeiro')
else
    disp('Falso')
end

fprintf('\n---\n\n')

% Soma de matrizes:
matrizA = 5.*ones(5,5);
matrizB = 3.*ones(5,5);

resultado = somaMatrizes(matrizA, matrizB);

disp('Matriz A: ')
disp(matrizA)
disp('Matriz B: ')
disp(matrizB)
disp('Matriz A + Matriz B = ')
disp(resultado)

fprintf('\n---\n\n')

% Multiplica matrizes:
matrizA = 2.*ones(4,4);
matrizB = randi(5).*ones(4,4);
resultado = multiplicaMatrizes(matrizA, matrizB);

disp('Matriz A: ')
disp(matrizA)
disp('Matriz B: ')
disp(matrizB)
disp('Matriz A x Matriz B = ')
disp(resultado)



