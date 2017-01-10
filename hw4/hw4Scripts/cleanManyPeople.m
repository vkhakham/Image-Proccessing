%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanManyPeople (noisyImg)
    clear;
    close all;
    clc;
    noisyImg = imread('manyPeople.tif');
    noisyImg = uint8(noisyImg);
    


    
%     %attempt 1 - number of differnt gray values bins
%     diffrentGrayValues = length(unique(noisyImg(:)));
%     equalizedIm = histeq(noisyImg,diffrentGrayValues);    
%     cleanImg = uint8(equalizedIm);

% %     %attempt 2 
%     histIm = histImage(noisyImg);
%     figure, plot(0:255,histIm);
%     minValue = min(noisyImg(:));
%     contrastIm = ( ((noisyImg - minValue)*0.5)+minValue );
%     
%     figure, imshow([noisyImg,ones(256,5)*255,uint8(contrastIm)]);
    
    
    
% %     %attempt 3 FFT - look like it
%     F = fft2(noisyImg);
%     D = log(1+abs(F));%locating peaks using log to make them larger  
%     D = fftshift(D);%shifting to center
%     figure,
%     imagesc(D);%display to hand pick the peaks
%     colormap(gray)%see gray fft
    
    
    cleanImg = noisyImg;
    cleanImg = uint8(cleanImg);
    figure, imshow([noisyImg,ones(256,5)*255,cleanImg]);
end
