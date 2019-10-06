img = imread('pout.tif');
%Modify the code below. Compute Image Negative
[r,c] = size(img);
img_neg = img;
for i=1:r*c
    img_neg(i)=255 - img(i);
end
figure
imshow(img)
figure
imshow(img_neg)
