clear all; close all; clc;

%% Prática 7
% Felipe dos Anjos Rezende
% ES=96694

%% Roteiro

A = imread('imagemA.tiff');
B = imread('imagemB.tiff');
figure
imshow(A)
figure
imshow(B)

[x,y,z] = size(A);
A1 = zeros(x,y);
B1 = zeros(x,y);

for i = 1:x
    for j = 1:y
        A1(i,j) = (A(i,j,1)+A(i,j,2)+A(i,j,3))/3;
        B1(i,j) = (B(i,j,1)+B(i,j,2)+B(i,j,3))/3;
    end
end   

A1 = uint8(A1);
B1 = uint8(B1);
figure
imshow(A1)
figure
imshow(B1)

%% Fourier 2D

A = rgb2gray(A);
B = rgb2gray(B);
figure
imshow(A)
figure
imshow(B)

XA = fft2(A);
XB = fft2(B);

figure
imshow(uint8(abs(XA)));
figure
imshow(uint8(abs(XB)));

figure
imshow(XA./abs(XA));
figure
imshow(XB./abs(XB));

[x,y] = size(XA);
for i = 1:x
    for j = 1:y
        XA1(i,j) = abs(XA(i,j));
    end
end

figure
YA1 = real(ifft2(XA1));
imshow(uint8(YA1))

for i = 1:x
    for j = 1:y
        XA2(i,j) = (XA(i,j)/abs(XA(i,j)));
    end
end

figure
YA2 = real(ifft2(XA2));
imshow(uint8(YA2))

[x,y] = size(XB);
for i = 1:x
    for j = 1:y
        XB1(i,j) = abs(XB(i,j));
    end
end

figure
YB1 = real(ifft2(XB1));
imshow(uint8(YB1))

for i = 1:x
    for j = 1:y
        XB2(i,j) = XB(i,j)/abs(XB(i,j));
    end
end

figure
YB2 = real(ifft2(XB2));
imshow(uint8(YB2))

for i = 1:x
    for j = 1:y
        X(i,j) = abs(XB(i,j))*(XA(i,j)/abs(XA(i,j)));
    end
end

figure
Y = real(ifft2(X));
imshow(uint8(Y))