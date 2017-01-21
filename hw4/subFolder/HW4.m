%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% HW4

clear;
close all;
clc;

% % DONE
% % wolf cleaning using only fft
% % remove 4 peaks on noisyImgF 
% noisyImg = imread('wolf.tif');
% cleanImg = cleanWolf(noisyImg);
% figure, imshow([noisyImg, ones(256,5)*255,cleanImg]);   
% pause;
% clear;
% close all;
% 
% % % DONE
% % % dining room cleaning expanding range of gray values
% % % using hist to manipulate gray values (doing 'histeq')
% noisyImg = imread('diningroom.tif');
% cleanImg = cleanDiningRoom(noisyImg);
% figure, imshow([noisyImg, ones(256,5)*255, cleanImg]);   
% pause;
% clear;
% close all;
% 
% % % DONE
% % % faces cleaning 
% % %   make from 3 faces - 3 frames using affineImage
% % %   call cleanImageMedian_multi with 3 frames - get 1 good frame
% % %   restore good frame back to the 3 faces using affineImage
% noisyImg = imread('faces.tif');
% cleanImg = cleanFaces(noisyImg);
% figure, imshow([noisyImg, ones(512,5)*255, cleanImg]); 
% pause;
% clear;
% close all;
% 
% % DONE
% % % cleanHouseFront cleans using option1 from lecture
% % % also tried to remove guasian noise on right side
% noisyImg = imread('housefront.tif');
% cleanImg = cleanHouseFront(noisyImg);
% figure, imshow([noisyImg, ones(256,5)*255, cleanImg]);   
% pause;
% clear;
% close all;
% 
% % % Done
% % % cleanManyPeople uses gamma correction to clean image.
% noisyImg = imread('manyPeople.tif');
% cleanImg = cleanManyPeople(noisyImg);
% figure, imshow([noisyImg, ones(256,5)*255, cleanImg]);  
% pause;
% clear;
% close all;

% % DONE
% % cleanQr uses sevral min max to remove text then adaptive binarize for white/black.
noisyImg = imread('QR.tif');
cleanImg = cleanQr(noisyImg);
figure, imshow([noisyImg, ones(256,5)*255, cleanImg]);   
pause;
clear;
close all;

% % Done
% % cleanPillows - median with mask[6,0] - looks just up and down
noisyImg = imread('pillows.tif');
cleanImg = cleanPillows(noisyImg);
figure, imshow([noisyImg, ones(256,5)*255, cleanImg]); 
pause;
clear;
close all;

% % Done  
% % cleanBuilding - biliteral fiter
noisyImg = imread('building.tif');
cleanImg = cleanBuilding(noisyImg);
figure, imshow([noisyImg, ones(255,5)*255, cleanImg]); 
pause;
clear;
close all;

