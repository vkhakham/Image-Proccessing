function    [imgNbit, Qvals] = optimalQuantization(img8bit,N)

% function    [imgNbit, Qvals] = optimalQuantization(img8bit,N)
%               
% This routine quantizes an 8 bit image into an N bit image using Optimal Quantization.
% 
% Input:  img8bit - a grayscale image in the range [0..255] 
%         N – number of bits for output image. N<8.
%         
% Output: imgNbit - a grayscale image with maximum 2N different values
%         Qvals  - a vector of length 2N where each entry i contains the 8 bit gray value qi. 
%         
% Method: TODO

%DELETE a
% Uses the iterative Loyd-Max algorithm for Optimal Quantization as described in class to perform quantization.
%  - Use the histogram of img8bit as the graylevel probability distribution.
%  - Use the Loyd-Max algorithm to compute the 2N+1 Zi values and the 2N qi values. 
%  - After computing the optimal qi and Zi values:
%  - - create the N bit image by mapping all pixels with gray value in the range [Zi .. Zi+1] to the value qi.
%  - - Use reasonable guess for initial qi or Zi values. 
%  - - Make sure that Z(0) and Z(2N+1) are 'anchored' to the bounds of the gray value range (0 and 255). 
%  - - Be careful re stopping condition of the algorithm. Since data is digital (not continuous)
%  - - process might converge to toggling state and not actual minima.
% Note: In class input z values were assumed continuous and thus integral over z values was used
%       in the computation. In our case z values are integers 0..255 and thus sum rather than integral is used.
img8bit = readImage('lighthouse.tif');
N = 1;
%DELETE a

P = histImage(img8bit); %histogram of img8bit

ziVector = (0:(2^N)) * (2^(8-N));   %spread the Zi uniformly as first guess
disp('initial uniformly ziVector: ');
disp(ziVector);


qiVector = (0:2^(N-1));
disp('initial empty qiVector: ');
disp(qiVector);

%calculates Qi's
for i=1 : length(qiVector)
    sumOfUp = 0;
    sumOfDown = 0;
    for j=ziVector(i) : ziVector(i+1)-1 
        sumOfUp = sumOfUp + j * P(j+1);%todo - think of value 0
        sumOfDown = sumOfDown + P(j+1);
    end
    qiVector(i) = floor(sumOfUp / sumOfDown);
end

disp('qiVector after first calc: ');
disp(qiVector);

%calculates Error
E = 0;
for i=1 : length(qiVector)
    for j=ziVector(i) : ziVector(i+1)-1 
        E = E + P(j+1)*((j-qiVector(i))^2);
    end
end
disp(['E after first calc: ', num2str(E)]);

Eold = inf(1);
maxLoops = 5;
loopCounter = 1;
%main loop. try to get lower E and stops when reaching local min.
while(Eold > E && loopCounter<=maxLoops)
    disp('*************************************');
    disp(['iter number:',num2str(loopCounter)]);
    Eold = E;
    cloneZiVector = ziVector;
    cloneQiVector = qiVector;
    %calculates Zi's. note: z(1)=0 and z(2^N)=256 allways.
    for i=2 : length(ziVector) - 1
        ziVector(i) = (qiVector(i-1) + qiVector(i)) / 2;
    end
    disp('ziVector after recalc: ');
    disp(ziVector);
    
    %calculates Qi's
    for i=1 : length(qiVector)
        sumOfUp = 0;
        sumOfDown = 0;
            for j=ziVector(i) : ziVector(i+1)-1 
                sumOfUp = sumOfUp + j * P(j+1);%todo - think of value 0
                sumOfDown = sumOfDown + P(j+1);
            end
        qiVector(i) = floor(sumOfUp / sumOfDown);
    end
    disp('qiVector after recalc: ');
    disp(qiVector);
    
    %calculates Error
    E = 0;
    for i=1 : length(qiVector)
        for j=ziVector(i) : ziVector(i+1)-1 
            E = E + P(j+1)*((j-qiVector(i))^2);
        end
    end
    disp(['E after recalc: ', num2str(E), ' and Eold is:' , num2str(Eold)]);
    
    loopCounter = loopCounter + 1;
end
disp('--------------------------------------------');
disp('--------------------------------------------');
disp('final results: ');
disp('ziVector: ');
disp(cloneZiVector);
disp('qiVector: ');
disp(cloneQiVector);
disp('Error: ');
disp(Eold);


imgNbit = 0;
Qvals = 0 ;
