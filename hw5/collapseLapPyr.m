%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function    img = collapseLapPyr(L)
% 
% (file name is accordingly collapseLapPyr.m ) 
% This routine reconstructs the original image from its Laplacian Pyramid.
% 
% Input:      L = the Laplacian pyramid. L is a 1D array of matrices implemented using matlab's cell.
% 
% Output:   img = a grayscale image (values in [0,255]).
% 
% Method:  Works level by level from top of pyramid. Uses function upSample.
% 
% Note: This routine should work for a Laplacian Pyramid with any number of levels. 
%
function img = collapseLapPyr(L)
    for i=length(L) :-1: 2
        %collapse- each level will contain the upper levels of the pyramid
         L{i-1} =  double(upSample(L{i})) + double(L{i-1}); 
    end
    img = uint8(L{1});
end