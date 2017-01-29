%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% 4)      function    US = upSample(I)
% (file name is accordingly upSample.m ) 
% This routine creates an upsampled version of an image i.e. a stretched version of the input image. 
% The routine is used to create a Laplacian Pyramid image at a given level.
% 
% Input:      I = a grayscale image (values in [0,255]) 
% 
% Output:   US = a grayscale image (values in [0,255]) double the width and height of I.
% 
% Method:  The input image is stretched in width and height. Several possible methods to do this: 
%            Interleave I with zeros and then smooth/interpolate the missing values (say with 
%            a simple blur mask e.g. the mask used in downSample). 
%            Or pad the FFT2 of the image with zeros and then IFFT2.
function US = upSample(I)
    f = double(I);    
    F = fft2(f);
    F = fftshift(F);
    %      pad with zeros
    F = padarray(F,size(F)/2);
%     D = log(1+abs(F));%locating peaks using log to make them larger  
%     D = fftshift(D);%shifting to center
%     imagesc(D);%display to hand pick the peaks
%     colormap(gray)%see gray fft
    F = ifftshift(F);
    F = F*4; % we increased pixel count times 4, we should increase the avg also.
    US = uint8(real(ifft2(F))); %reverse fft and cast to real uint8
%     showImage(US);
    
    
    