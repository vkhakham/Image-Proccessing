%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% HW4

clear;
close all;
clc;

% DONE
% % wolf cleaning using only fft
% % remove 4 peaks on noisyImgF 
% noisyImg = imread('wolf.tif');
% cleanImg = cleanWolf(noisyImg);
% imshow([noisyImg, ones(256,5)*255,cleanImg]);   
% pause;
% clear;
% close all;

% DONE
% % dining room cleaning expanding range of gray values
% % using hist to manipulate gray values
% noisyImg = imread('diningroom.tif');
% cleanImg = cleanDiningRoom(noisyImg);
% imshow([noisyImg, ones(256,5)*255, cleanImg]);   
% pause;
% clear;
% close all;

% DONE
% % faces cleaning 
% %   make from 3 faces - 3 frames using affineImage
% %   call cleanImageMedian_multi with 3 frames - get 1 good frame
% %   restore good frame back to the 3 faces using affineImage
% noisyImg = imread('faces.tif');
% cleanImg = cleanFaces(noisyImg);
% imshow([noisyImg, ones(512,5)*255, cleanImg]); 
% pause;
% clear;
% close all;

% TODO - NOT DONE try weiner
% % cleanHouseFront cleans ??? 
% noisyImg = imread('housefront.tif');
% cleanImg = cleanHouseFront(noisyImg);
% imshow([noisyImg, ones(256,5)*255, cleanImg]);   
% pause;
% clear;
% close all;

% TODO - try optimize by adding some of the orig im
% % cleanManyPeople uses gamma correction to clean image.
% noisyImg = imread('manyPeople.tif');
% cleanImg = cleanManyPeople(noisyImg);
% imshow([noisyImg, ones(256,5)*255, cleanImg]);  
% pause;
% clear;
% close all;

% TODO - fix edges on minmax like in adaptive
% % cleanQr uses maxmin(minmax) to remove text then adaptive binarize for white/black.
% noisyImg = imread('QR.tif');
% cleanImg = cleanQr(noisyImg);
% imshow([noisyImg, ones(256,5)*255, cleanImg]);   
% pause;
% clear;
% close all;

% OPT needed
% % cleanPillows - median with mask[6,0] - look just up and down
% noisyImg = imread('pillows.tif');
% cleanImg = cleanPillows(noisyImg);
% imshow([noisyImg, ones(256,5)*255, cleanImg]); 
% pause;
% clear;
% close all;

% TODO - try biliteral fiter
% % cleanBuilding - 
% noisyImg = imread('building.tif');
% cleanImg = cleanBuilding(noisyImg);
% figure, imshow([noisyImg, ones(256,5)*255, cleanImg]); 
% pause;
% clear;
% close all;















% clear;
% close all;
% clc;
