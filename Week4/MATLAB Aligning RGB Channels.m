%The goal of this project is to learn to work with images in Matlab by taking the digitized glass plate images and automatically producing a color image with as few visual artifacts as possible. In order to do this, you will need to extract the three color channel images. place them on top of each other. and align them so that they form a single RGB color image. The easiest way to align the parts is to exhaustively search over a window of possible displacements (You will search [-10,10] pixels), score each one using some image matching metric, and take the displacement with the best score. The simplest one is the Sum of Squared Differences (SSD) distance, which simple subtracts one image region from the other and evaluates the sum of the squared values in each pixel. You need to do SSD based calculations on image regions which are of double type. As R.G,B channels are highly correlated to each other, SSD metric is very likely to work. Your task is to hold the G channel as the reference and move around R and B channels over it, and keep track of the SSD value for the 51x51 image regions at the center of the channels. For each channel, you will find the (x,y) displacement vector that gives the minimum SSD value. 
The program should divide the image into three equal parts. The first image is Blue Channel. the second one is Green channel and the last one is Red channel. You have to name your variables as below Blue channel Image - B Green channel Image - G Red channel Image - R Reference Green Channelcenterregion(51x51)- ref_img_region (center of this region coincides with center of image and indexes are always integers) Final aligned image - Colorlmg_aligned%

%Read the image
img = imread('course1image.jpg');
[r,c] = size(img);


B = img(1:r/3,:);
G = img((r/3)+1:(2*r/3),:);
R = img((2*r/3)+1:r,:);

ref_img_region = G;
[rg,cg] = size(ref_img_region);
ref_img_region = ref_img_region(ceil((rg-50)/2) :ceil((rg-50)/2) + 50,ceil((cg-50)/2) :ceil((cg-50)/2) + 50);
%disp(size(ref_img_region));
ref_img_region = double(ref_img_region);

% Naive way
% ColorImg_aligned = cat(3,R,G,B);
% imshow(ColorImg_aligned);

% SSD way
nR = align(G,R);
nB = align(G,B);
ColorImg_aligned = cat(3,nR,G,nB);
imshow(ColorImg_aligned);


function aligned = align(green,red)
    [red_row,red_col] = size(red);
    [green_row,green_col] = size(green);

    % checking SSD for cropped part of the images for faster calculation 
    cropped_red = red(ceil((red_row-50)/2) : ceil((red_row-50)/2) + 50,ceil((red_col-50)/2) :ceil((red_col-50)/2) + 50);
cropped_green = green(ceil((green_row-50)/2) : ceil((green_row-50)/2) + 50,ceil((green_col-50)/2) :ceil((green_col-50)/2) + 50);

    MiN = 9999999999;
    r_index = 0;
    r_dim = 1;
    % Modifications
    for i = -10:10
        for j = -10:10
            ssd =     SSD(cropped_green,circshift(cropped_red,[i,j])); %circshift(A,[i,j])
            if ssd < MiN
                MiN = ssd;
                r_index = i;
                r_dim = j;
            end
        end
    end
    aligned = circshift(red,[r_index,r_dim]);
end       

function ssd = SSD(a1,a2)
    x = double(a1)-double(a2);
    ssd = sum(x(:).^2);
end 
