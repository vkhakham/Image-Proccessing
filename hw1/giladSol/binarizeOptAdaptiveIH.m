function [bimg] = binarizeOptAdaptiveIH(img,winsize,IH)

% function [bimg] = binarizeOptAdaptiveIH(im,winsize,IH)
% 
% Given an image, calculates the optimal threshold and returns the optimally thresholded image.
% Uses the precomputed IntegralHistogram, to efficiently calculate local histograms.
% 
% Input:     img - a grayscale image in the range [0..255] . 
%            winsize – an odd integer > 0. Adaptive thresholding windows are winsize x winsize.
%            IH – a 3 dimensional array containing the integralHistogram.
% 
% Output:    bimg - a binary image, represented as a grayscale
%               image with values 0 and 255.
% 
% Method:  Per image pixel determines the optimal threshold value by searching for optimal 

[rows,cols] = size(img);
boundCheck = floor(winsize/2);
cloneImgForTValues = zeros(size(img));% cloneImgForTValues(i,j) will be the T for img(i,j).

for i=1 : rows
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
        subimgHist = histogramFromIH(IH,[up-1 down left-1 right]);
        [~, Qvals] = optimalQuantizationUsingHistFromIH(subimg,1,subimgHist);
        cloneImgForTValues(i,j) = mean(Qvals); %allow fractions.
    end
end

bimg = (img>cloneImgForTValues)*255;

end
