function x = trumpet_fourier(t,freq,mag,ang)

N = length(freq);
if nargin==3
    ang = zeros(1,N);
end
x = 0;
for i = 1:N
    x = x+mag(i)*cos(2*pi*freq(i)*t+ang(i));
end

xmax = max(x);
xmin = min(x);
for i = 1:length(t)
    if x(i)>=0
        x(i)=x(i)/xmax;
    else
        x(i)=x(i)/abs(xmin);
    end
end