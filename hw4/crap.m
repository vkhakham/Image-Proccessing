
% %display sevral images in diffrent figgures
% 
% imshow(I(:,:,:,1))
% figure, imshow(I(:,:,:,2))
% figure, imshow(I(:,:,:,3))



% %old script crap
% 
% 
% % x = length(im(:));
% % figure
% % plot(1:65536,hist);
% % title('hist');
% % xlabel('grey');
% % ylabel('quantity');
% 
% % im((im==214)) = 0;
% % im((im==150)) = 0;
% % im((im==180)) = 0;
% % showImage(im);
% % cleanImage = cleanImageMedian(im,[3,3]);
% % showImage(cleanImage);
% 
% maskRad = [1,1];
% 
% max1 = cleanImMinMax(im, 'max',maskRad);
% % showImage(max1);
% minMax1 = cleanImMinMax(max1, 'min', maskRad);
% % showImage(minMax1);
% maxMinMax = cleanImMinMax(minMax1, 'max', maskRad);
% % showImage(maxMinMax);
% minMaxMinMax = cleanImMinMax(maxMinMax, 'min', maskRad);
% showImage(minMaxMinMax);
% 
% 
% min1 = cleanImMinMax(minMaxMinMax, 'min',maskRad);
% % showImage(min1);
% maxMin1 = cleanImMinMax(min1, 'max', maskRad);
% % showImage(maxMin1);
% minMaxMin = cleanImMinMax(maxMin1, 'min', maskRad);
% % showImage(minMaxMin);
% maxMinMaxMin = cleanImMinMax(minMaxMin, 'max', maskRad);
% showImage(maxMinMaxMin);
% 
% binarized = binarizeOptAdaptive(maxMinMaxMin, 100);
% showImage(binarized);
% % 
% % avg = cleanImageMedian(im, [6,0]);
% % % avg = cleanImageMedian(avg, [0,3]);
% % showImage(avg);
% % 
% % imArray(:,:,1) = avg;
% % imArray(:,:,2) = minMaxMinMax;
% % imArray(:,:,3) = maxMinMaxMin;
% % clean = cleanImageMedian_multi(imArray);
% % showImage(clean);
% % 
% % 
% % cln = im;
% % cln = cleanImMinMax(cln, 'max',maskRad);
% % showImage(cln);
% % cln = cleanImMinMax(cln, 'min',maskRad);
% % showImage(cln);
% % cln = cleanImMinMax(cln, 'min',maskRad);
% % cln = cleanImMinMax(cln, 'max',maskRad);
% % showImage(cln);
% % 
% % for i = 1 : 3
% %     for j = 1 : 5
% %         cln1 = sharpen(cln,[1,1],j,i);
% %         showImage(cln1);
% %         cln2 = sharpen(cln,[2,2],j,i);
% %         showImage(cln2);
% %     end
% % end
% % showImage(cln);
% % cln = cleanImageMedian(cln,[1,1]);
% % showImage(cln);
% 
% 
% % for i=1 : 3
% %     cleanIm = cleanImageMean(im,[i,i],3);
% %     showImage(cleanIm);
% % end
% 
% % fftIm = fft2(im);
% % % showImage(fftIm);
% % cleanIm = ifft2(fftIm);
% % showImage(cleanIm);