%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function f = cleanHouseFront (g)
    % Ftag = (H*x G) / (H* x H + lambda)) 
    g = uint8(g);
    h = zeros(size(g));
    h(1:10,1)=1/10;
    G = fft2(g);
    H = fft2(h);
    Hconj = conj(H);
    lambda = 0.003;
    Ftag = (Hconj.* G) ./ (Hconj .* H + lambda) ;
    f = uint8(real(ifft2(Ftag)));%reverse fft and cast to real uint8
    
    %some guasian noise on the right side - cleanMean
    cleanRightSide = cleanImageMean(f(:,128:256), [1,1], 3);
    
%     uncomment to see both images
%     f2 = f;
%     f2(:,128:256) = cleanRightSide;
%     figure, imshow([g, ones(256,5)*255, f,ones(256,5)*255, f2 ]);
    f(:,128:256) = cleanRightSide;
    f = uint8(f);
end

