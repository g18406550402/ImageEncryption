clc;%清除当前command区域的命令
clear;%清空环境变量
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
figure(1);imshow(P);
[M,N] = size(P);P = double(P);%转换为数值型的量
n = M*N;
s=ChaoticSequence(n);
X=mod(floor((s+100)*10^10),M*N)+1;
A=P(:);%将二维图像展成一维向量
for i=1:M*N
    t=A(i);A(i)=A(X(i));A(X(i))=t;
end
A=reshape(A,M,N);
figure(2);imshow(uint8(A));
A=A(:);
for i=M*N:-1:1
    t=A(i);A(i)=A(X(i));A(X(i))=t;
end
A=reshape(A,M,N);
figure(3);imshow(uint8(A));