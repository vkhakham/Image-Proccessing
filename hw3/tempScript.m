%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5
clear;
close all;
clc;

% %1saltAndPepperNoise
% img = readImage('im2.tif');
% showImage(img);
% saltAndPepperNoiseImg = addSPnoise(img,0.10);
% showImage(saltAndPepperNoiseImg);

% %2addGaussianNoise
% img = readImage('im2.tif');
% showImage(img);
% gaussianNoiseImg = addGaussianNoise(img,30);
% showImage(gaussianNoiseImg);

% %3addMotionBlur
% img = readImage('lena.tif');
% % img = readImage('im2.tif');
% showImage(img);
% motionBlurImg = addMotionBlur(img,5);
% showImage(motionBlurImg);

% %4cleanImageMedian
% img = readImage('lena.tif');
% % img = readImage('im2.tif');
% showImage(img);
% saltAndPepperNoiseImg = addSPnoise(img,0.01);
% showImage(saltAndPepperNoiseImg);
% cleanImageMedianImg = cleanImageMedian(saltAndPepperNoiseImg, [1,1]);
% showImage(cleanImageMedianImg);

% %5cleanImageMean
% img = readImage('lena.tif');
% % img = readImage('im2.tif');
% showImage(img);
% saltAndPepperNoiseImg = addSPnoise(img,0.01);
% showImage(saltAndPepperNoiseImg);
% cleanImageMedianImg = cleanImageMean(saltAndPepperNoiseImg, [1,1], 2);
% showImage(cleanImageMedianImg);

% %6sharpen
% img = readImage('lena.tif');
% % img = readImage('im2.tif');
% showImage(img);
% blurImg = addMotionBlur(img,7);
% showImage(blurImg);
% sharpenImg = sharpen(blurImg, [1,1], 2,7);
% showImage(sharpenImg);

% %7cleanImageMedian_multi
% img = readImage('lena.tif');
% % img = readImage('im2.tif');
% showImage(img);
% for i=1 : 10
%     gaussianNoiseImg = addGaussianNoise(img,30);
%     imArray(:,:,i) = gaussianNoiseImg;
%     showImage(gaussianNoiseImg);
% end
% cleanImg = cleanImageMedian_multi(imArray);
% showImage(cleanImg);

% %8cleanImageMean_multi
% img = readImage('lena.tif');
% % img = readImage('im2.tif');
% showImage(img);
% for i=1 : 10
%     gaussianNoiseImg = addGaussianNoise(img,30);
%     imArray(:,:,i) = gaussianNoiseImg;
%     showImage(gaussianNoiseImg);
% end
% cleanImg = cleanImageMean_multi(imArray);
% showImage(cleanImg);

% %9calcPSNR
% img = readImage('lena.tif');
% % img = readImage('im2.tif');
% showImage(img);
% blurImg = addMotionBlur(img,7);
% showImage(blurImg);
% psnr = calcPSNR(blurImg, img);
% disp(psnr);
% pause;
% clear;
% close all;
% clc;
 





