% Write a script that performs the following:
% 
% You may choose an image from the course toolbox or any other image
% in which case, please submit the image as well. You may use a different image per task.
% 
% a.    Show that an image Quantized into 4bits using Optimal quantization gives better results than
% using Uniform Quantization.
% Point out a region in which optimal quantization improves the false contour errors due to
% Uniform quantization. (Either describe image region in text [use disp ot fprintf] or mark the
% region in the displayed image). 
% 
% b.    Binarize an image using T = 128 and display the resulting image. Binarize the same image using
% Optimal threshold and display Binary image. Indicate which is better and why. 
% Choose a good image to demonstrate your point.
% 
% c.    Binarize an image using Optimal threshold using a single global Threshold. 
% Binarize the same image using Adaptive optimal thresholding. Choose a window size that gives you good
% results and Display both images and print the window size used.
% Explain why Adaptive threshold gives better results for this image.
% Choose a good image to demonstrate your point.
% 
% d.    Extra Credit:  Compare runtimes using optimal adaptive thresholding with and without IntegralHistogram. 
% You can use tic and toc to measure run time. 
% When does the advantage in run time kick in?
% You can plot ratio of run times as a function of window size to make your point.

img1 = readImage('lighthouse.tif');
img1UniformQuan = uniformQuantization(img1,4);
img1OptimalQuan = optimalQuantization(img1,4);
showImage(img1);
showImage(img1UniformQuan);
showImage(img1OptimalQuan);
%TODO
%check where result can be double but used for index(must be int)- use
%round not floor
%check all divisions for x/0