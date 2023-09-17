function[x] = fatorial(n)

x = n;

if x == 0
    x = 1;
else    
    while n > 1
        x = x*(n-1);
        n = n - 1;
    end
end
end