%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% 
% function newimg = affineImage(img,sourceCoors,targetCoors,newSize)
% This routine applies an affine transformation that maps sourceCoors to targetCoors.
% 
% Input:
% img - a grayscale image in the range [0..255]
% sourceCoors – a 2XN array of coordinates [x,y]' in the source image (img)
% targetCoors – a 2XN array of coordinates [x,y]' in the target image (newimg)
% newSize – optional parameter – [newRows,NewCols] - defines the size of 
%             the output image. May be smaller or larger than size of img. 
%             Default is size of img. 
%             
% Output:
% newimg – affine transformed image such that sourceCoors are mapped to targetCoors.
% 
% Method:  Performs the geometric operation using inverse mapping.
% Calculates the transform to apply by determining the affine transformation
% that best maps the source pixels to the target pixels (best under norm2). 
% Use the PINV approach described in class to find the vector of affine parameters (a..f). 
% Applies the transform in matrix operations on the target pixel coordinates to obtain the
% source pixel coordinates.  Use the source pixel coordinates to calculate the color in
% the source image (img) using Bilinear Interpolation. Pixels that have no source (outside
% the image) should be painted black (0).
function newimg = affineImage(img,sourceCoors,targetCoors,newSize)
    
    if(nargin == 4)
        newSize = size(img);
    end
    r = newSize(1);
    c = newSize(2);
    
    [~,N] = size(sourceCoors); %num of rows in Xmatrix
    Xmat = ones(N*2, 6);
%     for i=1 : N %replace with no loop
%         Xmat(2*i-1,:) = [sourceCoors(1,i) , sourceCoors(2,i), 0, 0, 1 ,0];
%         Xmat(2*i,:)   = [0, 0, sourceCoors(1,i) , sourceCoors(2,i), 0 ,1];
%     end
    Xmat(1:2:end) = zeros(N*2, 1);
    
    Xtag = targetCoors(:); %xtag is targetCoors in vector
    A = pinv(Xmat)*Xtag; % values a-f of matrix A
    A = [A(1) A(2) A(5); A(3) A(4) A(6); 0 0 1]; % allighn a-f values and pad last line
    Ainv = inv(A); % get Invese A
    
    [X,Y] = meshgrid(1:c, 1:r);%create clean image in the size of newSize
    O = ones(1,r*c);%vector of ones. pad meshgrid
    
    sourceCoorsOfNewPicture = Ainv*[X(:) Y(:) O(:)]';%locate source pixel for each target pixel
    sourceCoorsOfNewPicture = sourceCoorsOfNewPicture(1:2 , :);%remove last line of picture matrix
    
    %interpolate colors
    newimg = interpolateUsingNN(img, sourceCoorsOfNewPicture);%temp script thats using NN instead of bilinear
    newimg = reshape(newimg, r, c);%getting a vector in the size 1X(RxC) -> reshape to image  
end