function[Y] = convolucao(x,h)

m = length(x);
n = length(h);

y = [x zeros(1,n-1)];
z = [h zeros(1,m-1)];

Y = zeros(1,n+m-1);

for i=1:n+m-1
    for j=1:m
        if((i-j+1)>0)
            Y(i)=Y(i)+(y(j)*z(i-j+1));
        else
        end
    end
end
end