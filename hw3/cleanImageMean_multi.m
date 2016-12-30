%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function cleanIm = cleanImageMean_multi (imArray)
% (file name is accordingly cleanImageMean_multi.m ) 
% Denoises a series of images using mean filtering across corresponding pixels.
% 
% Input:
% imArray - a 3D array in the range [0..255]. Every frame imArray(:,:,i) is an image.              
% 
% Output:
% cleanIm - grayscale image in the range [0..255] same size as a frame in imArray.
% 
% Method:
% Assume imArray is a sequence of the same image but noised. Apply mean filtering
% across corresponding pixels of the sequence, to create a single denoised image.                                  
% You may loop over the image pixels. You may use matlab function mean.
function cleanIm = cleanImageMean_multi (imArray)

end