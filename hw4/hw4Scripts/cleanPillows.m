%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleanPillows (im)
%     clear;
%     close all;
%     im = imread('pillows.tif');
    im = double(im);
    median = cleanImageMedian(im, [6,0]);
    cleanIm = uint8(median);
%     figure, imshow([im, ones(256,5)*255, cleanIm]);   
%     title('cleanImg');
end
%     maskRad = [1,1];

%     max1 = cleanImMinMax(im, 'max',maskRad);
%     minMax1 = cleanImMinMax(max1, 'min', maskRad);
%     maxMinMax = cleanImMinMax(minMax1, 'max', maskRad);
%     minMaxMinMax = cleanImMinMax(maxMinMax, 'min', maskRad);
%     maxMinMin = cleanImMinMax(minMax1, 'min', maskRad);
%     maxMinMinMax = cleanImMinMax(maxMinMin, 'max', maskRad);
%     figure, imshow([im, ones(256,5)*255, maxMinMinMax]);   
%     title('maxMinMinMax');
% 
%     
%     min1 = cleanImMinMax(im, 'min',maskRad);
%     maxMin1 = cleanImMinMax(min1, 'max', maskRad);
%     minMaxMin = cleanImMinMax(maxMin1, 'min', maskRad);
%     maxMinMaxMin = cleanImMinMax(minMaxMin, 'max', maskRad);
%     minMaxMax = cleanImMinMax(maxMin1, 'max', maskRad);
%     minMaxMaxmin = cleanImMinMax(minMaxMax, 'min', maskRad);
% 
%     figure, imshow([im, ones(256,5)*255, minMaxMaxmin]);  
%     title('minMaxMaxmin');

%     figure, imshow([im, ones(256,5)*255, median]);   
%     title('median');
% %     median2 = cleanImageMedian(median, [1,1]);
% %     figure, imshow([im, ones(256,5)*255, median2]);   
% %     title('median2');
%     
%     imArray(:,:,1) = median;
%     imArray(:,:,2) = maxMinMinMax;
%     imArray(:,:,3) = minMaxMaxmin;
%     cleanIm = cleanImageMedian_multi(imArray);