%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function sharpIm = sharpen(im, maskRadius, maskSTD, lambda)
% (file name is accordingly sharpen.m ) 
% This function applies sharpening using convolution.
% 
% Inputs: 
% im - grayscale image (array of values in [0..255])
% maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size
%              to be 2*maskRadius + 1. Thus neighborhood at x is (x-maskRadius) : (x+maskRadius). 
% maskSTD – the std of the Gaussian used to create the sharpening mask.                                                
% lambda – the strength of the sharpening to apply.
% 
% Output: 
% sharpIm - grayscale image (array of values in [0..255])  - same size as im.
% 
% Method: Create the sharpening mask S(lambda) as defined in class using the 
% Gaussian parameters as the blur kernel.               
% Use matlab function conv2.
function sharpIm = sharpen(im, maskRadius, maskSTD, lambda)

%     im = readImage('im2.tif');
%     maskRadius = [1,1];
%     maskSTD = 2;
%     lambda = 1;


    im = double(im);%conv2 need a double im
    
    %MAKE GAUS MASK
    xRad = maskRadius(1);%x radius
    yRad = maskRadius(2);%y radius
    [X,Y] = meshgrid(-xRad:xRad,-yRad:yRad);% create two matrices of x and y's distance from center.
    mask = exp( - (X.^2 + Y.^2) / (2*maskSTD^2) );%formula from class
    mask = mask ./ sum(mask(:)); %normalize to keep the Sum the same
    
    %MAKE DELTA Mat
    deltaMat = zeros( xRad*2 + 1, yRad*2 + 1);
    deltaMat(xRad+1, yRad+1) =1 ;
    
    %MAKE S(lambda) from class
    S = deltaMat + lambda*(deltaMat - mask);
    sharpIm = conv2(im,S,'same');
    sharpIm = uint8(sharpIm);
    
end