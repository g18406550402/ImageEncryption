function LE = LEofTentMap( rStart, rEnd, rStep )
%LEOFTENTMAP 此处显示有关此函数的摘要
%   此处显示详细说明
rValues = rStart:rStep:rEnd;
nPoints = length( rValues );
nIterations = 1000; % number of iterations
LE      = zeros( 1, nPoints );
x       = zeros( 1, nIterations + 1 );
x( 1 ) = 0.3;
% for k = 1:nPoints
%     sum = 0;
%     for i = 1:nIterations
%         if x(i)<0.5
%             x( i + 1 ) = rValues(k)*x(i);
%         elseif x(i)>=0.5
%             x( i + 1 ) = rValues(k)*(1-x(i)) ;
%         end
%         sum = sum + log( abs(rValues(k) ) );
%     end
%     LE( k ) = sum / nIterations;
%     hold on;
%     plot(rValues(k),LE(k),'.','Markersize',2);
%     k
% end
for k = 1:nPoints
    sum = 0;
    for i = 1:nIterations
        if x(i)<rValues(k)
            x( i + 1 ) = x(i)/rValues(k);
            der=1/rValues(k);
        elseif x(i)>rValues(k)
            x( i + 1 ) = (1-x(i))/(1-rValues(k)) ;
            der=1/(1-rValues(k));
        end
        sum = sum + log( abs(der) );
    end
    LE( k ) = sum / nIterations;
    hold on;
    plot(rValues(k),LE(k),'.','Markersize',2);
    k
end
end

