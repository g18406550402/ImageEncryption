function s = Logistic( n )
%UNTITLED 原始的Logistic返回的混沌序列在（0，1）之间,改进后的Logistic返回的混沌序列在（-1，1）之间
%   此处显示详细说明
u=3.84;
t=900;
y=zeros(1,n+t);
y(1)=0.1;
for i=1:n-1+t
    y(i+1)=u*y(i)*(1-y(i));
end
y=y(t+1:end);
%改进的Logistic
a=1.5;
z=zeros(1,n+t);
z(1)=0.1;
for i=1:n-1+t
    z(i+1)=1-a*z(i)^2;
end
z=z(t+1:end);
s=y;
end

