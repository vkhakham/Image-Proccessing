%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% function sourceGrayVals = interpolate(img,sourceCoors)
% This routine calculates the gray values for each coordinate by interpolating the values in img.
% 
% Input:  
% img - a grayscale image in the range [0..255]
% sourceCoors – a 2XN array of coordinates [x,y]' in the source image (img)
% 
% Output:    
% sourceGrayVals – a 1XN vector of gray values.
% 
% Method:Performs Bilinear interpolation to evaluate the gray value of the sourceCoors
% within image img. Uses Matrix operations only when computing interpolation.
% Pixels that have no source (outside the image) should assigned gray value 0 
function sourceGrayVals = interpolate(img,sourceCoors) 
    img = double(img);
    [r,c] = size(img);
   
    Xs = sourceCoors(1,:);
    Ys = sourceCoors(2,:);

    %alpha correction. we think if a pixel coords are 20,256.0001(out of bound)
    %shoudn't be color 0, but should be the color of pixel 20,256
    alpha = 0.51;%we chose the alpha. basicly, taking out or range pixels in alpha back in the picture
    Xs(Xs>1-alpha & Xs<1) = 1;
    Xs(Xs>c & Xs<c+alpha) = c;
    
    Ys(Ys>1-alpha & Ys<1) = 1;
    Ys(Ys>r & Ys<r+alpha) = r;
        
    %out of range fix x
    indx = find(Xs<1 | Xs>c);
    Xs(indx) = 1;
    Ys(indx) = 1;
    
    %out of range fix y
    indy = find(Ys<1 | Ys>r);
    Xs(indy) = 1;
    Ys(indy) = 1;
    clear sourceCoors r c;%no need
    
    %preparing neighbours vectors
    %could have spared the next 4 vars but saved time instead of writing
    %twice each var below (leading to floor of a giant vector calculated twice
    floorX = floor(Xs);
    floorY = floor(Ys);
    ceilX = ceil(Xs);
    ceilY = ceil(Ys);
    
    %NW\NE\SW\SE holds coordinates of that direction
    %will explain the first, the rest are the same:
    %NW is top left-> Y grows down so take floor. X grows to the right so
    %take floor.
    NW = [floorY(:), floorX(:)];
    NE = [floorY(:), ceilX(:)]; 
    SW = [ceilY(:) , floorX(:)];
    SE = [ceilY(:) , ceilX(:)]; 
    
    %all DeltaX is the distance from Xs to his floor.
    %since Y grows down(ceil Y > Ys) we need the distance from up to down
    deltaX = Xs - floorX;
    deltaY = ceilY - Ys;
    clear Xs Ys floorY floorX ceilY ceilX;%no need
    
    %get indexes in img of the colors of direction coordinates
    %than overwrite the coordinates with colors vector
    NWind   = sub2ind(size(img), NW(:,1), NW(:,2));
    NW = img(NWind);
    
    NEind   = sub2ind(size(img), NE(:,1), NE(:,2));
    NE = img(NEind);
    
    SWind   = sub2ind(size(img), SW(:,1), SW(:,2));
    SW = img(SWind);
    
    SEind   = sub2ind(size(img), SE(:,1), SE(:,2));
    SE = img(SEind);
    clear NWind NEind SWind SEind
    
    %calculate linear inter' to SE and SW ->S (with deltaX)
    %and than do linear inter' to the NE and NW ->N(with deltaX)
    %finish with linear inter' to N and S -> V(with deltaY) 
    S = SE .* deltaX' + SW .* (1 - deltaX') ;
    N = NE .* deltaX' + NW .* (1 - deltaX') ;
    V = N .* deltaY' + S .* (1 - deltaY') ;
    clear NW NE SW SE img S N deltaX deltaY
    sourceGrayVals = V;
    
    %out of range gets color black. indx and indy were calculated at the begining
    sourceGrayVals(indx) = 0;
    sourceGrayVals(indy) = 0;
    sourceGrayVals = uint8(sourceGrayVals);
    sourceGrayVals = sourceGrayVals';
end
