s=ChaoticSeq(30000);
s=mod(floor((s(1:end)+100)*pow2(16)),256);

chai2=zeros(1,4);
g=10000/256;
for i=1:3
    s1=s((i-1)*10000+1:i*10000);
    f=zeros(1,256);
    for j=1:length(s1)
        f(s1(j)+1)=f(s1(j)+1)+1;%巧妙的统计了频数666
    end
    chai2(i)=sum((f-g).^2/g);
end

g=30000/256;
f=zeros(1,256);
for j=1:length(s)
    f(s(j)+1)=f(s(j)+1)+1;
end
chai2(4)=sum((f-g).^2/g);
