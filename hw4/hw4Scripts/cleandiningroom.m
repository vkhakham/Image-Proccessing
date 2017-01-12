%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanDiningRoom (noisyImg)
    noisyImg = imread('diningroom.tif');
    noisyImg = uint8(noisyImg);
    cleanImg = uint8(noisyImg.*6);
    
% diffrentGrayValues = length(unique(noisyImg(:)));
% equalizedIm = histeq(noisyImg,diffrentGrayValues);   
% imshow([noisyImg, equalizedIm, newImg]); 

end
