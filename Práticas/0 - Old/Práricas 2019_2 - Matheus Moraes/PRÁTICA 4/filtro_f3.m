I = imread('lua 08092019155226.jpg')
[p, q] =size(I) % descobre quais as dimensoes da matriz
l=p-q %subtrai o numero de linhas pelo d colunas cm o intuito de deixar a matriz de entrada quadrada
E=[I zeros(p,l)] % deixa I uma matriz quadrada
F3= [(2)*[1 1 1;1 1 1;1 1 1]]
imagem = convolucao2D(E,F3)
figure(1)
imshow(imagem)
title('Convolução 2D de E com F')
If = uint8( double(I) + imresize(imagem,size(I)));
figure(2)
imshow(If)
title('Aplicação do filtro f2')
