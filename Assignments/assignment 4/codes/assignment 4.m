Img = imread('kobe.png');
Img = rgb2gray(Img);
Img = imresize(Img,[256 256]);
figure,imshow(Img);

I = im2double(Img);
figure,imshow(I);

[row,col] = size(I);
x = row+4;
y = col+4;
R = uint8(zeros(x,y));
disp(x);
disp(y);
R(3:x-2, 3:y-2) = I(1:row,1:col);


prompt = 'Enter the value of sigma: ';
sigma = input(prompt);

fx = [-2 -1 0 1 2;-2 -1 0 1 2; -2 -1 0 1 2; -2 -1 0 1 2; -2 -1 0 1 2 ];
fy = [-2 -2 -2 -2 -2; -1 -1 -1 -1 -1; 0 0 0 0 0; 1 1 1 1 1; 2 2 2 2 2];
p = size(fx,1)-2;
q =size(fy,1)-2;
Exp_comp = -(fx.^2+fy.^2)/(2*sigma*sigma);
Kernel= exp(Exp_comp)/(2*pi*sigma*sigma);
Output=zeros(size(R));
for i = 1:x+4
    for j = 1:y+4
        N = I(i:i+p, j:j+q);
        t = N.*Kernel;
        Output(i,j) = sum(t(:));
    end
end
Output = uint8(Output);
figure,
imshow(Output);