%testando com imagens aleátorias
I = imread('IMG-20160717-WA0010.jpg')

R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);


[p, q] =size(R) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[R zeros(p,l)] % deixa I uma matriz quadrada
F1=[-1 -1 -1;-1 8 -1;-1 -1 -1]
imagem = convolucao2D(E,F1)
figure(9)
imshow(imagem)
title('Convolução 2D de E com F3')
If1 = uint8( double(E) + imresize(imagem,size(E)));
figure(10)
imshow(If1)
title('Aplicação do filtro F3')

[p, q] =size(G) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[G zeros(p,l)] % deixa I uma matriz quadrada
F1=[-1 -1 -1;-1 8 -1;-1 -1 -1]
imagem = convolucao2D(E,F1)
figure(11)
imshow(imagem)
title('Convolução 2D de E com F3')
If2 = uint8( double(E) + imresize(imagem,size(E)));
figure(12)
imshow(If2)
title('Aplicação do filtro F3')

[p, q] =size(B) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[B zeros(p,l)] % deixa I uma matriz quadrada
F1=[-1 -1 -1;-1 8 -1;-1 -1 -1]
imagem = convolucao2D(E,F1)
figure(13)
imshow(imagem)
title('Convolução 2D de E com F3')
If3 = uint8( double(E) + imresize(imagem,size(E)));
figure(14)
imshow(If3)
title('Aplicação do filtro F3')

T=If1+If2+If3
figure(15)
imshow(T)
