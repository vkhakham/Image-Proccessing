%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleanPillows (im)
    im = readImage('pillows.tif');
    showImage(im);
    im = double(im);
    maskRad = [1,1];

    
    max1 = cleanImMinMax(im, 'max',maskRad);
    % showImage(max1);
    minMax1 = cleanImMinMax(max1, 'min', maskRad);
    % showImage(minMax1);
    maxMinMax = cleanImMinMax(minMax1, 'max', maskRad);
    % showImage(maxMinMax);
    minMaxMinMax = cleanImMinMax(maxMinMax, 'min', maskRad);
    showImage(minMaxMinMax);

    min1 = cleanImMinMax(im, 'min',maskRad);
    % showImage(min1);
    maxMin1 = cleanImMinMax(min1, 'max', maskRad);
    % showImage(maxMin1);
    minMaxMin = cleanImMinMax(maxMin1, 'min', maskRad);
    % showImage(minMaxMin);
    maxMinMaxMin = cleanImMinMax(minMaxMin, 'max', maskRad);
    showImage(maxMinMaxMin);

    avg = cleanImageMedian(im, [6,0]);
    % avg = cleanImageMedian(avg, [0,3]); % tried to removie artifacts at
    % edges
    showImage(avg);

    imArray(:,:,1) = avg;
    imArray(:,:,2) = minMaxMinMax;
    imArray(:,:,3) = maxMinMaxMin;
    cleanIm = cleanImageMedian_multi(imArray);
    showImage(cleanIm);

    
    cleanIm = uint8(cleanIm);
end
