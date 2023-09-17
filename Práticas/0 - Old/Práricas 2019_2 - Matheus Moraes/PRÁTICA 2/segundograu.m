%% calcula de raizes de uma função quadrática
function [xa,xb] =  segundograu(a,b,c);

if a == 0;
disp(' ==== A equacao nao e do segundo grau ==== ');
a = input(' Coeficiente de x^2 - a <> 0 ')
end;
delta = b^2-4.*a*c;

if delta == 0;
ch = 0;
end;
if delta < 0;
ch = -1;
end
if delta > 0
ch = 1;
end;
xa = (-b + sqrt(delta))/(2.*a);
xb = (-b - sqrt(delta))/(2.*a);

switch ch;
case 0, disp([' Raizes reais e iguais.    x(1)=',num2str(xa),'    x(2)=',num2str(xb)])
case -1, disp([' Raizes complexas conjugadas.   x(1)=',num2str(xa),'    x(2)=',num2str(xb)])
otherwise,disp([' Raizes reais e desiguais.   x(1)=',num2str(xa),'    x(2)=',num2str(xb)])
end
