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

    im = double(im);%conv2 need a double im. 
    xRad = maskRadius(1);%x radius
    yRad = maskRadius(2);%y radius
    
    %MAKE GUAS MASK
    % create two matrices of x and y's distance from center.
    [X,Y] = meshgrid(-xRad:xRad,-yRad:yRad);
    mask = exp( - (X.^2 + Y.^2) / (2*maskSTD^2) );%formula from class
    mask = mask / sum(mask(:));%normalize to keep the Sum the same

    cleanIm = conv2(im,mask,'same');
    cleanIm = uint8(cleanIm);
end
