function y = LookUpGF257Ex( x0,x1,x2,TBL )
%LOOKUPGF257EX 此处显示有关此函数的摘要
%   此处显示详细说明
t=TBL(x1+2,x2+2)+1;y=find(TBL(t,:)==(x0+1))-2;


end

