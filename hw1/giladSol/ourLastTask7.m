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

% pics = {'addedScissors.tif';'barbarasmall.tif';'cups.tif';'darkimage.tif';'fourSquares.tif';'lena.tif';'stroller.tif';'wine.tif'}
% length(pics);

% a
% img1 = readImage('darkimage.tif');
% [img1UniformQuan,~] = uniformQuantization(img1,4);
% [img1OptimalQuan,~] = optimalQuantization(img1,4);
% showImage(img1UniformQuan);
% showImage(img1OptimalQuan);
% disp('***********question 7a*************');
% disp('    a. diff between uniformQuantization("darkimage.tif",4) and  optimalQuantization("darkimage.tif",4)');
% disp('    left pic: uniformQuantization, right pic: optimalQuantization');
% disp('    optimalQuantization clearly better in this case');
% disp('    in the left pic we can see that the right arm looks like a part of the background. also his hair and forhead hard to seperate');
% disp('    in the right we can see better the arm, hair, forhead and face features.');
% disp('    in the right we can see false contour errors in the left top corner background, in the left pic less error');
% disp('***********question 7a*************');
% disp(' ');

% b
% img2 = readImage('darkimage.tif');
% img2Binarize = binarize(img2,128);
% [img2Binarizeopt,~] = binarizeOpt(img2);
% showImage(img2Binarize);
% showImage(img2Binarizeopt);
% disp('***********question 7b*************');
% disp('    b. diff between binarize("darkimage.tif",128) and  binarizeOpt("darkimage.tif")');
% disp('    left pic: binarize, right pic: binarizeOpt');
% disp('    binarizeOpt is better');
% disp('    clearly all colors in darkimage.tif are under 128 so we got a black pic.');
% disp('    binarizeOpt found T=66 is better.');
% disp('***********question 7b*************');
% disp(' ');
% 
% 
% %c
% img3 = readImage('lakeScene.tif');
% [img3BinarizeOptT,~] = binarizeOpt(img3);
% img3BinarizeOptTAdaptive = binarizeOptAdaptive(img3,31);
% showImage(img3BinarizeOptT);
% showImage(img3BinarizeOptTAdaptive);
% disp('***********question 7c*************');
% disp('    c. diff between binarizeOpt("lakeScene.tif") and  binarizeOptAdaptive("lakeScene.tif",31)');
% disp('    left pic: binarizeOpt, right pic: binarizeOptAdaptive');
% disp('    binarizeOptAdaptive is better');
% disp('    as for the moment binarizeOptAdaptive("lakeScene.tif",31) took over 9 min');
% disp('    we chose 31 beacuse the picture details change fast.');
% disp('    in the left pic,we lost the mountains in the background. also we lost the trees infront of the mountain.');
% disp('    in the right pic, we can see the trees infront of the mountain becuase binarizeOptAdaptive could seperate colors better when looking on smaller pics(winsize^2).');
% disp('    also, we can see the background and alot of details that binarizeOpt lost');
% disp('***********question 7c*************');

%d
% d.    Extra Credit:  Compare runtimes using optimal adaptive thresholding with and without IntegralHistogram. 
% You can use tic and toc to measure run time. 
% When does the advantage in run time kick in?
% You can plot ratio of run times as a function of window size to make your point.
img4 = readImage('lakeScene.tif');
tic
img3BinarizeOptTAdaptive = binarizeOptAdaptive(img4,31);
disp('time for binarizeOptAdaptive(img3,31) took:');
toc
IH = IntegralHistogram(img4);
tic
img3BinarizeOptTAdaptiveIH = binarizeOptAdaptiveIH(img4,31,IH);
disp('time for binarizeOptAdaptiveIH(img3,31,IH) took:');
toc
showImage(img3BinarizeOptTAdaptive);
showImage(img3BinarizeOptTAdaptiveIH);
disp('the advantage is clearly when winsize is big. while in binarizeOptAdaptive we calc each subimg histogram');
disp(',in binarizeOptAdaptiveIH we do it once preprocessing. if win size if big, the work for binarizeOptAdaptive');
disp('grows significantly, while binarizeOptAdaptiveIH stays the same regarding the hist calc');


