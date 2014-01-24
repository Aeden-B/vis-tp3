function[imOut]=gradient(imIn, seuil)
A = imresize(imIn, 0.25);
figure;clf;
imagesc(A);colormap(gray);axis image; % A image source
hold on;
dx=[1;-1];
dy=[1,-1];
% Application des opérateurs dx et dy à l'image A
AA_x = conv2(double(A), dx, 'same');
AA_y = conv2(double(A), dy, 'same');
% Calcul du module du gradient
module = sqrt(AA_x^2+AA_y^2);
% On conserve uniquement les valeurs supérieures au seuil
AA_x(module < seuil) = 0;
AA_y(module < seuil) = 0;
scale_quiver = 2; % 10 for natural image; 2 for the synthetic black and white image
% AA_x image gradient dx, AA_y image gradient dy
quiver(AA_x,AA_y,scale_quiver,'b'); % gradient vector orthogonal to isophoted
quiver(-AA_y,AA_x,scale_quiver,'.r'); % isophote (orthogonal to gradient vector) ;
% linespec . draws a line instead of arrow
imOut = quiver(AA_y,-AA_x,scale_quiver,'.r');
