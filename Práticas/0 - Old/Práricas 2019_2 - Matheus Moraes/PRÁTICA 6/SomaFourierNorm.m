function [sinalR] = SomaFourierNorm(t,freq,mag,fase)
%UNIVERSIDADE FEDERAL DE VI�OSA
%ELT 410 - SINAIS E SISTEMAS
%PR�TICA 4
%JO�O PEDRO ROSSI E THIAGO MENDES 
%90102 93505
% FUN��O para Soma dos termos de Fourier para Reconstruir o sinal

%Tratamento caso nao seja informado o vetor com as fases
if nargin == 3
    fase = zeros(length(freq),1);
end
%Reconstru��o do sinal
for i = 1:length(t)
    sinalR(i) = sum(2*abs(mag).*cos(2*pi*freq*t(i) + fase));
end
%Normaliza��o do Sinal para ficar entre -1 e 1;
Sinalmax = max(sinalR);
Sinalmin = min(sinalR);

for ii = 1:length(t)
    if sinalR(ii)>=0
        sinalR(ii)=sinalR(ii)/Sinalmax;
    else
        sinalR(ii)=sinalR(ii)/abs(Sinalmin);
    end
end
