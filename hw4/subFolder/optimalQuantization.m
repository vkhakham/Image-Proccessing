%authors: 
% Vadim Khakham, id 311890156
% Gilad Eini   , id 034744920
function    [imgNbit, Qvals] = optimalQuantization(img8bit,N)
%
% function    [imgNbit, Qvals] = optimalQuantization(img8bit,N)
%               
% This routine quantizes an 8 bit image into an N bit image using Optimal 
% Quantization.
% 
% Input:  img8bit - a grayscale image in the range [0..255] 
%         N – number of bits for output image. N<8.
%         
% Output: imgNbit - a grayscale image with maximum 2^N different values
%         Qvals   - a vector of length 2^N where each entry i contains the 
%                   8 bit gray value q(i). 
%         NOTICE  - if img8bit diffrent values(shades of gray) <= 2^N, the 
%                   function will return the original img8bit with QVals 
%                   that contain all diffrent color with the last color 
%                   cloned till QVals length is 2^n
% Method: checks how much color in the img8bit. if less than 2^N ->done
%         guess Zi uniformly. if one or more Zi empty, reguess and place
%         atleast one color in each Zi
%         calc Qi's and Error. keep doing so while Error decreace
%         or Error the same and Zi or Qi vector changed. also don't do 
%         more iterations than MaxLoops.
%         once Zi and Qi determind, calculate the new imgNbit

global P; %histogram of img8bit - doesn't change 
P = histImage(img8bit); 

%look on all columns on the Hist and look for non-zeros
totalDiffrentColors = length(find(P));

if(totalDiffrentColors > 2^N)%if not, we finished
    ziVector = (0:(2^N)) * (2^(8-N));%spread the Zi uniformly 
    isThereZiEmpty = lookForEmptyZi(ziVector);
    if(isThereZiEmpty == true)
        ziVector = spreadZiDiffrently(N);
    end
    
    %calculates Qi's
    qiVector = calcQiByZi(ziVector);%first calc

    %calculates Error
    E = calcE(ziVector, qiVector);
    
    %prints data
    %printData(ziVector, qiVector, E);
    
    trioChanged = true;%will tell if there was improvment in this iteration.
    maxLoops = 500;
    loopCounter = 1;

    %main loop. try to get lower E and stops if reaching local min or maxLoops
    while(trioChanged==true && loopCounter<=maxLoops)

        %re-calculates Zi's. note: z(1)=0 and z(2^N)=256 allways.
        tempZiVector = calcZiByQi(qiVector);
        
        %re-calculates Qi's
        tempQiVector = calcQiByZi(tempZiVector);

        %re-calculates Error
        tempE = calcE(tempZiVector, tempQiVector);

        %printData(tempZiVector, tempQiVector, tempE);
        
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

    %printData(ziVector, qiVector, E);
    
    %insert Qi's into original image
    imgNbit = calcNewNbitImg(img8bit, ziVector, qiVector);
    Qvals = qiVector;
else
    Qvals = find(P)-1;
    if(length(Qvals) < 2^N)%minimum size 2^N
        diff = 2^N - length(Qvals);
        Qvals = [Qvals ones(1,diff)*Qvals(length(Qvals))];%duplicate last element
    end
    imgNbit = img8bit;
end
end

function [newQi] = calcQiByZi(oldZi)
%calculates Qi's using Zi vector and P the histogram of original image
global P;
newQi = (zeros(length(oldZi)-1,1))'; %declaring to avoid dynamic allocation

for i=1 : length(newQi)
    grayColorVector = find( P( (oldZi(i)+1) : (oldZi(i+1) ) ) ) - 1 + oldZi(i);
    numberOfPixelsInThatColor = P(find( P( (oldZi(i)+1) : (oldZi(i+1) ) ) )  + oldZi(i));
    numerator   = sum(grayColorVector .* numberOfPixelsInThatColor);
    denominator = sum(P((oldZi(i)+1):(oldZi(i+1))));
    if(denominator == 0)%should never happen, gave second guess that supposed to avoid empty Zi. left this fix just in case
        index = i;%doing qi = (zi + zi+1) / 2) as suggested didnt help on some cases.
        if (i == 1)
            index = 2;
        end
        newQi(i) = oldZi(index);
    else
        newQi(i) = round(numerator / denominator);
    end
end
end

function [E] = calcE(ziVector, qiVector)
%calculates Error
global P;
E = 0;
for i=1 : length(qiVector)
    %all non zero colums in hist [Zi..(Zi+1)-1]. note value X in Hist is color X-1 in img
    grayColorVector = find( P( (ziVector(i)+1) : (ziVector(i+1) ) ) ) + ziVector(i);%+ ziVector(i) cuase we dont start from 1
    numberOfPixelsInThatColor = P(grayColorVector);
    E = E + sum(numberOfPixelsInThatColor .* (((grayColorVector-1)-qiVector(i)).^2));%-1 to change from hist to 0..255
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

function [] = printData(argZiVector, argQiVector, error)
%used for debugging
DEBUG = false;
if (DEBUG == true)
    disp('----------------------');
    disp('argZiVector: ');
    disp(argZiVector);
    disp('argQiVector: ');
    disp(argQiVector);
    disp('error: ');
    disp(error);
    disp('----------------------');
end
end

function [isThereZiEmpty] = lookForEmptyZi(ziVector)
%checks if there is empty Zi
global P;
isThereZiEmpty = false;
for i=1 : length(ziVector)-1
    sumOfZi = sum(P(ziVector(i)+1:(ziVector(i+1))));
    if(sumOfZi == 0)
        isThereZiEmpty = true;
        break;
    end
end
end

function [ziVector] = spreadZiDiffrently(N)
%if found empty ZI - re guess 
global P;
ziVector = zeros(1,2^N+1);
ziVector(length(ziVector)) = 256;
%moving Zi so each will contain atleast one color - we know there are
%enough color because we checked (totalDiffrentColors > 2^N)
for i=1 : length(ziVector)-1
    if(ziVector(i) >= ziVector(i+1))%if Zi+1 was moved last iteration, now Zi > Zi+1
        ziVector(i+1) = ziVector(i) + 1;%fix Zi+1 to be > Zi
    end
    sumOfZi = sum(P(ziVector(i)+1:(ziVector(i+1))));
    if(sumOfZi==0)%no pixels
        ziVector(i+1) = find(P(ziVector(i+1):length(P)),1);        
    end
end
end


