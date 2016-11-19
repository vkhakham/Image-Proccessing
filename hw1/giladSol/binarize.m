function bimg = binarize(img,T) 

% function bimg = binarize(img,T) 
%  
% Given an image and a threshold value returns a binary image resulting from global thresholding.
% 
% Input:  img - a grayscale image in the range [0..255] 
%         T -  the threshold value in the range [0 ..255]. 
% 
% Output: bimg - a binary image, represented as a grayscale
%         image with values 0 and 255.
% 
% Method: Sets all grayscale values in the image greater than
%         the threshold T to 255 and all grayscale values
%         smaller or equal to T to 0. 

%DELETE a
%1 Line of Matlab code. Do NOT loop over the image � use matrix operations. 
% img = readImage('lighthouse.tif');
% showImage(img);
% T=127;
%DELETE a

bimg = (img > T) * 255;

%DELETE b 
% showImage(bimg);
%DELETE b