clc;clear;
s=ChaoticSeq(20000);
s=mod(floor((s+100)*pow2(16)),2);
k1=sum(s);k0=length(s)-k1;%单比特

f=zeros(1,16);
for i =1:5000
    v=s(4*i-3)*8+s(4*i-2)*4+s(4*i-1)*2+s(4*i);
    f(v+1)=f(v+1)+1;
end
p=sum(f.^2)*16/5000-5000;%扑克测试

%游程测试连续的几个0或1出现的个数
run0=zeros(1,100);run1=zeros(1,100);
t0=0;t1=0;
for i = 1:20000
    if i==1
        if s(i)==1
            t1=1;
        else 
            t0=1;
        end
    elseif i ==20000
        if s(i)==1&&t1>0
            t1=t1+1;
            run1(t1)=run1(t1)+1;
        end
        if s(i)==0&&t0>0
            t0=t0+1;
            run0(t0)=run0(t0)+1;
        end
        if s(i)==1&&t1==0
            run1(1)=run1(1)+1;
            run0(t0)=run0(t0)+1;
        end
        if s(i)==0&&t0==0
            run0(1)=run0(1)+1;
            run1(t1)=run1(t1)+1;
        end
    else
        if s(i)==1&&t1>0
            t1=t1+1;
        end
        if s(i)==0&&t0>0
            t0=t0+1;
        end
        if s(i)==1&&t1==0
            t1=1;
            run0(t0)=run0(t0)+1;t0=0;
        end
        if s(i)==0&&t0==0
            t0=1;
            run1(t1)=run1(t1)+1;t1=0;
        end
    end
end

run0_1=run0(1);run0_2=run0(2);run0_3=run0(3);run0_4=run0(4);
run0_5=run0(5);run0_6=sum(run0(6:100));run0_26=sum(run0(26:100));

run1_1=run1(1);run1_2=run1(2);run1_3=run1(3);run1_4=run1(4);
run1_5=run1(5);run1_6=sum(run1(6:100));run1_26=sum(run1(26:100));
