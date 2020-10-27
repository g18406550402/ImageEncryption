function LE = LEofLorenzMap( rStart, rEnd, rStep )
%LEOFHENONMAP 计算Lorenz的LE
%   雅可比矩阵方法
rValues = rStart:rStep:rEnd;
nPoints = length( rValues );
a = 10;b = 8/3;c = 28;h = 0.002;
a = rValues;
b = ones(1,nPoints)*b;
c = ones(1,nPoints)*c;

nIterations = 100; % number of iterations
LE = zeros( 3, nPoints );
x  = zeros( 1, nIterations + 1 );
y  = zeros( 1, nIterations + 1 );
z  = zeros( 1, nIterations + 1 );
for k = 1:nPoints  %参数变化
    Q=eye(3);
    x( 1 ) = 0;
    y( 1 ) = 0;
    z( 1 ) = 0;
    sum1 = 0;
    sum2 = 0;
    sum3 = 0;
    for i = 1:nIterations %迭代次数，对于每一个参数迭代次数越多越精确lim(n->inf)
        x0=x(i);y0=y(i);z0=z(i);
        for j=1:1000
            [x1, y1,z1]=RungeKuttaofLorenz(x0,y0,z0,a(k),b(k),c(k),h);
            x0=x1;
            y0=y1;
            z0=z1;
        end
        x(i+1)=x1;y(i+1)=y1;z(i+1)=z1;
        JT=[-a(k),a(k),0;
            c(k)-z(i),-1,-x(i);
            y(i),x(i),-b(k)];%雅可比矩阵
        JT=JT*Q;
        [Q,R]=qr(JT);%QR分解，Q是正交矩阵 R是上三角矩阵  
        d=diag(R);%对角化还原成列向量
        sum1 = sum1 + log( abs(d(1)) );
        sum2 = sum2 + log( abs(d(2)) );
        sum3 = sum3 + log( abs(d(3)) );
    end
    LE( 1, k ) = sum1 / nIterations;
    LE( 2, k ) = sum2 / nIterations;
    LE( 3, k ) = sum3 / nIterations;
    %plot(rValues(k),LE(1,k),rValues(k),LE(2,k),'.','Markersize',2);
    k
end
hold on;
plot(rValues,LE(1,:),rValues,LE(2,:),rValues,LE(3,:),'.-','Markersize',2);
grid on;
%axis([-0.2,1.5,-2,0.5]);
xlabel('a','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('LE','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);
hold off;
end

