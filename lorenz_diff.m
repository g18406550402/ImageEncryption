function dy = lorenz_diff(t,y)
%LORENZ_DIFF �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
dy = [-10*(y(1)-y(2));
30*y(1)-y(1)*y(3)-y(2);
-8/3*y(3)+y(1)*y(2);
];
end

