%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function cleanIm = cleanImageMedian_multi (imArray)
% (file name is accordingly cleanImageMedian_multi.m ) 
% Denoises a series of images using median filtering across corresponding pixels.
% 
% Input:
% imArray - a 3D array in the range [0..255]. Every frame imArray(:,:,i) is an image.              
% 
% Output:
% cleanIm - grayscale image in the range [0..255] same size as a frame in imArray.
% 
% Method:
% Assume imArray is a sequence of the same image but noised. Apply median filtering
% across corresponding pixels of the sequence, to create a single denoised image.                                  
% You may loop over the image pixels. You may used matlab function median.
function cleanIm = cleanImageMedian_multi (imArray)
%     im1 = [ 1 2 3 ; 4 2 6 ; 7 8 10];
%     im2 = [ 1 2 3 ; 4 5 6 ; 7 8 9];
%     im3 = [ 1 4 3 ; 4 5 6 ; 7 8 9];
%     imArray(:,:,1) = im1;
%     imArray(:,:,2) = im2;
%     imArray(:,:,3) = im3;
    
    
    [r,c,~] = size(imArray);
    cleanIm = zeros(r,c);%static declaration
    
    
    for i=1 : r 
        for j=1 : c 
            cleanIm(i,j) = median(imArray(i,j,:));
        end
    end
    
    cleanIm = uint8(cleanIm);
end