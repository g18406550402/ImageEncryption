clc;%�����ǰcommand���������
clear;%��ջ�������
P1 = imread('lena.bmp');
iptsetpref('imshowborder','tight');%ͼ��������������ѡ�ͼ��չʾ�򣬽���Χ��ͼ��
[M,N]=size(P1);
x0=rand(1,3)*80-40;y0=rand(1,3)*80-40;
z0=rand(1,3)*80+1;w0=rand(1,3)*500-250;
K1=[x0(1) y0(1) z0(1) w0(1)];

C1=TpEncrypt(P1,K1);
C1=double(C1);
H11=ENTROPY(P1);H12=ENTROPY(C1);