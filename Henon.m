function s = Henon( n )
%HENON 此处显示有关此函数的摘要
%   此处显示详细说明
a=1.4;b=0.3;
s=zeros(2,n);
t=100;
x0=0.5;
y0=0.4;
for i=1:n+t
    x1=1-a*x0^2+y0;
    y1=b*x0;
    if i>t
        s(1,i-t)=x1;
        s(2,i-t)=y1;
    end
    x0=x1;
    y0=y1;
end
end

