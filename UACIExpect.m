function  e_uaci  = UACIExpect( A )
%UACIEXPECT 此处显示有关此函数的摘要
%   此处显示详细说明
A=double(A);[M,N]=size(A);tot_n=zeros(1,256);tot_s=0:255;
for i=1:M
    for j=1:N
        for k=0:255
            if k<=A(i,j)
                tot_n(k+1)=tot_n(k+1)+1;
            end
            if k<=255-A(i,j)
                tot_n(k+1)=tot_n(k+1)+1;
            end
        end
    end
end
tot_n(1)=tot_n(1)/2;e_uaci=sum(tot_s.*tot_n)/sum(tot_n)/255;
fprintf('UACI=%10.4f%%\n',e_uaci*100);


end

