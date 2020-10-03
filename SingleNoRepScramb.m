clc;%�����ǰcommand���������
clear;%��ջ�������
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%ͼ��������������ѡ�ͼ��չʾ�򣬽���Χ��ͼ��
figure(1);imshow(P);
[M,N] = size(P);P = double(P);%ת��Ϊ��ֵ�͵���
n = M+N;
s=ChaoticSequence(n);
X=mod(floor((s(1:M)+100)*10^10),M)+1;
[~,idx]=unique(X);L=length(idx);X1=zeros(1,M);
X1(1:length(idx))=X(sort(idx));
X1(length(idx)+1:M)=setdiff(1:M,X1);X=X1;

Y=mod(floor((s(1:N)+100)*10^10),M)+1;
[~,idy]=unique(Y);L=length(idy);Y1=zeros(1,N);
Y1(1:length(idy))=Y(sort(idy));
Y1(length(idy)+1:N)=setdiff(1:N,Y1);Y=Y1;

for i=1:floor(M/2)
    t=P(X(i),:);P(X(i),:)=P(X(M-i+1),:);P(X(M-i+1),:)=t;
end
figure(2);imshow(uint8(P));
B=P;
for j=1:floor(N/2)
    t=B(:,Y(j));B(:,Y(j))=B(:,Y(N-j+1));B(:,Y(N-j+1))=t;
end
figure(3);imshow(uint8(B));

