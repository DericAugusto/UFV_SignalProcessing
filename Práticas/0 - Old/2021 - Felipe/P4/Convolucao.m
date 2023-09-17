function [c] = Convolucao(x,h) % Cria a fun��o de convolu��o, sendo x e h os vetore de entrada
                                % e c a convolu��o de sa�da
m = length(x);
n = length(h);                 % Tamanho dos vetores de entrada

xz = [x, zeros(1,n)];
hz = [h, zeros(1,m)];          % Completa os vetores de entrada

for i = 1:m+n-1                % Loop que vai at� a soma dos tamnhos
    c(i) = 0;
    for j = 1:m                % Loop at� tamanho do vetor x
        if (i-j+1>0)
            c(i) = c(i)+xz(j)*hz(i-j+1);    % Realiza convolu��o dos vetores
            
        end
    end
end
end