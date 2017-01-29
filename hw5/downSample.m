%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% This routine creates a downsampled blurred version of an image. The routine is used to create 
% a Gaussian Pyramid image at a given level, from the image at the previous level..
% 
% Input:      I = a grayscale image (values in [0,255]) 
% 
% Output:   DS = a grayscale image (values in [0,255])  with 1/2 the width and 1/2 the height of  I.
% 
% Method:  The input image is blurred using a gaussian mask (use the one given in class) and 
%               then subsampled. Use matlab function conv2 with parameter "same". 
function DS = downSample(I)
%     I = readImage('lena.tif');
    I = double(I);
    g = [0.05 0.25 0.4 0.25 0.05];
    gausMask = g'*g;
    blurredIm = conv2(I, gausMask, 'same');
    DS = zeros(size(I)/2);
    for i = 1:size(DS,1)
        for j = 1:size(DS,2)
            DS(i,j) = (blurredIm(i*2,j*2) + blurredIm(i*2-1,j*2) + blurredIm(i*2,j*2-1) + blurredIm(i*2-1,j*2-1))/4;
        end
    end
    DS = uint8(DS);
end
%     showImage(DS);
