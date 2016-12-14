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
% Output:    sourceGrayVals – a 1XN vector of gray values.
% 
% Method:Performs Bilinear interpolation to evaluate the gray value of the sourceCoors
% within image img. Uses Matrix operations only when computing interpolation.
% Pixels that have no source (outside the image) should assigned gray value 0 
function sourceGrayVals = interpolate(img,sourceCoors)


end

