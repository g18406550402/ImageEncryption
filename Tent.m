function  s  = Tent( n )
%TENT 混沌序列取值在(0,1)之间
%   此处显示详细说明
t=800;
%第一种
u=1.6;
y=zeros(1,n);
x0=0.3;
for i=1:n+t
    if x0<0.5           
           x1=u*x0;  
    elseif x0>=0.5                
           x1=u*(1-x0);
    end
    if i>t
        y(i-t)=x1;
    end
    x0=x1;
end
%第二种
p=0.49;
z=zeros(1,n);
x0=0.9;
for i=1:n+t
    if x0>=0&&x0<p
        x1=x0/p;
    elseif x0>p&&x0<=1
        x1=(1-x0)/(1-p);
    end
    if i>t
        z(i-t)=x1;
    end
    x0=x1;
end
s=y;
end

