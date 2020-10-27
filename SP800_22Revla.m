clc;clear;
n=1000000;
s=Arnold(n);
s=s(2,:);
s=mod(floor(s*1000)*pow2(16),2);
%p_value>=0.01    ==>   ͨ������
%�����ز���  ==>  ����0��1��������������ռ�ı���
s1=2*s-1;%�����е�0���-1    666
sm=sum(s1);sobs=abs(sm)/sqrt(n);%����ͳ��������ͳ�����n
p_v01=erfc(sobs/sqrt(2)); %������
clear s1 sm sobs;

%����Ƶ�ʲ���  ==>  �ֿ� + �����ز���
m=100;N=floor(n/m);f=zeros(1,N);%������S�ֳ�N�飬ÿ�鳤��m������β��
for i=1:N
    f(i)=sum(s((i-1)*m+1:i*m))/m;%ÿ����ڱ���1��Ƶ��
end
chai2=4*m*sum((f-1/2).^2);%kai��ͳ����
p_v02=gammainc(chai2/2,N/2,'upper');%�߼۲���ȫ٤����
clear m N f chai2;

%�γ̲���  ==>  1�γ̵���Ŀ�Ƿ�����������ͬ
ps=sum(s)/n;%�������1�ĸ���
r=bitxor(s(1:end-1),s(2:end));%���ڱ�����ͬȡ0��ͬȡ1
vn_obs=1+sum(r);%����ͳ����
p_v03=erfc(abs(vn_obs-2*n*ps*(1-ps))/(2*sqrt(2*n)*ps*(1-ps)));%����P-value
clear ps r vn_obs;

%�����1�γ̲��� ==> �ֿ� + �1�γ̳����Ƿ�ͬ���������ͬ
m=10^4;K=6;%�ֿ鳤�Ⱥ�
N=floor(n/m);%�ֿ���100
run1=zeros(1,N);
for i=1:N   %��������1�γ�
    s1=s((i-1)*m+1:i*m);%��01����
    j=1;k=1;t=1;        %t��ʾͷָ�� j��ʾβָ�� k��ʾj������1�γ̳���
    while j<=m
        if sum(s1(t:j))==j-t+1%t��j֮��ȫ��1����k��jǰ��
            k=j-t+1;j=j+1;
        else                  %t��j֮�䲻ȫ��1��t����j�������ֵ
            t=t+1;j=t+k;
        end
    end
    run1(i)=k;
end
v=zeros(1,7);%ͳ���1�γ̵ķֲ����
for i=1:7
    if i==1
        v(i)=sum(run1<11);
    elseif i==7
        v(i)=sum(run1>15);
    else
        v(i)=sum(run1==9+i);
    end
end
ps=[0.0882 0.2092 0.2483 0.1933 0.1208 0.0675 0.0727];
chai2_obs=sum((v-N*ps).^2./(N*ps));clear m N v run1 s1 i j k t ps
p_v04=gammainc(chai2_obs/2,K/2,'upper');clear chai2_obs K N

%�����ƾ����Ȳ���  ==>�����̶��������������Թ�ϵ��
M=32;Q=32;N=floor(100000/(M*Q));k0=0;k1=0;k2=0;
for i=1:N                                   %ѭ������
    R=zeros(M,Q);s1=s((i-1)*M*Q+1:i*M*Q);   %ȡ���󳤵�����
    for j=1:M
        R(j,:)=s1((j-1)*Q+1:j*Q);          %�����
    end
    
    for a=1:M-1 %������
        j=a+1;
        while j<=M&&R(a,a)==0
            if R(j,a)==1
                t=R(j,:);R(j,:)=R(a,:);R(a,:)=t;
            end
            j=j+1;
        end
        j=a+1;
        while j<=Q&&R(a,a)==0
            if R(a,j)==1
                t=R(:,j);R(:,j)=R(:,a);R(:,a)=t;
            end
            j=j+1;
        end %����R��a��a��=1
        if R(a,a)==1
            for u=a+1:M
                R(u,:)=bitxor(R(u,:),R(a,:));
            end
            for u=a+1:Q
                R(:,u)=bitxor(R(:,u),R(:,a));
            end
        end
    end
    r=sum(diag(R));%���Դ�����rank�����ͬ??
    
    if r==M
        k0=k0+1;
    elseif r==M-1
        k1=k1+1;
    else
        k2=k2+1;
    end
end
chai2_obs=(k0-0.2888*N)^2/(0.2888*N)+(k1-0.5776*N)^2/(0.5776*N)+(k2-0.1336*N)^2/(0.1336*N);
p_v05=exp(-chai2_obs/2);
clear i j a chai2_obs k* M Q r R s1 t u N

