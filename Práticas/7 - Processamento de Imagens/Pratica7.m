% Pratica 7
% Alexandre Caldeira - 96701
clearvars;close all;clc
% boas praticas

%% Exercício 1
figure(1)
% A = imread('5.3.02.tiff');
% );
A = imread('gray21.512.tiff');
imshow(A,[0 255])
title('Imagem A')

figure(2)
B = imread('boat.512.tiff');
imshow(B,[0 255])
title('Imagem B')

%% Exercício 2,3,4 e 5
Xa = fftshift(fft2(A));
Xb = fftshift(fft2(B));
% Xa = (fft2(A));
% Xb = (fft2(B));

figure(3)
imshow(abs(Xa),[0 255])
title('Módulos de Xa')

figure(4)
imshow(unwrap(angle(Xa)),[0 255])
title('Fases de Xa')

%% Exercício 6
A2 = ifft2(abs(Xa));

figure(5)
imshow(real(A2))
title('Inversa de Xa com fase nula')

%% Exercício 7
A3 = ifft2(1+ imag(Xa));

figure(6)
imshow(real(A3),[0 255])
title('Inversa de Xa com módulo unitário')

%% Exercício 8
AB = real(ifft2(angle(Xa)+abs(Xb)));

figure(7)
imshow(AB,[0 255])
title('Fases de Xa com módulos de Xb')

%% Extra

ReconstruidaA = real(ifft2(1j*imag(Xa)+real(Xa)));
figure(8)
imshow(ReconstruidaA,[0 255])
title('Imagem A reconstruida')


ReconstruidaB = real(ifft2(1j*imag(Xb)+real(Xb)));
figure(9)
imshow(ReconstruidaB,[0 255])
title('Imagem B reconstruida')


figure(10)
% img = zeros(size(A,1),size(A,2),2);
% img(:,:,1) = A;
% img(:,:,3) = abs(Xa);
imshow(real(A+uint8(abs(Xa))))

