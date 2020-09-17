%The image gradient magnitude corresponds to the strength of edges in any given image. In this problem, you will evaluate the Sobel Image Gradients Gx and Gy for the scameraman.tit image and subsequently Gradient magnitude Gmag and Gradient direction Gdir Reference: https://vvvvvv.mathworks.com/help/imagestref/imgradient.html Read the scameraman.tit image into variable img Compute Gx and Gy using imgradientxy function Compute Gmag and Gdir using imgradient function% 


img=imread('cameraman.tif');

[Gx,Gy]     =imgradientxy(img,'sobel');
[Gmag,Gdir] =imgradient(img,'sobel'); 

figure
imshowpair(Gx,Gy,'montage')
title("Directional Gradient Gx,GY") 

figure 
imshowpair(Gmag,Gdir,'montage')
title('Gradient magnintude (left),Gradient direction(Right)')

