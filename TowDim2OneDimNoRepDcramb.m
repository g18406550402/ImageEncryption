clc;%清除当前command区域的命令
clear;%清空环境变量
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
figure(1);imshow(P);
[M,N] = size(P);P = double(P);%转换为数值型的量
n = M*N;
s=ChaoticSequence(n);
X=mod(floor((s+100)*10^10),M*N)+1;
[~,idx]=unique(X);L=length(idx);X1=zeros(1,n);
X1(1:L)=X(sort(idx));
X1(L+1:n)=setdiff(1:n,X1);
X=X1;
A=P(:);
for i=1:floor(n/2)
    t=A(X(i));A(X(i))=A(X(n-i+1));A(X(n-i+1))=t;
end
A=reshape(A,M,N);
figure(2);imshow(uint8(A));
for i=1:floor(n/2)
    t=A(X(i));A(X(i))=A(X(n-i+1));A(X(n-i+1))=t;
end
A=reshape(A,M,N);
figure(3);imshow(uint8(A));
