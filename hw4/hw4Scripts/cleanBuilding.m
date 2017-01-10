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
    
    %seems like we need FFT




    cleanImg = noisyImg;
    cleanImg = uint8(cleanImg);
    imshow([noisyImg,cleanImg]);
end