%��ɢ����Ҷ���ף����� ==>��������������ԣ�
n1=10^5;T=sqrt(log(1/0.05)*n1);N0=0.95*n1/2;
X=2*s(1:n1)-1;F=fft(X);F1=abs(F(1:floor(n1/2)));
N1=sum(F1<T);d=(N1-N0)/sqrt(0.95*0.05*n1/4);
p_v06=erfc(abs(d)/sqrt(2));
clear n1 T N0 N1 X F1 F d

%�ص�ģ��ƥ�����  ==>�����ģ����ֵ�Ƶ�����������ģ�� �����ƶ���ģ�����һλ
N=20;M=floor(n/N);
m=10;B=[1 0 0 1 1 0 1 0 1 1];
miyou=(M-m+1)/pow2(m);%�����ֵ
sigma2=M*(1/pow2(m)-(2*m-1)/pow2(2*m));%���㷽��
W=zeros(1,N);
for i=1:N %����ģ����ֵĴ���
    s1=s((i-1)*M+1:i*M);
    j=1;
    while j<=M-m+1
        if sum(bitxor(B,s1(j:j+m-1)))==0
            W(i)=W(i)+1;j=j+m;
        else 
            j=j+1;
        end
    end
end
chai2_obs=sum((W-miyou).^2/sigma2);
p_v07=gammainc(chai2_obs/2,N/2,'upper');
clear B i j m M N chai2_obs miyou sigma2 s1 W

%���ص�ģ��ƥ�����  ==> ����ģ�壬�����ƶ�����ƶ�һλ
N=968;M=1032;m=9;B=[1 1 1 1 1 1 1 1 1];
lambta=(M-m+1)/pow2(m);yita=lambta/2;
W=zeros(1,N);v=zeros(1,6);
for i=1:N
    s1=s((i-1)*M+1:i*M);
    j=1;
    while j<=M-m+1
        if sum(bitxor(B,s1(j:j+m-1)))==0
            W(i)=W(i)+1;j=j+1;
        else
            j=j+1;
        end
    end
    if W(i)<5
        v(W(i)+1)=v(W(i)+1)+1;
    else
        v(6)=v(6)+1;
    end
end
ps=zeros(1,6);ps(1)=exp(-yita);ps(2)=ps(1)*yita/2;
ps(3)=ps(1)*yita/8*(yita+2);ps(4)=ps(1)*yita/8*(yita^2/6+yita+1);
ps(5)=ps(1)*yita/16*(yita^3/24+yita^2/2+3*yita/2+1);
ps(6)=1-sum(ps(1:5));chai2_obs=sum((v-N*ps).^2./(N*ps));
p_v08=gammainc(chai2_obs/2,5/2,'upper');
clear B i j m M N chai2_obs lambta yita s1 W ps v

%Maurerͨ�ò���  ==> ���ƥ��ģ����bit�������������ܷ���û����Ϣ��ĵ�����±�ѹ��
L=7;Q=1280;K=floor(n/L)-Q;T=zeros(1,pow2(L));
for j=1:Q
    t=s((j-1)*L+1:j*L);i=sum(t.*pow2(L-1:-1:0));T(i+1)=j;
end
sm=0;
for j=Q+1:Q+K
    t=s((j-1)*L+1:j*L);i=sum(t.*pow2(L-1:-1:0));
    sm=sm+log2(j-T(i+1));T(i+1)=j;
end
c=0.7-0.8/L+(4+32/L)*power(K,-3*L)/15;
sigma=c*sqrt(3.125/K);
fn=sm/K;p_v09=erfc(abs((fn-6.1962507)/(sqrt(2)*sigma)));
clear fn i j K L Q sm T t c

%���Ը��ӶȲ���  ==>  ���������Ƿ�ȼ���ʹ�ó���LFSR�����Է�����λ�Ĵ���������
M=1000;K=6;N=floor(n/M);L=zeros(1,N);
for ii=1:N %����L��ֵ ʹ�ñ�׼��Berlekamp-Massey�㷨
    S=s((ii-1)*M+1:ii*M);
    fx=zeros(1,N+1);lx=zeros(1,N+1);fx(1)=1;lx(1)=0;cond=0;sm=0;
    for i=1:N
        d=mod(sum(fx(1:lx(i)+1).*S(i:-1:i-lx(i))),2);
        if d==0
            lx(i+1)=lx(i);
        else
            if sum(lx(1:i))==0
                lx(i+1)=i;fx(lx(i+1)+1)=1;
            else
                for j=i-1:-1:1
                    if lx(j)<lx(j+1)
                        if j+1==i
                            cond=1;break;
                        else 
                            for k=i:-1:j+1+1            %%%
                                if lx(k)==lx(k-1)
                                    sm=sm+1;
                                end
                            end
                            if sm==i-j-1
                                sm=0;cond=1;break;
                            end
                        end
                    end
                end
                if cond==1
                    cond=0;
                    fx(i-j+1:i-j+1+lx(j))=mod(fx(i-j+1:i-j+1+lx(j))+fx(1:1+lx(j)),2);
                    lx(i+1)=max(lx(i),i-lx(i));
                end
            end
        end
    end
    L(ii)=max(lx);
