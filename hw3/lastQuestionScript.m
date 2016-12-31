%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
%
% last question script

clear;
close all;
clc;
lenaIm     = readImage('lena.tif');
sciccorsIm = readImage('im2.tif');%sciccors
picachuIm  = readImage('im3.tif');%picachu
raceCarIm = readImage('racecar.tif');
lightHouseIm = readImage('lighthouse.tif');


% a)  
% *Apply S&P noise to an image and show the results of denoising it 
%     using averaging and median filtering. 
% *Display the resulting images.
% *Print the PSNR between the original and the noised image.
% *Display the PSNR between the original and denoised image in each of the 2 
%     methods. (Either print PSNR or display it in the figure window).

%TODO check noise factor
%TODO try diffrent rad
% im = lenaIm;
% showImage(im);
% imSP = addSPnoise(im,0.1);
% showImage(imSP);
% maskRad = [1,1];
% cleanImMedian = cleanImageMedian(imSP,maskRad);
% cleanImMean   = cleanImageMean  (imSP,maskRad,3);
% showImage(cleanImMedian);
% showImage(cleanImMean);
% 
% disp(['a) psnr: original VS saltAndPepper =',num2str(calcPSNR(im, imSP))]);
% disp(['a) psnr: original VS clean median  =',num2str(calcPSNR(im, cleanImMedian))]);
% disp(['a) psnr: original VS clean mean    =',num2str(calcPSNR(im, cleanImMean))]);
% 
% pause;
% clear im imSP cleanImMedian cleanImMean maskRad;
% close all;

% b)   
% *Apply Gaussian noise to an image and show the results of denoising it
%     using averaging and median filtering. 
% *Display the resulting images.
% *Print the PSNR between the original and the noised image.
% *Display the PSNR between the original and denoised image in each of the 2 
%     methods. (Either print PSNR or display it in the figure window).

%TODO check noise factor
%TODO try diffrent rad
% im = lenaIm;
% showImage(im);
% imGaus = addGaussianNoise(im,15);
% showImage(imGaus);
% maskRad = [3,3];
% cleanImMedian = cleanImageMedian(imGaus,maskRad);
% cleanImMean   = cleanImageMean  (imGaus,maskRad,2);
% showImage(cleanImMedian);
% showImage(cleanImMean);
% 
% disp(['b) psnr: original VS Guas blur    =',num2str(calcPSNR(im, imGaus))]);
% disp(['b) psnr: original VS clean median =',num2str(calcPSNR(im, cleanImMedian))]);
% disp(['b) psnr: original VS clean mean   =',num2str(calcPSNR(im, cleanImMean))]);
% 
% pause;
% clear im imGaus cleanImMedian cleanImMean maskRad;
% close all;

% c)  
% *Print on screen your conclusion as to which type of filtering works best 
%     for each type of noise. 
% *Which gives the largest signal to noise? Which gives the most pleasing 
%     visual result in your opinion.


% TODO check if my guess below is correct
% disp('S&P noise: ');
% disp('	*median filter is better than mean filter');
% disp('	*median gives larger PSNR, there for closer to original pic');
% disp('	*median gives the best visual result as we can see');
% disp('Gaus noise: ');
% disp('	*mean filter is better than median filter');
% disp('	*mean gives larger PSNR, there for closer to original pic');
% disp('	*mean gives the best visual result as we can see');


% d) 
% *Plot the PSNR values between original and median-denoised image as a 
%     function of the size of median neighborhood – maskRadius. Use a heavily
%     noised image and use the noise for which median filtering works best.
% *Use matlab function plot. Use matlab functions title, xlabel and ylabel to
%     display axis description.
% *Print your explanation for the behavior of the graph.

% %TODO: think if median is best for SPNoise.
% %TODO: choose a pic 
% %TODO: try radius + 1/2
% %TODO: explain
% im = lenaIm;
% showImage(im);
% imSP = addSPnoise(im,0.2);
% showImage(imSP);
% iters = 3; 
% PSNRarray = zeros(iters,1);
% for i=1 : iters
%     cleanIm = cleanImageMedian(imSP,[i,i]);
% %    showImage(cleanIm);
%     PSNRarray(i) = calcPSNR(cleanIm,imSP); 
% end
% 
% figure
% plot(1:length(PSNRarray),PSNRarray);
% title('PSNR values between original and median-denoised image');
% xlabel('maskSTD');
% ylabel('PNSR');

% e) 
% *Plot the PSNR values between original and mean-denoised image as a 
%     function of the maskSTD. Use a heavily noised image and use the noise
%     for which mean filtering works best. Use a relatively large maskRadius
%     to accommodate the different maskSTD.
% *Use matlab function plot. Use matlab functions title, xlabel and ylabel to
%     display axis description.
% *Print your explanation for the behavior of the graph.

% %TODO: think if mean is best for GaussianNoise.
% %TODO: choose a pic and put more noise
% %TODO: try std + 1/2
% %TODO: explain
% im = lenaIm;
% showImage(im);
% imG = addGaussianNoise(im,10);
% showImage(imG);
% iters = 3; 
% PSNRarray = zeros(iters,1);
% for i=1 : iters
%     cleanIm = cleanImageMean(imG,[1,1],i);
%     showImage(cleanIm);
%     PSNRarray(i) = calcPSNR(cleanIm,imG); 
% end
% 
% figure
% plot(1:length(PSNRarray),PSNRarray);
% title('PSNR values between original and mean-denoised image');
% xlabel('maskSTD');
% ylabel('PNSR');

% f)   
% *Create an image array from an image by creating several Gaussian-noised 
%     versions of it.
% *Create a denoised image by filtering along corresponding pixels using mean
%     and using median.
% *Display resulting denoised images and their PSNR.
% *Which filtering approach works best for Gaussian noise? 
%     Print your answer on screen.
% 
% g)   
% *Create an image array from an image by creating several S&P-noised 
%     versions of it.
% *Create a denoised image by filtering along corresponding pixels using mean
%     and using median.
% *Display resulting denoised images and their PSNR.
% *Which filtering approach works best for Gaussian noise?
%     Print your answer on screen.
% 
% h)  
% *Plot the PSNR values between original and denoised image as a function of
%     the number of frames in the image array. Use S&P noise and use the 
%     denoising methods which you found to work best for this noise type.
% *Use matlab function plot. Use matlab functions title, xlabel and ylabel to
%     display axis description.
% *Print your explanation for the behavior of the graph.
% 
% 
% i)  
% *Plot the PSNR values between original and denoised image as a function of 
%     the number of frames in the image array. Use Gaussian noise and use the
%     denoising methods which you found to work best for this noise type.
% *Use matlab function plot. Use matlab functions title, xlabel and ylabel to
%     display axis description.
% *Print your explanation for the behavior of the graph.
% 
% 
% j) 
% *What happens when you sharpen an image that has S&P noise? 





% pause;
% clear;
% close all;
% clc;






















