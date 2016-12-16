%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function newimg = scaleImage(img,s,centerX,centerY,newSize)
% This routine scales img uniformly by s around the point [centerX,center].
% 
% Input:      
% img - a grayscale image in the range [0..255]
% s – the scale factor must be greater than 0.
% centerX,centerY – coordinates of center of scaling (may be outside the image). 
% newSize – optional parameter – [newRows,NewCols] - defines the size of 
% the output image. May be smaller or larger than size of img. 
% Default is size of img. 
% 
% Output:    
% newimg – the scaled image.
% 
% Method:  Performs the geometric operation using inverse mapping.
% Creates an array of all target pixel coordinates. Calculates the transform to apply
% on these coordinates. Applies the transform in matrix operations on the target
% pixel coordinates to obtain the source pixel coordinates.  Use the source pixel
% coordinates to calculate the color in the source image (img) using
% Bilinear Interpolation. Pixels that have no source (outside the image) should be
% painted black (0).
function newimg = scaleImage(img,s,centerX,centerY,newSize)
    if(nargin == 4)
        newSize = size(img);
    end

    r = newSize(1);
    c = newSize(2);
    
    %calculate scale matrix^-1(named Sinv)
    Sinv = [1/s,0; 0,1/s];
    
    %calc source coordinates
    [X,Y] = meshgrid(1:c, 1:r);%arrange the target pixels in 2XN shape
    
    %shift pixels that 0,0 will be centerX,centerY
    X = X - centerX;
    Y = Y - centerY;
    sourceCoors = Sinv*[X(:) Y(:)]';%locate source pixel for each target pixel
    
    %shift pixels back
    sourceCoors(1,:) = sourceCoors(1,:) + centerX;
    sourceCoors(2,:) = sourceCoors(2,:) + centerY;
 
    %interpolate colors
    newimg = interpolate(img, sourceCoors);% bilinear interp
    newimg = reshape(newimg, r, c);%getting a vector in the size 1X(RxC) -> reshape to image(r,c)
    
%     TEST Bilinear VS Nearest neighbour     
%     newimg2 = interpolateUsingNN(img, sourceCoors);%temp script thats using NN instead of bilinear
%     newimg2 = reshape(newimg2, r, c);%getting a vector in the size 1X(RxC) -> reshape to image  
%     showImage(newimg);
%     showImage(newimg2);
end
