function y = LookUpGF17( x0,x1,x2,TBL )
%LOOKUPGF17 此处显示有关此函数的摘要
%   此处显示详细说明
x0H=floor(x0/16)+1;x0L=mod(x0,16)+1;
x1H=floor(x1/16)+1;x1L=mod(x1,16)+1;
x2H=floor(x2/16)+1;x2L=mod(x2,16)+1;
t1=TBL(TBL(x0L+1,x1L+1)+1,x2L+1);
t2=TBL(TBL(x0H+1,x1H+1)+1,x2H+1);
y=(t2-1)*16+(t1-1);
end

