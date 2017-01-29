%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function    G = gaussPyr(img,levels)
% 
% (file name is accordingly gaussPyr.m ) 
% This routine creates a Gaussian pyramid.
% 
% Input:      img = a grayscale image (values in [0,255]) 
%             levels = the number of levels created in the Gaussian Pyramid (minimum value = 1). 
% Output:     G = the Gaussian pyramid. G is a 1D array of matrices implemented using matlab's cell.
% 
% Method:     Starts with img and creates level after level. Uses function downSample. 
% 
function G = gaussPyr(img,levels)
    img = uint8(img);
    G = cell(1,levels);
    G{1} = img;
    levels = min ( levels , log2(size(img,1))+1);
    if(levels > 1)
        for i=2 : levels
            G{i} = downSample(G{i-1});
        end
    end
end