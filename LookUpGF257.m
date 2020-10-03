function y = LookUpGF257( x0,x1,x2,TBL )
%LOOKUPGF257 此处显示有关此函数的摘要
%   此处显示详细说明
y=TBL(TBL(x0+2,x1+2)+1,x2+2)-1;

end

