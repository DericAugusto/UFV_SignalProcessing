function[X] = sistema(A,B)

disp('Entre com os coeficientes do sistema linear:');
disp(' ');

for i = 1 : 3
    A(i,1) = input(['Digite o termo a', num2str(i), ': ']);
    A(i,2) = input(['Digite o termo b', num2str(i), ': ']);
    A(i,3) = input(['Digite o termo c', num2str(i), ': ']);
    B(i,1) = input(['Digite o termo resposta d', num2str(i), ': ']);
    disp(' ');
end

if det(A) || 0
    X = (inv(A))*B;
else
    X = [0; 0; 0];
end