function h = histogramFromIH(IH,box)

% function h = histogramFromIH(IH,box)
% (file name is accordingly histogramFromIH.m ) 
% This routine builds the IntegralHistogram of image img.
% 
% Input:  IH – a 3 dimensional array containing the integralHistogram
%         box = a 4-vector defining a window in an image: [r0 r1 c0 c1]. 
% Output: h - image histogram. An array 1x256.
% 
% Method: Efficiently computes the histogram in window [r0 : r1, c0 : c1] from IH.