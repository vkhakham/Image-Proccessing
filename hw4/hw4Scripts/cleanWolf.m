%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
function cleanIm = cleanWolf (f)
    f = double(f);    
    F = fft2(f);

    
% %     uncomment to see the fft yourself    
%     D = log(1+abs(F));%locating peaks using log to make them larger  
%     D = fftshift(D);%shifting to center
%     imagesc(D);%display to hand pick the peaks
%     colormap(gray)%see gray fft
%     toZeroCoor = ginput(4);
    
    
    
%     found 4 peaks using ginput
%     1st peak (148,98)
%     2st peak (110,160)
%     3st peak (126,118)
%     4st peak (132,140)
    
    F = fftshift(F); %shifting without log()
    
%     changing peaks to 0
    F(148,98) = 0;
    F(110,160) = 0;
    F(126,118) = 0;
    F(132,140) = 0;
    
    F = ifftshift(F);%shifting back
    
    cleanIm = uint8(real(ifft2(F)));%reverse fft and cast to real uint8
end
