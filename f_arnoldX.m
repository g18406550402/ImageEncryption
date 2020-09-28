function [x,y] = f_arnoldX(x1,y1,a,b)
x1=x1-1;y1=y1-1;
tmp = [a*b+1,-a;-b,1]*[x1;y1];
tmp = mod(tmp,512);
x=tmp(1);y=tmp(2);
end
