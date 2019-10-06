img = imread('zone.gif');

%Modify the code below. Select alternate rows and columns from img using MATLAB matrix slicing
[row,col]=size(img); % no of rows and cols
i=1;
j=1;
img_resized = zeros(row/2, col/2); % creates zero matrix of (row/2)X(col/2) order


for x=1:2:row % inc 2 as image size is half        
    for y=1:2:col
        img_resized(i,j) = img(x,y); % keep value of image in c       
        j = j+1;
    end
    i = i+1;
    j = 1;
end
img_resized = uint8(img_resized);
[r,c] = size(img_resized)

figure;
imshow(img)
truesize
figure;
imshow(img_resized)
truesize