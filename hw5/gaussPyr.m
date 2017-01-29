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
    
    C = cell(1,levels);
    g = [0.05 0.25 0.4 0.25 0.05];
    C(1) = img;
    C(2) = gausMask;
    gausMask = g'*g;
    img = uint8(img);
    for i=0 : levels-1
        disp(int2str(i));
    end
    
end