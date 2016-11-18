function    h = histImage(img)
% Input:      img - a grayscale image in the range [0..255] 
%             Output:    h - image histogram. An array 1x256 such that 
%                          entry i contains the number of pixels in the 
%                          image having grayscale value i.
% 
%             Method:  Counts the number of pixels with grayscale 
%                          value i in the range [0 .. 255]. 
%                            Do NOT loop over the image (see note below). You may use Matlab function find.
%                            Do NOT use the matlab function hist. 
h = zeros(1, 256);
nonZeroIndexes = find(img);
for idx = 1:numel(nonZeroIndexes)
    disp(img(nonZeroIndexes(idx)))
    h(img(nonZeroIndexes(idx))) = h(img(nonZeroIndexes(idx))) + 1;
end
