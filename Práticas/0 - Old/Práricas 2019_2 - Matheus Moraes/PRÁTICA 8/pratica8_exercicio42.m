% Universidade Federal de Viçosa - UFV
% Departamento de Engenharia Elétrica - DEL
% ELT 410 - PROCESSAMENTO DIGITAL DE SINAIS
% Thiago Mendes de Ávila 93505 & João Pedro Rossi 90102
% PRÁTICA 8
% EXERCÍCIO 4.2
%%
clc
clear all
close all
%CARREGAR IMAGENS
lua = imread('lua.jpg');
texto = imread('texto.jpg');
%% LUA - PASSA ALTA

fft_lua = fftshift(fft2(lua));
a1 = 100;
b1 = 100;
[M_LUA,N_LUA] = size(lua);
[u_LUA,v_LUA] = meshgrid(-N_LUA/2+1:N_LUA/2,-M_LUA/2+1:M_LUA/2); 
Hb = exp(-u_LUA.^2/(2*a1^2)-v_LUA.^2/(2*b1^2));
Ha = 1 - Hb; %PASSA ALTA
lua_filtrada = real(ifft2(Ha.*fft_lua));
lua_nova = lua_filtrada + double(lua);
figure
plot(v_LUA,fft_lua)
figure;
imshow(lua)
title 'lua'
figure;
imshow(lua_nova,[])
title 'lua filtrada'
%% TEXTO - PASSA BAIXA
fft_texto = fftshift(fft2(texto));
a2 = 50;
b2 = 50;
[M_TEXTO,N_TEXTO] = size(texto);
[u_TEXTO,v_TEXTO] = meshgrid(-N_TEXTO/2+1:N_TEXTO/2,-M_TEXTO/2+1:M_TEXTO/2); 
Hb = exp(-u_TEXTO.^2/(2*a2^2)-v_TEXTO.^2/(2*b2^2));
texto_filtrada = abs(ifft2(Hb.*fft_texto));
figure
plot(v_TEXTO,fft_texto)
figure
imshow(texto)
figure
imshow(texto_filtrada,[])





