function dy = Chen_diff( t,y )
%CHEN_DIFF �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
a=35;b=3;c=28;
dy=[a*(y(2)-y(1));
    (c-a)*y(1)-y(1)*y(3)+c*y(2);
    y(1)*y(2)-b*y(3);
    ];

end

