%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5
clear;
close all;
clc;

pics = {'lena.tif';'im2.tif';'addedScissors.tif';'barbarasmall.tif';'cups.tif';'darkimage.tif';'fourSquares.tif';'stroller.tif';'wine.tif';'im3.tif';'seagray.tif'};

% imgName = char(pics(1));
% img = readImage(imgName);
% % newImage = rotateImage(img, 30, -5, 40);
% newImage = rotateImage(img, 145, 256, 256, [512,521]);
% showImage(img);
% showImage(newImage);

% imgName = char(pics(1));
% img = readImage(imgName);
% newImage = scaleImage(img, 1.5, 128, 128);
% showImage(img);
% showImage(newImage);


% % showImage(img);
% %     sourceCoors = ginput(4)';
% %     targetCoors = ginput(4)';
%     sourceCoors = [98 234 209 74; 22 161 230 85]; %for pic seagray
%     targetCoors = [4 174 180 10; 3 5 79 77];
%     img = readImage('seagray.tif');
% %     img = readImage('lena.tif');
%     newimg = affineImage(img, sourceCoors, targetCoors);
%     showImage(newimg);

Xmat = ones(2*2, 6);
Z = zeros(6, 1)';
%     for i=1 : N %replace with no loop
%         Xmat(2*i-1,:) = [sourceCoors(1,i) , sourceCoors(2,i), 0, 0, 1 ,0];
%         Xmat(2*i,:)   = [0, 0, sourceCoors(1,i) , sourceCoors(2,i), 0 ,1];
%     end
Xmat(1:2:end) = Z;
a = 0;
%Q1 meshgrid - in pdf its mesh(1:c, 1:r). in Hw its mesh(1:x, 1:y)
%Q2 in rotate: degrees ?
%Q3 in scale: a =b ? the scale matrix is [a 0; 0 a] ?
