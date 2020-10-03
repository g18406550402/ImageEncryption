function y = LookUpGF17Ex( x0,x1,x2,TBL )
%LOOKUPGF17EX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
x0H=floor(x0/16)+1;x0L=mod(x0,16)+1;
x1H=floor(x1/16)+1;x1L=mod(x1,16)+1;
x2H=floor(x2/16)+1;x2L=mod(x2,16)+1;
k1=TBL(x1L+1,x2L+1)+1;
k2=TBL(x1H+1,x2H+1)+1;
t1=find(TBL(k1,:)==x0L)-1;
t2=find(TBL(k2,:)==x0H)-1;
y=(t2-1)*16+(t1-1);
end

