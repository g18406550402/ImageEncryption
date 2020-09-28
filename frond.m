clc;
clear;
P=imread('lena.bmp');
a = 2;
b = 2;
imshow(P);
S=P;
[M,N] = size(P);

    for i=1:M
       for j=1:N
           [x,y] = f_arnold(i-1,j-1,a,b);
           S(x+1,y+1) = P(i,j);
       end
    end

figure; 
imshow(S);

for i=1:M
    for j=1:N
        [x,y] = f_arnold(i-1,j-1,a,b);
        P(i,j) = S(x+1,y+1);
    end
end

%figure; 
%imshow(P);

for i=M:1
    for j=N:1
        [x,y]=f_arnoldX(i-1,j-1,a,b);
        P(x+1,y+1) = S(i,j);
    end
end
figure;
imshow(P);