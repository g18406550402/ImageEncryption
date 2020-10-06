%x(n+1)=1-ux(n)^2
%u in (0,2]
%x in(-1,1);
clear all
u=linspace(0,2,200);
for k=1:200
    x0=0.42212;                                   %赋初值
    for p = 1:200                                
        xn=1-u(k)*x0*x0;    
        if p<100
            plot(0,0)
        else                                      %迭代100此以上，描点
            hold on
            plot(u(k),xn,'.','Markersize',2)
        end
        x0=xn;
    end
end