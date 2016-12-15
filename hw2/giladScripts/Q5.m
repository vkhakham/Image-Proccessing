%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5
clear;
close all;
clc;

pics = {'lena.tif';'im2.tif';'addedScissors.tif';'barbarasmall.tif';'cups.tif';'darkimage.tif';'fourSquares.tif';'stroller.tif';'wine.tif'};

% imgName = char(pics(2));
% img = readImage(imgName);
% newImage = rotateImage(img, 30, -5, 40);
% showImage(img);
% showImage(newImage);

imgName = char(pics(1));
img = readImage(imgName);
newImage = scaleImage(img, 1.5, 128, 128);
showImage(img);
showImage(newImage);







%Q1 meshgrid - in pdf its mesh(1:c, 1:r). in Hw its mesh(1:x, 1:y)
%Q2 in rotate: degrees ?
%Q3 in scale: a =b ? the scale matrix is [a 0; 0 a] ?
