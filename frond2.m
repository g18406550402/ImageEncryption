clc;
clear;
P=imread('lena.bmp');
figure(1);imshow(P);
S=P(:);
[M,N] = size(P);
s=ChaoticSequence(2*M*N);
X=mod(floor((s+100)*10^10),10*max(M,N))+1;
a=X(1:M*N);b=X(M*N+1:2*M*N);
for i=1:M*N
a(i)=a(i)*b(i)+1;
end
    for i=1:M*N
    
           y = mod(b(i)+a(i)*i,M*N);
           t=S(y);S(y) = S(i);S(i)=t;
     
    end
S=reshape(S,M,N);
figure(2); 
imshow(S);

for i=M:-1:1

      y = mod(b(i)+a(i)*i,M*N);
       t=S(y);S(y) = S(i);S(i)=t;

end

figure(3); 
imshow(P);