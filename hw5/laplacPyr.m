%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function    L = laplacPyr(img,levels)
% 
% (file name is accordingly laplacPyr.m ) 
% This routine creates a Laplacian pyramid.
% 
% Input:    img = a grayscale image (values in [0,255]) 
%           levels = the number of levels created in the Laplacian Pyramid (minimum value = 1). 
% Output:   L = the Laplacian pyramid. L is a 1D array of matrices implemented using matlab's cell.
% 
% Method:  Starts with img and creates level after level using function downSample and upSample. 
% Or using gaussPyr and upSample. 
% 
function L = laplacPyr(img,levels)
    G = gaussPyr(img,levels+1);%make gausian + 1. no problem if full was asked.
    L = cell(1,levels);
    maxLevels = log2(size(img,1))+1;
    for i=1 : levels
        if(i ~= maxLevels)
            L{i} = double(G{i}) - double(upSample(G{i+1})); %Li = Gi - Gi+1
        else
            L{maxLevels} = G{maxLevels};%DC
        end
    end
end