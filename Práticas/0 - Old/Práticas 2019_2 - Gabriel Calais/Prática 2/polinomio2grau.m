function[x1,x2,delta] = polinomio2grau(a,b,c)

delta = b^2 - 4*a*c;

x1 = (-b + sqrt(delta))/(2.*a);
x2 = (-b - sqrt(delta))/(2.*a);

end