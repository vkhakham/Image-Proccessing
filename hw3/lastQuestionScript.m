%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% last question script

clear;
close all;
clc;
lenaIm = readImage('lena.tif');


% % a)  
% % *Apply S&P noise to an image and show the results of denoising it 
% %     using averaging and median filtering. 
% % *Display the resulting images.
% % *Print the PSNR between the original and the noised image.
% % *Display the PSNR between the original and denoised image in each of the 2 
% %     methods. (Either print PSNR or display it in the figure window).

im = lenaIm;
showImage(im);
imSP = addSPnoise(im,0.3);
showImage(imSP);
maskRad = [1,1];
cleanImMedian = cleanImageMedian(imSP,maskRad);
cleanImMean   = cleanImageMean  (imSP,maskRad,3);
showImage(cleanImMedian);
showImage(cleanImMean);


disp(['a) psnr: original VS saltAndPepper =',num2str(calcPSNR(im, imSP))]);
disp(['a) psnr: original VS clean median  =',num2str(calcPSNR(im, cleanImMedian))]);
disp(['a) psnr: original VS clean mean    =',num2str(calcPSNR(im, cleanImMean))]);

pause;
clear im imSP cleanImMedian cleanImMean maskRad;
close all;

% % b)   
% % *Apply Gaussian noise to an image and show the results of denoising it
% %     using averaging and median filtering. 
% % *Display the resulting images.
% % *Print the PSNR between the original and the noised image.
% % *Display the PSNR between the original and denoised image in each of the 2 
% %     methods. (Either print PSNR or display it in the figure window).


im = lenaIm;
showImage(im);
imGaus = addGaussianNoise(im,30);
showImage(imGaus);
maskRad = [3,3];
cleanImMedian = cleanImageMedian(imGaus,maskRad);
cleanImMean   = cleanImageMean  (imGaus,maskRad,2);
showImage(cleanImMedian);
showImage(cleanImMean);

disp(['b) psnr: original VS Guas blur    =',num2str(calcPSNR(im, imGaus))]);
disp(['b) psnr: original VS clean median =',num2str(calcPSNR(im, cleanImMedian))]);
disp(['b) psnr: original VS clean mean   =',num2str(calcPSNR(im, cleanImMean))]);

pause;
clear im imGaus cleanImMedian cleanImMean maskRad;
close all;

% % c)  
% % *Print on screen your conclusion as to which type of filtering works best 
% %     for each type of noise. 
% % *Which gives the largest signal to noise? Which gives the most pleasing 
% %     visual result in your opinion.


disp('S&P noise: ');
disp('	*median filter is better than mean filter');
disp('	*median gives larger PSNR, therefor closer to original pic');
disp('	*median gives the best visual result as we can see');
disp('Gaus noise: ');
disp('	*mean filter is better than median filter');
disp('	*mean gives larger PSNR, therefor closer to original pic');
disp('	*mean gives the best visual result as we can see');
pause;
clear im imGaus cleanImMedian cleanImMean maskRad;
close all;

% % d) 
% % *Plot the PSNR values between original and median-denoised image as a 
% %     function of the size of median neighborhood – maskRadius. Use a heavily
% %     noised image and use the noise for which median filtering works best.
% % *Use matlab function plot. Use matlab functions title, xlabel and ylabel to
% %     display axis description.
% % *Print your explanation for the behavior of the graph.

im = lenaIm;
showImage(im);
imSP = addSPnoise(im,0.4);
showImage(imSP);
PSNRarray = zeros(10,1);
for i=1 : 10
    cleanIm = cleanImageMedian(imSP,[i,i]);
%    showImage(cleanIm);
    PSNRarray(i) = calcPSNR(cleanIm,im); 
end

