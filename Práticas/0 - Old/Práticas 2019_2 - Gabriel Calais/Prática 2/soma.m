function[C] = soma(A,B)

disp('Entre com os par�metros pedidos:');
disp(' ');

m = input('N�mero de linhas da matriz A: ');
disp(' ');
n = input('N�mero de colunas da matriz A: ');
disp(' ');
o = input('N�mero de linhas da matriz B: ');
disp(' ');
p = input('N�mero de colunas da matriz B: ');
disp(' ');

while m ~= o || n ~= p
    disp('As matrizes devem ter a mesma ordem!');
    disp(' ');
    m = input('N�mero de linhas da matriz A: ');
    disp(' ');
    n = input('N�mero de colunas da matriz A: ');
    disp(' ');
    o = input('N�mero de linhas da matriz B: ');
    disp(' ');
    p = input('N�mero de colunas da matriz B: ');
    disp(' ');
end

for i = 1 : m
    for j = 1 : n 
        A(i,j) = input(['Digite o termo a(', num2str(i), ',', num2str(j), '): ']);
        disp(' ');
    end
end
A = reshape(A,m,n);

for i = 1 : o
    for j = 1 : p 
        B(i,j) = input(['Digite o termo b(', num2str(i), ',', num2str(j), '): ']);
        disp(' ');
    end
end
B = reshape(B,o,p);

C = A + B;

end