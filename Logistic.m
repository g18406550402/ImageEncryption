function s = Logistic( n )
%UNTITLED ԭʼ��Logistic���صĻ��������ڣ�0��1��֮��,�Ľ����Logistic���صĻ��������ڣ�-1��1��֮��
%   �˴���ʾ��ϸ˵��
u=3.84;
t=900;
y=zeros(1,n+t);
y(1)=0.1;
for i=1:n-1+t
    y(i+1)=u*y(i)*(1-y(i));
end
y=y(t+1:end);
%�Ľ���Logistic
a=1.5;
z=zeros(1,n+t);
z(1)=0.1;
for i=1:n-1+t
    z(i+1)=1-a*z(i)^2;
end
z=z(t+1:end);
s=y;
end

