%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5


img = readImage('im2.tif');
showImage(img);
saltAndPepperNoiseImg = addSPnoise(img,0.01);
showImage(saltAndPepperNoiseImg);


% pause;
clear;
close all;
clc;
 





