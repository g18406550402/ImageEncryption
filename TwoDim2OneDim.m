clc;%�����ǰcommand���������
clear;%��ջ�������
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%ͼ��������������ѡ�ͼ��չʾ�򣬽���Χ��ͼ��
figure(1);imshow(P);
[M,N] = size(P);P = double(P);%ת��Ϊ��ֵ�͵���
n = M*N;
s=ChaoticSequence(n);
X=mod(floor((s+100)*10^10),M*N)+1;
A=P(:);%����άͼ��չ��һά����
for i=1:M*N
    t=A(i);A(i)=A(X(i));A(X(i))=t;
end
A=reshape(A,M,N);
figure(2);imshow(uint8(A));
A=A(:);
for i=M*N:-1:1
    t=A(i);A(i)=A(X(i));A(X(i))=t;
end
A=reshape(A,M,N);
figure(3);imshow(uint8(A));