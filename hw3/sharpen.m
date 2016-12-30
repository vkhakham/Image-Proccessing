%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function sharpIm = sharpen(im, maskRadius, maskSTD, lambda)
% (file name is accordingly sharpen.m ) 
% This function applies sharpening using convolution.
% 
% Inputs: 
% im - grayscale image (array of values in [0..255])
% maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size
%              to be 2*maskRadius + 1. Thus neighborhood at x is (x-maskRadius) : (x+maskRadius). 
% maskSTD – the std of the Gaussian used to create the sharpening mask.                                                
% lambda – the strength of the sharpening to apply.
% 
% Output: 
% sharpIm - grayscale image (array of values in [0..255])  - same size as im.
% 
% Method: Create the sharpening mask S(lambda) as defined in class using the 
% Gaussian parameters as the blur kernel.               
% Use matlab function conv2.
function sharpIm = sharpen(im, maskRadius, maskSTD, lambda)

end