function dy = lorenz_diff(t,y)
%LORENZ_DIFF 此处显示有关此函数的摘要
%   此处显示详细说明
dy = [-10*(y(1)-y(2));
30*y(1)-y(1)*y(3)-y(2);
-8/3*y(3)+y(1)*y(2);
];
end

