%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanManyPeople (noisyImg)
    noisyImg = double(noisyImg);
    %gamma factor 1/4 
    %a =60 
    
% % %     uncomment to see the reason why we chose those parameters
%     cleanImg = noisyImg.^(1/4);
%     hist2 = histImage(cleanImg);
%     figure
%     plot(0:255,hist2);xlabel('gray level(+1)');ylabel('#pixels');
%     
%     cleanImg = noisyImg*60;
%     hist3 = histImage(cleanImg);
%     figure
%     plot(0:255,hist3);xlabel('gray level(+1)');ylabel('#pixels');
    
    cleanImg = noisyImg.^(1/4) * 60 ;
    cleanImg = uint8(cleanImg);
end
