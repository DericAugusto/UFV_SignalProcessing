%% Exercício 1
clc
clear all
close all
t = 0:0.01:50;
u = @(t) t>=0; 
n = 1 ;
Z  = zeros(1,5001);
Z1 = zeros(1,5001);
Z2 = zeros(1,5001);
i = 1;
while n <= 51
   Z(i)  = Z(i)  + 0.1^(n-1);
   Z1(i) = Z1(i) + 0.5^(n-1);
   Z2(i) = Z2(i) + 0.8^(n-1);
   n = n + 0.01;
   i = i + 1;
end

Z = Z.*u(t);
Z1 = Z1.*u(t);
Z2 = Z2.*u(t);


[Ryy,lags] = xcorr(Z,Z,'coeff');
figure;
subplot(2,1,1);plot(t,Z,'b');
title('Y = (0.1^n)*u(n)');
subplot(2,1,2);plot(lags,Ryy,'k')
title('Autocorrelação');

[Ry1y1,lags] = xcorr(Z1,Z1,'coeff');
figure;
subplot(2,1,1);plot(t,Z1,'b');
title('Y = (0.5^n)*u(n)');
subplot(2,1,2);plot(lags,Ry1y1,'k')
title('Autocorrelação');

[Ry2y2,lags] = xcorr(Z2,Z2,'coeff');
figure;
subplot(2,1,1);plot(t,Z2,'b');
title('Y = (0.8^n)*u(n)');
subplot(2,1,2);plot(lags,Ry2y2,'k')
title('Autocorrelação');
%%
% Exercício 2
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

