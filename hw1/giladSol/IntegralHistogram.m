function IH = IntegralHistogram(img)

% function IH = IntegralHistogram(img)
% 
% This routine builds the IntegralHistogram of image img.
% 
% Input:     img - a grayscale image in the range [0..255] 
% Output:    IH – the IntegralHistogram. An array of size imageRowsximageColsX256 such that 
%            IH(i,j,:) contains the histogram of img(1:i,1:j)
% 
% Method:    Use the efficient algorithm, for computing Integral Histogram image.

img = img + 1;%values in histogram 1..256
[I,J] = size(img);
IH = zeros(I,J,256);

for i=1 : 256
   for j=1 : 256
       
       if(j-1 > 0)
          IH(i,j,:) = IH(i,j,:) + IH(i,j-1,:);%H(x,y-1)
       end
       
       if(i-1 > 0)
          IH(i,j,:) = IH(i,j,:) + IH(i-1,j,:);%H(x-1,y)
       end
       
       if((i-1 > 0) && (j-1 > 0))
          IH(i,j,:) = IH(i,j,:) - IH(i-1,j-1,:);%H(x-1,y-1)
       end
       
       aI_x_y = img(i,j);%aI(x,y)
       
       IH(i,j,aI_x_y) = IH(i,j,aI_x_y) + 1;
   end
end

end
