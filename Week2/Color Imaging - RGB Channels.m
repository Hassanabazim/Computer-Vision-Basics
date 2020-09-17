
%The goal of this assignment is to learn to work with images in Matlab by taking the digitized Prokudin-Gorskii glass plate images and automatically producing a color image. In
order to do this, you will need to extract the three color channel images, place them on top of each other, so that they form a single RGB color image. Your program should take a
glass plate image as input and produce a single color image as output.

The top most image belongs to Blue channel. The middle image belongs to Green channel and the bottom image belongs to Red channel.

The program should divide the image into three equal parts and place the second and the third parts (G and R) on to the first (B)

You have to name your variables as below

Blue channel Image - 8

Green channel Image - G

Red channel Image - R

Concatenated Color Image - ColorImg %


%Read the image
img = imread('image.jpg');
%Get the size (rows and columns) of the image 
[r,c] = size(img);

B = img(1:r/3,:);
G = img((r/3)+1:(2*r/3),:);
R = img((2*r/3)+1:r,:);

ColorImg = cat(3,R,G,B);
imshow(ColorImg);