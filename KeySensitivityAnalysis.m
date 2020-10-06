clc;clear;close all;
P1 = imread('lena.bmp');
x0=rand(1,1000)*80-40;y0=rand(1,1000)*80-40;
z0=rand(1,1000)*80+1;w0=rand(1,1000)*500-250;
nubLex=zeros(1,3);nubLey=zeros(1,3);nubLez=zeros(1,3);nubLew=zeros(1,3);

for i=1:10
    K1=[x0(i) y0(i) z0(i) w0(i)];
    CLe1=TpEncrypt(P1,K1);
    K2=[x0(i)+10^(-13) y0(i) z0(i) w0(i)];
    CLe2=TpEncrypt(P1,K2);
    K3=[x0(i) y0(i)+10^(-13) z0(i) w0(i)];
    CLe3=TpEncrypt(P1,K3);
    K4=[x0(i) y0(i) z0(i)+10^(-13) w0(i)];
    CLe4=TpEncrypt(P1,K4);
    K5=[x0(i) y0(i) z0(i) w0(i)+10^(-13)];
    CLe5=TpEncrypt(P1,K5);
    nubLex=nubLex+NPCRUACIBACI(CLe1,CLe2);
    nubLey=nubLey+NPCRUACIBACI(CLe1,CLe3);
    nubLez=nubLez+NPCRUACIBACI(CLe1,CLe4);
    nubLew=nubLew+NPCRUACIBACI(CLe1,CLe5);
end
nubLex=nubLex/10;nubLey=nubLey/10;nubLez=nubLez/10;nubLew=nubLew/10;
    