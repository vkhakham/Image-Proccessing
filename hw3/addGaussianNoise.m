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

    im = double(im);%just in case. saw some error in other functions
    
    gaussianNoise = s * randn(size(im));%randn will get values normaly disterbuted and than multiply with std
    noisyIm = im + gaussianNoise;%add a random value which is chosen from a Gaussian distribution of std s
    noisyIm = uint8(noisyIm);%take care of rounding doubles and change all above 255 to 255 and all below 0 to 0(8bit unsighned int)
end
