%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function    newImg = multiResSpline(img1,img2,mask,levels)
% 
% (file name is accordingly multiResSpline.m ) 
% This routine combines 2 images using multiresolution spline.
% 
% Input:      img1 = a grayscale image (values in [0,255]) 
% img2 = a grayscale image (values in [0,255]) the same size as img1. 
% mask = an image with values in [0 ,1] the same size as img1 and img2, representing the merging regions. 
% Values of mask are the weights for img1. The weights for img2 are 1 minus these values.
% levels = the number of levels created in the Laplacian Pyramids used in the process 
% (minimum value = 1).
% 
% Output:   newImage = a grayscale image (values in [0,255]) the same size as img1 and img2.
% 
% Method:  Builds a Laplacian pyramid for img1 and img2. Builds a Gaussian pyramid for mask.
% Creates a new Laplacian Pyramid the same size of the existing pyramids. Each level 
% of the new Pyramid is a combination of the corresponding levels in the 2 existing pyramids. The combination 
% is given by the appropriate level of the mask pyramid: values from Pyramid of img1 are weighted by
% by the mask and those of img2 are weighted by 1 minus the values of the mask.
% The new image is then reconstructed from the new Pyramid. 
% Note: 1) The reconstructed image may not have values in 0..255, you must scale or truncate. 
function newImg = multiResSpline(img1,img2,mask,levels)
    L1 = laplacPyr(img1, levels);
    L2 = laplacPyr(img2, levels);
    L3 = cell(1,levels);
    L3{1} = double(L1{1}).*mask + double(L2{1}).*(1-mask); %first level no need to down scale mask
    for i=2 : levels
        mask = double(downSample(mask));
        L3{i} = double(L1{i}).*mask + double(L2{i}).*(1-mask); 
    end
    newImg = uint8(collapseLapPyr(L3));
end