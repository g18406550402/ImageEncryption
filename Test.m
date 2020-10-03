clc;clear;close all;

figure(1);P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
figure(1);imshow(P);
tic;C=TpEncrypt(P);toc;
tic;P1=TpDecrypt(C);toc