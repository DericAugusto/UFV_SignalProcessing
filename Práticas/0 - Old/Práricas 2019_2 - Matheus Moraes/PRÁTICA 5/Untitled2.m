fs = 256;
fo = 8; tmax = 16;
t = 0:1/fs:tmax;
x1 = sin(2*pi*fo*t);
var=0:0.1:10
r1=randn(size(t));
for i=1:length(var);
    xn=x1+sqrt(var(i))*r1;
    Rxx=xcorr(x1,xn,'coeff');
    Rxxmax(i)=max(Rxx);
    i=i+0.1;
end
plot(var,Rxxmax)
title('Amplitude da correlação');
xlabel('amplitude do rúido')
ylabel('Rxy')
