clear all; close all; clc;

load('trumpet.mat')
h = [1 zeros(1,10000) 0.25 zeros(1,10000)];
y1 = conv(y,h);


sound(y,Fs)