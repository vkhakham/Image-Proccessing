%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
function [imgNbit,Qvals] = uniformQuantization(img8bit,N)
%
%function [imgNbit,Qvals] = uniformQuantization(img8bit,N)
%This routine quantizes an 8 bit image into an N bit image
%using Uniform Quantization.
% 
%Input:  img8bit - a grayscale image in the range [0..255] 
%        N – number of bits for output image. N<8.
%
%Output: imgNbit - a grayscale image with maximum 2N different values 
%        Qvals  - a vector of length 2N where each entry i contains the 8 
%        bit gray value qi. 
%        
% Method: div the img8bit in 2^(8-N) and floor the values will result have 
%         2^N diffrent values in the img8bit.
%         multiply with 2^(8-N) give each value the uniformly spreaded Zi.
%         add 2^(7-N) will move the value to the middle of the bucket 
%         between Zi and Zi+1.
%         calc Qvals very similar

imgNbit = floor(img8bit / 2^(8-N)) * 2^(8-N) + 2^(7-N);
Qvals   = (0:(2^N-1)) * (2^(8-N)) + 2^(7-N);

end