function P = TpDecrypt( C )
%TPDECRYPT �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[M,N]=size(C);P=double(C);
n=3*M*N;
s=zeros(1,n);
s=ChaoticSequence(n);%�ó�����lorenzϵͳ���ɻ�������
X=mod(floor((s(1:M*N)+100)*10^10),M*N)+1;
[~,idx]=unique(X);X1=zeros(1,M*N);X1(1:length(idx))=X(sort(idx));
X1(length(idx)+1:end)=setdiff(1:M*N,X1);X=X1;%X���ظ�Ԫ��

TBL=GF257Table();S=mod(floor(s(M*N+1:3*M*N)*pow2(16)),256);
S1=S(1:M*N);S2=S(M*N+1:2*M*N);

A=C(:);D=zeros(1,M*N);E=zeros(1,M*N);

A0=0;D(M*N)=LookUpGF257Ex(A(M*N),A0,S2(M*N),TBL);
for i=M*N-1:-1:1
    D(i)=LookUpGF257Ex(A(i),A(i+1),S2(i),TBL);
end
E0=0;E(1)=LookUpGF257Ex(D(1),E0,S1(1),TBL);
for i=2:M*N
    E(i)=LookUpGF257Ex(D(i),D(i-1),S1(i),TBL);
end
E=reshape(E,M,N);figure;imshow(uint8(E));

%��άչһά���ظ����һ�ԭ
for i=1:floor(M*N/2)
    t=E(X(i));E(X(i))=E(X(M*N-i+1));E(X(M*N-i+1))=t;
end
E=reshape(E,M,N);figure;imshow(uint8(E));

end

