%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
% script that answers question 5
clear;
close all;
clc;



%NOTICE we put clear & close all & clc. place breakpoint on each if
%statment to see result of current question.
%to cancel those commands, change clean to false.
cleanEnv = true;


%%Question 5 - a custom script - explanations in the PDF file.

%%Question 5A
%%A1. need to show that rotating an img, then rotating back damage the img:
imgA = readImage('im2.tif');
showImage(imgA);
[x,y] = size(imgA);
rotatedImgA = rotateImage(imgA, 90, x/2 , y/2);%rotate around middle pixel
% showImage(rotatedImgA); %uncomment to see first rotation
rotatedImgAback = rotateImage(rotatedImgA, -90, x/2 , y/2);%rotate back around middle pixel
showImage(rotatedImgAback);
if(cleanEnv)
    clear;
    close all;
    clc;
    cleanEnv = true;
end

%%A2. need to show that scaling an img, then scaling back damage the img:
imgA2 = readImage('lena.tif');
showImage(imgA2);
[x,y] = size(imgA2);
scaledImgA = scaleImage(imgA2, 0.5, 1 , 1, [x/2,y/2]);%scale in factor 1/2 the start of the axis.newsize 1/2.
% showImage(scaledImgA);%uncomment to see first scale
scaledImgAback = scaleImage(scaledImgA, 2, 1 , 1, [x,y]);%scale in factor 2 the start of the axis.newsize *2.
showImage(scaledImgAback);
if(cleanEnv)
    clear;
    close all;
    clc;
    cleanEnv = true;
end


%%Question 5B
%%B. Does rotating then scaling an image produce the same result as first scaling and
%%   then rotating with same parameters?
imgB = readImage('lena.tif');
showImage(imgB);
[x,y] = size(imgB);
rotateThenScaleImgB = rotateImage(imgB, 90, x/2 +0.5, y/2+0.5);%no middle pixel. so put the rotate in the middle. otherwise, get a black line
% showImage(rotateThenScaleImgB);%uncomment to see middle stage
rotateThenScaleImgB = scaleImage(rotateThenScaleImgB, 2, 1 , 1);
showImage(rotateThenScaleImgB);
scaleThenRotateImgB = scaleImage(imgB, 2, 1 , 1);
% showImage(scaleThenRotateImgB);%uncomment to see middle stage
scaleThenRotateImgB = rotateImage(scaleThenRotateImgB, 90, x/2+0.5 , y/2+0.5);
showImage(scaleThenRotateImgB);
if(cleanEnv)
    clear;
    close all;
    clc;
    cleanEnv = true;
end

%%Question 5C
%%C. Show an example where an affine transformation does not suffice to map points (a 
%%   Projective transformation is needed).
imgC = readImage('railroad.tif');
[x,y] = size(imgC);
imgCsmaller = scaleImage(imgC, 0.25, 1, 1, [x/4, y/4]);%the pic is to big. shrink to 1/4
showImage(imgCsmaller);
% sourceCoors = ginput(4)'; 
sourceCoors = [10 123 139 244; 252 151 151 248 ];
targetCoors = [ 1,1,256,256 ; 256,1,1,256];
% save('Q5C_sourceAndTargetCoords.mat', 'sourceCoors', 'targetCoors');
newimgC = affineImage(imgCsmaller, sourceCoors, targetCoors);
showImage(newimgC);
if(cleanEnv)
    clear;
    close all;
    clc;
    cleanEnv = true;
end

%%Question 5D
%% Show an example image where the affine transform maps the SourceCoors to
%% the TargetCoors exactly. Use at least 4 point pairs.  
%% Provide the BODEK with an effective way to show this example, i.e. to prove
%% that indeed the the source is mapped to the target.
%%D1
imgD = readImage('lena.tif');
showImage(imgD);
sourceCoors = [1 256 256 1; 1 1 256 256];
targetCoors = [1 256 256 1; 1 1 256 256]; 
newimgD = affineImage(imgD, sourceCoors, targetCoors);
showImage(newimgD);
display(isequal(imgD,newimgD));
if(cleanEnv)
    clear;
    close all;
    clc;
    cleanEnv = true;
end

% % D2
imgD = readImage('seagray.tif');
showImage(imgD);
sourceCoors = [98 234 209 74; 22 161 230 85]; %for pic seagray   
targetCoors = [10 170 170 10; 10 10 70 70]; 
newimgD = affineImage(imgD, sourceCoors, targetCoors);
showImage(newimgD);
targetCoors2 = [30 286 286 30; 20 20 226 226];
newimgD = affineImage(imgD, sourceCoors, targetCoors2);
showImage(newimgD);
if(cleanEnv)
    clear;
    close all;
    clc;
    cleanEnv = true;
end

%%D3
imgD = readImage('lena.tif');
showImage(imgD);
[x,y] = size(imgD);
sourceCoors = [1   256 256 1; 1   1 256 256]; %for pic in the size 256^2   
targetCoors = [512 512 1   1; 1 512 512 1]; 
newimgD = affineImage(imgD, sourceCoors, targetCoors, [x*2,y*2]);
showImage(newimgD);
if(cleanEnv)
    clear;
    close all;
    clc;
    cleanEnv = true;
end

