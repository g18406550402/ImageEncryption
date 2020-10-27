clc;clear;
% %Tent(1)映射的函数图像
% 
% u=1.2;
% x=linspace(-100,100,1000);
% y=zeros(1,1000);
% %axis([0,1,0,2]);
% for i=1:1000
%      if x(i)<0.5           
%            y(i)=u*x(i);  
%     elseif x(i)>=0.5                
%            y(i)=u*(1-x(i));
%     end
% end
% 
% figure(1);
% plot(x,y);
% grid on
% xlabel('x(n)','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('x(n+1)','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);

%Tent(2)映射的函数图像
% p=0.3;
% x=linspace(0,1,1000);
% y=zeros(1,1000);
% for i=1:1000
%     if (x(i)<p)
%         y(i)=x(i)/p;
%     elseif x(i)>p
%         y(i)=(1-x(i))/(1-p);
%     end
% end
% figure(1);plot(x,y);
% grid on
% xlabel('x(n)','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('x(n+1)','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);

%Tent映射分岐图
% %第一种
% figure(1);
% grid on;
% axis([-2.5,2.5,-1.5,2.5]);
% u=linspace(-2,-1,100);
% for i=1:100
%     x0=-1;
%     for j=1:200
%         if x0<0.5           
%                x1=u(i)*x0;  
%         elseif x0>=0.5                
%                x1=u(i)*(1-x0);
%         end
%         if j>100
%             hold on;
%             plot(u(i),x1,'.','MarkerSize',2);
%         end
%         x0=x1;
%     end
%     
%     i
% end
% xlabel('μ','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% hold off;

%第二种
% figure(1);
% grid on;
% axis([0,1,0,1]);
% p=linspace(0,1,1000);
% for i=1:1000
%     x0=0.3;
%     for j=1:500
%         if x0<p(i)
%             x1=x0/p(i);
%         elseif x0>p(i)
%             x1=(1-x0)/(1-p(i));
%         end
%         if j>100
%             hold on;
%             plot(p(i),x1,'.','MarkerSize',2);
%         end
%         x0=x1;
%     end
%     
%     i
% end
% xlabel('p','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% hold off;

%Tent（1）映射LE图
% figure(2)
% grid on;
% axis([-2.5,2.5,-5,5]);
% LE=LEofTentMap(-2.5,2.5,0.001);
% xlabel('μ','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('LE','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% %将LE于u对应
% LE1=zeros(2,5001);
% LE1(1,:)=(-2.5:0.001:2.5);
% LE1(2,:)=LE;

%Tent（2）映射LE图
% figure(2)
% grid on;
% axis([-0.5,1.5,-1.5,1.5]);
% LE=LEofTentMap(-0.5,1.5,0.001);
% xlabel('p','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('LE','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% %将LE于u对应
% LE1=zeros(2,2001);
% LE1(1,:)=(-0.5:0.001:1.5);
% LE1(2,:)=LE;

%Tent(1)μ取定值时，x的取值范围
% figure(3);
% grid on;
% %axis([0,1,0,1]);%确定x轴与y轴框图大小
% t=1:1:100;
% u=-1.7;
% x=zeros(1,100);
% x(1)=1;
% for i=1:99
%     if x(i)<0.5
%         x(i+1)=u*x(i);
%     elseif x(i)>=0.5
%         x(i+1)=u*(1-x(i));
%     end
% end
% plot(t,x,'o','Markersize',2);
% %set(gca,'XTick',[0:100:1000]) %x轴范围1-6，间隔1
% %set(gca,'YTick',[-1000:100:100]) %y轴范围0-700，间隔100
% %legend('μ取定值');   %右上角标注
% xlabel('迭代次数')  %x轴坐标描述
% ylabel('x值') %y轴坐标描述

%Tent(2)p取定值时，x的取值范围
% figure(3);
% grid on;
% nIterations=10000;
% %axis([0,1,0,1]);%确定x轴与y轴框图大小
% t=1:1:nIterations;
% p=0.7;
% x=zeros(1,nIterations);
% x(1)=0.3;
% for i=1:nIterations-1
%     if x(i)<p
%         x(i+1)=x(i)/p;
%     elseif x(i)>p
%         x(i+1)=(1-x(i))/(1-p);
%     end
% end
% plot(t,x,'.');
% %set(gca,'XTick',[0:100:1000]) %x轴范围1-6，间隔1
% %set(gca,'YTick',[-1000:100:100]) %y轴范围0-700，间隔100
% %legend('μ取定值');   %右上角标注
% xlabel('迭代次数')  %x轴坐标描述
% ylabel('x值') %y轴坐标描述


%Tent(1)x微小改变后差图像
% figure(4);
% grid on;
% %axis([0,1,0,1]);
% t=linspace(1,100,100);
% u=-1.99;
% x=zeros(2,100);
% cha=zeros(1,100);
% x(1,1)=0.3;x(2,1)=0.30001;
% for i=1:100
%     if i<100
%         if x(1,i)<0.5
%             x(1,i+1)=u*x(1,i);
%         elseif x(1,i)>=0.5
%             x(1,i+1)=u*(1-x(1,i));
%         end
%         if x(2,i)<0.5
%             x(2,i+1)=u*x(2,i);
%         elseif x(2,i)>=0.5
%             x(2,i+1)=u*(1-x(2,i));
%         end
%     end
%      cha(i)=x(1,i)-x(2,i);
% end
% 
% plot(t,cha,'-ob','Markersize',2);
% set(gca,'XTick',[0:10:100]) %x轴范围
% %set(gca,'YTick',[-1000:100:100]) %y轴范围
% %legend('μ取定值');   %右上角标注
% xlabel('迭代次数')  %x轴坐标描述
% ylabel('差值') %y轴坐标描述

%Tent(2)x微小改变后差图像
% figure(4);
% grid on;
% %axis([0,1,0,1]);
% t=linspace(1,100,100);
% p=0.6;
% x=zeros(2,100);
% cha=zeros(1,100);
% x(1,1)=0.3;x(2,1)=0.30001;
% for i=1:100
%     if i<100
%         if x(1,i)<p
%             x(1,i+1)=x(1,i)/p;
%         elseif x(1,i)>p
%             x(1,i+1)=(1-x(1,i))/(1-p);
%         end
%         if x(2,i)<p
%             x(2,i+1)=x(2,i)/p;
%         elseif x(2,i)>p
%             x(2,i+1)=(1-x(2,i))/(1-p);
%         end
%     end
%      cha(i)=x(1,i)-x(2,i);
% end
% 
% plot(t,cha,'-ob','Markersize',2);
% set(gca,'XTick',[0:10:100]) %x轴范围
% %set(gca,'YTick',[-1000:100:100]) %y轴范围
% %legend('μ取定值');   %右上角标注
% xlabel('迭代次数')  %x轴坐标描述
% ylabel('差值') %y轴坐标描述

%Tent(1)x分布情况
t=100;
u=-1.8;
x=zeros(1,10100);
x(1)=0.123;
for i=1:10999
    if x(i)<0.5
        x(i+1)=u*x(i);
    elseif x(i)>=0.5
        x(i+1)=u*(1-x(i));
    end
end
x=x(t+1:10100);
fenbu=zeros(1,9);
for i=1:10000
    if x(i)>=-0.75&&x(i)<-0.5
        fenbu(1)=fenbu(1)+1;
    end
    if x(i)>=-0.5&&x(i)<-0.25
        fenbu(2)=fenbu(2)+1;
    end
    if x(i)>=-0.25&&x(i)<0
        fenbu(3)=fenbu(3)+1;
    end
    if x(i)>=0&&x(i)<0.25
        fenbu(4)=fenbu(4)+1;
    end
    if x(i)>=0.25&&x(i)<0.5
        fenbu(5)=fenbu(5)+1;
    end
    if x(i)>=0.5&&x(i)<0.75
        fenbu(6)=fenbu(6)+1;
    end
    if x(i)>=0.75&&x(i)<1
        fenbu(7)=fenbu(7)+1;
    end
     if x(i)>=1&&x(i)<=1.25
         fenbu(8)=fenbu(8)+1;
     end
     if x(i)>=1.25&&x(i)<=1.5
         fenbu(9)=fenbu(9)+1;
     end
%     if x(i)>=1.4&&x(i)<1.7
%         fenbu(9)=fenbu(9)+1;
%     end
%     if x(i)>=1.7&&x(i)<2
%         fenbu(10)=fenbu(10)+1;
%     end
end
fenbu=fenbu/10000*100;
t=(1:1:9);
bar(fenbu);
for i = 1:9
    text(t(i),fenbu(i),num2str(fenbu(i),'%g%%'),...
    'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
end
xlabel('区间'),ylabel('比例') ;title('x分布情况');grid on; %设置x轴和y轴的名称
set(gca,'XTickLabel',{'[-0.75,-0.5)','[-0.5,-0.25)','[-0.25,0)','[0,0.25)','[0.25,0.5)','[0.5,0.75)','[0.75,1)','[1,1.25)','[1.25,1.5)'}) %设置x轴
%set(gca,'XTickLabel',{'[0.1,0.2)','[0.2,0.3)','[0.3,0.4)','[0.4,0.5)','[0.5,0.6)','[0.6,0.7)','[0.7,0.8)','[0.8,0.9]'}) %设置x轴

%Tent(2)x分布情况
% t=100;
% p=0.01;
% x=zeros(1,10000+t);
% x(1)=0.39;
% for i=1:10000+t-1
%     if x(i)<p
%         x(i+1)=x(i)/p;
%     elseif x(i)>p
%         x(i+1)=(1-x(i))/(1-p);
%     end
% end
% x=x(t+1:end);
% fenbu=zeros(1,10);
% for i=1:10000
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
% fenbu=fenbu/10000*100;
% t=(1:1:10);
% bar(fenbu);
% for i = 1:10
%     text(t(i),fenbu(i),num2str(fenbu(i),'%g%%'),...
%     'HorizontalAlignment','center',...
%     'VerticalAlignment','bottom')
% end
% xlabel('区间'),ylabel('比例') ;title('x分布情况');grid on; %设置x轴和y轴的名称
% set(gca,'XTickLabel',{'(0,0.1)','[0.1,0.2))','[0.2,0.3)','[0.3,0.4)','[0.4,0.5)','[0.5,0.6)','[0.6,0.7)','[0.7,0.8)','[0.8,0.9)','[0.9,1)'}) %设置x轴
