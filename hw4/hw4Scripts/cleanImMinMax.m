%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleanImMinMax (im, isMin, maskRadius)

    im = double(im);
    [r,c] = size(im);
    cleanIm = zeros(r,c);
    xRad = maskRadius(1);
    yRad = maskRadius(2);
    %no need to look from 1 to r -> was asked to 'blacken' pixels their neighborhood extends beyond the bounds of the image
    for i=1 : r  
        for j=1 : c 
            neighborhoodMatrix = im((max(i-xRad,1)) : min((i+xRad),r), max((j-yRad),1) : min((j+yRad),c));
            if strcmp(isMin,'min')
                cleanIm(i,j) = min(neighborhoodMatrix(:));
            else
                cleanIm(i,j) = max(neighborhoodMatrix(:));        
            end
        end
    end  
    cleanIm = uint8(cleanIm);
end