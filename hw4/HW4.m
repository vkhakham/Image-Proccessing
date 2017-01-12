%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% HW4

clear;
close all;
clc;

% % wolf cleaning using only fft
% noisyImg = imread('wolf.tif');
% cleanImg = cleanWolf(noisyImg);
% imshow([noisyImg, ones(256,5)*255,cleanImg]);    

% % dining room cleaning expanding range of gray values
% noisyImg = imread('diningroom.tif');
% cleanImg = cleanDiningRoom(noisyImg);
% imshow([noisyImg, ones(256,5)*255, cleanImg]);   

% % faces cleaning 
% %   make from 3 faces - 3 frames using affineImage
% %   call cleanImageMedian_multi with 3 frames - get 1 good frame
% %   restore good frame back to the 3 faces using affineImage
% noisyImg = imread('faces.tif');
% cleanImg = cleanFaces(noisyImg);
% imshow([noisyImg, ones(512,5)*255, cleanImg]); 





% im = readImage('pillows.tif');
% im = readImage('QR.tif');
% pause;
















% clear;
% close all;
% clc;
