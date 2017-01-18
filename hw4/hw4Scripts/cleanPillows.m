%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleanPillows (im)
    im = double(im);
    maskRad = [1,1];

    max1 = cleanImMinMax(im, 'max',maskRad);
    minMax1 = cleanImMinMax(max1, 'min', maskRad);
    maxMinMax = cleanImMinMax(minMax1, 'max', maskRad);
    minMaxMinMax = cleanImMinMax(maxMinMax, 'min', maskRad);

    min1 = cleanImMinMax(im, 'min',maskRad);
    maxMin1 = cleanImMinMax(min1, 'max', maskRad);
    minMaxMin = cleanImMinMax(maxMin1, 'min', maskRad);
    maxMinMaxMin = cleanImMinMax(minMaxMin, 'max', maskRad);

    median = cleanImageMedian(im, [6,0]);

    imArray(:,:,1) = median;
    imArray(:,:,2) = minMaxMinMax;
    imArray(:,:,3) = maxMinMaxMin;
    cleanIm = cleanImageMedian_multi(imArray);
    cleanIm = uint8(cleanIm);
end
