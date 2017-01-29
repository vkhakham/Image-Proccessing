%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% Main script

clear;
close all;
clc;

img = imread('lena.tif');
maxLevels = log2(size(img,1))+1;

G = gaussPyr(img, maxLevels);
printPyr(G);

F = laplacPyr(img, maxLevels);
printPyr(F);

img = collapseLapPyr(F);
figure, imshow(img);

img1 = imread('apple.jpeg');
img = multiResSpline(img1, img1, img1, maxLevels);


%check 251X256 im2.tif