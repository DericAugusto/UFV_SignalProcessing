clear all; close all; clc;

%% Prática 5
% Felipe dos Anjos Rezende
% ES=96694

%% Exercício
% I

k = -10:10;  
y = ck(k);
stem(k,y)

% Para Kmax=5
t = -5:0.01:5;
x = zeros(size(t));
Kmax = 5;
wo=2;
for k=0:Kmax
    x=x+(2*abs(ck(k))*cos(k*wo*t+angle(ck(k))));
end
figure
subplot(3,1,1)
plot(t,x)
title('5 harmônicos')

% Para Kmax=15
x = zeros(size(t));
Kmax = 15;
for k=0:Kmax
    x=x+(2*abs(ck(k))*cos(k*wo*t+angle(ck(k))));
end
subplot(3,1,2)
plot(t,x)
title('15 harmônicos')

% Para Kmax=30
x = zeros(size(t));
Kmax = 30;
for k=0:Kmax
    x=x+(2*abs(ck(k))*cos(k*wo*t+angle(ck(k))));
end
subplot(3,1,3)
plot(t,x)
title('30 harmônicos')

%% II

t = -5:0.01:5;
x = zeros(size(t));
Kmax = 100;
wo=2;
for k=0:Kmax
    x=x+((Kmax-k)/Kmax*2*abs(ck(k))*cos(k*wo*t+angle(ck(k))));
end
figure
plot(t,x)

x = zeros(size(t));
Kmax = 100;
for k=0:Kmax
    x=x+((0.54+0.46*cos(k*pi/Kmax))*2*abs(ck(k))*cos(k*wo*t+angle(ck(k))));
end
figure
plot(t,x)
