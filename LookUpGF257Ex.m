function y = LookUpGF257Ex( x0,x1,x2,TBL )
%LOOKUPGF257EX �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
t=TBL(x1+2,x2+2)+1;y=find(TBL(t,:)==(x0+1))-2;


end
