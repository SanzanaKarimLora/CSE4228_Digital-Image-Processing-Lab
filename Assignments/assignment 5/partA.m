%%%%%%%% PART-A%%%%%%

clc;
clear;
close all;

input_img = [0 0 0 0 0 0 0;
     0 0 0 0 0 0 0;
     0 0 1 0 1 0 0;
     0 0 1 0 1 0 0;
     0 0 1 1 1 0 0;
     0 0 0 0 0 0 0;
     0 0 0 0 0 0 0];

[row, col] = size(input_img);
img = zeros(row,col);

     
w = [0 1 0;
     1 1 1;                 %required structuring element along with its dimension(3x3)
     0 1 0];

for i = 1 : row - 2
    for j = 1 : col - 2
        w1 =[ input_img(i,j+1)*w(1,2) input_img(i+1,j)*w(2,1) input_img(i+1,j+1)*w(2,2) input_img(i+1,j+2)*w(2,3) input_img(i+2,j+1)*w(3,2)];
        img(i+1,j+1) = max(w1);
    end
end

img = img - input_img;
subplot(1, 2, 1); 
imshow(input_img); 
title('Given Image');
subplot(1, 2, 2);
imshow(img);
title('Image we want');

