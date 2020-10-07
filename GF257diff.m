clc;%清除当前command区域的命令
clear;%清空环境变量
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
%figure(1);imshow(P);

%相关系数
%r1=ImCoef(P,2000);

[M,N] = size(P);P = double(P);%转换为数值型的量
n = 2*M*N;
s=ChaoticSequence(n);

%直方图x^2检验
%fp1=hist(P(:),256);g=M*N/256;chai1=sum((fp1-g).^2)/g;


A=P(:);
%GF257扩散
TBL=GF257Table();S=mod(floor(s*pow2(16)),256);
[TBL1,TBL2]=GF257TableEx();
S1=S(1:M*N);S2=S(M*N+1:2*M*N);B=zeros(1,M*N);C=zeros(1,M*N);
%正向扩散
tic;
B0=0;B(1)=LookUpGF257(B0,S1(1),A(1),TBL);
for i=2:M*N
    B(i)=LookUpGF257(B(i-1),S1(i),A(i),TBL);
end

%逆向扩散
C0=0;C(M*N)=LookUpGF257(C0,S2(M*N),B(M*N),TBL);
for i=M*N-1:-1:1
    C(i)=LookUpGF257(C(i+1),S2(i),B(i),TBL);
end
toc;
C=reshape(C,M,N);%figure;imshow(uint8(C));

%NPCRUACIBACI测试

nu=NPCRUACIBACI(P,C);

%直方图
%figure;hist(C(:),256);set(gca,'fontsize',18);
%直方图x^2检验
%fp2=hist(C(:),256);g=M*N/256;chai2=sum((fp2-g).^2)/g;

%相关系数
%r2=ImCoef(C,2000);

A=C(:);D=zeros(1,M*N);E=zeros(1,M*N);
tic;
A0=0;D(M*N)=LookUpGF257Ex2(A(M*N),A0,S2(M*N),TBL1,TBL2);
for i=M*N-1:-1:1
    D(i)=LookUpGF257Ex2(A(i),A(i+1),S2(i),TBL1,TBL2);
end
E0=0;E(1)=LookUpGF257Ex2(D(1),E0,S1(1),TBL1,TBL2);
for i=2:M*N
    E(i)=LookUpGF257Ex2(D(i),D(i-1),S1(i),TBL1,TBL2);
end
toc;
E=reshape(E,M,N);%figure;imshow(uint8(E));
