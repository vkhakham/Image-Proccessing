%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanDiningRoom (noisyImg)
    noisyImg = uint8(noisyImg);
    
    cleanImg = double(noisyImg);
    %%after casing the histograme most of the values move from 1 to 52
    %%uncomment to see the hist
	%hist = histImage(cleanImg);
    %figure
    %plot(0:255,hist);xlabel('gray level(+1)');ylabel('#pixels');
	%after casing the histograme most of the color are under 50
	threshold = 51;%the highest significant Color
	higherThanThreshold = (cleanImg > threshold);%save all above highestColor to change to 255
	factor = 254/threshold;%255 reservd to to higher than highestColor
	cleanImg = floor(cleanImg*factor);
	cleanImg(higherThanThreshold) = 255;
    %%uncomment to see the new hist
	%newHist = histImage(cleanImg);
    %figure
    %plot(0:255,newHist);xlabel('gray level(+1)');ylabel('#pixels');
	cleanImg = uint8(cleanImg);
	

end
