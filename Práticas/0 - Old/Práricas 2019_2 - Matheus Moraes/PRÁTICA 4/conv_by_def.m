%FUNÇÃO QUE REALIZA A CONVOLUÇÃO EM 1 DIMENSÃO PELA DEFINIÇÃO
function Y= conv_by_def(a,b)
disp('Entre com dois vetores ''a'' e ''b''');
a=input('entre com o vetor a:');
b=input('entre com o vetor b:');
m= length(a);
n= length(b);
tic
A=[a zeros(1,n-1)];
B=[b zeros(1,m-1)];
for i= 1:m+n-1
    Y(i)=0;
 for j= 1:m
     if((i-j+1)>0)  
        Y(i)= Y(i)+(A(j)*B(i-j+1));
     end
 end
end
toc
tic
conv(a,b)
toc
end