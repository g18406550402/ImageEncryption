%TENT ��������ȡֵ��(0,1)֮��
%   �˴���ʾ��ϸ˵��
clc;clear;
p=0.5;
x=linspace(0,1,100);
y=zeros(1,100);
for i=1:100
    if (x(i)>=0&&x(i)<p)
        y(i)=x(i)/p;
    elseif x(i)>p&&x(i)<=1
        y(i)=(1-x(i))/(1-p);
    end

end
figure(i);plot(x,y);
xlabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('y','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);


