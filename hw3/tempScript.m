%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5
clear;
close all;
clc;

%saltAndPepperNoise
% img = readImage('im2.tif');
% showImage(img);
% saltAndPepperNoiseImg = addSPnoise(img,0.01);
% showImage(saltAndPepperNoiseImg);

% %addGaussianNoise
% img = readImage('im2.tif');
% showImage(img);
% gaussianNoiseImg = addGaussianNoise(img,15);
% showImage(gaussianNoiseImg);

% %addMotionBlur
% img = readImage('lena.tif');
% % img = readImage('im2.tif');
% showImage(img);
% motionBlurImg = addMotionBlur(img,20);
% showImage(motionBlurImg);

%cleanImageMedian
img = readImage('lena.tif');
% img = readImage('im2.tif');
showImage(img);
saltAndPepperNoiseImg = addSPnoise(img,0.01);
showImage(saltAndPepperNoiseImg);
cleanImageMedianImg = cleanImageMedian(saltAndPepperNoiseImg, [1,1]);
showImage(cleanImageMedianImg);

% pause;
clear;
close all;
clc;
 





