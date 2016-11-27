function [bimg] = binarizeOptAdaptiveIH(im,winsize,IH)

% function [bimg] = binarizeOptAdaptiveIH(im,winsize,IH)
% 
% Given an image, calculates the optimal threshold and returns the optimally thresholded image.
% Uses the precomputed IntegralHistogram, to efficiently calculate local histograms.
% 
% Input:     img - a grayscale image in the range [0..255] . 
%            winsize – an odd integer > 0. Adaptive thresholding windows are winsize x winsize.
%            IH – a 3 dimensional array containing the integralHistogram.
% 
% Output:    bimg - a binary image, represented as a grayscale
%               image with values 0 and 255.
% 
% Method:  Per image pixel determines the optimal threshold value by searching for optimal 