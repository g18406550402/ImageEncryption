x0 = 1.1; y0 = 2.2; z0 = 3.3; w0 = 4.4;
a = 10;b = 8/3;c = 28;r = -1;h = 0.002;t = 800;
n=20000;
xn = zeros(1,n);yn = zeros(1,n);zn = zeros(1,n);wn = zeros(1,n);
for i = 1:n+t
    K11 = a*(y0-x0)+w0;
    K12 = a*(y0-x0-K11*h/2)+w0;
    K13 = a*(y0-x0-K12*h/2)+w0;
    K14 = a*(y0-x0-K13*h)+w0;
    x1 = x0+(K11+K12+K13+K14)*h/6;
    
    K21 = c*x1-y0-x1*z0;
    K22 = c*x1-(y0+K21*h/2)-x1*z0;
    K23 = c*x1-(y0+K22*h/2)-x1*z0;
    K24 = c*x1-(y0+K23*h)-x1*z0;
    y1 = y0+(K21+K22+K23+K24)*h/6;
    
    K31 = x1*y1-b*z0;
    K32 = x1*y1-b*(z0+K31*h/2);
    K33 = x1*y1-b*(z0+K32*h/2);
    K34 = x1*y1-b*(z0+K33*h);
    z1 = z0 + (K31+K32+K33+K34)*h/6;
    
    K41 = -y1*z1+r*w0;
    K42 = -y1*z1+r*(w0+K41*h/2);
    K43 = -y1*z1+r*(w0+K42*h/2);
    K44 = -y1*z1+r*(w0+K43*h);
    w1 = w0+(K41+K42+K43+K44)*h/6;
    
    x0=x1;y0=y1;z0=z1;w0=w1;
   if i>t
        xn(i-t)=x1; yn(i-t)=y1; zn(i-t)=z1; wn(i-t)=w1;
    end
end

figure(1);plot(xn,yn);
xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);

figure(2);plot(xn,zn);
xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);

figure(3);plot(xn,wn);
xlabel('x_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('w_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);

figure(4);plot(yn,zn);
xlabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);

figure(5);plot(yn,wn);
xlabel('y_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('w_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);

figure(6);plot(zn,wn);
xlabel('z_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('w_n','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);
