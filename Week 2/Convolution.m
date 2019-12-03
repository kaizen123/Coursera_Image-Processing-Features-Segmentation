%read the image
img = imread('Davis_Hall.jpg');

I = double(rgb2gray(img));

Gx = ([-1 0 1; -2 0 2;-1 0 1])

Gy = ([-1 -2 -1; 0 0 0;1 2 1]);

Gx = fliplr(Gx)

Gy = flipud(Gy);

Fx = zeros(size(I));

Fy = zeros(size(I));

B = padarray(I,[1 1]);

for i = 1 : size(B,1) - 2

for j = 1 : size(B,2) - 2

Fx(i, j) = sum(sum(B( i:i+2, j:j+2 ).*Gx));

Fy(i, j) = sum(sum(B( i:i+2, j:j+2 ).*Gy));

end

end

FMag = sqrt(Fx.^2 + Fy.^2);

I = uint8(I);

%uncomment the code as needed

figure

imshow(img)

title('Original Image');

figure

imshow((abs(Fx))./max(max(Fx)))

title('Gradient in X direction');

figure

imshow(abs(Fy)./max(max(Fy)))

title('Gradient in Y direction');

figure

imshow(FMag./max(max(FMag)))

title('Gradient Magnitude');