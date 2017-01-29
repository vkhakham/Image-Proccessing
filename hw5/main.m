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
% 
% G = gaussPyr(img, maxLevels);
% printPyr(G);
% 
% F = laplacPyr(img, maxLevels);
% printPyr(F);
% 
% img = collapseLapPyr(F);
% figure, imshow(img);


% img1 = imread('apple-bw.tif');
% img2 = imread('orange-bw.tif');
img1 = imread('lena.tif');
img2 = imread('barbarasmall.tif');
[r,c] = size(img1);
mask = zeros(r,c);
transitionMask = 
colsMdl = floor(c/2);
mask(:,colsMdl:c) = 0;
mask(:,colsMdl-10:colsMdl-9) = 0.9; 
mask(:,colsMdl-8:colsMdl-7) = 0.8;
mask(:,colsMdl-6:colsMdl-5) = 0.7;
mask(:,colsMdl-4:colsMdl-3) = 0.6;
mask(:,colsMdl-2:colsMdl+1) = 0.5;
mask(:,colsMdl+2:colsMdl+3) = 0.4;
mask(:,colsMdl+4:colsMdl+5) = 0.3;
mask(:,colsMdl+6:colsMdl+7) = 0.2;
mask(:,colsMdl+8:colsMdl+9) = 0.1;
a = roipoly(img);
newImg = multiResSpline(img1, img2, mask, maxLevels);
figure, imshow([img1,img2,newImg]);   


newImgWithNoMask = multiResSpline(img1, img2, mask, maxLevels);
figure, imshow([img1,img2,newImgWithNoMask]);   


%check 251X256 im2.tif