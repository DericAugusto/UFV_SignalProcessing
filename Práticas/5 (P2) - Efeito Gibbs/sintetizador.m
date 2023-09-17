function [x] = sintetizador(t, freq, mag)

x = zeros(1,length(t));
for j=1:1:length(t)
    for i=1:1:length(mag)
        x(j) = x(j) + 2*abs(mag(i))*cos( 2*pi*freq(i)*(t(j)) );
    end
end
x = x/max(abs(x));
end