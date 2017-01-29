%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function printPyr(C)
    img =  C{1};
    [r,c] = size(img);
    pyramid = [img zeros(r,floor(c/2)+2)];
    lastRow = 1;
    for i = 2 : length(C)
        img = C{i};
        [ri,ci] = size(img);
        pyramid(lastRow:lastRow+ri,c+1+1:c+1+1+ci) = 150;
        lastRow = lastRow + ri +1+ 1;
    end
    
    
    imshow(pyramid);
end