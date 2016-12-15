%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function sourceGrayVals = interpolate(img,sourceCoors)
% This routine calculates the gray values for each coordinate by interpolating the values in img.
% 
% Input:  
% img - a grayscale image in the range [0..255]
% sourceCoors – a 2XN array of coordinates [x,y]' in the source image (img)
% 
% Output:    
% sourceGrayVals – a 1XN vector of gray values.
% 
% Method:Performs Bilinear interpolation to evaluate the gray value of the sourceCoors
% within image img. Uses Matrix operations only when computing interpolation.
% Pixels that have no source (outside the image) should assigned gray value 0 
function sourceGrayVals = interpolate(img,sourceCoors) 
    [r,c] = size(img);
   
    Xs = sourceCoors(1,:);
    Ys = sourceCoors(2,:);
    
    newimg = reshape(sourceGrayVals, [r, c]);
    showImage(img);
    showImage(newimg);
    K = img - newimg;
    clear;
    close all;
    clc;
    NEind   = sub2ind(size(img), NE(:,1), NE(:,2));
    NE = img(NEind);
    
    SWind   = sub2ind(size(img), SW(:,1), SW(:,2));
    SW = img(SWind);
    
    SEind   = sub2ind(size(img), SE(:,1), SE(:,2));
    SE = img(SEind);
    
    %calculate linear inter' to SE and SW ->S (with deltaX)
    %and than do linear inter' to the NE and NW ->N(with deltaX)
    %finish with linear inter' to N and S -> V(with deltaY) 
    S = SE .* deltaX' + SW .* (1 - deltaX') ;
    N = NE .* deltaX' + NW .* (1 - deltaX') ;
    V = N .* deltaY' + S .* (1 - deltaY') ;
    sourceGrayVals = V;
    
    %out of range gets color black. indx and indy were calculated at the begining
    sourceGrayVals(indx) = 0;
    sourceGrayVals(indy) = 0;
end
