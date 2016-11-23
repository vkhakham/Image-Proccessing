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
%         T � the optimal threshold.
% 
% Method:  Determines the threshold value which 
%          optimally separates objects from background. 

%del img = readImage('lighthouse.tif');

%need to calc T value from Qvals
[~, Qvals] = optimalQuantization(img,1);
%expecting Qvals.size == 2.
T = mean(Qvals);
%using binarize with T
bimg = binarize(img,T);

%del disp(['T is: ', num2str(T)]);
%del showImage(bimg);
end

