CONTRAST_STRETCHING
x = imread('');
subplot(1, 2, 1)
imshow(x);
y = imadjust(x, stretchlim(x),[]);
subplot(1, 2, 2)
imshow(y);
---


gray_image=im2gray(input_image);
imshow(gray_image)
darkened_image=0.25*gray_image;
imshow(darkened_image)
r_min=min(darkened_image(:))
r_max=max(darkened_image(:))
contrast_imge=(darkened_image-r_min).*(255/(r_max-r_min));
imshow(contrast_imge)


HISTOGRAM
imhist(contrast_imge)
------
Img1 = imread('');
img_hist = zeros(1,256);
x = 3000; y=3000; 
for i = 1:x % Rows of Input Image
    for j = 1:y % Colms  of input image
        img_hist(Img1(i,j,1)+1) = img_hist(Img1(i,j,1)+1)+1; % Bin Increment for occurrence
    end
end
figure % Plotting the Histogram
stem(0:255, img_hist); 
grid on;
ylabel('No of Pixels');
xlabel('GrayScale Intensity Levels'); 
title('Image Histogram without Using Built-in Function');

------
edgedetect = edge(contrast_imge,'sobel');
Prewitt,Roberts,log,zerocross,sobel,canny



-----

Iblur1 = imgaussfilt(I,2);

%normal matrix : [1 0 0; 0 1 0; 0 0 1]
theta = 180
rotation = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]; %rotate based on matrix  [cost, -sint; sint, cost]
tform1 = affine2d(rotation)
scale = [2 0 0; 0 4 0; 0 0 1]; %keep 0's same, scale up or down the values of 1's
tform2 = affine2d(scale)
reflection  = [1 0 0; 0 -1 0; 0 0 1]; %keep 0's same, but make the 1's value negative
tform3 = affine2d(reflection)
shearr = [1 0.33 0; 0 1 0; 0 0 1]; %keep 1's same, change 0
tform4 = affine2d(shearr)
O = imtranslate(I,[100, 400]);
J = imwarp(I,tform1);
H = imwarp(I,tform3);

-----
THRESHOLDING
x = imread('');
x = rgb2gray(x);
x = double(x);
tot = 0;
[a,b] = size(x);
y = zeros(a,b);
for i=1:a
    for j=1:b
        y(i,j) = 0;
    end
end
for i=1:a
    for j=1:b
        tot = tot + x(i,j);
    end
end
c = a*b;
thr = tot/(a*b);
for i=1:a
    for j=1:b
        if x(i,j) > thr
            y(i,j)=1;
        else
            y(i,j)=0;
        end
    end
end
figure;
imshow(y);






