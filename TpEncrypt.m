function C = TpEncrypt( P ,K)
%TPENCRYPT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[M,N]=size(P);P=double(P);
n=3*M*N;
s=HyperchaosLorenzSystem(n,K);%�ó�����lorenzϵͳ���ɻ�������
X=mod(floor((s(1:M*N)+100)*10^10),M*N)+1;
[~,idx]=unique(X);X1=zeros(1,M*N);X1(1:length(idx))=X(sort(idx));
X1(length(idx)+1:end)=setdiff(1:M*N,X1);X=X1;%X���ظ�Ԫ�ص�
A=P(:);
%��άչһά���ظ�����
%tic;
%ֻ��ɢ������--ע�͵�
%   for i=1:floor(M*N/2)
%       t=A(X(i));A(X(i))=A(X(M*N-i+1));A(X(M*N-i+1))=t;
%   end
A=reshape(A,M,N);

%ֻ���Ҳ���ɢ
%A=uint8(A);

%GF257��ɢ
TBL=GF257Table();S=mod(floor(s(M*N+1:3*M*N)*pow2(16)),256);
S1=S(1:M*N);S2=S(M*N+1:2*M*N);B=zeros(1,M*N);C=zeros(1,M*N);
%������ɢ
B0=0;B(1)=LookUpGF257(B0,S1(1),A(1),TBL);
for i=2:M*N
    B(i)=LookUpGF257(B(i-1),S1(i),A(i),TBL);
end
%������ɢ
C0=0;C(M*N)=LookUpGF257(C0,S2(M*N),B(M*N),TBL);
for i=M*N-1:-1:1
    C(i)=LookUpGF257(C(i+1),S2(i),B(i),TBL);
end
%toc;
C=reshape(C,M,N);C=uint8(C);
%ͼ��ֱ��ͼ
%figure;hist(C(:),256);set(gca,'fontsize',18);

end


