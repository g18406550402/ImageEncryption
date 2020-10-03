function y = LookUpGF2p4( x0,x1,x2,TBL )
%LOOKUPGF2P4 此处显示有关此函数的摘要
%   此处显示详细说明
x0H=floor(x0/16);x0L=mod(x0,16);
x1H=floor(x1/16);x1L=mod(x1,16);
x2H=floor(x2/16);x2L=mod(x2,16);
t1=bitxor(bitxor(x0L,x1L),x2L);
t2=bitxor(bitxor(x0H,x1H),x2H);
y=t2*16+t1;
end

