%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanHouseFront (noisyImg)
    imF = fft2(noisyImg);
    %Get the size of the noisy image
    [rows_image ,columns_image] = size(noisyImg);
    mask = zeros([10,1]);
    %Sets the mask
    mask(:) = 1/10;
    %Get the FFT of the mask
    maskF = fft2(mask, rows_image, columns_image);
    %Divides each pixel in the frequency domain
    cleanImg = imF./(maskF+0.001);
    %Do invers FFT to return to clean image
    cleanImg = ifft2(cleanImg);
    %Casting to unsigned int 8 bits
    cleanImg = uint8(real(cleanImg));
end

function cleanImg = doIt (g)
    g = double(g);   
%     F = fft2(f);
    
    mask = zeros( size(g) );
    mask( 1, 1 )  = 0.5;
    mask( 1, 20 ) = 0.5;
    
    maskF = fft2( mask );
    G = fft2(g); 
    cleanImg = abs( ifft2( G ./(maskF+ 0.001) ) );
    
%     cleanImg = uint8(real(ifft2(F)));
    [r,~] = size(g);
    sep = ones(r,5)*255;
    g = uint8(g);
    cleanImg = uint8(cleanImg);
    figure, imshow([g,sep  , cleanImg]);
end

function enhanced = doIt2 (im)
    F = fft2( im );
    sizeIm = size(im);
    % radius
    radius = 5;
    % indexes from [0 0] to [n-1 n-1]
    [x, y ] = meshgrid(1:(sizeIm(1)), 1:(sizeIm(2)));
    % calculating distance to local frequency coordinates
    D1 = floor( sqrt( (256-y).^2 + (1-x).^2));
    D2 = floor( sqrt( (1-y).^2 + (256-x).^2));

    % zeroing circle around the points we want to remove  
    F(D1<=radius)=0;
    F(D2<=radius)=0;

    [r,~] = size(im);
    sep = ones(r,5)*255;
    enhanced = abs( ifft2( F ) );
    enhanced = uint8(enhanced);
    figure, imshow([im ,sep , enhanced]);
end

% function clnIm = doIt3 (NoiseIm)
%     imF = fft2(NoiseIm);
%     %Get the size of the noisy image
%     [rows_image ,columns_image] = size(NoiseIm);
%     %Zeros matrix with image size
%     %mask = zeros(size(NoiseIm));
%     mask = zeros([10,1]);
%     %Sets the mask
%     mask(:) = 1/10;
%     %Get the FFT of the mask
%     maskF = fft2(mask, rows_image, columns_image);
%     %Divides each pixel in the frequency domain
%     clnIm = imF./(maskF+0.001);
%     %Do invers FFT to return to clean image
%     clnIm = ifft2(clnIm);
%     %Casting to unsigned int 8 bits
%     clnIm = uint8(clnIm);
%     [r,~] = size(NoiseIm);
%     sep = ones(r,5)*255;
%     figure, imshow([NoiseIm ,sep , clnIm]);   
%     close all;
% end
% 
% function clnIm = doIt4 (NoiseIm)
%     NoiseIm = double(NoiseIm);
%     imF = fft2(NoiseIm);
%     [row, col] = size(NoiseIm);
%     %Zeros matrix with image size
% %     mask = zeros(size(NoiseIm));
%     mask = zeros([1,10]);
%     %Sets the mask
%     mask(:) = 1/10;
%     %Get the FFT of the mask
%     maskF = fft2(mask, row, col);
%     %Divides each pixel in the frequency domain
%     HHtlabda = conj(maskF)*maskF + 0.01;
%     clnIm = ((conj(maskF)*imF)./(HHtlabda));
%     %Do invers FFT to return to clean image
% %     clnIm = ifft2(clnIm);
%     %Casting to unsigned int 8 bits
% %     clnIm = uint8(clnIm);
%     [r,~] = size(NoiseIm);
%     sep = ones(r,5)*255;
%     clnIm = uint8(real(ifft2(clnIm)));%reverse fft and cast to real uint8
%     figure, imshow([NoiseIm ,sep , clnIm]);   
%     close all;
%     
%     [rows_image ,columns_image] = size(NoiseIm);
%     leftHalf = NoiseIm(:, 1:columns_image/2);
%     rightHalf = NoiseIm(:, columns_image/2:end);
%     rightHalf = cleanImageMean(rightHalf, [2,2], 5);
%     leftImF = fft2(leftHalf);
%     %Zeros matrix with image size
%     mask = zeros(rows_image,columns_image/2);
%     %Sets the mask
%     mask(1:10) = 1/10;
%     %Get the FFT of the mask
%     maskF = fft2(mask);
%     %Divides each pixel in the frequency domain
%     clnLeftIm = leftImF./(maskF+0.001);
%     %Do invers FFT to return to clean image
%     clnLeftIm = ifft2(clnLeftIm);
%     %Casting to unsigned int 8 bits
%     clnLeftIm = uint8(clnLeftIm);
%     clnIm = horzcat(clnLeftIm,rightHalf);
% %     [r,~] = size(NoiseIm);
%     sep = ones(rows_image,5)*255;
%     figure, imshow([NoiseIm ,sep , clnIm]);   
%     close all;
% end




%     imshow([noisyImg, newImgLeft,newImgRight ,newImgDown, cleanImg, temp]);%debugging   