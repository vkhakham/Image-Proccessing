%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5
clear;
close all;
clc;

pics = {'lena.tif';'im2.tif';'barbarasmall.tif';'cups.tif';'darkimage.tif';'fourSquares.tif';'stroller.tif';'wine.tif';'im3.tif';'seagray.tif'};

%%%ROTATE
% % for i=1 : length(pics)
%     i=1;
%     imgName = char(pics(i));
%     img = readImage(imgName);
%     %newImage = rotateImage(img, 30, -5, 40);
%     [x,y] = size(img);
%     newImage = rotateImage(img, 90, x/2, y/2);
% %      %newImage = rotateImage(img, 145, 256, 256, [512,521]);
% % %    showImage(img);
% %     showImage(newImage);
% % end

% %%SCALE
% % for i=1 : length(pics)
%     i=1;
%     imgName = char(pics(i));
%     img = readImage(imgName);
%     [x,y] = size(img);
%     newImage = scaleImage(img, 1.5, x/2, y/2);
%     showImage(img);
%     showImage(newImage);
% % end

% % %%%AFFINE
%     img = readImage('seagray.tif');
% %     showImage(img);
% %     sourceCoors = ginput(4)';
% %     targetCoors = ginput(4)';
%     sourceCoors = [98 234 209 74; 22 161 230 85]; %for pic seagray
%     targetCoors = [4 174 180 10; 3 5 79 77];  
%     targetCoors = [10 290 290 10; 10 10 232 232];   
%     targetCoors = [30 286 286 30; 20 20 226 226];   
%     newimg = affineImage(img, sourceCoors, targetCoors);
% %     showImage(img);
% %     showImage(newimg);

% %%% INTERPOLATE
% %     img = [1 2 3; 4 5 6 ; 7 8 9];
% %     sourceCoors = [ 0.3, 1.6, 1.7, 2.2; 0.4, 1.4, 2.3, 1.5 ];%capture 3X3 first
%     img = readImage('im2.tif');
%     newSize = size(img);
%     r = newSize(1);
%     c = newSize(2);
%     [X,Y] = meshgrid(1:c, 1:r); 
%     sourceCoors = [X(:) Y(:)]';
%     newimg = interpolate(img, sourceCoors);
%     newimg = reshape(newimg, [r, c]);%getting a vector in the size 1X(RxC) -> reshape to image  
%     showImage(img);
%     showImage(newimg);
%     temp = img - newimg;
%     clear;
%     close all;
%     clc;



%Q1 meshgrid - in pdf its mesh(1:c, 1:r). in Hw its mesh(1:x, 1:y)
%Q2 IMPORTANT - how do i get r and c in interpolate ??? is the size(img) good ?
%Q3 notice the check of out of bounds in INTERPOLATE its backwards

%TODO
% 
