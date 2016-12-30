%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function PSNRval= calcPSNR (noisyIm,im)
% 
% (file name is accordingly calcPSNR.m ) 
% This function calculates the Peak-Signal_to-Noise-Ratio (PSNR) of a noisy image 
% compared to the original image.
% 
% Inputs: 
% noisyIm - grayscale image (array of values in [0..255])
% im - grayscale image (array of values in [0..255]) same size as noisyIm.
% 
% Output: 
% PSNRval – a Real value expressing the PSNR of noisyIm.
% 
% Method: Peak-Signal-to-Noise-Ratio evaluates the difference between 2 images.
% Calculate Peak-Signal-to-Noise-Ratio using the PSNR definition here:                
% http://www.mathworks.com/help/vision/ref/psnr.html 
% http://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio)
% Do not use matlab function PSNR.
function PSNRval= calcPSNR (noisyIm,im)
    %MSE sum of all squares between pixels of im and noisyIm. normalize in
    %size of im
    MSE = sum( sum(((noisyIm - im).^2)/ length(im(:) )));
    
    %PNSR - https://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio
    PSNRval = 20 * log10(255)  - 10 * log10(MSE);
end