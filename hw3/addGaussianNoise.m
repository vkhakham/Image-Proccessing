%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function noisyIm = addGaussianNoise(im, s)
% (file name is accordingly addGaussianNoise.m ) 
% Adds Gaussian noise to image
% 
% Input:      
% im - a grayscale image array in the range [0..255]. 
% s  - the std to be used for Gaussian distribution of noise
% 
% Output:   
% NoisyIm - grayscale image in the range [0..255] same size as im
% 
% Method:  
% For every pixel add a random value which is chosen from a Gaussian distribution
% of std s. Do not loop over image pixels. Use matlab function randn.
%
function noisyIm = addGaussianNoise(im, s)
%     im = readImage('im2.tif');
%     im = [ 1 2 3 ; 4 5 6 ; 7 8 9];
%     s = 500;
    gaussianMask = s * randn(size(im));%randn will get values normaly disterbuted with std 1
    noisyIm = im + gaussianMask;%add a random value which is chosen from a Gaussian distribution of std s
    noisyIm = uint8(noisyIm);%take care of rounding doubles and change all above 255 to 255 and all below 0 to 0(8bit unsighned int)
%     showImage(noisyIm);
end

%check with others if std has to be at least 15 to notice a diffrenece