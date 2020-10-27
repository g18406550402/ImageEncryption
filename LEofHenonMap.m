function  LE  = LEofHenonMap( rStart, rEnd, rStep )
%LEOFHENONMAP ����Henon��LE
%   �ſɱȾ��󷽷�
rValues = rStart:rStep:rEnd;
nPoints = length( rValues );
a = 1.4;b = 0.3;
a = rValues;
b = ones(1,nPoints)*b;
nIterations = 1000; % number of iterations
LE = zeros( 2, nPoints );
x  = zeros( 1, nIterations + 1 );
y  = zeros( 1, nIterations + 1 );
for k = 1:nPoints  %�����仯
    Q=eye(2);
    x( 1 ) = 0;
    y( 1 ) = 0;
    sum1 = 0;
    sum2 = 0;
    for i = 1:nIterations %��������������ÿһ��������������Խ��Խ��ȷlim(n->inf)
        x(i+1)=1-a(k)*x(i)^2+y(i);
        y(i+1)=b(k)*x(i);
        D1 = -2*a(k)*x(i);
        D2 = 1;
        D3 = b(k);
        D4 = 0;
        JT=[D1,D2;D3,D4];%�ſɱȾ���
        B=JT*Q;
        [Q,R]=qr(B);%QR�ֽ⣬Q���������� R�������Ǿ���  
        d=diag(R);%�Խǻ���ԭ��������
        sum1 = sum1 + log( abs(d(1)) );
        sum2 = sum2 + log( abs(d(2)) );
    end
    LE( 1, k ) = sum1 / nIterations;
    LE( 2, k ) = sum2 / nIterations;
    %plot(rValues(k),LE(1,k),rValues(k),LE(2,k),'.','Markersize',2);
    k
end
hold on;
plot(rValues,LE(1,:),rValues,LE(2,:),'.-','Markersize',2);
grid on;
axis([-0.2,1.5,-2,0.5]);
xlabel('a','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
ylabel('LE','FontName','Times New Roman','FontSize',16,'FontAngle','Italic');
set(gca,'FontName','Times New Roman','FontSize',16);
hold off;
end

