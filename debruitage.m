function[imOut]=debruitage(imIn)
imBruit=imnoise(imIn,'salt & pepper', 0.05);
figure; imshow(imBruit);
imOut=medfilt2(imBruit);
figure; imshow(imOut);
imOut2=f_moyen(imBruit, 3);
figure; imshow(imOut2);