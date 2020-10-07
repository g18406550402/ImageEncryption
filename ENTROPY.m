function y = ENTROPY( P )
%ENTROPY 此处显示有关此函数的摘要
%   此处显示详细说明
P=double(P);[M,N]=size(P);P=transpose(P(:));T=zeros(1,256);
for i=1:256
    T(i)=sum(P==(i-1));T(i)=T(i)/(M*N);
end
y=-T(T>0)*transpose(log2(T(T>0)));

end

