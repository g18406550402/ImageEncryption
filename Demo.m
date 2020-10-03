clc;%清除当前command区域的命令
clear;%清空环境变量
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
figure(1);imshow(P);
[M,N] = size(P);P = double(P);%转换为数值型的量
n = M+N;
s=ChaoticSequence(n);
