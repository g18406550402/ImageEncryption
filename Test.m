clc;clear;close all;

figure(1);P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%ͼ��������������ѡ�ͼ��չʾ�򣬽���Χ��ͼ��
figure(1);imshow(P);
tic;C=TpEncrypt(P);toc;
tic;P1=TpDecrypt(C);toc