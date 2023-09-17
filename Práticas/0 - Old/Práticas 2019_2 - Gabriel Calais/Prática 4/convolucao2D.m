function[X] = convolucao2D(A,B)

[m,n] = size(A);
[p,q] = size(B);

C=[A zeros(m,q-1)];
E=[C; zeros(p-1,n+q-1)];

D=[B zeros(p,n-1)];
F=[D; zeros(m-1,q+n-1)];

X = zeros(m+p-1,n+q-1);

for j=1:m+p-1
    for k=1:n+q-1
        for a=1:m+p-1
            for b=1:n+q-1
                if j-a+1>0 & k-b+1>0
                    X(j,k)=X(j,k)+(E(a,b)*F(j-a+1,k-b+1));
                else
                end
            end
        end
    end
end
end