end
miyou = M/2+(9-(-1)^(M+1))/36-(M/3+2/9)/pow2(M);%�̵�ֵ
T=(-1)^M*(L-miyou)+2/9;v=zeros(1,K+1);
for i=1:N
    if T(i)<=-2.5
        v(1)=v(1)+1;
    elseif T(i)<=-1.5
        v(2)=v(2)+1;
    elseif T(i)<=-0.5
        v(3)=v(3)+1;
    elseif T(i)<=0.5
        v(4)=v(4)+1;
    elseif T(i)<=1.5
        v(5)=v(5)+1;
    elseif T(i)<=2.5
        v(6)=v(6)+1;
    else 
        v(7)=v(7)+1;
    end
end
ps=[0.010417 0.03125 0.125 0.5 0.25 0.0625 0.020833];
chai2_obs=sum((v-N*ps).^2./(N*ps));
p_v10=gammainc(chai2_obs/2,K/2,'upper');
clear cond chai2_obs d fx i ii j k K L lx M miyou N S sigma sm T v ps

%���в���  ==>  �����������г���Ϊm�ı���ģ����ֵĴ���
m=3;  %������Ϊ3
vm0=zeros(1,pow2(m));vm1=zeros(1,pow2(m-1));vm2=zeros(1,pow2(m-2));
s1=[s s(1:m-1)];
for i=1:n  %�������ģ���ڴ��������г��ֵ�Ƶ��
    for j=1:pow2(m)
        bm0=floor(mod((j-1),2.^(m:-1:1))./(2.^(m-1:-1:0)));  %bm0=0 0 0 ,0 0 1 ,0 1 0...
        if sum(bitxor(bm0,s1(i:i+m-1)))==0
            vm0(j)=vm0(j)+1;
        end
    end
    for j=1:pow2(m-1)
        bm1=floor(mod((j-1),2.^(m-1:-1:1))./(2.^(m-2:-1:0)));
        if sum(bitxor(bm1,s1(i:i+m-2)))==0
            vm1(j)=vm1(j)+1;
        end
    end
    for j=1:pow2(m-2)
        bm2=floor(mod((j-1),2.^(m-2:-1:1))./(2.^(m-3:-1:0)));
        if sum(bitxor(bm2,s1(i:i+m-3)))==0
            vm2(j)=vm2(j)+1;
        end
    end
end
psai2m0=sum(vm0.*vm0)*pow2(m)/n-n;
psai2m1=sum(vm1.*vm1)*pow2(m-1)/n-n;
psai2m2=sum(vm2.*vm2)*pow2(m-2)/n-n;
d_ps=psai2m0-psai2m1;d_ps2=psai2m0-2*psai2m1+psai2m2;
p_v11_1=gammainc(d_ps,pow2(m-2),'upper');
p_v11_2=gammainc(d_ps2,pow2(m-3),'upper');
clear b* d* i j m s1 v* ps*

%�����ز���  ==>  ��ⳤ��Ϊm��m+1�ı��������ڴ��������г��ֵ�Ƶ�ʡ�
m=3;  
vm0=zeros(1,pow2(m));vm1=zeros(1,pow2(m+1));
s1=s(1:10000);n1=length(s1);s1=[s1 s1(1:m)];
for i=1:n1 %���㳤��Ϊ3 �� 4 �ĸ���ģ���ڴ��������г��ֵ�Ƶ��
    for j=1:pow2(m)
        bm0=floor(mod((j-1),2.^(m:-1:1))./(2.^(m-1:-1:0)));
        if sum(bitxor(bm0,s1(i:i+m-1)))==0
            vm0(j)=vm0(j)+1;
        end
    end
    for j=1:pow2(m+1)
        bm1=floor(mod((j-1),2.^(m+1:-1:1))./(2.^(m:-1:0)));
        if sum(bitxor(bm1,s1(i:i+m)))==0
            vm1(j)=vm1(j)+1;
        end
    end
end
vm0=vm0/n1;vm1=vm1/n1;fai0=sum(vm0.*log(vm0));fail=sum(vm1.*log(vm1));
chai2=2*n1*(log(2)+fail-fai0);
p_v12=gammainc(chai2/2,pow2(m-1),'upper');
clear b* c* f* i j m n1 s1 v*

%�ۼӺͲ��� ==>  �������е��ۼӺ͵����
n1=10000;s1=s(1:n1);X=2*s1-1;
SL=zeros(1,n1);SR=zeros(1,n1);
SL(1)=X(1);SR(1)=X(end);
for i=2:n1
    SL(i)=SL(i-1)+X(1,i);SR(i)=SR(i-1)+X(end-i+1);
