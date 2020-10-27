function [Texp,Lexp]=lyapunov(n,lorenz_ext,ODE45,tstart,stept,tend,ystart,a,b,c,r)
%
%    Lyapunov exponent calcullation for ODE-system.
%
%    The alogrithm employed in this m-file for determining Lyapunov
%    exponents was proposed in
%
%         A. Wolf, J. B. Swift, H. L. Swinney, and J. A. Vastano,
%        "Determining Lyapunov Exponents from a Time Series," Physica D,
%        Vol. 16, pp. 285-317, 1985.
%
%    For integrating ODE system can be used any MATLAB ODE-suite methods. 
% This function is a part of MATDS program - toolbox for dynamical system investigation
%    See:    http://www.math.rsu.ru/mexmat/kvm/matds/
%
%    Input parameters:
%      n - number of equation
%      rhs_ext_fcn - handle of function with right hand side of extended ODE-system.
%              This function must include RHS of ODE-system coupled with 
%              variational equation (n items of linearized systems, see Example).                   
%      fcn_integrator - handle of ODE integrator function, for example: @ode45                  
%      tstart - start values of independent value (time t)
%      stept - step on t-variable for Gram-Schmidt renormalization procedure.
%      tend - finish value of time
%      ystart - start point of trajectory of ODE system.
%      ioutp - step of print to MATLAB main window. ioutp==0 - no print, 
%              if ioutp>0 then each ioutp-th point will be print.
%
%    Output parameters:
%      Texp - time values
%      Lexp - Lyapunov exponents to each time value.
%
%    Users have to write their own ODE functions for their specified
%    systems and use handle of this function as rhs_ext_fcn - parameter.      
%
%    Example. Lorenz system:
%               dx/dt = sigma*(y - x)     = f1
%               dy/dt = r*x - y - x*z = f2
%               dz/dt = x*y - b*z     = f3
%
%    The Jacobian of system: 
%        | -sigma  sigma  0 |
%    J = |   r-z    -1   -x |
%        |    y      x   -b |
%
%    Then, the variational equation has a form:
% 
%    F = J*Y
%    where Y is a square matrix with the same dimension as J.
%    Corresponding m-file:
%        function f=lorenz_ext(t,X)
%         SIGMA = 10; R = 28; BETA = 8/3;
%         x=X(1); y=X(2); z=X(3);
%
%         Y= [X(4), X(7), X(10);
%             X(5), X(8), X(11);
%             X(6), X(9), X(12)];
%         f=zeros(9,1);
%         f(1)=SIGMA*(y-x); f(2)=-x*z+R*x-y; f(3)=x*y-BETA*z;
%
%         Jac=[-SIGMA,SIGMA,0; R-z,-1,-x; y, x,-BETA];
%  
%         f(4:12)=Jac*Y;
%
%    Run Lyapunov exponent calculation:
%     
%    [T,Res]=lyapunov(3,@lorenz_ext,@ode45,0,0.5,200,[0 1 0],10);   
%   
%    See files: lorenz_ext, run_lyap.   
%  
% --------------------------------------------------------------------
% Copyright (C) 2004, Govorukhin V.N.
% This file is intended for use with MATLAB and was produced for MATDS-program
% http://www.math.rsu.ru/mexmat/kvm/matds/
% lyapunov.m is free software. lyapunov.m is distributed in the hope that it 
% will be useful, but WITHOUT ANY WARRANTY. 
%



%
%       n=number of nonlinear odes
%       n2=n*(n+1)=total number of odes
%

n1=n; %方程数3
n2=n1*(n1+1); %参数个数12

%  Number of steps

nit = round((tend-tstart)/stept);%循环次数=总长/步长

% Memory allocation 分配空间

y=zeros(n2,1); y0=y;
cum=zeros(n1,1);%对数和
gsc=cum; znorm=cum;


% Initial values

y(1:n)=ystart(:);%初值x0,y0,z0

for i=1:n1 %等价于tmp=eye(3);y(4:12)=tmp(:);
    y((n1+1)*i)=1.0; 
end;

t=tstart;

% Main loop主循环

for ITERLYAP=1:nit

% Solutuion of extended ODE system 扩展ODE系统的求解

  [T,Y] = feval(ODE45,lorenz_ext,[t t+stept],y,[],a,b,c,r);  %执行函数句柄（运行ODE45)
  
  t=t+stept;
  y=Y(size(Y,1),:);%size（Y，1）取Y的行数，size（Y，2）取列数
  %按列排序y方便正交化
  for i=1:n1 
      for j=1:n1 
          y0(n1*i+j)=y(n1*j+i);
      end;
  end;

%
%       用gram-schmidt构造正交基
%

  znorm(1)=0.0;
  for j=1:n1 
      znorm(1)=znorm(1)+y0(n1*j+1)^2; 
  end;

  znorm(1)=sqrt(znorm(1));

  for j=1:n1 
      y0(n1*j+1)=y0(n1*j+1)/znorm(1); 
  end;

  for j=2:n1
      for k=1:(j-1)
          gsc(k)=0.0;
          for l=1:n1 
              gsc(k)=gsc(k)+y0(n1*l+j)*y0(n1*l+k); 
          end;
      end;
 
      for k=1:n1
          for l=1:(j-1)
              y0(n1*k+j)=y0(n1*k+j)-gsc(l)*y0(n1*k+l);
          end;
      end;

      znorm(j)=0.0;
      for k=1:n1 
          znorm(j)=znorm(j)+y0(n1*k+j)^2; 
      end;
      znorm(j)=sqrt(znorm(j));

      for k=1:n1 
          y0(n1*k+j)=y0(n1*k+j)/znorm(j); 
      end;
  end;

%
%       update running vector magnitudes更新运行矢量幅值
%

  for k=1:n1 
      cum(k)=cum(k)+log(znorm(k)); 
  end;

%
%       normalize exponent标准化指数
%

  for k=1:n1 
      lp(k)=cum(k)/(t-tstart); 
  end;

% Output modification输出修改

  if ITERLYAP==1
     Lexp=lp;
     Texp=t;
  else
     Lexp=[Lexp; lp];
     Texp=[Texp; t];
  end;

  for i=1:n1 
      for j=1:n1
          y(n1*j+i)=y0(n1*i+j);
      end;
  end;

end;
end