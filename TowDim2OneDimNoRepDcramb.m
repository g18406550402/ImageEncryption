clc;%�����ǰcommand���������
clear;%��ջ�������
close all;
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%ͼ��������������ѡ�ͼ��չʾ�򣬽���Χ��ͼ��
%figure(1);imshow(P);
[M,N] = size(P);P = double(P);%ת��Ϊ��ֵ�͵���

%���ϵ��
%r1=ImCoef(P,2000);

n = M*N;
s=ChaoticSequence(n);



X=mod(floor((s+100)*10^10),M*N)+1;
[~,idx]=unique(X);L=length(idx);X1=zeros(1,n);
X1(1:L)=X(sort(idx));
X1(L+1:n)=setdiff(1:n,X1);
X=X1;
A=P(:);
tic;
for i=1:floor(n/2)
    t=A(X(i));A(X(i))=A(X(n-i+1));A(X(n-i+1))=t;
end
toc;
A=reshape(A,M,N);

figure;imshow(uint8(A));
%ͼ��ֱ��ͼ
%figure;hist(A(:),256);set(gca,'fontsize',18);
%ֱ��ͼx^2����
%fp2=hist(A(:),256);g=M*N/256;chai2=sum((fp2-g).^2)/g;
%���ϵ��
%r2=ImCoef(A,2000);
%NPCRUACIBACI����

nu=NPCRUACIBACI(P,A);

tic;
for i=floor(n/2):-1:1
    t=A(X(i));A(X(i))=A(X(n-i+1));A(X(n-i+1))=t;
end
toc;
A=reshape(A,M,N);
%figure(3);imshow(uint8(A));

%ͼ��ֱ��ͼ
%figure(2);hist(A(:),256);set(gca,'fontsize',18);

%�Ƚϻ�ԭ���ͼ��ԭͼ�Ĳ��
% sum=0;
% for i=1:M*N
%     sum=sum+P(i)-A(i);
% end