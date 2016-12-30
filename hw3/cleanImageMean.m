%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function cleanIm = cleanImageMean (im, maskRadius, maskSTD)
% (file name is accordingly cleanImageMean.m ) 
% Denoises image using mean filtering.
% 
% Input:      
% im - a grayscale image array in the range [0..255].
% maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size
%     to be 2*maskRadius + 1. Thus neighborhood at x is (x-maskRadius) : (x+maskRadius).
% maskSTD - the std of the Gaussian mask.
% 
% Output:
% cleanIm - grayscale image in the range [0..255] same size as im
% 
% Method:
% Convolve image with Gaussian mask of size 2*maskRadius +1.
% Use matlab function conv2.
% 
function cleanIm = cleanImageMean (im, maskRadius, maskSTD)
%     im = readImage('im2.tif');
%     im = randi(256,5) -1 ;
%     maskRadius = [3,3];
%     maskSTD = 2;
%     
% [x,y] = meshgrid(-radius:radius,-radius:radius);
% mask = exp(-x.^2/(2*maskSTD^2)-y.^2/(2*maskSTD^2));
% su = sum(sum(mask));
% mask = mask ./ su;
% 
% cleanIm = conv2(im,mask,'same');
%     
%     gaussianMask = maskSTD * randn(maskRadius(1),maskRadius(2));%randn will get values normaly disterbuted with std 1
%     cleanIm = conv2(im,gaussianMask,'same'); %convolotion im and mask.
%     cleanIm = uint8(cleanIm);
end