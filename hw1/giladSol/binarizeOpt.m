function    [bimg,T] = binarizeOpt(img)

% function    [bimg,T] = binarizeOpt(im)
% 
% Given an image, calculates the optimal threshold and 
% returns the optimally thresholded image.
% 
% Input: img - a grayscale image in the range [0..255] . 
% 
% Output: bimg - a binary image, represented as a grayscale
%             image with values 0 and 255. 
%         T – the optimal threshold.
% 
% Method:  Determines the threshold value which 
%          optimally separates objects from background. 


%DELETE a
%Use optimalQuantization with N=1. 
%T is calculated from the qi values.
img = readImage('lighthouse.tif');
%showImage(img);
T=127;
%DELETE a

%TODO call: [imgNbit, Qvals] = optimalQuantization(img,1)
%TODO calc T from QVALS
bimg = (img > T) * 255;

%DELETE b 
showImage(bimg);
%DELETE b

