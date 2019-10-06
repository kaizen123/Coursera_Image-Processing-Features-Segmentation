img = imread('cameraman.tif');
[G,L] =  GaussianLaplacian(img)
montage({img,G,L}, 'size',[1,3],'BorderSize', 10); %Though Gaussian is half the size, montage function resizes it to fit the window
truesize
