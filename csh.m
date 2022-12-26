global im;
global im2;
[path,user_cancel] = imgetfile();
if user_cancel
    pass
end
im = imread(path);
im2= im2double(im);
imshow(im2,'Parent',app.UIAxes2)

## Morphological operations
se= strel('cube',10);
c=imclose(a,se);
d=imopen(a,se);
e=imerode(a,se);
f=imdilate(a,se);


## Saturation
a = imread()
HSV = rgb2hsv(a)
[h, s, v] = imsplit(HSV)
saturation_factor = 2
S_saturation = s*saturation_factor
hsv_saturation = cat(3, h, S_saturation, v)
Saturated = rgb2hsv(hsv_saturation)
imshow(Saturated)

## Kmeans Segmentation
[L,Centers] = imsegkmeans(I,4);
B = labeloverlay(I,L);
imshow(B)

## MultiLevel Thresholing
level = multithresh(I);
seg_I = imquantize(I,level);

thresh = multithresh(I,2);
seg_I = imquantize(I,thresh);
RGB = label2rgb(seg_I); 

## Grey Thres
level = graythresh(I)
BW = imbinarize(I,level);

	 
