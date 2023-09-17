%% fatrorial
function[p]=fat(n);
p=1;
a=0;
if n == 0;
    disp(['!0=',num2str(p)])
else; 
    while n>0;
        p=p*n;
        n=n-1;
        a=a+1;
    end;
end
