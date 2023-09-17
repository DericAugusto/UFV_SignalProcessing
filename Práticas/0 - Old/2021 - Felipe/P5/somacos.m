function s = somacos(mag,freq,t)
s=zeros(size(t));

for i=1:length(mag)
    s =s + mag(i)*cos(2*pi*freq(i)*t);
end

return;
end