function h = histImage(img)



%DELETE

img = readImage('barbarasmall.tif');

%DELETE

h = zeros(1,256);
for i=0:255
    h(i+1) = length( find(img == i) );
    disp([ num2str(i) , ':', num2str(h(i+1))])
end