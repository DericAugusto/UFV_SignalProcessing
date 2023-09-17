%% multiplicação de matrizes
function [C]=multpl_matriz(A,B);
D = size(A);
F = size(B);
b =D(1,2);
a =F(1,1);
while b ~= a;
    disp('impossivel multiplicar')
    A=input('entre com a matriz A:')
    B=input('entre com a matriz B:')
    D = size(A);
    F = size(B);
    b =D(1,2);
    a =F(1,1)
end;
C = A*B;
end
   

