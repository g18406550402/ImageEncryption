function cycleLength = CalculateCycle( s )
%CALCULATECYCLE 计算周期长度
%   此处显示详细说明
[r,c]=size(s);
if r==1
    a=s(1);
    flag=0;
    for i=2:c
        if abs(s(i)-a)<1e-15
            flag=1;
            cycleLength=i-1;
            break;
        end
    end
    if flag==0
        cycleLength=-1;
    end
elseif r==2
    a=[s(1,1),s(2,1)];
    flag = 0;
    for i=2:c
        if abs(s(1,i)-a(1))<0.0000000001&&abs(s(2,i)-a(2))<0.0000000001
           flag =1;
           cycleLength=i-1;
           break;
        end
    end
    if flag==0;
        cycleLength=-1;
    end
end
end
