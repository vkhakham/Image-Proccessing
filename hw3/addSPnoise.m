 %authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% 
% function noisyIm = addSPnoise(im, p)
% (file name is accordingly addSPnoise.m ) 
% Adds Salt & Pepper noise to image
% 
% Input:      
% im - a grayscale image array in the range [0..255]. 
% p  - proportion of pixels that will be noisy
% 
% Output:   
% NoisyIm - grayscale image in the range [0..255] same size as im
% 
% Method:  
% p/2 pixels are randomly chosen as 0 and p/2 as 255. Do not loop over 
% image pixels. Use matlab function rand.
 function noisyIm = addSPnoise(im, p)
%     im = readImage('im2.tif');
%     im = [ 1 2 3 ; 4 5 6 ; 7 8 9];
%     p = 0.5;
%     showImage(im);
    n = round(p*length(im(:))/2);%fraction of noise for white and black.
    
    %noisyVec will be used for indexes of the noise.
    noisyVec = zeros(length(im(:)),1);%0 will represent unchanged grey value
    noisyVec(1:n) = 1;%1 will represent black noise
    noisyVec(n+1:2*n) = 2;%2 will represent white noise
    idx = randperm(length(noisyVec(:)));%shuffle the indexes;
    noisyVec = noisyVec(idx);%get a vector that contains 0,1,2 randomly ( 1's and 2's appear n times)

    noisyIm = im; % get all colors
    noisyIm(noisyVec == 1) = 0; % change the indexes from noisyVec==1 to black noise
    noisyIm(noisyVec == 2) = 256;% change the indexes from noisyVec==2 to white noise
%     showImage(noisyIm);
    noisyIm = uint8(noisyIm);
    
 end