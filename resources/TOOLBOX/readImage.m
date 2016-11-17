function img = readImage(fileName,fmt);
% 
% img = readImage(fileName)
%
% Reads a grayscale image from a file.
% File is assumed to contain a TIF image
% fileName is a string
% img - is a grayscale image with values [0..255]
% fmt - is an optional argument with the format of the image.
%       see fmt of imread.

%
% Written by Hagit Hel-Or  I.D. xxxxxxxx
%  Last Modified 14/12/98
%  Last Modified by Y. Moses 3.2.2000

if nargin <1
    error('USAGE: img = readImage(fileName)');
end;

if nargin <2
    fmt='tif'; end;

[im,map]=imread(fileName,fmt);

% indexed image - grayscale or RGB
if (size(map,1) ~= 0)
    % use only the Green index
    img = reshape(map(double(im)+1,2),size(im));
    img = round(img.*255);
else  % non indexed image
    if (ndims(im) == 2)  % grayscale
       img = round(double(im));   % values are already in 0..255
    else  % RGB image [or higher dimension]
       img = round(double(im(:,:,2)));   % use only Green image
                                  % values are already in 0..255
    end;
end;

