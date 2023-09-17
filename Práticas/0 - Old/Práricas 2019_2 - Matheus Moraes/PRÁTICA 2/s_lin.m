%% Sistema Linear de ordem 3
function [x , y , z ] = s_lin()

A = zeros(3,3);
B = zeros(3,1);
i = 1;
j = 1;
k = 1;
disp('Entre com os elementos da matriz A (a11,a12,...,a33): ')
for i=1:3
    for j=1:3
        A(i,j)= input(['a' num2str(i),num2str(j),' = ']);
    end
end
disp('Entre com a matriz B termo a termo: ')
for k=1:3
    B(k,1) = input(['B' num2str(k),'1 = ']);
end
disp(' ')
A;
B;

detA=det(A);
C = [B A(:,2) A(:,3)];
detC = det(C);
D = [A(:,1) B A(:,3) ];
detD = det(D);
E = [A(:,1) A(:,2) B];
detE = det(E);
if detA == 0 
    if detC ==0 || detD == 0 || detE ==0
        disp('Sistema Possível Indeterminado')
        x = detC/detA;
        y = detD/detA;
        z = detE/detA;
    else
        disp('Sistema Impossível')
        x = detC/detA;
        y = detD/detA;
        z = detE/detA;
    end
else
x = detC/detA;
y = detD/detA;
z = detE/detA;
disp('Sistema Possível Determinado')

disp(['x = ' num2str(x)])
disp(['y = '  num2str(y)])
disp(['z = ' num2str(z) ])
end