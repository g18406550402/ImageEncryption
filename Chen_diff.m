function dy = Chen_diff( t,y )
%CHEN_DIFF 此处显示有关此函数的摘要
%   此处显示详细说明
a=35;b=3;c=28;
dy=[a*(y(2)-y(1));
    (c-a)*y(1)-y(1)*y(3)+c*y(2);
    y(1)*y(2)-b*y(3);
    ];

end

