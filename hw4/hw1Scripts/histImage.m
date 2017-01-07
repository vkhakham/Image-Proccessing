%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
function h = histImage(img)
%
%function h = histImage(img)
%This routine builds the histogram of image img.
%
%Input : img - a grayscale image in the range [0..255] 
%
%Output: h - image histogram. An array 1x256 such that 
%        entry i contains the number of pixels in the 
%        image having grayscale value i-1.
% 
%Method: Counts the number of pixels with grayscale 
%        value i in the range [0 .. 255]. 

h = zeros(1,256);
for i=0:255
    h(i+1) = length( find(img == i) );
end
end



