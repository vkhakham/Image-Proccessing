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
function    G = gaussPyr(img,levels)
    img = readImage('lena.tif');
    levels = 4;
    
    img = uint8(img);
    C = cell(1,levels);
    C{1} = img;
    if(levels > 1)
        for i=2 : levels
%             disp(int2str(i));
%             [r,c] = size(img);
%             img = img(1:(floor(r/2)), 1:(floor(c/2)));
%             C{i} = img;
            C{i} = downSample(C{i-1});
        end
    end
    printPyr(C);
end