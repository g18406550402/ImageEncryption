clc;clear;
P = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
figure(1);imshow(P);
[M,N] = size(P);P = double(P);%转换为数值型的量
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
TBL = mod((transpose(0:16)*(0:16)),17);

S = mod(floor(s*pow2(16)),256);
S1 = S(1:M*N);S2=S(M*N+1:2*M*N);B=zeros(M,N);C=zeros(M,N);
tic;
A=P(:);
B0=0;b(1)=LookUpGF17(B0,S1(1),A(1),TBL);
for i=2:M*N
    B(i)=LookUpGF17(B(i-1),S1(i),A(i),TBL);
end
C0=0;C(M*N)=LookUpGF17(C0,S2(M*N),B(M*N),TBL);
for i=M*N-1:-1:1
    C(i)=LookUpGF17(C(i+1),S2(i),B(i),TBL);
end
figure(2);imshow(uint8(C));

A=C(:);D=zeros(M,N);E=zeros(M,N);
A0=0;D(M*N)=LookUpGF17Ex(A(M*N),A0,S2(M*N),TBL);
for i=M*N-1:-1:1
    D(i)=LookUpGF17Ex(A(i),A(i+1),S2(i),TBL);
end
E0=0;E(1)=LookUpGF17Ex(D(1),E0,S1(1),TBL);
for i=2:M*N
    E(i)=LookUpGF17Ex(D(i),D(i-1),S1(i),TBL);
end
E=reshape(E,M,N);figure(3);imshow(uint8(E));