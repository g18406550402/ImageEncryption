%Arnold
% %x(n+1)=x(n)+a*y(n);
% %y(n+1)=b*x(n)+(1+a*b)*y(n);
clc;clear;close all;
% % %��ͼ
% a=1;
% b=-5;
% N=1000;
% x=zeros(1,N);
% y=zeros(1,N);
% x(1)=0.1;y(1)=0.1;
% for i=1:N-1
%     x(i+1)=mod(x(i)+a*y(i),1);
%     y(i+1)=mod(b*x(i)+(1+a*b)*y(i),1);
% end
% plot(x,y,'.b');
% grid on;
% xlabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('y','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% s=[x;y];
% cycleLength=CalculateCycle(s);
% for i=1:13
%     fprintf('(%d,%d)',s(1,i),s(2,i));
% end

%�ֲ�ͼ
% a=1;b=1;N=11;
% a=linspace(-5,5,N);
% b=ones(1,N)*b;
% Iteration=200;
% s=zeros(2,Iteration);
% cycleLength=zeros(1,N);
% for i=1:N
%     x0=0.23;
%     y0=0.34;
%     s(1,1)=x0;s(2,1)=y0;
%     for j=2:Iteration
%         x1=mod(x0+a(i)*y0,1);
%         y1=mod(b(i)*x0+(1+a(i)*b(i))*y0,1);
%         s(1,j)=x1;s(2,j)=y1;
%         x0=x1;
%         y0=y1;
%     end
%     cycleLength(i)=CalculateCycle(s);
%     i
% end
% xlabel('a','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% hold off;

%�̶�a��b
% a=1;b=-1;N=100;
% x0=0.4;
% y0=0.5;
% t=linspace(0,1,N);
% 
% % for i=1:N
% %     x0=0.4;
% %     y0=0.5;
%     for j=1:10
%         x1=mod(x0+a*y0,1);
%         y1=mod(b*x0+(1+a*b)*y0,1);
% %         hold on;
% %         plot(t(j),x1,'ob','markersize',2);
%         x0=x1;
%         y0=y1;
%     end
% % end
% xlabel('a','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('x','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% hold off;

%LEͼ
%LE=LEofArnoldMap(-14,10,0.1);

%x,y΢С�ı���ͼ��
% grid on;
% N=100;
% t=(0:1:N-1);
% a=1;b=1;
% x=zeros(2,N);
% y=zeros(2,N);
% cha=zeros(1,N);
% x(1,1)=0.1;x(2,1)=0.1;
% y(1,1)=0.1;y(2,1)=0.10001;
% for i=1:N-1
%     x(1,i+1)=mod(x(1,i)+a*y(1,i),1);
%     y(1,i+1)=mod(b*x(1,i)+(1+a*b)*y(1,i),1);
%     x(2,i+1)=mod(x(2,i)+a*y(2,i),1);
%     y(2,i+1)=mod(b*x(2,i)+(1+a*b)*y(2,i),1);
%     cha(i)=sqrt((x(2,i)-x(1,i))^2+(y(2,i)-y(1,i))^2);
% end
% 
% plot(t,cha,'-ob','Markersize',2);
% %legend('��ȡ��ֵ');   %���ϽǱ�ע
% xlabel('��������')  %x����������
% ylabel('�����ľ���') %y����������

%x,y�ֲ����
a=1;
b=1;
N=500000;
preIteration=100;
x=zeros(1,N+preIteration);
y=zeros(1,N+preIteration);
x(1)=0.1;y(1)=0.1;
for i=1:N-1+preIteration
    x(i+1)=mod(x(i)+a*y(i),1);
    y(i+1)=mod(b*x(i)+(1+a*b)*y(i),1);
end
x=x(preIteration+1:end);
y=y(preIteration+1:end);
plot(x,y,'.');
%x�ֲ�
fenbu=zeros(1,100);
for i=1:N
    if y(i)>=0&&y(i)<0.1
        for j=1:10
            if x(i)>=0.1*(j-1)&&x(i)<0.1*j
                fenbu(j)=fenbu(j)+1;
            end
        end
    end
    if y(i)>=0.1&&y(i)<0.2
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(10+j)=fenbu(10+j)+1;
            end
        end
    end
    if y(i)>=0.2&&y(i)<0.3
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(20+j)=fenbu(20+j)+1;
            end
        end
    end
    if y(i)>=0.3&&y(i)<0.4
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(30+j)=fenbu(30+j)+1;
            end
        end
    end
    if y(i)>=0.4&&y(i)<0.5
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(40+j)=fenbu(40+j)+1;
            end
        end
    end
    if y(i)>=0.5&&y(i)<0.6
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(50+j)=fenbu(50+j)+1;
            end
        end
    end
    if y(i)>=0.6&&y(i)<0.7
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(60+j)=fenbu(60+j)+1;
            end
        end
    end
    if y(i)>=0.7&&y(i)<0.8
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(70+j)=fenbu(70+j)+1;
            end
        end
    end
    if y(i)>=0.8&&y(i)<0.9
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(80+j)=fenbu(80+j)+1;
            end
        end
    end
    if y(i)>=0.9&&y(i)<1
        for j=1:10
            if x(i)>=(j-1)*0.1&&x(i)<j*0.1
                fenbu(90+j)=fenbu(90+j)+1;
            end
        end
    end
end
bar([0.005:0.01:0.995],fenbu);
xlabel('����'),ylabel('Ƶ��') ;title('x�ֲ����');grid on; %����x���y������ƣ�bar����
