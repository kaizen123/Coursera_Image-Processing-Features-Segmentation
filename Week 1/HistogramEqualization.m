img = imread('pout.tif')
H = imhist(img);
Hc = cumsum(H);
[r,c] = size(Hc);
[M,N] = size(img);
T = zeros(r,c);
for i=1:r
    for j=1:c
        T(i,j) = round((255/(M*N))*Hc(i,j));
    end  
end