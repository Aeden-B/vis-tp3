function[imOut]=f_moyen(imIn, size)
coeff = ones(size)/(size*size);
imOut = imfilter(imIn, coeff);
end