%img = 
sigma=3; thresh=10000000; odr=9;


img = imread('image.jpg');

sigma=3; thresh=10000000; odr=9;

k=0.05;

gaussian= fspecial('gaussian',max(1,fix(6*sigma)), sigma);

dy=[-1 0 1; -1 0 1; -1 0 1];

dx=dy';

I = rgb2gray(img);

Ix=conv2(I,dx,'same');

Iy=conv2(I,dy,'same');

Ix2 = Ix.*Ix;

Iy2 = Iy.*Iy;

Ixy = Ix.*Iy;

Ix20 = conv2(Ix.*Ix,gaussian,'same');

Iy20 = conv2(Iy.*Iy,gaussian,'same');

Ixy20 = conv2(Ix.*Iy,gaussian,'same');

det_M = (Ix20.*Iy20 - Ixy20.*Ixy20);

trace_M = Ix20 + Iy20;

R = det_M - k*(trace_M).^2;

response=R;

size(R)




%Write your code above till response calculation
% Final local maxima and perform nonmaximal suppression and threshold
mx = ordfilt2(response,odr^2,ones(odr)); % Grey-scale dilate
final_response = (response==mx)&(response>thresh); % Find maxima and thresholding
[rows,columns] = find(final_response); % Find row,col coords.
figure; imshow(img);
hold on;
p=[columns rows];
plot(p(:,1),p(:,2),'ys');
% plot(p(:,1),p(:,2),'or');
title('\bf Harris Corners')
