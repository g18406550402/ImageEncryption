function s = Logistic( n )
%UNTITLED ԭʼ��Logistic���صĻ��������ڣ�0��1��֮��,�Ľ����Logistic���صĻ��������ڣ�-1��1��֮��
%   �˴���ʾ��ϸ˵��
u=4;
y=zeros(1,n);
y(1)=0.1;
for i=1:n-1
    y(i+1)=u*y(i)*(1-y(i));
end

%�Ľ���Logistic
a=2;
z=zeros(1,n);
z(1)=0.1;
for i=1:n-1
    z(i+1)=1-a*z(i)^2;
end
s=z;
end

