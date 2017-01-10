%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanHouseFront (noisyImg)
    clear;
    close all;
    clc;
    noisyImg = imread('housefront.tif');
    noisyImg = uint8(noisyImg);
    
    %seems like we need FFT




    cleanImg = noisyImg;
    cleanImg = uint8(cleanImg);
    imshow([noisyImg,cleanImg]);
end

%     imshow([noisyImg, newImgLeft,newImgRight ,newImgDown, cleanImg, temp]);%debugging   