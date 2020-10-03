function s = Logistic( n )
%UNTITLED 原始的Logistic返回的混沌序列在（0，1）之间,改进后的Logistic返回的混沌序列在（-1，1）之间
%   此处显示详细说明
u=4;
y=zeros(1,n);
y(1)=0.32;
for i=1:n
    y(i+1)=u*y(i)*(1-y(i));
end

%改进的Logistic
a=2;
z=zeros(1,n);
z(1)=0.32;
for i=1:n
    z(i+1)=1-a*z(i)^2;
end
s=z;
end

