%% UNIVERSIDADE FEDERAL DE VIÇOSA
% ELT - 410 SINAIS E SISTEMAS
% Gabriel Pereira de Calais e Márcio Von Rondow Campos

clc
clear all;
close all;

%% Roteiro Prática 8

% 4.1 Magnitude e fase na formação de imagens

ima = imread('5.1.09.tiff'); %Carrega a imagem para a workspace
figure; imshow(ima, []); %Plota a imagem em uma figura
imb = imread('5.1.12.tiff'); %Carrega a imagem para a workspace
figure; imshow(imb, []); %Plota a imagem em uma figura

%%

IMa = fft2(ima); %Realiza a tranformada de Fourier 2D da imagem
IMb = fft2(imb); %Realiza a tranformada de Fourier 2D da imagem

ima1 = real(ifft2(abs(IMa))); %Realiza a tranformada inversa de Fourier 2D do módulo da imagem
imb1 = real(ifft2(abs(IMb))); %Realiza a tranformada inversa de Fourier 2D do módulo da imagem

figure; imshow(ima1, []); %Plota a imagem em uma figura
figure; imshow(imb1, []); %Plota a imagem em uma figura

%%

ima2 = real(ifft2(exp(1i*angle(IMa)))); %Realiza a tranformada inversa de Fourier 2D da fase da imagem
imb2 = real(ifft2(exp(1i*angle(IMb)))); %Realiza a tranformada inversa de Fourier 2D da fase da imagem

figure; imshow(ima2, []); %Plota a imagem em uma figura
figure; imshow(imb2, []); %Plota a imagem em uma figura

%%

ima3 = real(ifft2(abs(IMa).*exp(1i*angle(IMa)))); %Realiza a tranformada inversa de módulo e fase da imagem
imb3 = real(ifft2(abs(IMb).*exp(1i*angle(IMb)))); %Realiza a tranformada inversa de módulo e fase da imagem

figure; imshow(ima3, []); %Plota a imagem em uma figura
figure; imshow(imb3, []); %Plota a imagem em uma figura

%% 4.2 Filtragem de imagens no domínio da frequência

%Filtragem da imagem da lua
lua = imread('lua 08092019155226.jpg'); %Carrega a imagem para a workspace
LUA = fftshift(fft2(lua)); %Calcula a tranformada de Fourier 2D e a centraliza

[M, N] = size(lua);
a = 25; %Define frequência de corte
b = 25; %Define frequência de corte
[u, v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2); %Define parâmetros para o filtro
H = exp(-u.^2/(2*a^2)-v.^2/(2*b^2)); %Define o filtro

%% Filtragem passa-baixa
Y1 = LUA.*H; %Realiza a filtragem
figure; imshow(lua); %Plota a imagem em uma figura
figure; imshow(log(real(ifft2(Y1))), []); %Plota a imagem filtrada em uma figura
figure; imshow(double(lua) + log(real(ifft2(Y1))), []); %Plota a imagem filtrada e reconstruída em uma figura

%% Filtragem passa-alta

a = 50; %Define frequência de corte
b = 50; %Define frequência de corte
[u, v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2); %Define parâmetros para o filtro
H = exp(-u.^2/(2*a^2)-v.^2/(2*b^2));
Ha = 1 - H; %Define o filtro
Y2 = LUA.*Ha; %Realiza a filtragem
figure; imshow(lua); %Plota a imagem original em uma figura
figure; imshow(log(real(ifft2(Y2))), []); %Plota a imagem filtrada em uma figura
figure; imshow(double(lua) + log(real(ifft2(Y2))), []); %Plota a imagem filtrada e reconstruída em uma figura

%% Filtragem da imagem de texto
texto = imread('texto 08092019155244.jpg'); %Carrega a imagem para a workspace
TEXTO = fftshift(fft2(texto));
[M, N] = size(texto);
a = 70; %Define frequência de corte
b = 70; %Define frequência de corte
[u, v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2); %Define parâmetros para o filtro
Hb = exp(-u.^2/(2*a^2)-v.^2/(2*b^2)); %Define o filtro

%% Filtragem passa-baixa
Y3 = TEXTO.*Hb; %Realiza a filtragem
figure;
imshow(texto);
figure;
imshow(log(real(ifft2(Y3))), []); %Plota a imagem filtrada em uma figura

%% Exercício proposto

%Filtragem passa-baixas

IMa = imread('escuro.png'); %Carrega a imagem para a workspace
escuro = rgb2gray(IMa); %Converte a imagem para tons de cinza
figure; imshow(escuro);
ESCURO = fftshift(fft2(escuro)); %Calcula a tranformada de Fourier 2D e a centraliza
[M, N] = size(escuro);
a = 30; %Define frequência de corte
b = 30; %Define frequência de corte
[u, v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2); %Define parâmetros para o filtro
Hc = exp(-u.^2/(2*a^2)-v.^2/(2*b^2)); %Define o filtro
Y4 = ESCURO.*Hc; %Realiza a filtragem
figure; imshow(log(real(ifft2(Y4))), []);
figure; imshow(double(escuro) + log(real(ifft2(Y4))), []); %Plota a imagem filtrada e reconstruída em uma figura

%%

%Filtragem passa-altas

IMb = imread('claro.jpg'); %Carrega a imagem para a workspace
claro = rgb2gray(IMb); %Converte a imagem para tons de cinza
figure; imshow(claro);
CLARO = fftshift(fft2(claro)); %Calcula a tranformada de Fourier 2D e a centraliza
[M, N] = size(claro);
a = 500000; %Define frequência de corte
b = 500000; %Define frequência de corte
[u, v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2); %Define parâmetros para o filtro
Hd = 1 - exp(-u.^2/(2*a^2)-v.^2/(2*b^2)); %Define o filtro
Y5 = CLARO.*Hd; %Realiza a filtragem
figure; imshow(log(real(ifft2(Y5))), []);
figure; imshow(double(claro) + log(real(ifft2(Y5))), []); %Plota a imagem filtrada e reconstruída em uma figura