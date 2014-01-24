function[imOut]=f_gaussien(imIn, size, deviation)
filter = fspecial('gaussian', size, deviation);
imOut = imfilter(imIn, filter);
figure; imshow(imIn);
figure; imshow(imOut);
end
