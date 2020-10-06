function  s  = Tent( n )
%TENT 混沌序列取值在(0,1)之间
%   此处显示详细说明
p=0.3;
x=zeros(1,n);
x(1)=0.32;
for i=1:n-1
    if (x(i)>=0&&x(i)<p)
        x(i+1)=x(i)/p;
    elseif x(i)>p&&x(i)<=1
        x(i+1)=(1-x(i))/(1-p);
    end
end
s=x;
end

