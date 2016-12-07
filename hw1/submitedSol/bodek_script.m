clear; 
close all; 
clc;

fprintf('++++++++++++++ Bodek script ++++++++++++++\n\n\n');

%% 1-histImage test
img = imread('images/lena.tif');
h_bodek=zeros(1,256);
for n=1:256    
    h_bodek(n)= length(find(img == (n-1)));
end
h = histImage(img);
diff_vec = h-h_bodek;
mean_diff = sum(diff_vec.^2);
if mean_diff~=0
    fprintf('1. histImage is not correct!\n');
end

%% 2-uniformQuantization(img8bit,N)
img_all_grayscale = 0:255;
img_all_grayscale = repmat(img_all_grayscale, 256, 1);
n=1;
[imgNbit,Qvals] = uniformQuantization(img_all_grayscale,n);
img_unique_values = unique(imgNbit);
if length(img_unique_values)~=2^n
    fprintf('2. uniformQuantization - no 2^n unique values in image\n');
end

if length(Qvals)~=2^n
    fprintf('2. uniformQuantization - no 2^n elements in Qvals\n');
end

%should be left half - dark gray, righ half - light gray.
showImage(imgNbit);


%% 3-optimalQuantization(img8bit,N)

opt_quantization_img_first_row = 0:255;
four_colors = [50 100 150 200];
four_colors_img =  repmat(four_colors,255,256/length(four_colors));
opt_quantization_img = [opt_quantization_img_first_row ; four_colors_img];
n=2;
[imgNbit, Qvals] = optimalQuantization(opt_quantization_img,n);
img_unique_values = unique(imgNbit);
if length(img_unique_values)~=2^n
    fprintf('3. optimalQuantization - there should be %d unique values in image but there are %d\n',2^n, length(img_unique_values));
end

diff_unique = img_unique_values-four_colors';
mean_diff_unique = sum(diff_unique.^2);
unique_threshold = 4;
if mean_diff_unique > unique_threshold
   fprintf('3. optimalQuantization - imgNbit is not correct (not optimal)\n');
end

if length(Qvals)~=2^n
    fprintf('3. optimalQuantization - length of Qvals should be %d but is %d\n',2^n,length(Qvals));
end


%% 4-binarize(img,T)
img_all_grayscale = 0:255;
img_all_grayscale = repmat(img_all_grayscale, 256, 1);
thres = 127;
bimg = binarize(img_all_grayscale,thres);
bimg_unique_values = unique(bimg);
if length(bimg_unique_values)~=2
    fprintf('4. binarize - bimg should be binary image. but here bimg has %d unique values\n',length(bimg_unique_values));
end
correct_binary_img = [zeros(256,128) 255*ones(256,128)];
diff_images_binary = bimg - correct_binary_img;
mean_diff_binary = sum(diff_images_binary(:).^2);
if mean_diff_binary>0
    fprintf('4. binarize - bimg is not correct\n');    
end

%% 5-binarizeOpt(im)
opt_binary_img_first_row = 0:255;
two_colors = [90 100];
two_colors_img=[];
for i=1:length(two_colors)
    two_colors_img = [two_colors_img two_colors(i)*ones(1,256/length(two_colors))];
end
two_colors_img =  repmat(two_colors_img,255,1);
img = [opt_binary_img_first_row ; two_colors_img];
[ optbimg, optT ] = binarizeOpt( img );
% expected_thres_possibilities = two_colors(1):two_colors(2); 
% if sum(find(expected_thres_possibilities==optT))==0
%     fprintf('5. binarizeOpt - optimal threshold is not correct\n');
% end
if optT<two_colors(1) || optT>two_colors(2)
    fprintf('5. binarizeOpt - optimal threshold is not correct\n');
end
bimg = binarize(img,optT);
figure;
%should be left half - black, right half - white. maybe with a little
%noise from the first row.
imshow(bimg);

%% 6-binarizeOptAdaptive(im,winsize)
img_text = readImage('text.tif');
showImage(img_text)
[bimg_text] = binarizeOptAdaptive(img_text,25);
%bimg_text should be a clear black text on white background (doesn't really
%need to be able to read the text)
showImage(bimg_text);

%% 7-IntegralHistogram(img) (bonus)
img_all_grayscale = 0:255;
img_all_grayscale = repmat(img_all_grayscale, 256, 1);
IH = IntegralHistogram(img_all_grayscale);
aa = IH(3,3,:);
integral_hist_result=permute(aa,[1 3 2]);
expected_integral_hist = [3 3 3 zeros(1,253)];
diff_hist = integral_hist_result - expected_integral_hist;
mean_diff_integral_hist = sum(diff_hist.^2);
if mean_diff_integral_hist>0
    fprintf('7. IntegralHistogram - IH is not correct\n');
end

%% 8-histogramFromIH(IH,box) (bonus)
img_all_grayscale = 0:255;
img_all_grayscale = repmat(img_all_grayscale, 256, 1);
IH = IntegralHistogram(img_all_grayscale);
box = [1 3 1 3];
h = histogramFromIH(IH,box);
% h=permute(h,[1 3 2]);
expected_hist = [3 3 3 zeros(1,253)];
diff_hist = h - expected_hist;
mean_diff_hist = sum(diff_hist.^2);
if mean_diff_hist>0
    fprintf('8. histogramFromIH - h is not correct\n');
end

%% 9-binarizeOptAdaptiveIH(im,winsize,IH) (bonus)
img_text = readImage('text.tif');
showImage(img_text);
IH = IntegralHistogram(img_text);
[bimg_text] = binarizeOptAdaptiveIH(img_text,25,IH);
%bimg_text should be a clear black text on white background (doesn't really
%need to be able to read the text)
showImage(bimg_text);
