function s = Arnold( n )
%ARNOLD 此处显示有关此函数的摘要
%   此处显示详细说明
a=1;b=1;
s=zeros(2,n);
t=100;
x0=0.1;
y0=0.1;
for i=1:n+t
    x1=mod(x0+a*y0,1);
    y1=mod(b*x0+(1+a*b)*y0,1);
    if i>t
        s(1,i-t)=x1;
        s(2,i-t)=y1;
    end
    x0=x1;
    y0=y1;
end

end

