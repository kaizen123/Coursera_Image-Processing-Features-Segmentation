function [G,L] = GaussianLaplacian(img)
%Apply imgaussfilt on img and store it in a temporary image variable
i = imgaussfilt(img,2);
%Access alternate rows and columns (downsampling) from the smoothed image and assign it to G
G = i(1:2:end,1:2:end);
%replicate the rows and columns (upsampling) of G and assign it to L
L = repelem(G,2,2);
end
