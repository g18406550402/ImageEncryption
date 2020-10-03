function [x1,y1] = f_arnold(x,y,a,b)
tmp = [1,a;b,a*b+1]*[x;y];
tmp = mod(tmp,[512;512]);
x1=tmp(1)+1;y1=tmp(2)+1;
%x1=tmp(1);y1=tmp(2);
end
