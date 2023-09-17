function fct=ck(k)

%Esta função produz os coeficientes da série de Fourier de uma onda
%quadrada para ser usada na aula prática de ELT 410. Note que a função tem
%um argumento de entrada 'k' e retorna ck, o k-ésimo coeficiente desta
%série. A função pode também retornar um conjunto de coeficientes se a
%entrada k for um vetor. Por exemplo, se k = [0,1,2], a função retornará os
%coeficientes [c0,c1,c2]

fct = zeros(size(k));
T1 = pi/2;
T = 2*pi;
for m=1:length(k)
    if k(m)==0
        fct(m)=2*T1/T;
    else
        fct(m)=1./(k(m)*pi).*(sin(k(m)*T1));
    end
    
end


return;