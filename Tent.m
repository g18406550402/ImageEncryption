function  s  = Tent( n )
%TENT ��������ȡֵ��(0,1)֮��
%   �˴���ʾ��ϸ˵��
p=0.3;
x=zeros(1,n);
x(1)=0.32;
for i=1:n
    if (x(i)>=0&&x(i)<p)
        x(i+1)=x(i)/p;
    elseif x(i)>p&&x(i)<=1
        x(i+1)=(1-x(i))/(1-p);
    end
end
s=x;
end

