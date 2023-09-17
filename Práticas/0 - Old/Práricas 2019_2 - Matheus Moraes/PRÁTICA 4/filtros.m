%Filtro F
%%
I = imread('lua 08092019155226.jpg')
[p, q] =size(I) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[I zeros(p,l)] % deixa I uma matriz quadrada
F=[-1 -1 -1;-1 8 -1;-1 -1 -1]
imagem = convolucao2D(E,F)
figure(1)
imshow(imagem)
title('Convolução 2D de E com F')
If = uint8( double(E) + imresize(imagem,size(E)));
figure(2)
imshow(If)
%%
%Filtro F1
I = imread('lua 08092019155226.jpg')
[p, q] =size(I) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[I zeros(p,l)] % deixa I uma matriz quadrada
F1=(1/9)*[1 1 1;1 1 1;1 1 1]
imagem = convolucao2D(E,F1)
figure(3)
imshow(imagem)
title('Convolução 2D de E com F1')
If = uint8( double(E) + imresize(imagem,size(E)));
figure(4)
imshow(If)
%%
%Filtro F2
I = imread('lua 08092019155226.jpg')
[p, q] =size(I) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo de colunas com o intuito de deixar a matriz de entrada quadrada
E=[I zeros(p,l)] % deixa I uma matriz quadrada
F2=(2)*[0 0 0;0 1 0;0 0 0]
imagem = convolucao2D(E,F2)
figure(5)
imshow(imagem)
title('Convolução 2D de E com F2')
If = uint8( double(E) + imresize(imagem,size(E)));
figure(6)
imshow(If)
%%
%Filtro f3
I = imread('lua 08092019155226.jpg')
[p, q] =size(I) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[I zeros(p,l)] % deixa I uma matriz quadrada
F1=(1/9)*[1 1 1;1 1 1;1 1 1]
F2=(2)*[1 1 1;1 1 1;1 1 1]
F3=5*F1 -(1/4)*F2 %combinação de F1 com F2
imagem = convolucao2D(E,F3)
figure(7)
imshow(imagem)
title('Convolução 2D de E com F3')
If = uint8( double(E) + imresize(imagem,size(E)));
figure(8)
imshow(If)
title('Aplicação do filtro F3')
%%
%testando com imagens aleátorias
I = imread('leao.jpg')
imshow(I)
[p, q] =size(I) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[I;zeros(l,q)] % deixa I uma matriz quadrada
F1=(1/9)*[1 1 1;1 1 1;1 1 1]
F2=(2)*[1 1 1;1 1 1;1 1 1]
FT=5*F1 +(2)*F2 %combinação de F1 com F2
imagem = convolucao2D(E,FT)
figure(9)
imshow(imagem)
title('Convolução 2D de E com FT')
If = uint8( double(E) + imresize(imagem,size(E)));
figure(10)
imshow(If)
title('Aplicação do filtro F3')
%%
%filtro f4
I = imread('lua 08092019155226.jpg')
[p, q] =size(I) % descobre quais as dimensoes da matriz
l=abs(p-q)   %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[I zeros(p,l)] % deixa I uma matriz quadrada
F4=[-1 -1 0;-1 3 0;0 0 0]
imagem = convolucao2D(E,F4)
figure(11)
imshow(imagem)
title('Convolução 2D de E com F4')
If = uint8( double(E) + imresize(imagem,size(E)));
figure(12)
imshow(If)
title('Aplicação do filtro F4')
%%
%filtro f5
%texto
I = imread('texto 08092019155244.jpg')
[p, q] =size(I) % descobre quais as dimensoes da matriz
l=abs(p-q) %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[I;zeros(l,q)] % deixa I uma matriz quadrada
F5=(1/9)*[1 1 1;1 1 1;1 1 1]
imagem = convolucao2D(E,F5)
figure(13)
imshow(imagem)
title('Convolução 2D de E com F5')
If = uint8(imresize(imagem,size(E)));
figure(14)
imshow(If)
title('Aplicação do filtro F5')

