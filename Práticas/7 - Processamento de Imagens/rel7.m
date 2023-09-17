close all
clear all
clc

%abrindos imagens e tratando para escalas de cinza
% A = imread('4.1.06.tiff'); 
% B = imread('4.1.04.tiff'); 
A1 = imread('gray21.512.tiff');
B1 = imread('boat.512.tiff');
% A1 = rgb2gray(A); 
% B1 = rgb2gray(B); 

%plotando imagens tratadas
%figure
%subplot(1,2,1), imshow(A1), title('Imagem A') 
%subplot(1,2,2), imshow(B1), title('Imagem B')

AT = fft2(A1);
BT = fft2(B1);

%plotando imagem apenas com os módulos de XA(jw1, jw2)
%Im1 = (ifft2(abs(BT))); 
%figure, subplot(1,2,1), imshow(real(log(Im1)),[])
%title('Imagem A - módulos de XA')

%plotando imagem apenas com as fases de XA(jw1, jw2)
%Ia1 = ifft2(exp(1i*angle(BT))); 
%subplot(1,2,2), imshow(real(Ia1),[])
%title('Imagem A - fases de XA')

%imagem com módulo de A e fase 0
%angle_zero = zeros(size(AT));
%angle_zero(:) = abs(AT(:));
%figure
%subplot(1,2,1)
%imshow(real(log(ifft2(angle_zero))),[])
%title('Imagem com módulo de A e fase 0')

%imagem com fase de A e módulo 1 
%angle_ = zeros(size(AT));
%[x,y] = pol2cart(angle(AT(:)), 1E-17);
%angle_(:) = x(:) + y(:)*1i;
%subplot(1,2,2)
%imshow(real(log(ifft2(angle_))),[])
%title('Imagem com fase de A e módulo 1')

%imagem com fase de A e amplitude de B
mix = zeros(size(BT));
[a,b] = pol2cart(angle(BT(:)), abs(AT(:)));
mix(:) = a(:) + b(:)*1i;
figure
subplot(1,2,1)
imshow(uint8(real(ifft2(mix))),[])
title('Fase de A e módulo de B')

mix = zeros(size(AT));
[a,b] = pol2cart(angle(AT(:)), abs(BT(:)));
mix(:) = a(:) + b(:)*1i;
subplot(1,2,2)
imshow(uint8(real(ifft2(mix))),[])
title('Fase de B e módulo de A')