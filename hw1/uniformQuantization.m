 function [imgNbit,Qvals] = uniformQuantization(img8bit,N)
%     This routine quantizes an 8 bit image into an N bit image
%     using Uniform Quantization.
% 
%     Input: img8bit - a grayscale image in the range [0..255] 
%              N – number of bits for output image. N<8.
%     Output: imgNbit - a grayscale image with maximum 2^N different values 
%             Qvals  - a vector of length 2^N where each entry i contains the 8 bit gray value qi. 
%     Method: Uses Uniform Quantization to create the N bit image. 
%             This is a two line function (one line for each of the output variables).
Qvals = zeros(1,2^N);
imgNbit = zeros(size(img8bit));

step = 2^(8-N);
for idx = 1:numel(Qvals)
    Qvals(idx) = step * idx - step/2 ;
end

nonZeroIndexes = find(img8bit);
for idx = 1:numel(nonZeroIndexes)
    indexQval = floor(img8bit(nonZeroIndexes(idx)) / step) + 1;
    imgNbit(nonZeroIndexes(idx)) = Qvals(indexQval);
end

Qvals