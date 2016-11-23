function [bimg] = binarizeOptAdaptive(img,winsize)

% function [bimg] = binarizeOptAdaptive(img,winsize)
%             
% Given an image, calculates the optimal threshold and returns the optimally thresholded image.
%   
% Input:  img - a grayscale image in the range [0..255] . 
%         winsize – an odd integer > 0. Adaptive thresholding windows are winsize x winsize.
%                               
% Output: bimg - a binary image, represented as a grayscale
%                image with values 0 and 255.
% 
% Method: Per image pixel determines the optimal threshold value by searching for optimal threshold
%         in winsize X winsize window around the pixel. Apply optimalQuantization with N=1 in each window.
%         If window exceeds image boundaries – use only pixels within the image boundaries.

%DELETE
winsize = 11;
img = readImage('lighthouse.tif');


      
bimg = img;