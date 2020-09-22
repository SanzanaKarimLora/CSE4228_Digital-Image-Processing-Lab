%1. Take your RGB photo 
img = imread('Lora_1.jpg');
img = imresize(img,[256 256]);
imgDouble = im2double(img);
figure(1);
imshow(img);

%2. Make it a grayscale image, say I 
I = rgb2gray(img);
figure(2);
imshow(I);
[row,col] = size(I);

%3. Calculate and plot histogram of image I 
histI = zeros(1,row);
for i = 1:row
    for j = 1:col
        for k = 0:255
            if(I(i,j) == k)
                histI(k+1) = histI(k+1) + 1;
            end
        end
    end
end

figure(3);
subplot(5,2,1),
imshow(I);
title('Gray Scale');
subplot(5,2,2), 
bar(histI);

%4. Take gamma value input from user, say Y = 2.5 
gammaI = zeros(row,col);
gamma = 2.5;

%5. Apply Power Law Transformation on image I with c = 1.5 
c = 1.5;
for i = 1:row
    for j = 1:col
        r = imgDouble(i,j);
        gammaI(i,j) = c * (r.^gamma);
    end
end

gammaI = uint8(255 * gammaI);

%6. Calculate and plot histogram of the Power Law transformed image 
histGammaI = zeros(1,row);
for i = 1:row
    for j = 1:col
        for k = 0:255
            if(gammaI(i,j) == k)
                histGammaI(k+1) = histGammaI(k+1) + 1;
            end
        end
    end
end

figure(3);
subplot(5,2,3),
imshow(gammaI);
title('Power Law transformed image');
subplot(5,2,4), 
bar(histGammaI);

%7. Take a threshold value input from user, say A = 200
A = 200;
imgBright = uint8(zeros(row,col));

%8. Increase brightness by 50% for pixels with intensity smaller than A; else decrease it by 25% of image I 
for i = 1:row
    for j = 1:col
        r = I(i,j);
        if(img(i,j) < A)
            imgBright(i,j) = r + (0.5 *r);
        else
            imgBright(i,j) = r - (0.25 * r);
        end
    end
end


%9. Calculate and plot histogram of the thresholded image
histBright = zeros(1,row);
for i = 1:row
    for j = 1:col
        for k = 0:255
            if(imgBright(i,j) == k)
                histBright(k+1) = histBright(k+1) + 1;
            end
        end
    end
end

figure(3);
subplot(5,2,5),
imshow(imgBright);
title('Increase-Decrease brightness');
subplot(5,2,6), 
bar(histBright);

%10. Apply Log Transformation on image I with c = 1.9 
imgLog = zeros(row,col);
c = 1.9;
for i = 1:row
    for j = 1:col
        r = imgDouble(i,j);
        imgLog(i,j) = c*log(r + 1);
    end
end
imgLog = uint8(255 * imgLog);

%11. Calculate and plot histogram of the log transformed image 
histLogI = zeros(1,row);
for i = 1:row
    for j = 1:col
        for k = 0:255
            if(imgLog(i,j) == k)
                histLogI(k+1) = histLogI(k+1) + 1;
            end
        end
    end
end

figure(3);
subplot(5,2,7),
imshow(imgLog);
title('log transformed image');
subplot(5,2,8), 
bar(histLogI);

%12. Apply Negation Transformation on I 
imgNeg = uint8(zeros(row,col));
for i = 1:row
    for j = 1:col
        imgNeg(i,j) = 255 - I(i,j);
    end
end

%13. Calculate and plot histogram of the negative image 
histNeg = zeros(1,row);
for i = 1:row
    for j = 1:col
        for k = 0:255
            if(imgNeg(i,j) == k)
                histNeg(k+1) = histNeg(k+1) + 1;
            end
        end
    end
end

figure(3);
subplot(5,2,9),
imshow(imgNeg);
title('Negative image');
subplot(5,2,10), 
bar(histNeg);

%14. Understand the histograms, differences, their indications. 
figure(4);
subplot(3,2,1);
imhist(I);
title('Gray Scale');

subplot(3,2,2);
imhist(gammaI);
title('Power Law');

subplot(3,2,3);
imhist(imgBright);
title('Threshold');

subplot(3,2,4);
imhist(imgLog);
title('Log Transformation');

subplot(3,2,5);
imhist(imgNeg);
title('Negative');



