clc;%�����ǰcommand���������
clear;%��ջ�������
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%ͼ��������������ѡ�ͼ��չʾ�򣬽���Χ��ͼ��
figure(1);imshow(P);

%���ϵ��
r1=ImCoef(P,2000);

[M,N] = size(P);P = double(P);%ת��Ϊ��ֵ�͵���
n = 2*M*N;
s=ChaoticSequence(n);

%ֱ��ͼx^2����
fp1=hist(P(:),256);g=M*N/256;chai1=sum((fp1-g).^2)/g;


A=P(:);
%GF257��ɢ
TBL=GF257Table();S=mod(floor(s*pow2(16)),256);
[TBL1,TBL2]=GF257TableEx();
S1=S(1:M*N);S2=S(M*N+1:2*M*N);B=zeros(1,M*N);C=zeros(1,M*N);
%������ɢ
tic;
B0=0;B(1)=LookUpGF257(B0,S1(1),A(1),TBL);
for i=2:M*N
    B(i)=LookUpGF257(B(i-1),S1(i),A(i),TBL);
end

%������ɢ
C0=0;C(M*N)=LookUpGF257(C0,S2(M*N),B(M*N),TBL);
for i=M*N-1:-1:1
    C(i)=LookUpGF257(C(i+1),S2(i),B(i),TBL);
end
toc;
C=reshape(C,M,N);figure;imshow(uint8(C));
%ֱ��ͼ
figure;hist(C(:),256);set(gca,'fontsize',18);
%ֱ��ͼx^2����
fp2=hist(C(:),256);g=M*N/256;chai2=sum((fp2-g).^2)/g;

%���ϵ��
r2=ImCoef(C,2000);

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
E=reshape(E,M,N);figure;imshow(uint8(E));
