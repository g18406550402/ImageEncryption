%Henon
% %x(n+1)=1-a.*x(n)^2+y(n);
% %y(n+1)=b*x(n);
clc;clear;close all;
% %相图
% a=1.4;
% b=0.3;
% N=10000;
% x=zeros(1,N);
% y=zeros(1,N);
% x(1)=0.5;y(1)=0.5;
% for i=1:N-1
%     x(i+1)=1-a.*x(i)^2+y(i);
%     y(i+1)=b*x(i);
% end
% plot(x,y,'ok','markersize',2);
% grid on;
% %axis([-1.5,1.5,-0.5,0.4]);
% xlabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('y','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
%分岔图
% a=1.4;b=0.1;N=100;
% a=linspace(0.5,2,N);
% b=ones(1,N)*b;
% for i=1:N
%    x0=0.5;
%    y0=0.5;
%    for j=1:200
%        x1=1-a(i)*x0^2+y0;
%        y1=b(i)*x0;
%        if j>100
%            hold on;
%            plot(a(i),y1,'.','markersize',2);
%        end
%        x0=x1;
%        y0=y1;
%    end
%    i
% end
% axis([-0.5,2,-0.5,0.5]);
% xlabel('a','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('y','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% hold off;

%LE图
LE=LEofHenonMap(-0.2,1.5,0.01);

% %固定a,b时，x,y的变化
% a=1.4;
% b=0.3;
% N=10000;
% x=zeros(1,N);
% y=zeros(1,N);
% t=(0:1:N-1);
% x(1)=0.23;y(1)=0.4;
% for i=1:N-1
%     x(i+1)=1-a.*x(i)^2+y(i);
%     y(i+1)=b*x(i);
% end
% plot(t,y,'.','markersize',2);
% grid on;
% %axis([1,N,0,50]);
% xlabel('迭代次数','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('y','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);

%x,y微小改变后差图像
% grid on;
% N=100;
% t=(0:1:N-1);
% a=1.4;b=0.3;
% x=zeros(2,N);
% cha=zeros(1,N);
% x(1,1)=0.3;x(2,1)=0.3;
% y(1,1)=0.4;y(2,1)=0.40001;
% for i=1:N-1
%     x(1,i+1)=1-a.*x(1,i)^2+y(1,i);
%     y(1,i+1)=b*x(1,i);
%     x(2,i+1)=1-a.*x(2,i)^2+y(2,i);
%     y(2,i+1)=b*x(2,i);
%     cha(i)=y(2,i)-y(1,i);
% end
% 
% plot(t,cha,'-ob','Markersize',2);
% %legend('μ取定值');   %右上角标注
% xlabel('迭代次数')  %x轴坐标描述
% ylabel('y差值') %y轴坐标描述

%x,y分布情况
% a=1.4;
% b=0.3;
% N=5000;
% preIteration=100;
% x=zeros(1,N+preIteration);
% y=zeros(1,N+preIteration);
% x(1)=0.3;y(1)=0.4;
% for i=1:N-1+preIteration
%     x(i+1)=1-a.*x(i)^2+y(i);
%     y(i+1)=b*x(i);
% end
% x=x(preIteration+1:end);
% y=y(preIteration+1:end);
% %x分布
% % fenbu=zeros(1,300);
% % for i=1:N
% %     for j=1:300
% %         if x(i)>=-1.5+(j-1)*0.01&&x(i)<-1.5+j*0.01
% %             fenbu(j)=fenbu(j)+1;
% %         end
% %     end
% % end
% % bar([-1.495:0.01:1.495],fenbu);
% % xlabel('区间'),ylabel('频数') ;title('x分布情况');grid on; %设置x轴和y轴的名称，bar标题
% % y分布
% fenbu=zeros(1,100);
% for i=1:N
%     for j=1:100
%         if x(i)>=-0.5+(j-1)*0.01&&x(i)<-0.5+j*0.01
%             fenbu(j)=fenbu(j)+1;
%         end
%     end
% end
% bar([-0.495:0.01:0.495],fenbu);
% xlabel('区间'),ylabel('频数') ;title('y分布情况');grid on; %设置x轴和y轴的名称


