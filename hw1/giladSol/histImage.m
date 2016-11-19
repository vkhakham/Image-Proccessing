function h = histImage(img)

%Input : img - a grayscale image in the range [0..255] 
%
%Output: h - image histogram. An array 1x256 such that 
%        entry i contains the number of pixels in the 
%        image having grayscale value i-1.
% 
%Method: Counts the number of pixels with grayscale 
%        value i in the range [0 .. 255]. 

%DELETE
%img = readImage('barbarasmall.tif');
%DELETE

h = zeros(1,256);
for i=0:255
    h(i+1) = length( find(img == i) );
end



