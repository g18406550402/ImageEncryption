clear;
clc;
y0 = [0,2,9];
[t,y] = ode45('lorenz_diff',[0,200],y0);
plot(y(:,1),y(:,3),'.');
grid on;
