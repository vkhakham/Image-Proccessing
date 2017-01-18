%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanImg = cleanHouseFront (noisyImg)
    noisyImg = imread('housefront.tif');
    
    
    
    noisyImgF = fft2(noisyImg);
    %Get the size of the noisy image
    [rows_image ,columns_image] = size(noisyImg);
    mask = zeros([10,1]);
    %Sets the mask
    mask(:) = 1/10;
    %Get the FFT of the mask
    maskF = fft2(mask, rows_image, columns_image);
    %Divides each pixel in the frequency domain
    cleanImg = noisyImgF./(maskF+0.001);
    %Do invers FFT to return to clean image
    cleanImg = ifft2(cleanImg);
    %Casting to unsigned int 8 bits
    cleanImg = uint8(real(cleanImg));
    
    
    
    imshow([noisyImg, ones(256,5)*255, cleanImg]);
end
