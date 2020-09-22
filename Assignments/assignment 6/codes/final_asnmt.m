%%%%% FINAL ASSIGNMENT %%%%%%

% Step 1
a = imread('input.png');
a = rgb2gray(a);
a = im2double(a);

subplot(2,4,1);
imshow(a);
title('Figure (a)');


% Step 2
O = zeros(size(a) + 2);
[x,y] = size(O);
O(2:x-1,2:y-1) = a;

lap=[0 1 0; 
     1 -4 1; 
     0 1 0];

b = zeros(size(O));

for i = 2:x-1
    for j =2:y-1
        Temp = O(i-1:i+1,j-1:j+1).*lap;
        b(i,j)=sum(Temp(:));
    end
end

subplot(2,4,2);
imshow(b,[]);
title('Figure (b)');

% Step 3
c = a - b(2:x-1, 2:y-1);
subplot(2,4,3);
imshow(c);
title('Figure (c)');

% Step 4
sx = [-1 0 1; 
      -2 0 2; 
      -1 0 1];
  
sy = [-1 -2 -1; 
       0 0 0; 
       1 2 1];
  
threshold = 0.1;

p1 = zeros(size(O));
p2 = zeros(size(O));

for i = 2:x-1
    for j =2:y-1
        Temp2 = O(i-1:i+1,j-1:j+1).*sx;
        p1(i,j)=sum(Temp2(:));
    end
end

for i = 2:x-1
    for j =2:y-1
        Temp3 = O(i-1:i+1,j-1:j+1).*sy;
        p2(i,j)=sum(Temp3(:));
    end
end

sobel_image = sqrt(p1.^2 + p2.^2);
for i = 1:x
    for j =1:y
        if(sobel_image(i,j)<threshold)
            sobel_image(i,j)=0;
        end
    end
end

subplot(2,4,4);
imshow(sobel_image(2:x-1,2:y-1));
title('Figure (d)');

% Step 5
avg = [1/25 1/25 1/25 1/25 1/25; 
      1/25 1/25 1/25 1/25 1/25;
      1/25 1/25 1/25 1/25 1/25; 
      1/25 1/25 1/25 1/25 1/25;
      1/25 1/25 1/25 1/25 1/25];

O2=zeros(size(sobel_image)+2);
[x,y]=size(O2);
O2(2:x-1,2:y-1) = sobel_image;

avg_img = zeros(size(O2));
  
for i = 3:x-2
    for j =3:y-2
        Temp4 = O2(i-2:i+2,j-2:j+2).*avg;
        avg_img(i,j)=sum(Temp4(:));
    end
end

e = avg_img(3:x-2,3:y-2);
subplot(2,4,5);
imshow(e);
title('Figure (e)');

% Step 6
f = c.*e;
subplot(2,4,6);
imshow(f);
title('Figure (f)');

% Step 7
g = a+f;
subplot(2,4,7);
imshow(g);
title('Figure (g)');

% Step 8
c = 1;
gamma = 0.5;

[x,y] = size(g);
h = zeros(size(g));
for i = 1:x
    for j =1:y
        h(i,j) = c.*(g(i,j).^gamma);
    end
end

subplot(2,4,8);
imshow(h);
title('Figure (h)');
