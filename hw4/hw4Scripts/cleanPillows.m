%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleanPillows (im)
    im = double(im);
    median = cleanImageMedian(im, [6,0]);
    cleanIm = uint8(median);
end