figure
plot(1:10,PSNRarray);
title('d)PSNR values between original and median-denoised image');
xlabel('maskSTD');
ylabel('PNSR');
disp('We see a spike in neighberhood size of 2 since since the image is heavly');
disp('noised so the close neighbehood caused some pixels to choose');
disp('the wrong pixel and a higher neighberhood of 2 made those errors');
disp('less likely, after neighberhood size of 2 we saw a drop of PNSR since each pixel');
disp(' got heavly influence by further away pixels which are not as relevant.');

pause;
clear im imSP i PSNRarray cleanIm;
close all;

% % e) 
% % *Plot the PSNR values between original and mean-denoised image as a 
% %     function of the maskSTD. Use a heavily noised image and use the noise
% %     for which mean filtering works best. Use a relatively large maskRadius
% %     to accommodate the different maskSTD.
% % *Use matlab function plot. Use matlab functions title, xlabel and ylabel to
% %     display axis description.
% % *Print your explanation for the behavior of the graph.

im = lenaIm;
showImage(im);
imG = addGaussianNoise(im,60);
showImage(imG); 
PSNRarray = zeros(10,1);
for i=1 : 10
    cleanIm = cleanImageMean(imG,[3,3],i);
%     showImage(cleanIm);
    PSNRarray(i) = calcPSNR(cleanIm,im); 
end

figure
plot(1:10,PSNRarray);
title('e)PSNR values between original and mean-denoised image');
xlabel('maskSTD');
ylabel('PNSR');
disp('The higher the STD value the more importance the mean image cleans gives ');
disp('to its neighbours, we see a spike in STD value of 2 since we would like ');
disp('to give the neighbours some more importance since we cant rely only on');
disp('the closest neighbours, this advatage drops off when we raise the STD value ');
disp('and give importance to further away neighbours. ');

pause;
clear im imG i cleanIm PSNRarray;
close all;

% % f)   
% % *Create an image array from an image by creating several Gaussian-noised 
% %     versions of it.
% % *Create a denoised image by filtering along corresponding pixels using mean
% %     and using median.
% % *Display resulting denoised images and their PSNR.
% % *Which filtering approach works best for Gaussian noise? 
% %     Print your answer on screen.

im = lenaIm;
showImage(im);
for i=1 : 10
    gaussianNoiseImg = addGaussianNoise(im,60);
    imArray(:,:,i) = gaussianNoiseImg;
%     showImage(gaussianNoiseImg);
end
cleanImgmean = cleanImageMean_multi(imArray);
showImage(cleanImgmean);
disp(['f) psnr: original VS cleanImageMean_multi=',num2str(calcPSNR(im, cleanImgmean))]);
cleanImgmedian = cleanImageMedian_multi(imArray);
showImage(cleanImgmedian);
disp(['f) psnr: original VS cleanImageMedian_multi=',num2str(calcPSNR(im, cleanImgmedian))]);

pause;
clear im cleanImgmedian cleanImgmean imArray i gaussianNoiseImg;
close all;

% % g)   
% % *Create an image array from an image by creating several S&P-noised 
% %     versions of it.
% % *Create a denoised image by filtering along corresponding pixels using mean
% %     and using median.
% % *Display resulting denoised images and their PSNR.
% % *Which filtering approach works best for Gaussian noise?
% %     Print your answer on screen.



im = lenaIm;
showImage(im);
for i=1 : 10
    saltAndPepperNoiseImg = addSPnoise(im,0.3);
    imArray(:,:,i) = saltAndPepperNoiseImg;
%     showImage(gaussianNoiseImg);
end
cleanImgmean = cleanImageMean_multi(imArray);
showImage(cleanImgmean);
disp(['f) psnr: original VS cleanImageMean_multi=',num2str(calcPSNR(im, cleanImgmean))]);
cleanImgmedian = cleanImageMedian_multi(imArray);
showImage(cleanImgmedian);
disp(['f) psnr: original VS cleanImageMedian_multi=',num2str(calcPSNR(im, cleanImgmedian))]);

pause;
clear im cleanImgmedian cleanImgmean imArray i saltAndPepperNoiseImg;
close all;

