function [ x1,y1,z1,w1 ]  = RungeKuttaofHyperChaosLorenz( x0,y0,z0,w0,a,b,c,r,h )
%RUNGEKUTTAOFHYPERCHAOSLORENZ �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
K11 = a*(y0-x0)+w0;
    K12 = a*(y0-(x0+K11*h/2))+w0;
    K13 = a*(y0-(x0+K12*h/2))+w0;
    K14 = a*(y0-(x0+K13*h))+w0;
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

end

