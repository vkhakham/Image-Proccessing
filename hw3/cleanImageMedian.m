%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function cleanIm = cleanImageMedian (im, maskRadius)
% (file name is accordingly cleanImageMedian.m ) 
% Denoises image using median filtering.
% 
% Input:      
% im - a grayscale image array in the range [0..255].
% maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size
%     to be 2*maskRadius + 1. Thus neighborhood at x is (x-maskRadius) : (x+maskRadius). 
% 
% Output:   
% cleanIm - grayscale image in the range [0..255] same size as im.
% 
% Method:  
% Apply median filtering with neighborhood defined by maskRadius.
% You may loop over the image pixels. You may used matlab function median.
% Set to zero all boundary pixels (pixels where the neighborhood
% extends beyond the bounds of the image). 
% 
function cleanIm = cleanImageMedian (im, maskRadius)
%     im = readImage('im2.tif');
%     maskRadius = [1,1];
    [r,c] = size(im);
    cleanIm = zeros(r,c);%out pic, whoever has neighborhood out of bound, remain 0
    xRad = maskRadius(1);%x radius
    yRad = maskRadius(2);%y radius
    %no need to look from 1 to r -> was asked to leave pixel their neighborhood extends beyond the bounds of the image
    for i=1+xRad : r - xRad 
        %no need to look from 1 to c from the same reason
        for j=1+yRad : c - yRad
            neighborhoodMatrix = im((i-xRad) : (i+xRad), (j-yRad) : (j+yRad));
            cleanIm(i,j) = median(neighborhoodMatrix(:));
        end
    end
    cleanIm = uint8(cleanIm);
    showImage(cleanIm);
end

%1 Set to zero all boundary pixels (pixels where the neighborhood extends
%beyond the bounds of the image): if one+ pixel in the neighborhood is out
%of bound, put his value 0 ?