% % h)  
% % *Plot the PSNR values between original and denoised image as a function of
% %     the number of frames in the image array. Use S&P noise and use the 
% %     denoising methods which you found to work best for this noise type.
% % *Use matlab function plot. Use matlab functions title, xlabel and ylabel to
% %     display axis description.
% % *Print your explanation for the behavior of the graph.


im = lenaIm;
showImage(im);
%making j imArrays. the first, multiImArray(:,:,:,1) will be an imArray with 1
%frame, the second,multiImArray(:,:,:,2) 2 frames and so on
for j=1 : 10
    for i=1 : j
        saltAndPepperNoiseImg = addSPnoise(im,0.3);
        multiImArray(:,:,i,j) = saltAndPepperNoiseImg;
    %     showImage(saltAndPepperNoiseImg);
    end 
end

PSNRarray = zeros(10,1);
for i=1 : 10
    %1:i - selecting from the array the size of the i'th iteration frames.
    imArray = multiImArray(:,:,1:i,i);
    cleanIm = cleanImageMedian_multi(imArray);
%     showImage(cleanIm);
    PSNRarray(i) = calcPSNR(cleanIm,im); 
end

figure
plot(1:10,PSNRarray);
title('h)PSNR values between original and median-denoised image');
xlabel('frames');
ylabel('PNSR');

disp('The higher number of frames we have to work with the more likely a pixel will regain');
disp('its original value, since noise changes pixel values to 0 or 255 evenely, the original');
disp('the original pixel value will be the median, the PNSR value will be closer to the original');
disp('the more frames we have.');

pause;
clear im imArray j i saltAndPepperNoiseImg multiImArray PSNRarray cleanIm;
close all;
 
% % i)  
% % *Plot the PSNR values between original and denoised image as a function of 
% %     the number of frames in the image array. Use Gaussian noise and use the
% %     denoising methods which you found to work best for this noise type.
% % *Use matlab function plot. Use matlab functions title, xlabel and ylabel to
% %     display axis description.
% % *Print your explanation for the behavior of the graph.

im = lenaIm;
showImage(im);
%making j imArrays. the first, multiImArray(:,:,:,1) will be an imArray with 1
%frame, the second,multiImArray(:,:,:,2) 2 frames and so on
for j=1 : 10
    for i=1 : j
    gaussianNoiseImg = addGaussianNoise(im,80);
    multiImArray(:,:,i,j) = gaussianNoiseImg;
%     showImage(gaussianNoiseImg);
    end 
end

PSNRarray = zeros(10,1);
for i=1 : 10
    %1:i - selecting from the array the size of the i'th iteration frames.
    imArray = multiImArray(:,:,1:i,i);
    cleanIm = cleanImageMean_multi(imArray);
%     showImage(cleanIm);
    PSNRarray(i) = calcPSNR(cleanIm,im); 
end

figure
plot(1:10,PSNRarray);
title('i)PSNR values between original and mean-denoised image');
xlabel('frames');
ylabel('PNSR');

disp('The higher number of frames we have to work with the more likely a pixel will regain');
disp('its original value, since noise changes pixel values to 0 or 255 evenely, the original');
disp('the original pixel value will be the median, the PNSR value will be closer to the original');
disp('the more frames we have.');

pause;
clear im imArray j i gaussianNoiseImg multiImArray PSNRarray cleanIm;
close all;

% % j) 
% % *What happens when you sharpen an image that has S&P noise? 

im = lenaIm;
showImage(im);
saltAndPepperNoiseImg = addSPnoise(im,0.05);
showImage(saltAndPepperNoiseImg);
sharpenImg = sharpen(saltAndPepperNoiseImg,[1,1],5,3);
showImage(sharpenImg);
disp('the SP noise gets an aura in opposite color.');
disp('the black noise gets white aura that circles around it in the size of maskRad');
disp('the white noise gets black aura that circles around it in the size of maskRad');

pause;
clear;
close all;
clc;






















