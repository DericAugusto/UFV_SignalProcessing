%% Universidade Federal de Viçosa 
% ELT 410 - Sinais e Sistemas Lineares
% Ulisses Bredofw Perim
% Prática 08

clc
clear all
close all

%%  Exercício 01

% carrega e plota as imagens
A = imread('4.1.03.tiff');
B = imread('5.1.12.tiff');
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

% plotagem apenas a magnitude da imagem A
Ixam = ifft2(abs(Xa));
imshow(log(real(Ixam)),[]);
title('Magnitude de Xa(jw1,jw2)')

%%

% plotagem de apenas a fase da imagem A
Ixaf = ifft2(exp(1i*angle(Xa)));
imshow(Ixaf, []);
title('Fase de Xa(jw1,jw2)');


%%

angle(Xa) == 0
AA = ifft2(Xa)
imshow(AA)




%%

% plotagem de magnitude de Xb e módulo de Xa
Ixa = ifft2((abs(Xb)).*exp(1i*angle(Xa)));
imshow(Ixa, []);
title('Imagem com magnitude de Xb(jw1,jw2) e fase de Xa(jw1,jw2)');

%% Exercício 02

clc
clear all 
close all

lua = imread('lua.jpg');
texto = imread('texto.jpg');
figure
imshow(lua)
figure
imshow(texto)
[M, N] = size(lua);

% frequências de corte
a = 100;
b = 100;

[u, v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2);
Hb = exp(-u.^2/(2*a^2)-v.^2/(2*b^2));

% filtragem passa-baixas 
Flua = fftshift(fft2(lua));
Fblua = Flua.*Hb;
LUAb = real(ifft2(Fblua));
figure
luabf = LUAb+double(lua);
imshow(luabf,[])

% filtragem passa-altas 
Falua = Flua.*(1-Hb);
LUAa = real(ifft2(Falua));
figure
luaaf = LUAa+double(lua);
imshow(luaaf,[])

[M, N] = size(texto);

% frequencias de corte
a = 60;
b = 70;

[u, v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2);
Hb = exp(-u.^2/(2*a^2)-v.^2/(2*b^2));

% filtragem passa-baixas 
Ftexto = fftshift(fft2(texto));
Fbtexto = Ftexto.*Hb;
TEXTOb = real(ifft2(Fbtexto));
figure(3)
textobf = TEXTOb+double(texto);
imshow(textobf,[])

% filtragem passa-altas 
Fatexto = Ftexto.*(1-Hb);
TEXTOa = real(ifft2(Fatexto));
figure(4)
textoaf = TEXTOa+double(texto);
imshow(textoaf,[])

%% Parte Extra
clc
clear all
close all

c = imread('truck.tiff');
d = imread('aplane.tiff');
C = rgb2gray(c);                 % Deixas as imagens em tons de cinza
D = rgb2gray(d);
figure
subplot(1,2,1); imshow(C);title('arrasca');
subplot(1,2,2); imshow(D);title('gabigol');

C1 = fft2(C);  % Transformada bidimensional de A
D1 = fft2(D);  % Transformada bidimensional de B

C1c = fftshift(C1); 
D1c = fftshift(D1);


% Filtragem figura C
[M N]= size(C);
a = 100; b = 100;

[u,v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2);
Hb = exp(-u.^2/(2*a^2)-v.^2/(2*b^2));
Ha = 1- Hb;

figure
C1a = Ha .* C1c;
subplot(1,2,1);imshow(real(ifft2(C1a))+double(C),[]);title('Passa-Altas');
figure
C1b = Hb .* C1c;
subplot(1,2,2);imshow(real(ifft2(C1b))+double(C),[]);title('Passa-Baixas');


% Filtragem figura D
[M N]= size(D);
a = 100; b = 100;

[u,v] = meshgrid(-N/2+1:N/2,-M/2+1:M/2);
Hb = exp(-u.^2/(2*a^2)-v.^2/(2*b^2));
Ha = 1- Hb;

figure
D1a = Ha .* D1c;
subplot(1,2,1);imshow(real(ifft2(D1a))+double(D),[]);title('Passa-Altas');
D1b = Hb .* D1c;
subplot(1,2,2);imshow(real(ifft2(D1b))+double(D),[]);title('Passa-Baixas');

