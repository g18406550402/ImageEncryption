function [T1,T2] = GF257TableEx()
%GF257TABLEEX 改进后的GF257乘法和除法表
%   此处显示详细说明
T1=mod(transpose(0:256)*(0:256),257);
T2=zeros(257,257);
T2(:,1)=transpose(0:256);
for j = 1:256
    for k=1:257
        T2(mod(j*k,257)+1,j+1)=k;
    end
end

end

