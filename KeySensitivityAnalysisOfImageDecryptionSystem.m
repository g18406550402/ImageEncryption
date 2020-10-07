clc;%清除当前command区域的命令
clear;%清空环境变量
P1 = imread('lena.bmp');
iptsetpref('imshowborder','tight');%图像处理工具箱设置首选项，图像展示框，紧紧围绕图像
x0=rand(2,1000)*80-40;y0=rand(2,1000)*80-40;
z0=rand(2,1000)*80+1;w0=rand(2,1000)*500-250;
nubLex=zeros(2,3);nubLey=zeros(2,3);nubLez=zeros(2,3);nubLew=zeros(2,3);

N=10;tic;
for i=1:N
    K1=[x0(1,i) y0(1,i) z0(1,i) w0(1,i)];
    C1=TpEncrypt(P1,K1);
    %密钥做微小改变
    K2=K1;K2(1)=K2(1)+10^(-13);
    %用改变后的密钥解密图像
    P1N1=TpDecrypt(C1,K2);
    K3=K1;K3(2)=K3(2)+10^(-13);
    P1N2=TpDecrypt(C1,K3);
    K4=K1;K4(3)=K4(3)+10^(-13);
    P1N3=TpDecrypt(C1,K4);
    K5=K1;K5(4)=K5(4)+10^(-12);
    P1N4=TpDecrypt(C1,K5);
    %明文图与用改变密钥后解密出的图像相比
    nubLex(1,:)=nubLex(1,:)+NPCRUACIBACI(P1,P1N1);
    nubLey(1,:)=nubLey(1,:)+NPCRUACIBACI(P1,P1N2);
    nubLez(1,:)=nubLez(1,:)+NPCRUACIBACI(P1,P1N3);
    nubLew(1,:)=nubLew(1,:)+NPCRUACIBACI(P1,P1N4);
    %用随机生成的密钥解密图像
    KK1=[x0(2,i) y0(2,i) z0(2,i) w0(2,i)];
    PP1=TpDecrypt(C1,KK1);
    %密钥做微小改变
    KK2=KK1;KK2(1)=KK2(1)+10^(-13);
    %用改变后的密钥解密图像
    PP1N1=TpDecrypt(C1,KK2);
    KK3=KK1;KK3(2)=KK3(2)+10^(-13);
    PP1N2=TpDecrypt(C1,KK3);
    KK4=KK1;KK4(3)=KK4(3)+10^(-13);
    PP1N3=TpDecrypt(C1,KK4);
    KK5=KK1;KK5(4)=KK5(4)+10^(-12);
    PP1N4=TpDecrypt(C1,KK5);
    %用随机生成的密钥解密得到的图像与用改变密钥后解密出的图像相比
    nubLex(2,:)=nubLex(2,:)+NPCRUACIBACI(PP1,PP1N1);
    nubLey(2,:)=nubLey(2,:)+NPCRUACIBACI(PP1,PP1N2);
    nubLez(2,:)=nubLez(2,:)+NPCRUACIBACI(PP1,PP1N3);
    nubLew(2,:)=nubLew(2,:)+NPCRUACIBACI(PP1,PP1N4);
end
nubLex=nubLex/N;nubLey=nubLey/N;nubLez=nubLez/N;nubLew=nubLew/N;
toc;
 