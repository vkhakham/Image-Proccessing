%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanDiningRoom (noisyImg)
    noisyImg = imread('diningroom.tif');
    noisyImg = uint8(noisyImg);
    %cleanImg = uint8(noisyImg.*6);
    cleanImg = double(noisyImg);
	hist = histImage(cleanImg);
	%after casing the histograme most of the color are under 50
	highestColor = 50;%the highest significant Color
	ind = (cleanImg > highestColor);%save those for later
	factor = 254/highestColor;%255 reservd to to higher than 50
	cleanImg = floor(cleanImg*factor);
	cleanImg(ind) = 255;
	cleanImg = uint8(cleanImg);
	
% diffrentGrayValues = length(unique(noisyImg(:)));
% equalizedIm = histeq(noisyImg,diffrentGrayValues);   
% imshow([noisyImg, equalizedIm, newImg]); 

end
