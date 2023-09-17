
clc
clear all
close all

%%  Exercício 04

% carrega e plota as imagens
A = imread('aplane.tiff');
B = imread('tank.tiff');
figure
imshow(A);
figure
imshow(B);

% deixa a imagem em tons de cinza
%%Ag = rgb2gray(A);
%%Bg = rgb2gray(B);
%%figure
%%imshow(Ag);
%%figure
%%imshow(Bg);

% transformada de Fourier bidimensional das duas imagens
Xa = fft2(A);
Xb = fft2(B);

% plotagem apenas a magnitude da imagem A  (4.4)
Ixam = ifft2(abs(Xa));
imshow(log(real(Ixam)),[]);
title('Magnitude de Xa(jw1,jw2)')

%%

% plotagem de apenas a fase da imagem A   (4.5)
Ixaf = ifft2(exp(1i*angle(Xa)));
imshow(Ixaf, []);
title('Fase de Xa(jw1,jw2)');




%% faltam 4.6 e 4.7

% plotagem de magnitude de Xb e módulo de Xa  (4.8)
Ixa = ifft2((abs(Xb)).*exp(1i*angle(Xa)));
imshow(Ixa, []);
title('Imagem com magnitude de Xb(jw1,jw2) e fase de Xa(jw1,jw2)');

