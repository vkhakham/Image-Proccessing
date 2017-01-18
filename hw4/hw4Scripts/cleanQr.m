%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleanQr (noisyIm)
    noisyIm = double(noisyIm);
    maskRad = [1,1];
    
    max1 = cleanImMinMax(noisyIm, 'min',maskRad);
    % showImage(max1);
    minMax1 = cleanImMinMax(max1, 'max', maskRad);
    % showImage(minMax1);
    maxMinMax = cleanImMinMax(minMax1, 'min', maskRad);
    % showImage(maxMinMax);
    minMaxMinMax = cleanImMinMax(maxMinMax, 'max', maskRad);

    min1 = cleanImMinMax(minMaxMinMax, 'max',maskRad);
    % showImage(min1);
    maxMin1 = cleanImMinMax(min1, 'min', maskRad);
    % showImage(maxMin1);
    minMaxMin = cleanImMinMax(maxMin1, 'max', maskRad);
    % showImage(minMaxMin);
    maxMinMaxMin = cleanImMinMax(minMaxMin, 'min', maskRad);
    
    binirizedIm = binarizeOptAdaptive(maxMinMaxMin, 30);
    cleanIm = uint8(binirizedIm);
    
end


