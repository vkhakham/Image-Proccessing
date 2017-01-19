%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanBuilding (noisyImg)
    clear;
    close all;
    clc;
    noisyImg = imread('building.tif');
    noisyImg = uint8(noisyImg);
    
    



    cleanImg = bilateralFilt(noisyImg, 3, 50, 20);
    cleanImg = uint8(cleanImg);
    imshow([noisyImg,ones(255,5)*255,cleanImg]);
end

