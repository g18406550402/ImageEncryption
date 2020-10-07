clc;%清除当前command区域的命令
clear;%清空环境变量
P1 = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
[M,N]=size(P1);
x0=rand(1,200)*80-40;y0=rand(1,200)*80-40;
z0=rand(1,200)*80+1;w0=rand(1,200)*500-250;
nubLe=zeros(1,3);
for i=1:10
    K=[x0(i) y0(i) z0(i) w0(i)];
    %加密
    C1=TpEncrypt(P1,K);
    
    ix=mod(floor(rand*10^8),M)+1;iy=mod(floor(rand*10^8),N)+1;
    %改变某像素点的值
    P1N=P1;P1N(ix,iy)=mod(P1N(ix,iy)+1,256);
    %加密
    C1N=TpEncrypt(P1N,K);
    
    nubLe=nubLe+NPCRUACIBACI(C1,C1N);
end
nubLe=nubLe/10;