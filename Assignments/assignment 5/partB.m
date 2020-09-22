%%%%%%%% PART-B%%%%%%


clc;
clear;
close all;

input_img = [0,0,0,0,0,0,0;
         0,0,0,0,0,0,0;
         0,1,0,0,0,1,0;
         0,1,0,1,0,1,0;
         0,1,0,0,0,1,0;
         0,0,1,0,1,0,0;
         0,0,0,0,0,0,0 ];
     
[row, col] = size(input_img);

input_img_padded = zeros(row+2, col+2); 
input_img_padded(2:row+1, 2:col+1) = input_img;
output_img1 = zeros(row+2,col+2);
     
w = [ 1 1 1;
      1 1 1;                    %required structuring element along with its dimension(3x3)
      1 1 1 ];
  
for i = 2 : row+1
    for j = 2 : col+1 
        w1 = [input_img_padded(i-1,j-1)*w(1,1) input_img_padded(i-1,j)*w(1,2) input_img_padded(i-1,j+1)*w(1,3) input_img_padded(i,j-1)*w(2,1) input_img_padded(i,j)*w(2,2) input_img_padded(i,j+1)*w(2,3) input_img_padded(i+1,j-1)*w(3,1) input_img_padded(i+1,j)*w(3,2) input_img_padded(i+1,j+1)*w(3,3)];
        output_img1(i,j) = max(w1);
    end
end

input_img_padded = ones(row+2, col+2);
input_img_padded(2:row+1, 2:col+1) = output_img1(2:row+1, 2:col+1);
output_img2 = zeros(row+2,col+2);


for i = 2 : row+1
    for j = 2 : col+1 
        w1 = [input_img_padded(i-1,j-1)*w(1,1) input_img_padded(i-1,j)*w(1,2) input_img_padded(i-1,j+1)*w(1,3) input_img_padded(i,j-1)*w(2,1) input_img_padded(i,j)*w(2,2) input_img_padded(i,j+1)*w(2,3) input_img_padded(i+1,j-1)*w(3,1) input_img_padded(i+1,j)*w(3,2) input_img_padded(i+1,j+1)*w(3,3)];
        output_img2(i,j) = min(w1);
    end
end

output = zeros(row, col);
output(1:row,1:col) = output_img1(2:row+1, 2:col+1) - output_img2(2:row+1, 2:col+1);

subplot(1, 2, 1); 
imshow(input_img); 
title('Given Image');
subplot(1, 2, 2); 
imshow(output); 
title('Image we want');