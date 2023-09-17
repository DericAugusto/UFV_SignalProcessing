%% soma de  matrizes
function [C]=soma_matriz(A,B);
a=size(A);
b=size(B);
c=a(1,1);
d=a(1,2);
e=b(1,1);
f=b(1,2);
while (c~=e | d~=f );
    disp('matrizes de ordem diferente')
    A=input('entre com a matriz A:');
    B=input('entre com a matriz B:');
    a=size(A);
    b=size(B);
    c=a(1,1);
    d=a(1,2);
    e=b(1,1);
    f=b(1,2);
end;
C=A+B;
end