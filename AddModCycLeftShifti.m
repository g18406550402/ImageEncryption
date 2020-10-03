clc;clear;close all;
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%ͼ��������������ѡ�ͼ��չʾ�򣬽���Χ��ͼ��
figure(1);imshow(P);
[M,N] = size(P);P = double(P);%ת��Ϊ��ֵ�͵���
n = 2*M*N;
x0 = 1.1; y0 = 2.2; z0 = 3.3; w0 = 4.4;
a = 10;b = 8/3;c = 28;r = -1;h = 0.00002;t = 800;
s = zeros(1,n);
p=0;
for i = 1:n+t
    K11 = a*(y0-x0)+w0;
    K12 = a*(y0-x0+K11*h/2)+w0;
    K13 = a*(y0-x0+K12*h/2)+w0;
    K14 = a*(y0-x0+K13*h)+w0;
    x1 = x0+(K11+K12+K13+K14)*h/6;
    
    K21 = c*x1-y0-x1*z0;
    K22 = c*x1-(y0+K21*h/2)-x1*z0;
    K23 = c*x1-(y0+K22*h/2)-x1*z0;
    K24 = c*x1-(y0+K23*h)-x1*z0;
    y1 = y0+(K21+K22+K23+K24)*h/6;
    
    K31 = x1*y1-b*z0;
    K32 = x1*y1-b*(z0+K31*h/2);
    K33 = x1*y1-b*(z0+K32*h/2);
    K34 = x1*y1-b*(z0+K33*h);
    z1 = z0 + (K31+K32+K33+K34)*h/6;
    
    K41 = -y1*z1+r*w0;
    K42 = -y1*z1+r*(w0+K41*h/2);
    K43 = -y1*z1+r*(w0+K42*h/2);
    K44 = -y1*z1+r*(w0+K43*h);
    w1 = w0+(K41+K42+K43+K44)*h/6;
    
    x0=x1;y0=y1;z0=z1;w0=w1;
   if i>t
        s(i-t)=x1;
        if mod((i-t),3000) == 0
            x0 = x0 +h*sin(y0);
        end
    end
end
S = mod(floor(s*pow2(16)),256);%��Ϊ��Ҫ���������Ҫ����ֵ��С������0-255֮��
S1 = S(1:M*N);S2 = S(M*N + 1:2*M*N);
B = zeros(M,N);C=zeros(M,N);
tic;
%�����ȡģѭ������
A=P(:);B0=0;B(1)=mod(B0+S1(1)+A(1),256);
B(1)=BitCircShift(B(1),mod(B0,8));
for i=2:M*N
    B(i)=mod(B(i-1)+S1(i)+A(i),256);
    B(i)=BitCircShift(B(i),mod(B(i-1),8));
end
%�����ȡģѭ������
C0=0;C(M*N)=mod(B(M*N)+C0+S2(M*N),256);
C(M*N)=BitCircShift(C(M*N),mod(C0,8));
for i=M*N-1:-1:1
    C(i)=mod(C(i+1)+S2(i)+B(i),256);
    C(i)=BitCircShift(C(i),mod(C(i+1),8));
end
C=reshape(C,M,N);
toc;
figure(2);imshow(uint8(C));

A=C(:);D=zeros(M,N);E=zeros(M,N);
D0=0;A(M*N)=BitCircShift(A(M*N),-mod(D0,8));
D(M*N) = mod(2*256-D0-S2(M*N)+A(M*N),256);
for i=M*N-1:-1:1
    D(i)=BitCircShift(A(i),-mod(A(i+1),8));
    D(i) = mod(2*256-A(i+1)-S2(i)+D(i),256);
end
E0 = 0;
E(1)=BitCircShift(D(1),-mod(E0,8));
E(1) = mod(2*256-E0-S1(1)+E(1),256);
for i =2:M*N
    E(i)=BitCircShift(D(i),-mod(D(i-1),8));
    E(i) = mod(2*256-D(i-1)-S1(i)+E(i),256);
end
E=reshape(E,M,N);figure(3);imshow(uint8(E));