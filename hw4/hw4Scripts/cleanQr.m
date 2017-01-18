%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleanQr (im)
    clear;
    close all;
    clc;
    im = imread('QR.tif');
    
% % % %     miniIm = im(1:50,1:50);
% % % %     showImage(im);
% % % %     cleanim = binarizeOptAdaptive(miniIm,15);
% % % %     cleanim = cleanImageMedian(cleanim,[1,1]);
% % %     maskRad = [1,1];
% % %     cleanimRightSide = cleanImMinMax(im(:,128:256), 'max', maskRad);
% % %     cleanimLeftSide  = cleanImMinMax(im(:,1:127)  , 'min', maskRad);
% % %     cleanim = [cleanimLeftSide cleanimRightSide];
% % %     
% % %     miniIm = cleanim(1:50,:);
% % %     cleanim = binarizeOptAdaptive(miniIm,30);
% % %     
% % %     imshowpair(im, cleanim, 'montage');
% % %     im = double(im);
    maskRad = [1,1];

    max1 = cleanImMinMax(im, 'max',maskRad);
    % showImage(max1);
    minMax1 = cleanImMinMax(max1, 'min', maskRad);
    % showImage(minMax1);
    maxMinMax = cleanImMinMax(minMax1, 'max', maskRad);
    % showImage(maxMinMax);
    minMaxMinMax = cleanImMinMax(maxMinMax, 'min', maskRad);

    min1 = cleanImMinMax(minMaxMinMax, 'min',maskRad);
    % showImage(min1);
    maxMin1 = cleanImMinMax(min1, 'max', maskRad);
    % showImage(maxMin1);
    minMaxMin = cleanImMinMax(maxMin1, 'min', maskRad);
    % showImage(minMaxMin);
    maxMinMaxMin = cleanImMinMax(minMaxMin, 'max', maskRad);

    cleanIm = binarizeOptAdaptive(maxMinMaxMin, 30);
    
    cleanIm = uint8(cleanIm);
    imshow(cleanIm);
end