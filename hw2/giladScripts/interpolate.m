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
    img = readImage('im2.tif');
    newSize = size(img);
    r = newSize(1);
    c = newSize(2);
    [X,Y] = meshgrid(1:c, 1:r); %arrange the target pixels in 2XN shape
%     X = X + 10.3;
%     Y = Y + 10.3;
    sourceCoors = [X(:) Y(:)]';   
    sourceGrayVals = ones(r*c ,1);   
    for i=1 : r*c
        x = sourceCoors(1,i);
        y = sourceCoors(2,i);
        NW = [min(max(floor(x),1),r), min(max(floor(y),1),c)];
        NE = [min(max(floor(x),1),r), max(min(ceil(y),c),1)];
        SW = [max(min(ceil(x),r),1) , min(max(floor(y),1),c)];
        SE = [max(min(ceil(x),r),1) , max(min(ceil(y),c),1)];
        if(NE(1) ~= NW(1))
            Ndx = (x - NW(1)) / (NE(1) - NW(1)); 
            NColor = img(NW(1), NW(2)) * Ndx + img(NE(1), NE(2)) * (1 - Ndx);
            Sdx = (x - SW(1)) / (SE(1) - SW(1));
            SColor = img(SW(1), SW(2)) * Ndx + img(SE(1), SE(2)) * (1 - Sdx);
        else 
            try
                NColor = img(NW(1), NW(2));
            catch
                disp('1');
            end
            SColor = img(SW(1), SW(2));
        end
        if(SE(2) ~= NW(2))
            dy = (y - NW(2)) / (SE(2) - NW(2));
            color = NColor * dy + SColor * (1 - dy);
        else
            color = NColor;
        end
        sourceGrayVals(i) = round(color);
    end
    
    newimg = reshape(sourceGrayVals, [r, c]);
    showImage(img);
    showImage(newimg);
    K = img - newimg;
    clear;
    close all;
    clc;
end

