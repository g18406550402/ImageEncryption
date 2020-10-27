%Lorenz
%x'=a*(y-x)
%y'=c*x-y-x*z
%z'=x*y-b*z
clc;clear;close all;
%ÏàÍ¼
% n=200000;
% x = zeros(1,n);y = zeros(1,n);z = zeros(1,n);
% x(1,1)=1.1;y(1,1)=2.2;z(1,1)=3.3;
% a = 10;b = 8/3;c = 28;h = 0.002;
% for i=2:n
%     [x(i),y(i),z(i)]=RungeKuttaofLorenz(x(i-1),y(i-1),z(i-1),a,b,c,h);
% end
% figure(1);plot(x,y);
% xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% 
% figure(2);plot(x,z);
% xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% 
% figure(3);plot(y,z);
% xlabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% 
% figure(4);plot3(x,y,z);
% xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% zlabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);

%·Ö²íÍ¼
n=200;t=50;
x = zeros(1,n+t);y = zeros(1,n+t);z = zeros(1,n+t);
x(1,1)=1.1;y(1,1)=2.2;z(1,1)=3.3;
a = 10;b = 8/3;c = 28;h = 0.002;
N=100;
a = ones(1,N)*a;
b = ones(1,N)*b;
c = linspace(-10,30,N);
for j=1:N
    for i=2:n+t
        [x(i),y(i),z(i)]=RungeKuttaofLorenz(x(i-1),y(i-1),z(i-1),a(j),b(j),c(j),h);
        if i>t
            hold on;
            plot(c(j),z(i));
        end
    end
    j
end
%axis([-20,40,-50,100]);
xlabel('c','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('z','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);

%LEÍ¼
%%LE=LEofLorenzMap(-10,20,1);
% N=10;
% a=10;b=8/3;c=28;
% a=ones(1,N)*a;
% b=ones(1,N)*b;
% c=linspace(0,40,N);
% LE=zeros(3,N);
% for i=1:N
%     [T,Res]=lyapunov(3,@lorenz_ext,@ode45,0,0.5,50,[0 1 0],a(i),b(i),c(i));
%     LE(1,i)=Res(end,1);
%     LE(2,i)=Res(end,2);
%     LE(3,i)=Res(end,3);
%     i
% end
% plot(c,LE(1,:),c,LE(2,:),c,LE(3,:),'.-','Markersize',2);
% title('Dynamics of Lyapunov exponents');
% xlabel('c'); ylabel('Lyapunov exponents');