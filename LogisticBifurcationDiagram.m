%x(n+1)=u*x(n)*(1-x(n))
%x(n+1)=1-ux(n)^2
%u in (0,2]
%x in(-1,1);
clc;clear;clear all
%分岔图
% grid on;
% u=linspace(0,4,2000);
% for k=1:2000
%     x0=0.1;                                   %赋初值
%     for p = 1:2000                                
%         xn=u(k)*x0*(1-x0);    
%         if p>100                              %迭代100此以上，描点                         
%             hold on
%             plot(u(k),xn,'.','Markersize',2)
%         end
%         
%         x0=xn;
%     end
%     k
% end
% xlabel('t','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('μ','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
%u=0
%μ取固定值，x的分布情况
% 
% grid on;
% u=3.9;
% t=linspace(0,1,1000);
% x=zeros(1,1001);
% x(1)=0.5;  i=1;
% for k=1:1000
%                                      %赋初值
%     x(i+1)=u*x(i)*(1-x(i));    
%     i=i+1;
%     hold on
%     plot(t(k),x(i),'.','Markersize',2)
%     k
% end
% axis([0,1,0,1]);
% xlabel('t','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);


%x微小改变后系统变化
% u=4;
% t=linspace(0,1,100);
% figure(1);
% grid on;
% x=zeros(2,100);
% x(1,1)=0.3;      x(2,1)=0.30000001;                          %赋初值    
% for k=1:99
%     x(1,k+1)=u*x(1,k)*(1-x(1,k));    
%     x(2,k+1)=u*x(2,k)*(1-x(2,k));
%     cha=x(1,k)-x(2,k);
%     hold on;
%     plot(t(k),cha,'-ob','Markersize',2);
% end
% xlabel('t','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);

%x分布情况
% u=4;
% x=zeros(1,5000);
% t=100;
% x(1)=0.3;                            %赋初值    
% for k=1:4999+t
%     
%     x(k+1)=u*x(k)*(1-x(k));    
%     
% end
% x=x(t+1:5100);
% fenbu=zeros(1,10);
% for i=1:1:5000
%     if x(i)>=0&&x(i)<0.1
%         fenbu(1)=fenbu(1)+1;
%     end
%     if x(i)>=0.1&&x(i)<0.2
%         fenbu(2)=fenbu(2)+1;
%     end
%     if x(i)>=0.2&&x(i)<0.3
%         fenbu(3)=fenbu(3)+1;
%     end
%     if x(i)>=0.3&&x(i)<0.4
%         fenbu(4)=fenbu(4)+1;
%     end
%     if x(i)>=0.4&&x(i)<0.5
%         fenbu(5)=fenbu(5)+1;
%     end
%     if x(i)>=0.5&&x(i)<0.6
%         fenbu(6)=fenbu(6)+1;
%     end
%     if x(i)>=0.6&&x(i)<0.7
%         fenbu(7)=fenbu(7)+1;
%     end
%     if x(i)>=0.7&&x(i)<0.8
%         fenbu(8)=fenbu(8)+1;
%     end
%     if x(i)>=0.8&&x(i)<0.9
%         fenbu(9)=fenbu(9)+1;
%     end
%     if x(i)>=0.9&&x(i)<=1
%         fenbu(10)=fenbu(10)+1;
%     end
% end

%Lypunov指数图
figure(2)
grid on;
LE=LEofLogisticMap(0,4,0.001);
%将LE于λ对应
LE1=zeros(2,4001);
LE1(1,:)=(0:0.001:4);
LE1(2,:)=LE;
Lypn0=zeros(10);
k=1;qujian=zeros(2,1000);
%求最大值点
zuidazhi=zeros(1,1000);

for i=2:4000
    if LE1(2,i)>0.1
        break;
    end
    if LE1(2,i)>LE1(2,i-1)&&LE1(2,i)>LE1(2,i+1)
        zuidazhi(k)=LE1(1,i);
        k=k+1;
    end
end
%周期长度
cycleLength=zeros(1,1000);
for i=1:length(zuidazhi)-1;
    cycleLength(i)=zuidazhi(i+1)-zuidazhi(i);
end
%费根鲍姆常数
feiContant=zeros(1,1000);
for i=1:length(cycleLength)-1;
    feiContant(i)=cycleLength(i)/cycleLength(i+1);
end

%求取正值区间
%k=1;
% for i=1:40000
%     if LE1(2,i)<0&&LE1(2,i+1)>0
%         qujian(1,k)=LE1(1,i+1);
%     end
%     if LE1(2,i)>0&&LE1(2,i+1)<0
%         qujian(2,k)=LE1(1,i);
%         k=k+1;
%     end
% end
% %求LE取正值的区间
%  for i=1:240
%     sprintf('[%.5f,%.5f]',qujian(1,i),qujian(2,i))
%  end
% %求极小值的点
% jixiaozhi=zeros(2,300);
% k=1;
% for i=2:200000
%     if LE1(2,i)<LE1(2,i-1)&&LE1(2,i)<LE1(2,i+1)&&LE1(2,i)<-1
%         jixiaozhi(1,k)=LE1(1,i);
%         jixiaozhi(2,k)=LE1(2,i);
%         k=k+1;
%     end
% end