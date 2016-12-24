%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function noisyIm = addMotionBlur(im,t)
% (file name is accordingly addMotionBlur.m ) 
% Adds Motion Blur to image
% 
% Input:      
% im - a grayscale image array in the range [0..255]. 
% t  - length of blur filter.  (Equivalent to the length of time over which the
%   camera integrates the sensor input for a camera moving at 1 pixel per time unit).
% 
% Output:   
% NoisyIm - grayscale image in the range [0..255] same size as im
% 
% Method:  
% Motion blur occurs when a camera is in motion while capturing the image. Thus 
% every sensor (pixel) averages intensities from a sequence of points in the scene.
% We simulate motion blur in the x direction by averaging over a neighborhood 
% 1 X t  for each image pixel.
% Do not loop over image pixels. Use matlab function conv2. Assume zero padding.
% 
function noisyIm = addMotionBlur(im,t)

%     im = readImage('im2.tif');
%     showImage(im);
%     im = [ 1 2 3 ; 4 5 6 ; 7 8 9];
%     t = 15;
    mask = ones(t,1)' / t; %creating average horizontal mask
    noisyIm = conv2(im,mask,'same'); %convolotion im and mask. zero padding and same size
%     showImage(noisyIm);
end

%check 'a neighborhood 1 X t'. is it ment the mask on columns ? if so, add mask = mask';
%since the camera goes on X direction, shouldn't the mask be tX1 ?