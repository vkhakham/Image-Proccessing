%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function newimg = rotateImage(img,theta,centerX,center,newSize)
% This routine rotates img by theta degrees ANTI-clockwise around the point [centerX,center].
% 
% Input:      
% img - a grayscale image in the range [0..255]
% theta – angle in degrees anti-clockwise from x-axis.
% centerX,centerY – coordinates of center of rotation (may be outside image). 
% newSize – optional parameter – [newRows,NewCols] - defines the size of 
%                the output image. May be smaller or larger than size of img. 
%                Default is size of img. 
% Output:    
% newimg – the rotated image.
% 
% Method:  Performs the geometric operation using inverse mapping.
% Creates an array of all target pixel coordinates. Calculates the transform to apply on 
% these coordinates. Applies the transform in matrix operations on the target 
% pixel coordinates to obtain the source pixel coordinates.  Use the source pixel
% coordinates to calculate the color in the source image (img) using Bilinear Interpolation.
% Pixels that have no source (outside the image) should be painted black (0).
function newimg = rotateImage(img,theta,centerX,centerY,newSize)
    if(nargin == 4)
        newSize = size(img);
    end

    r = newSize(1);
    c = newSize(2);
    
    %calculate rotate matrix^-1(named Tinv)
	%delete create T^-1 instead of T and inv(T)
    T = [cosd(theta),sind(theta);-sind(theta),cosd(theta)]; %delete. check that T^-1(theta) = T(-theta) always true
    TinvNotDirect = inv(T);%delete
    Tinv = [cosd(-theta),sind(-theta);-sind(-theta),cosd(-theta)];
    %delete if clause
    if(isequal(Tinv, TinvNotDirect) )
        display('same');
    else
        Tinv
        TinvNotDirect
        display('diff');
    end
    
    %calc source coordinates
    
    [X,Y] = meshgrid(1:c, 1:r);%arrange the target pixels in 2XN shape
    
    %shift pixels that 0,0 will be centerX,centerY
    X = X - centerX;
    Y = Y - centerY;
    sourceCoors = TinvNotDirect*[X(:) Y(:)]';%locate source pixel for each target pixel
    
    H1 = TinvNotDirect*[X(:) Y(:)]';
    H2 = T\[X(:) Y(:)]';
    if(isequal(H1,H2) )
        display('H1 and H2 the same');
    else
        display('H1 and H2 diff');
    end
    
    %shift pixels back
    sourceCoors(1,:) = sourceCoors(1,:) + centerX;
    sourceCoors(2,:) = sourceCoors(2,:) + centerY;
 
    %interpolate colors
    newimg = interpolateUsingNN(img, sourceCoors);%temp script thats using NN instead of bilinear
    newimg = reshape(newimg, [r, c]);%getting a vector in the size 1X(RxC) -> reshape to image  

    %%%% check what matlab prepared function create. i think it arournd
    %%%% the middle pixel
%     angle = theta;
%     B = imrotate(img,angle,'nearest');
%     showImage(B);
%     C = imrotate(img,angle,'bilinear');
%     showImage(C);
    %%%% done check
end




















