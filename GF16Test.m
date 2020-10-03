clc;%清除当前command区域的命令
clear;%清空环境变量
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
figure(1);imshow(P);
[M,N] = size(P);P = double(P);%转换为数值型的量
n = M*N;
s=ChaoticSequence(n);
S=mod(floor(s*pow2(16)),256);
SH=floor(S(1:M*N)/pow2(4));SL=mod(S(1:M*N),pow2(4));%混沌序列高低位
%PH1=floor(P(1)/pow2(4));PL1=mod(P(1),pow2(4));
PH=floor(P(1:M*N)/pow2(4));PL=mod(P(1:M*N),pow2(4));%明文图高低位
CH=zeros(1,M*N);CL=zeros(1,M*N);%密图高低位
CH0=0;CL0=0;

CH(1)=bitxor(bitxor(CH0,SH(1)),PH(1));
CL(1)=bitxor(bitxor(CL0,SL(1)),PL(1));
C=zeros(M,N);
C(1)=CH(1)*16+CL(1);
for i=2:M*N
    
    CH(i)=bitxor(bitxor(CH(i-1),SH(i)),PH(i));
    CL(i)=bitxor(bitxor(CL(i-1),SL(i)),PL(i));
    C(i)=CH(i)*16+CL(i);
end
figure(2);imshow(uint8(C));

  for i=2:M*N
    
      PH(i)=bitxor(bitxor(CH(i-1),SH(i)),CH(i));
      PL(i)=bitxor(bitxor(CL(i-1),SL(i)),CL(i));
      P(i)=PH(i)*16+PL(i);
  end
  figure(3);imshow(uint8(P));
