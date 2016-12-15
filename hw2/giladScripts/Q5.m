%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5
clear;
close all;
clc;

pics = {'lena.tif';'im2.tif';'addedScissors.tif';'barbarasmall.tif';'cups.tif';'darkimage.tif';'fourSquares.tif';'stroller.tif';'wine.tif';'im3.tif';'seagray.tif'};

% %%%ROTATE
% imgName = char(pics(1));
% img = readImage(imgName);
% newImage = rotateImage(img, 30, -5, 40);
% % newImage = rotateImage(img, 145, 256, 256, [512,521]);
% showImage(img);
% showImage(newImage);

%%SCALE
imgName = char(pics(1));
img = readImage(imgName);
newImage = scaleImage(img, 1.5, 128, 128);
showImage(img);
showImage(newImage);

% %%%AFFINE
%     img = readImage('seagray.tif');
% %     showImage(img);
% %     sourceCoors = ginput(4)';
% %     targetCoors = ginput(4)';
%     sourceCoors = [98 234 209 74; 22 161 230 85]; %for pic seagray
%     targetCoors = [4 174 180 10; 3 5 79 77];    
%     newimg = affineImage(img, sourceCoors, targetCoors);
%     showImage(img);
%     showImage(newimg);





%Q1 meshgrid - in pdf its mesh(1:c, 1:r). in Hw its mesh(1:x, 1:y)
%Q2 in rotate: degrees ?
%Q3 in scale: a =b ? the scale matrix is [a 0; 0 a] ?

%TODO
% change creation of matrices in ROTATE and SCALE. do M^-1 dirrect
%
%
