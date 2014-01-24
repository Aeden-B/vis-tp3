function[outim]=sharp_variance(imIn, thresh)
imgSource=double(imIn);
ws=10;
k=0.5;
ww=2*ws+1; %taille de la fenetre d'analyse
wp=ww^2; %nbre de pixels dans la fenetre
% Calcul du facteur A pour toute l'image [k * moyenne de l'image / variance
% locale]
% La variance locale peut se calculer de la facon suivante:
sigma = sqrt(conv2(imgSource.^2,ones(ww)/wp,'same')-conv2(imgSource,ones(ww)/wp,'same').^2);
amp=k*mean(imgSource(:))./sigma;
% Filtrer passe bas l'image source
filter = fspecial('gaussian', [3 3], 0.5);
bim=imfilter(imgSource, filter);
mskf=(abs(imgSource-bim)>thresh);
outim=imgSource+mskf.*amp.*(imgSource-bim); %amplify the small residuals by
% the amplification factor and figure;
figure; imshow(uint8(imgSource));
colormap('gray');
figure; imshow(uint8(outim));
colormap('gray');