% Prática 7 - Laboratório de Sinais e Sistemas
% Iure Rosa, 90688
% @uthores Iure Rosa
%% Inicializar Script
clear all; close all; clc;

%% Roteiro

% Carregando as imagens e convertendo para escala de cinza

im1=rgb2gray(imread('4.1.04.tiff')); % Faz a conversão da imagem colorida para escala de cinza
im2=rgb2gray(imread('4.1.06.tiff')); % Faz a conversão da imagem colorida para escala de cinza
figure()
imshow(im1,[]); % Exibe a imagem "im1"
figure()
imshow(im2,[]); % Exibe a imagem "im2"

% Aplicando a transformada

IM1=fft2(im1); % Transformada bidimensional de Fourier da imagem "im1"
IM2=fft2(im2); % Transformada bidimensional de Fourier da imagem "im2"

% Plotando a transformada inversa do módulo

ima1=real(ifft2(abs(IM1))); % Parte real da transformada inversa bidimensional da imagem "IM1"
imb1=real(ifft2(abs(IM2))); % Parte real da transformada inversa bidimensional da imagem "IM2"
figure()
subplot(221)
imshow(ima1,[]); % Exibe a imagem "ima1"
title('Imagem 1, módulo');
subplot(222)
imshow(imb1,[]); % Exibe a imagem "imb1"
title('Imagem 2, módulo');

% Plotando a transformada inversa da fase

ima2=real(ifft2(exp(angle(IM1)*1i))); % Parte imaginária da transformada inversa bidimensional da imagem "IM1" 
imb2=real(ifft2(exp(angle(IM2)*1i))); % Parte imaginária da transformada inversa bidimensional da imagem "IM2"
subplot(223)
imshow(ima2,[]); % Exibe a imagem "ima2"
title('Imagem 1, fase');
subplot(224)
imshow(imb2,[]); % Exibe a imagem "imb2"
title('Imagem 2, fase');

salvaGrafico("Imagens geradas a partir de somente a fase e somente o módulo")

% Plotando a transformada inversa do módulo e a fase multiplicadas

ima3=real(ifft2(abs(IM1).*exp(1i*angle(IM1)))); % Realiza a transformada inversa bidimesional da imagem "IM1" em termos de módulo e fase 
imb3=real(ifft2(abs(IM2).*exp(1i*angle(IM2)))); % Realiza a transformada inversa bidimesional da imagem "IM2" em termos de módulo e fase
figure()
subplot(121)
imshow(ima3,[]); % Exibe a imagem "ima3"
title('Imagem 1, módulo e fase');
subplot(122)
imshow(imb3,[]); % Exibe a imagem "imb3"
title('Imagem 2, módulo e fase');

salvaGrafico("Imagem gerada da trasnformada inversa com módulo e fase")

%% Salvar as imagens

function salvaGrafico(nome)
% salvaGrafico Salva figura atual em pdf
%   Tomando nome como string de entrada, salva .pdf
%   vetorizando a figura aberta por último
    
    try 
    	cd imagens
    catch
        mkdir imagens
        cd imagens
    end 

    set(gcf,'Units','inches');
    screenposition = get(gcf,'Position');
    set(gcf,...
        'PaperPosition',[0 0 screenposition(3:4)],...
        'PaperSize',[screenposition(3:4)]);
    print(gcf,'-dpdf',nome)
    print(gcf,'-dsvg',nome)
    
    cd ..
end