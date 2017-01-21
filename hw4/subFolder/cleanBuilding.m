%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanBuilding (noisyImg)
    
    noisyImg = double(noisyImg);
    rad = 1;
    spatialSTD= 40;
    rangeSTD =25;


    % Ws := spatial mask
    [X,Y] = meshgrid(-rad:rad,-rad:rad);
    Ws = exp( - (X.^2 + Y.^2) / (2*spatialSTD^2) );%formula from class


    % doing range calc for each pixel.
    % need loop cuase of the edges pixels
    [r,c] = size(noisyImg);
    cleanImg = zeros(r,c);
    for i=1 : r  
        for j=1 : c
            up = i - rad;
            if(up < 1)
                up = 1;
            end
                down = i + rad;
            if(down > r)
                down = r;
            end
                left = j - rad;
            if(left < 1)
                left = 1;
            end
                right = j + rad;
            if(right > c)
                right = c;
            end

        %sub image of this pixel with radius = 'rad'
        I = noisyImg(up:down,left:right);

        % Wp := range kernel for this pixel
        Wp = exp(-(I-noisyImg(i,j)).^2/(2*rangeSTD^2));

        % WsMultWp - had to adjust spatial kernel for the edges pixels
        WsMultWpMultI = (Wp.*Ws((up:down)-i+rad+1,(left:right)-j+rad+1)).*I;
        WsMultWp = (Wp.*Ws((up:down)-i+rad+1,(left:right)-j+rad+1));

        %formula from class
        filteredValue = sum(WsMultWpMultI(:))/sum(WsMultWp(:));
        cleanImg(i,j) = filteredValue;
        end
    end
    cleanImg = uint8(cleanImg);
end

