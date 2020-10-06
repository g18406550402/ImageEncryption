function s = ChaoticSeq (n)
s=zeros(1,n);num=600;
y0 = [1.1,2.2,3.3];
[t,y] = ode45('Chen_diff',[0,3500],y0);

% 系统吸引子图像
% figure(1);plot(y(:,1),y(:,2));
% xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% 
% figure(2);plot(y(:,1),y(:,3));
% xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% 
% figure(3);plot(y(:,2),y(:,3));
% xlabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% 
% figure(4);plot3(y(:,3),y(:,2),y(:,1));
% xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% ylabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% zlabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
% set(gca,'FontName','Times New Roman','FontSize',16);
% 
%生成混沌序列
 for i=1:n+num
     if i>num
     s(i-num)=y(i,1);
     end
 end
 end
