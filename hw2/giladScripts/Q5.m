%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5
clear;
close all;
clc;

pics = {'lena.tif';'im2.tif';'addedScissors.tif';'barbarasmall.tif';'cups.tif';'darkimage.tif';'fourSquares.tif';'stroller.tif';'wine.tif'};

imgName = char(pics(2));
img = readImage(imgName);
newImage = rotateImage(img, 90, 40, 40);
showImage(img);
showImage(newImage);



clear;
close all;
clc;




%Q1 meshgrid - in pdf its mesh(1:c, 1:r). in Hw its mesh(1:x, 1:y)

