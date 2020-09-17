%Your task is to extract 50x50 image sub-regions from the top-left as well as the bottom right and store them in the variables subimg1 and subimg2 respectively
After you successfully extract subimg1 and subimg2 images, compute the SSD (Sum of Squared Differences)  between them and store in the variable SSD%

img = imread('cameraman.tif');
subimg1 = img(1:50,1:50);
subimg2 = img(  end -49 :end,  end -49 :end);
SSD = sum(sum((double(subimg1) - double(subimg2)).^2));
imshow([subimg1, subimg2]); 