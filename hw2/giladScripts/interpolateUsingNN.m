%temp function for exmaple
function sourceGrayVals = interpolateUsingNN(img,sourceCoors)
    [r,c] = size(img);
    
    %calc nearest neighbour interp
    Xs = round(sourceCoors(1,:));
    Ys = round(sourceCoors(2,:));
    
    %out of range fix
    indx = find(Xs<1 | Xs>c);
    Xs(indx) = 1;
    Ys(indx) = 1;
    
    indy = find(Ys<1 | Ys>r);
    Xs(indy) = 1;
    Ys(indy) = 1;
    
    %calc new img
    sourceGrayVals = img( (Xs-1).*r + Ys);
    sourceGrayVals(indx) = 0;
    sourceGrayVals(indy) = 0;
    
end