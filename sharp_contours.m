function[imOut]=sharp_contours(imIn, coeff)
gaussianFilter = [1,4,7,4,1;4,20,33,20,4;7,33,55,33,7;4,20,33,20,4;1,4,7,4,1];
gaussianFilter = gaussianFilter/sum(gaussianFilter);
imOut = imfilter(imIn, gaussianFilter);
imOut = imOut + coeff * laplacien(imOut, 8);
end