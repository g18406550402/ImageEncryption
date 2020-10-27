function f = HyperChaosLorenz_ext( t,X,a,b,c,r )
%HYPERCHA 此处显示有关此函数的摘要
%   此处显示详细说明

x=X(1); y=X(2); z=X(3); w=X(4);

Y= [X(5), X(9), X(13),X(17);
    X(6), X(10), X(14),X(18);
    X(7), X(11), X(15),X(19);
    X(8), X(12), X(16),X(20)];

f=zeros(16,1);

%Lorenz equation
f(1)=a*(y-x)+w;
f(2)=c*x-y-x*z;
f(3)=x*y-b*z;
f(4)=-y*z+r*w;

%Linearized system

 Jac=[-a,a,0,1;
      c-z,-1,-x,0;
      y,x,-b,0;
      0,-z,-y,r;];
  
%Variational equation   
f(5:20)=Jac*Y;

%Output data must be a column vector

end

