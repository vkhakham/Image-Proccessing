%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanFaces (noisyImg)
    noisyImg = uint8(noisyImg);
    
    %get each copy of the face pic coordinates
    rightSourceCoors = [378 499 387 265; 2 128 231 105];
    leftSourceCoors = [61 208 174 27; 2 25 215 193];
    downSourceCoors = [128 383 383 128; 257 257 512 512];
    
    %map to a full image 
    targetCoors = [1 512 512 1; 1 1 512 512];
    
    %use affineImage to create our image
    newImgLeft = affineImage(noisyImg,leftSourceCoors, targetCoors);
    newImgRight = affineImage(noisyImg,rightSourceCoors, targetCoors);
    newImgDown = affineImage(noisyImg,downSourceCoors, targetCoors);

    %insert to a frame array
    imArray(:,:,1) = newImgLeft;
    imArray(:,:,2) = newImgRight;
    imArray(:,:,3) = newImgDown;
    
    cleanFrame = cleanImageMedian_multi(imArray);
    
    %place back the clean frame for all 3 faces
    temp1 = affineImage(cleanFrame,targetCoors,leftSourceCoors);
    temp2 = affineImage(cleanFrame,targetCoors,rightSourceCoors);
    temp3 = affineImage(cleanFrame,targetCoors,downSourceCoors);
    
    %sum it to 1 im. background is black and frames are not touching
    cleanImg = temp1 + temp2 + temp3;
    cleanImg = uint8(cleanImg);

end

