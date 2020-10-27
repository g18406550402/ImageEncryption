function [ x1,y1,z1 ] = RungeKuttaofLorenz( x0,y0,z0,a,b,c,h )
%L 此处显示有关此函数的摘要
%   此处显示详细说明
K11 = a*(y0-x0);
    K12 = a*(y0-(x0+K11*h/2));
    K13 = a*(y0-(x0+K12*h/2));
    K14 = a*(y0-(x0+K13*h));
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
    
end

