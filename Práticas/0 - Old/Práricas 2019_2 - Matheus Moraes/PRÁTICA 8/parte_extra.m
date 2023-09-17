% Universidade Federal de Vi�osa - UFV
% Departamento de Engenharia El�trica - DEL
% ELT 410 - PROCESSAMENTO DIGITAL DE SINAIS
% Thiago Mendes de �vila 93505 & Jo�o Pedro Rossi 90102
% PR�TICA 8
% EXERC�CIO EXTRA
%%
clc
clear all
close all
%CARREGAR IMAGENS
aplane = imread('aplane.tiff');
truck = imread('tank.tiff');
%% AVI�O - PASSA ALTA

fft_aplane = fftshift(fft2(aplane));
a1 = 30;
b1 = 30;
[M_PLANE,N_PLANE] = size(aplane);
[u_plane,v_plane] = meshgrid(-N_PLANE/2+1:N_PLANE/2,-M_PLANE/2+1:M_PLANE/2); 
Hb = exp(-u_plane.^2/(2*a1^2)-v_plane.^2/(2*b1^2));
Ha = 1 - Hb; %PASSA ALTA
aplane_filtrada1 = real(ifft2(Ha.*fft_aplane));
aplane_new = aplane_filtrada1 + double(aplane);
figure;
subplot (121)
imshow(aplane)
title 'Avi�o original'
subplot (122)
imshow(aplane_filtrada1,[])
title 'Avi�o filtrado (passa alta)'

%% AVI�O - PASSA BAIXA
fft_aplane = fftshift(fft2(aplane));
a2 = 70;
b2 = 70;
[M_PLANE,N_PLANE] = size(aplane);
[u_PLANE,v_PLANE] = meshgrid(-N_PLANE/2+1:N_PLANE/2,-M_PLANE/2+1:M_PLANE/2); 
Hb = exp(-u_PLANE.^2/(2*a2^2)-v_PLANE.^2/(2*b2^2));
aplane_filtrada = abs(ifft2(Hb.*fft_aplane));
figure;
subplot (121)
imshow(aplane)
title 'Avi�o original'
subplot (122)
imshow(aplane_filtrada,[])
title 'Avi�o filtrado (passa baixa)'

%% TRUCK - PASSA ALTA

fft_truck = fftshift(fft2(truck));
a1 = 35;
b1 = 35;
[M_TRUCK,N_TRUCK] = size(truck);
[u_TRUCK,v_TRUCK] = meshgrid(-N_TRUCK/2+1:N_TRUCK/2,-M_TRUCK/2+1:M_TRUCK/2); 
Hb = exp(-u_TRUCK.^2/(2*a1^2)-v_TRUCK.^2/(2*b1^2));
Ha = 1 - Hb; %PASSA ALTA
truck_filtrado1 = real(ifft2(Ha.*fft_truck));
truck_new = truck_filtrado1 + double(truck);
subplot (121)
imshow(truck)
title 'Tanque original'
subplot (122)
imshow(truck_filtrado1,[])
title 'Tanque filtrado (passa alta)'

%% TRUCK - PASSA BAIXA
fft_truck = fftshift(fft2(truck));
a2 = 70;
b2 = 70;
[M_TRUCK,N_TRUCK] = size(truck);
[u_PLANE,v_PLANE] = meshgrid(-N_TRUCK/2+1:N_TRUCK/2,-M_TRUCK/2+1:M_TRUCK/2); 
Hb = exp(-u_PLANE.^2/(2*a2^2)-v_PLANE.^2/(2*b2^2));
aplane_filtrada = abs(ifft2(Hb.*fft_truck));
% figure
% plot(v_TRUCK,fft_truck)
figure;
subplot (121)
imshow(truck)
title 'Tanque original'
subplot (122)
imshow(aplane_filtrada,[])
title 'Tanque filtrado (passa baixa)'










