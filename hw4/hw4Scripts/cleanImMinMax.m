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
    for i=1+xRad : r - xRad 
        for j=1+yRad : c - yRad
            neighborhoodMatrix = im((i-xRad) : (i+xRad), (j-yRad) : (j+yRad));
            if strcmp(isMin,'min')
                cleanIm(i,j) = min(neighborhoodMatrix(:));
            else
                cleanIm(i,j) = max(neighborhoodMatrix(:));        
            end
        end
    end  
    cleanIm = uint8(cleanIm);
end