clc;%�����ǰcommand���������
clear;%��ջ�������
P1 = imread('lena.bmp');
iptsetpref('imshowborder','tight');%ͼ��������������ѡ�ͼ��չʾ�򣬽���Χ��ͼ��
[M,N]=size(P1);
x0=rand(1,200)*80-40;y0=rand(1,200)*80-40;
z0=rand(1,200)*80+1;w0=rand(1,200)*500-250;
nubLe=zeros(1,3);
for i=1:10
    K=[x0(i) y0(i) z0(i) w0(i)];
    %����
    C1=TpEncrypt(P1,K);
    
    ix=mod(floor(rand*10^8),M)+1;iy=mod(floor(rand*10^8),N)+1;
    %�ı�ĳ���ص��ֵ
    P1N=P1;P1N(ix,iy)=mod(P1N(ix,iy)+1,256);
    %����
    C1N=TpEncrypt(P1N,K);
    
    nubLe=nubLe+NPCRUACIBACI(C1,C1N);
end
nubLe=nubLe/10;