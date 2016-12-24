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
    cleanIm = zeros(r,c);
    xRad = maskRadius(1);
    yRad = maskRadius(2);
    for i=1 : r
        for j=1 : c
            %it was asked to give zero to all pixel where the neighborhood
            % extends beyond the bounds of the image
            if((i-xRad < 1) || (i+xRad > r) || (j-yRad < 1) || (j+yRad > c))
               cleanIm(i,j) = 0;
            %valid neighborhood - put median value
            else
                neighborhoodMatrix = im((i-xRad) : (i+xRad), (j-yRad) : (j+yRad));
                cleanIm(i,j) = median(neighborhoodMatrix(:));
            end
        end
    end
end

%1 Set to zero all boundary pixels (pixels where the neighborhood extends
%beyond the bounds of the image): if one+ pixel in the neighborhood is out
%of bound, put his value 0 ?