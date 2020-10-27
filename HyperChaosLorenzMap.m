clc;clear;close all;
%ÏàÍ¼
% n=100000;
% x = zeros(1,n);y = zeros(1,n);z = zeros(1,n);w = zeros(1,n);
% x(1,1)=1.1;y(1,1)=2.2;z(1,1)=3.3;w(1,1)=4.4;
% a = 10;b = 8/3;c = 28;r=-1;h = 0.002;
% for i=2:n
%     [x(i),y(i),z(i),w(i)]=RungeKuttaofHyperChaosLorenz(x(i-1),y(i-1),z(i-1),w(i-1),a,b,c,r,h);
% end
% figure(1);plot3(y,z,w);
% xlabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% zlabel('w_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);

%·Ö²íÍ¼
n=200;t=50;
x = zeros(1,n+t);y = zeros(1,n+t);z = zeros(1,n+t);w = zeros(1,n);
x(1,1)=1.1;y(1,1)=2.2;z(1,1)=3.3;w(1,1)=4.4;
a = 10;b = 8/3;c = 28;r=-1;h = 0.002;
N=100;
a = ones(1,N)*a;
b = ones(1,N)*b;
c = ones(1,N)*c;
r = linspace(-10,20,N);
for j=1:N
    for i=2:n+t
        [x(i),y(i),z(i),w(i)]=RungeKuttaofHyperChaosLorenz(x(i-1),y(i-1),z(i-1),w(i-1),a(j),b(j),c(j),r(j),h);
        if i>t
            hold on;
            plot(r(j),w(i));
        end
    end
    j
end
%axis([-10,20,-50,50]);
xlabel('r','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('w','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);


%LEÍ¼
% N=100;
% a=10;b=8/3;c=28;r=-1;
% a=ones(1,N)*a;
% b=ones(1,N)*b;
% c=ones(1,N)*c;
% r=linspace(-10,0,N);
% LE=zeros(3,N);
% for i=1:N
%     [T,Res]=lyapunov(4,@HyperChaosLorenz_ext,@ode45,0,0.5,50,[0 1 0 0],a(i),b(i),c(i),r(i));
%     LE(1,i)=Res(end,1);
%     LE(2,i)=Res(end,2);
%     LE(3,i)=Res(end,3);
%     LE(4,i)=Res(end,4);
%     i
% end
% plot(r,LE(1,:),r,LE(2,:),r,LE(3,:),r,LE(4,:),'.-','Markersize',2);
% hold on;
% plot([-10,0],[0,0],'.-k');
% title('Dynamics of Lyapunov exponents');
% xlabel('c'); ylabel('Lyapunov exponents');