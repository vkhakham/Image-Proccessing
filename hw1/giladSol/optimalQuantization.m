function    [imgNbit, Qvals] = optimalQuantization(img8bit,N)

% function    [imgNbit, Qvals] = optimalQuantization(img8bit,N)
%               
% This routine quantizes an 8 bit image into an N bit image using Optimal Quantization.
% 
% Input:  img8bit - a grayscale image in the range [0..255] 
%         N – number of bits for output image. N<8.
%         
% Output: imgNbit - a grayscale image with maximum 2N different values
%         Qvals  - a vector of length 2N where each entry i contains the 8 bit gray value qi. 
%         
% Method: TODO

%DELETE a
% Uses the iterative Loyd-Max algorithm for Optimal Quantization as described in class to 
% perform quantization. Use the histogram of img8bit as the graylevel probability 
% distribution. Use the Loyd-Max algorithm to compute the 2N+1 Zi values and the 2N qi values. 
% After computing the optimal qi and Zi values, create the N bit image by mapping
% all pixels with gray value in the range [Zi .. Zi+1] to the value qi.
% Use reasonable guess for initial qi or Zi values. Make sure that Z0 and
% Z2N+1 are 'anchored' to the bounds of the gray value range (0 and 255). 
% Be careful re stopping condition of the algorithm. Since data is digital (not continuous)
% process might converge to toggling state and not actual minima.
% Note: In class input z values were assumed continuous and thus integral over z values was used
% in the computation. In our case z values are integers 0..255 and thus sum rather than integral is used.
img8bit = readImage('lighthouse.tif');
N=1;
[imgNbit,Qvals] = uniformQuantization(img8bit,N);
% imgNbit = h;
% Qvals   = j;
%DELETE a