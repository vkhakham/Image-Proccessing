%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleandiningroom (im)
    clear;
    close all;
    clc;
    im = readImage('diningroom.tif');
    [cleanim,~] = optimalQuantization(im,5);
    imshowpair(im, cleanim, 'montage');
end