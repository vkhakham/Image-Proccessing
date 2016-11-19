 function [imgNbit,Qvals] = uniformQuantization(img8bit,N)
%     This routine quantizes an 8 bit image into an N bit image
%     using Uniform Quantization.
% 
%     Input: img8bit - a grayscale image in the range [0..255] 
%              N � number of bits for output image. N<8.
%     Output: imgNbit - a grayscale image with maximum 2^N different values 
%             Qvals  - a vector of length 2^N where each entry i contains the 8 bit gray value qi. 
%     Method: Uses Uniform Quantization to create the N bit image. 
%             This is a two line function (one line for each of the output variables).
imgNbit = floor(img8bit / 2^(8-N)) * 2^(8-N) + 2^(8-N-1);
Qvals = (0:(2^N-1)) * (2^(8-N)) + 2^(8-N-1);