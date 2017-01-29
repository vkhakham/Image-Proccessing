%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function printPyr(I)
    m = size(I{1}, 1);
    newI = I{1};
    for i = 2 : numel(I)
        [q,p,~] = size(I{i});
        I{i} = cat(1,repmat(zeros(1 , p),[m - q , 1]),I{i});
        newI = cat(2,newI,I{i});
    end
    imshow(newI)
end