end
zL=max(SL);zR=max(SR);
kL1=floor(4*(-n1/zL+1)):floor(4*(n1/zL-1));
kL2=floor(4*(-n1/zL-3)):floor(4*(n1/zL-1));
p_v13L=1-sum(normcdf(zL*(4*kL1+1)/sqrt(n1))...
    -normcdf(zL*(4*kL1-1)/sqrt(n1)))...
    +sum(normcdf(zL*(4*kL2+3)/sqrt(n1))...
    -normcdf(zL*(4*kL2+1)/sqrt(n1)));
kR1=floor(4*(-n1/zR+1)):floor(4*(n1/zR-1));
kR2=floor(4*(-n1/zR-3)):floor(4*(n1/zR-1));
p_v13R=1-sum(normcdf(zR*(4*kR1+1)/sqrt(n1))...
    -normcdf(zR*(4*kR1-1)/sqrt(n1)))...
    +sum(normcdf(zR*(4*kR2+3)/sqrt(n1))...
    -normcdf(zR*(4*kR2+1)/sqrt(n1)));
clear i k* n1 s1 S* X z*

%������в���  ==>  �������е��ۼӺ͵�������
X=2*s-1;S=zeros(1,n+2);
for i=2:n+1
    S(i)=S(i-1)+X(i-1); %�����ۼӺ�
end
clear X;
v0=zeros(1,8);v1=v0;v2=v0;v3=v0;v4=v0;v5=v0;%��ʾx�����ڿ��г���k�ε���Щ���ڿ�ĸ���
j=1;
for i=2:n+2  %������������Ϊ��λ����Ϊ�� 
    if S(i)~=0
    else
        s1=S(j:i);j=i;
        for x=-4:4  %����ÿ��������x���ֵ�Ƶ�� ��0 ��0Ϊһ������
            if x==0
            else 
                if x<0
                    id=x+5;
                else 
                    id=x+4;
                end
                k=sum(s1==x);
                if k==0
                    v0(id)=v0(id)+1;
                elseif k==1
                    v1(id)=v1(id)+1;
                elseif k==2
                    v2(id)=v2(id)+1;
                elseif k==3
                    v3(id)=v3(id)+1;
                elseif k==4
                    v4(id)=v4(id)+1;
                else
                    v5(id)=v5(id)+1;
                end
            end
        end
    end
end
ps0=zeros(1,8);ps1=ps0;ps2=ps0;ps3=ps0;ps4=ps0;
ps0(1:4)=1-1./(2*abs(-4:-1));ps0(5:8)=fliplr(ps0(1:4));
ps1(1:4)=1./(4*(-4:-1).^2);ps1(5:8)=fliplr(ps1(1:4));
ps2(1:4)=1./(4*(-4:-1).^2).*(1-1./(2*abs(-4:-1)));
ps2(5:8)=fliplr(ps2(1:4));
ps3(1:4)=1./(4*(-4:-1).^2).*(1-1./(2*abs(-4:-1))).^2;
ps3(5:8)=fliplr(ps3(1:4));
ps4(1:4)=1./(4*(-4:-1).^2).*(1-1./(2*abs(-4:-1))).^3;
ps4(5:8)=fliplr(ps4(1:4));
ps5=1-(ps0+ps1+ps2+ps3+ps4);
chai2_obs=zeros(1,8);
J=v0(1)+v1(1)+v2(1)+v3(1)+v4(1)+v5(1);
p_v14=zeros(1,8);
for i=1:8
    chai2_obs(i)=chai2_obs(i)+(v0(i)-J*ps0(i))^2/(J*ps0(i))+...
        (v1(i)-J*ps1(i))^2/(J*ps1(i))+(v2(i)-J*ps2(i))^2/(J*ps2(i))+...
        (v3(i)-J*ps3(i))^2/(J*ps3(i))+(v4(i)-J*ps4(i))^2/(J*ps4(i))+...
        (v5(i)-J*ps5(i))^2/(J*ps5(i));
    p_v14(i)=gammainc(chai2_obs(i)/2,5/2,'upper');
end
clear i id j J k ps* S s1 v* x chai2_obs

%������б��ֲ���  ==>  �������е��ۼӺ͵����ڲ������
X=2*s-1;S=zeros(1,n+2);
for i=2:n+1
    S(i)=S(i-1)+X(i-1);
end
clear X;
J=sum(S==0)-1; %����������
x=[-9:-1 1:9];
p_v15=zeros(1,length(x));
for i=1:length(x) 
    v=sum(S==x(i)); %����������x���ֵ�Ƶ��
    p_v15(i)=erfc(abs(v-J)/(sqrt(2*J*(4*abs(x(i))-2))));
end
clear i J S v x
