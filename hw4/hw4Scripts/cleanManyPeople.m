%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanManyPeople (noisyImg)
    noisyImg = double(noisyImg);
    %gamma factor 1/4 
    %a =60 
    cleanImg = noisyImg.^(1/4) * 60 ;
    cleanImg = uint8(cleanImg);
end
