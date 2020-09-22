I1 = imread('Lora_1.jpg');
I1 = imresize(I1,[512 512]);
I1 = rgb2gray(I1);
I2 = imread('Lora_2.jpg');
I2 = imresize(I2,[512 512]);
I2 = rgb2gray(I2);

figure; 
imshow(I1);
figure; 
imshow(I2);

[row,col] = size(I1);
imgSplit = uint8(zeros(row,col));
len = uint8(512/5);
disp(len);
for i = 1:row
    for j = 1:col
        
        if(j>=1 && j<=len)
             imgSplit(i,j) = I1(i,j);
        elseif(j>=(len+1) && j<=(2*len+1))
             imgSplit(i,j) = I2(i,j);
        elseif(j>=(2*len+2) && j<=(3*len+2))
            imgSplit(i,j) = I1(i,j);
        elseif(j>=(3*len+3) && j<=411)
             imgSplit(i,j) = I2(i,j);
        elseif(j>=(4*len+4) && j<=512)
            imgSplit(i,j) = I1(i,j);
        end;
    end;
end;

figure;
imshow(imgSplit);
