function[imOut]=laplacien(imIn, connexite)
if connexite == 4
    edgeFilter = [0,-1,0;-1,4,-1;0,-1,0];
elseif connexite == 8
    edgeFilter = [-1,-1,-1;-1,8,-1;-1,-1,-1];
end
imOut = imfilter(imIn, edgeFilter);
end
