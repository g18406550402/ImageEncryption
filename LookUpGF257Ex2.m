function  y  = LookUpGF257Ex2( x0,x1,x2,TBL1,TBL2 )
%LOOKUPGF257EX2 ����GF(257)��ĳ������㺯��
%   �˴���ʾ��ϸ˵��
t=TBL1(x1+2,x2+2)+1;
y=TBL2(x0+2,t)-1;

end

