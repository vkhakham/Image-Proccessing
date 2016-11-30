function h = histogramFromIH(IH,box)

% function h = histogramFromIH(IH,box)
% (file name is accordingly histogramFromIH.m ) 
% This routine builds the IntegralHistogram of image img.
% 
% Input:  IH – a 3 dimensional array containing the integralHistogram
%         box = a 4-vector defining a window in an image: [r0 r1 c0 c1]. 
%               where 0 <= r0,c0 < r1,c1 <= 256
%         if box=[1 2 1 2] you will get the value of img(2,2) + 1
%         r0=c0=0: is equal to ask regular hist to img till pixel r1,c1
% Output: h - image histogram. An array 1x256.
% 
% Method: Efficiently computes the histogram in window [r0 : r1, c0 : c1] from IH.

% img = readImage('darkimage.tif');
% box = [0 256 0 256];
% IH = IntegralHistogram(img);

r0 = box(1);
r1 = box(2);
c0 = box(3);
c1 = box(4);


%we assume that histogramFromIH(IH,[0 1 0 1]) is legal. 
%the output will be a histogram with one value - img(1,1)+1
%basically its like asking a hist of an img of size 1x1
%asking for [0 0 0 0] will result an empty hist
%asking for [0 256 0 256] will result a hist = histImage(img)
temph = zeros(1,1,256);
if(r1>0 && c1>0)
    temph = IH(r1,c1,:);
end
if(r0>0 && c0>0)
    temph = temph + IH(r0,c0,:);
end
if(r0>0 && c1>0)
    temph = temph - IH(r0,c1,:);
end
if(r1>0 && c0>0)
    temph = temph - IH(r1,c0,:);
end
h = reshape(temph,1,size(temph,3));

% testing
% P = histImage(img);
% if(isequal(P,h))
%     disp('last pixel hist in this function is equal to hist result from function histImage(img)');
% end

end
