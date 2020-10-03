clc;
clear;
P=imread('lena.bmp');
%P=imresize(P,[64,64]);
figure(1);imshow(P);
iptsetpref('imshowborder','tight');
S=P;
[M,N] = size(P);
a=1;b=1;
for k=1:12
   for i=1:M
       for j=1:N
           [x,y] = f_arnold(i,j,a,b);
           t=S(x,y);S(x,y) = S(i,j);S(i,j)=t;
       end
   end
   figure(2);
imshow(S);
        if mod(k,2)==0
        figure; 
        imshow(S);
        end
end
%解密过程
% figure(2); 
% imshow(S);
%  for i=M:-1:1
%      for j=N:-1:1
%          [x,y] = f_arnold(i,j,a,b);
%          t=S(x,y);S(x,y) = S(i,j);S(i,j)=t;
%      end
%  end
%  figure(3); 
%  imshow(P);
 
% 参数a，b依靠混沌系统生成
% s=ChaoticSequence(2*M*N);
% X=mod(floor((s+100)*10^10),10*max(M,N))+1;
% a=reshape(X(1:M*N),M,N);b=reshape(X(M*N+1:2*M*N),M,N);
%     for i=1:M
%        for j=1:N
%            [x,y] = f_arnold(i,j,a(i,j),b(i,j));
%            t=S(x,y);S(x,y) = S(i,j);S(i,j)=t;
%        end
%     end
% 
% figure(2); 
% imshow(S);
% 
% for i=M:-1:1
%     for j=N:-1:1
%         [x,y] = f_arnold(i,j,a(i,j),b(i,j));
%         t=S(x,y);S(x,y) = S(i,j);S(i,j)=t;
%     end
% end
% figure(3); 
% imshow(P);
%阿诺德逆函数
% for i=M:1
%     for j=N:1
%         [x,y]=f_arnoldX(i-1,j-1,a,b);
%         P(x+1,y+1) = S(i,j);
%     end
% end
% figure;
% imshow(P);