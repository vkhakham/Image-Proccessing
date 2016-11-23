function    [imgNbit, Qvals] = optimalQuantization(img8bit,N)

% function    [imgNbit, Qvals] = optimalQuantization(img8bit,N)
%               
% This routine quantizes an 8 bit image into an N bit image using Optimal Quantization.
% 
% Input:  img8bit - a grayscale image in the range [0..255] 
%         N – number of bits for output image. N<8.
%         
% Output: imgNbit - a grayscale image with maximum 2^N different values
%         Qvals  - a vector of length 2^N where each entry i contains the 8 bit gray value q(i-1). 
%         
% Method: TODO

%DELETE a
%img8bit = readImage('lighthouse.tif');
%N = 1;
%DELETE a

P = histImage(img8bit); %histogram of img8bit

ziVector = (0:(2^N)) * (2^(8-N));   %spread the Zi uniformly as first guess
disp('initial uniformly ziVector: ');
disp(ziVector);


qiVector = (0:(2^N)-1);
disp('initial empty qiVector: ');
disp(qiVector);

%calculates Qi's
qiVector = calcQiByZi(ziVector, qiVector, P);
disp('qiVector after first calc: ');
disp(qiVector);

%calculates Error
E = calcE(ziVector, qiVector, P);
disp(['E after first calc: ', num2str(E)]);

Eold = inf(1);
maxLoops = 50;
loopCounter = 1;
%main loop. try to get lower E and stops if reaching local min or maxLoops
while(Eold > E && loopCounter<=maxLoops)
    disp('*************************************');
    disp(['iter number:',num2str(loopCounter)]);
    
    Eold = E;
    cloneZiVector = ziVector;%saving old values
    cloneQiVector = qiVector;%saving old values
    
    %re-calculates Zi's. note: z(1)=0 and z(2^N)=256 allways.
    ziVector = calcZiByQi(ziVector, qiVector);
    disp('ziVector after recalc: ');
    disp(ziVector);
    
    %re-calculates Qi's
    qiVector = calcQiByZi(ziVector, qiVector, P);
    disp('qiVector after recalc: ');
    disp(qiVector);
    
    %re-calculates Error
    E = calcE(ziVector, qiVector, P);
    disp(['E after recalc: ', num2str(E), ' and Eold is:' , num2str(Eold)]);
    
    loopCounter = loopCounter + 1;
end
disp('--------------------------------------------');
disp('final results: ');
disp('ziVector: ');
disp(cloneZiVector);
disp('qiVector: ');
disp(cloneQiVector);
disp('Error: ');
disp(Eold);

%insert Qi's into original image
imgNbit = calcNewNbitImg(img8bit, cloneZiVector, cloneQiVector);%TODO change to matlab instead of loop
%showImage(imgNbit);
Qvals = cloneQiVector;
end

function [newQi] = calcQiByZi(oldZi, oldQi, P)
%calculates Qi's using Zi vector and P the histogram of original image
newQi = oldQi; %create newQi the same size to avoid dynamic allocation
for i=1 : length(newQi)
    sumOfUp = 0;
    sumOfDown = 0;
    for j=oldZi(i) : oldZi(i+1)-1 
        sumOfUp = sumOfUp + j * P(j+1);
        sumOfDown = sumOfDown + P(j+1);
    end
    newQi(i) = floor(sumOfUp / sumOfDown);
end

end

function [E] = calcE(ziVector, qiVector, P)
%calculates Error
E = 0;
for i=1 : length(qiVector)
    for j=ziVector(i) : ziVector(i+1)-1 
        E = E + P(j+1)*((j-qiVector(i))^2);
    end
end
end

function [newZi] = calcZiByQi(oldZi, oldQi)
%calculates Zi's. note: z(1)=0 and z(2^N)=256 allways.
newZi = oldZi;
for i=2 : length(newZi) - 1
    newZi(i) = floor((oldQi(i-1) + oldQi(i)) / 2);
end
end

function [imgNbit] = calcNewNbitImg(img8bit, ziVector, qiVector)
%insert Qi's into original image
imgNbit = img8bit;
for i=1 : 256
    for j=1 : 256
        for k=1 : length(ziVector)-1
            if(imgNbit(i,j) >= ziVector(k) && imgNbit(i,j) < ziVector(k+1))
                imgNbit(i,j) = qiVector(k);
                break;
            end
        end
    end
end
end



