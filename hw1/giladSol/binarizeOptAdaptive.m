function [bimg] = binarizeOptAdaptive(img,winsize)

% function [bimg] = binarizeOptAdaptive(img,winsize)
%             
% Given an image, calculates the optimal threshold and returns the optimally thresholded image.
%   
% Input:  img - a grayscale image in the range [0..255] . 
%         winsize – an odd integer > 0. Adaptive thresholding windows are winsize x winsize.
%                               
% Output: bimg - a binary image, represented as a grayscale
%                image with values 0 and 255.
% 
% Method: Per image pixel determines the optimal threshold value by searching for optimal threshold
%         in winsize X winsize window around the pixel. Apply optimalQuantization with N=1 in each window.
%         If window exceeds image boundaries – use only pixels within the image boundaries.

[rows,cols] = size(img);
boundCheck = floor(winsize/2);
cloneImgForTValues = zeros(size(img));% cloneImgForTValues(i,j) will be the T for img(i,j).
for i=1 : rows
%     tic
    for j=1 : cols
        %calculate indexes of sub-matrix
        up = i - boundCheck;
        if(up < 1)
            up = 1;
        end
        down = i + boundCheck;
        if(down > rows)
            down = rows;
        end
        left = j - boundCheck;
        if(left < 1)
            left = 1;
        end
        right = j + boundCheck;
        if(right > cols)
            right = cols;
        end
        subimg = img(up:down,left:right);
        [~, Qvals] = optimalQuantization(subimg,1);%didnt use [~,T]= binarizeOpt(subimg)not to overload the stack
        cloneImgForTValues(i,j) = mean(Qvals); %allow fractions.
    end
%     toc
%    disp(num2str(i));
end

bimg = (img>cloneImgForTValues)*255;

end

