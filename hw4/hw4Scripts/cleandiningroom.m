%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleandiningroom (noisyImg)
    noisyImg = uint8(noisyImg);
    
    %attempt a - number of differnt gray values bins
    diffrentGrayValues = length(unique(noisyImg(:)));
    equalizedIm = histeq(noisyImg,diffrentGrayValues);
    
    %attempt b - default 64 bins
%     equalizedIm2 = histeq(noisyImg);

%     imshow([noisyImg, equalizedIm, equalizedIm2]);    
    cleanImg = uint8(equalizedIm);
end

%TODO see if ok to use this function hist equalization
%choose 64bins or unique values bins