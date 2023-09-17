% Universidade Federal de Viçosa - UFV
% Departamento de Engenharia Elétrica - DEL
% ELT 410 - PROCESSAMENTO DIGITAL DE SINAIS
% Thiago Mendes de Ávila 93505 & João Pedro Rossi 90102
% PRÁTICA 8
%%
% EXERCÍCIO 4.1
clc
clear all
close all
%CARREGAR IMAGENS
lena = imread('lena.tiff');
tiffany = imread('tiffany.tiff');
%CONVERTER PARA ESCALA DE CINZA
lena = rgb2gray(lena);
tiffany = rgb2gray(tiffany);

figure
subplot(121)
imshow(lena)
title 'Imagem A em tons de cinza'
subplot(122)
imshow(tiffany)
title 'Imagem B em tons de cinza'

%TRANSFORMADA FFT2
fft_lena = fft2(lena);
fft_tiffany = fft2(tiffany);

%TRANSFORMADA INVERSA IFFT2
%MODULO
M_fft_lena = real(ifft2(abs(fft_lena))); 
M_fft_tiffany = real(ifft2(abs(fft_tiffany))); 

%PHASE
Ph_fft_lena = real(ifft2(exp(1i*angle(fft_lena)))); 
Ph_fft_tiffany = real(ifft2(exp(1i*angle(fft_tiffany)))); 

figure;
imshow((M_fft_lena),[])
title 'Imagem A em módulo'
figure;
imshow(Ph_fft_lena,[])
title 'Imagem A em fase' 

%COMBINAÇÃO DA PHASE DE UMA IMAGEM COM O MODULO DA OUTRA
tiffany_lena = real(ifft2(abs(fft_tiffany).*exp(1i*angle(fft_lena)))); 
%RECONSTRUÇÃO
lena_tiffany = real(ifft2(abs(fft_lena).*exp(1i*angle(fft_tiffany)))); 
figure
imshow(lena_tiffany,[])
title 'Combinação das imagens'
figure
imshow(tiffany_lena,[])
title 'Combinação das imagens 2'
