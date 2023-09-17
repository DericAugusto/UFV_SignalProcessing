clear all; close all; clc;

%% Prática 4
% Felipe dos Anjos Rezende
% ES=96694

%% Exercício
% III

%Exibindo a imagem
I = imread('lua.jpg');
subplot(3,3,1);
imshow(I, [0 255]);
title('Lua Original');

% Primeiro Filtro
F =[-1,-1,-1;-1,8,-1;-1,-1,-1];
If = uint8( double(I) + imresize(Convolucao2D(F,I),size(I)));
subplot(3,3,2);
imshow(If, [0 255]);
title('F')

% F1
F1 = 1/9*ones(3,3);
f1 = uint8( double(I) + imresize(Convolucao2D(F1,I),size(I)));
subplot(3,3,3);
imshow(f1, [0 255]);
title('F1');

% F2
F2 = 2*ones(3,3);
f2 = uint8( double(I) + imresize(Convolucao2D(F2,I),size(I)));
subplot(3,3,4);
imshow(f2, [0 255]);
title('F2');

% F3
F3 = F2./F1;
f3 = uint8( double(I) + imresize(Convolucao2D(F3,I),size(I)));
subplot(3,3,5);
imshow(f3, [0 255]);
title('F3');

% F4
F4 = [-1,-1,0;-1,3,0;0,0,0;];
f4 = uint8( double(I) + imresize(Convolucao2D(F4,I),size(I)));
subplot(3,3,6);
imshow(f4, [0 255]);
title('F4');
%%
% Imagem Texto
I1 = imread('texto.jpg');
figure;
subplot(1,2,1);
imshow(I1, [0 255]);
title('Texto Original');

% Imagem Texto após o filtro
F1 = 1/9*ones(3,3);
IF1 = uint8( double(I1) + imresize(Convolucao2D(F1,I1),size(I1)));
subplot(1,2,2);
imshow(IF1, [0 255]);
title('Texto Filtrada');