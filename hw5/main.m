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

%pring gaus pyr
G = gaussPyr(img, maxLevels);
printPyr(G);

%pring lap pyr
F = laplacPyr(img, maxLevels);
printPyr(F);

%print collapsed lap
imgCollapse = collapseLapPyr(F);
figure, imshow(imgCollapse);
display(isequal(imgCollapse,img));%checking after collapse if is equal (will equal only on full level)

%multi spline
img1 = imread('apple-bw.tif');
img1 = img1(:,:,1); %after convertion from RGB, this is what we got 
img2 = imread('orange-bw.tif');
img2 = img2(:,:,1); %after convertion from RGB, this is what we got 

%init out mask [1 0] (ones on left and zeros on right
[r,c] = size(img1);
mask = ones(r,c);
mask(:,c/2+1 :c) = 0;

%making gaus mask to conv on our mask
gausMaskSTD = 1000;%std of gaus
xRad = 20;%x radius
[X,Y] = meshgrid(-xRad:xRad,0:0);
gaus = exp( - (X.^2) / (2*gausMaskSTD^2) );%formula from class
gaus = gaus / sum(gaus(:));%normalize to keep the Sum the same

xLayer = xRad+1;
%pad mask with values - reflection - to convolve with reflective propery
%instead of zeros
mask = double(padarray(mask,[xLayer xLayer],'symmetric'));
mask = conv2(mask, gaus, 'same');
mask = mask(xLayer+1:end-xLayer, xLayer+1:end-xLayer);

%call multiResSpline
newImg = multiResSpline(img1, img2, mask, maxLevels);
figure, imshow([img1,img2,newImg]);   
title('gaus mask');

mask = ones(r,c);
mask(:,c/2+1 :c) = 0;
newImg = multiResSpline(img1, img2, mask, maxLevels);
figure, imshow([img1,img2,newImg]);   
title('[1 0] mask');



