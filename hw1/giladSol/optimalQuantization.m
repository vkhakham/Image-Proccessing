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
%         NOTICE - if img8bit diffrent values <= 2^N, the function will
%           return the original img8bit with QVals that contain all
%           diffrent color with the last color cloned till QVals length is 2^n

%DELETE a
img8bit = readImage('lighthouse.tif');
%img8bit = [206 206 208; 200 205 204; 205 200 202]; %run this win N=4 and see where the fix is going wrong
% img8bit = [1 1 1; 5 5 5; 3 3 3];
N = 1;
%DELETE a

%histogram of img8bit
P = histImage(img8bit); 
totalDiffrentColors = length(find(P));%look on all columns on the Hist and look for non-zeros

if(totalDiffrentColors > 2^N)
    %spread the Zi uniformly 
%     ziVector = (0:(2^N)) * (2^(8-N));
   
    ziVector = zeros(1,2^N+1);
    ziVector(length(ziVector)) = 256;
    %moving Zi so each will contain atleast one color - we know there are
    %enough color because we checked (totalDiffrentColors > 2^N)
    for i=1 : length(ziVector)-1
        if(ziVector(i) >= ziVector(i+1))%if Zi-1 was moved, need to fix the currnet to start after him
            ziVector(i+1) = ziVector(i) + 1;
        end
        pixelsInCurrentZi = 0;%counting pixels in a Zi->Zi+1
        for j=ziVector(i) : ziVector(i+1)-1 
            pixelsInCurrentZi = pixelsInCurrentZi + P(j+1);
        end
        if(pixelsInCurrentZi==0)%no pixels
            index = ziVector(i+1);%mark first index on the next section
            while(P(index) == 0)
                index = index + 1; %move till non-zero column
            end
            ziVector(i+1) = index;%place Zi+1 above the color (on the Hist its +1)
        end
    end
    
    disp('initial uniformly ziVector(after removing empty parts): ');
    disp(ziVector);

    %calculates Qi's
    qiVector = calcQiByZi(ziVector, P);%first calc
    disp('qiVector after first calc: ');
    disp(qiVector);

    %calculates Error
    E = calcE(ziVector, qiVector, P);
    disp(['E after first calc: ', num2str(E)]);

    trioChanged = true;%will tell if there was improvment in this iteration.
    maxLoops = 500;
    loopCounter = 1;

    %main loop. try to get lower E and stops if reaching local min or maxLoops
    while(trioChanged==true && loopCounter<=maxLoops)
        disp('*************************************');
        disp(['iter number:',num2str(loopCounter)]);

        %re-calculates Zi's. note: z(1)=0 and z(2^N)=256 allways.
        tempZiVector = calcZiByQi(qiVector);
        disp('tempZiVector after recalc: ');
        disp(tempZiVector);

        %re-calculates Qi's
        tempQiVector = calcQiByZi(tempZiVector, P);
        disp('tempQiVector after recalc: ');
        disp(tempQiVector);

        %re-calculates Error
        tempE = calcE(tempZiVector, tempQiVector, P);
        disp(['tempE after recalc: ', num2str(tempE), ' and Eold is:' , num2str(E)]);

        %if E>temp -> improved ->continue
        %if E==temp -> if Qi changed or Zi changed, we might be fixind empty slot(Zi to Zi+1 is empty) ->continue
        if(E >= tempE && (~isequal(tempQiVector,qiVector) || ~isequal(tempZiVector,ziVector)))
            E = tempE;
            qiVector = tempQiVector;
        else
            trioChanged = false;
        end

        ziVector = tempZiVector;%Zi need to be calced anyway from Qi
        loopCounter = loopCounter + 1;
    end

    disp('--------------------------------------------');
    disp('final results: ');
    disp('ziVector: ');
    disp(ziVector);
    disp('qiVector: ');
    disp(qiVector);
    disp('Error: ');
    disp(E);

    %insert Qi's into original image
    imgNbit = calcNewNbitImg(img8bit, ziVector, qiVector);%TODO change to matlab instead of loop
    showImage(imgNbit);
    Qvals = qiVector;
else
    disp('we are done. no calc is needed.')
    Qvals = find(P);
    if(length(Qvals) < 2^N)%minimum size 2^N
        diff = 2^N - length(Qvals);
        Qvals = [Qvals ones(1,diff)*Qvals(length(Qvals))];%duplicate last element
    end
    imgNbit = img8bit;
end
end

function [newQi] = calcQiByZi(oldZi, P)
%calculates Qi's using Zi vector and P the histogram of original image
newQi = (zeros(length(oldZi)-1,1))'; %declaring to avoid dynamic allocation

for i=1 : length(newQi)
    sumOfUp = 0;
    sumOfDown = 0;
    for j=oldZi(i) : oldZi(i+1)-1 
        sumOfUp = sumOfUp + j * P(j+1);
        sumOfDown = sumOfDown + P(j+1);
    end
    if(sumOfDown == 0)
        if (i == 1)
            newQi(i) = oldZi(i+1);%should never happen
        else 
            newQi(i) = oldZi(i);%should never happen
        end
    else
        newQi(i) = round(sumOfUp / sumOfDown);
    end
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

function [newZi] = calcZiByQi(oldQi)
%calculates Zi's. note: z(1)=0 and z(2^N)=256 allways.
newZi = (zeros(length(oldQi)+1,1))';
for i=2 : length(newZi) - 1
    newZi(i) = round((oldQi(i-1) + oldQi(i)) / 2);
end
newZi(length(newZi)) = 256;
end

function [imgNbit] = calcNewNbitImg(img8bit, ziVector, qiVector)
%insert Qi's into original image instead of old colors
for i=1 : length(ziVector)-1
    img8bit(img8bit >= ziVector(i) & img8bit < ziVector(i+1)) = qiVector(i);
end
imgNbit = img8bit;
end



