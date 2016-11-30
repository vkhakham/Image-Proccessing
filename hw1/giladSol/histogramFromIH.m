function h = histogramFromIH(IH,box)

% function h = histogramFromIH(IH,box)
% (file name is accordingly histogramFromIH.m ) 
% This routine builds the IntegralHistogram of image img.
% 
% Input:  IH – a 3 dimensional array containing the integralHistogram
%         box = a 4-vector defining a window in an image: [r0 r1 c0 c1]. 
%               where 0 <= r0,c0 < r1,c1 <= 256
%         if box=[1 2 1 2] you will get the value of img(2,2) + 1
% Output: h - image histogram. An array 1x256.
% 
% Method: Efficiently computes the histogram in window [r0 : r1, c0 : c1] from IH.

img = readImage('darkimage.tif');
img = zeros(256,256);
img(1,1) = 2;
img(1,2) = 2;
img(2,1) = 2;
img(2,2) = 2;
[I,J] = size(img);
IH = zeros(I,J,256);
IH = IntegralHistogram(img);

box = [1 2 1 2];
r0 = box(1);
r1 = box(2);
c0 = box(3);
c1 = box(4);




temph = IH(r1,c1,:)
temph = temph + IH(r0,c0,:)
temph = temph - IH(r0,c1,:)
temph = temph - IH(r1,c0,:)
h = reshape(temph,1,size(temph,3));

end
