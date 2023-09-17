%FUNÇÃO QUE REALIZA A CONVOLUÇÃO EM 2 DIMENSÕES PELA DEFINIÇÃO
function C=convolucao2D(I,F)
[ma,na] = size(I);
[mb,nb] = size(F);
aux = rot90(F, 2);
vet = zeros(ma + mb*2-2, na + nb*2-2);
for j = mb : mb+ma-1
    for k = nb : nb+ma-1
        vet(j,k) = I(j-mb+1, k-nb+1);
    end
end
C = zeros(ma+mb-1,nb+na-1);
for j = 1 : ma+mb-1
    for k = 1 : nb+na-1
        for p = 1 : mb
            for q = 1 : nb
                C(j, k) = C(j, k) + (vet(j+p-1, k+q-1) * aux(p, q));
            end
        end
    end
end
end