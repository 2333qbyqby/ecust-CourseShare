function Cha6demo9
%�¼�ʹ��ʾ��
global CB0
CB0=0.0117;
C0=[CB0,0 0 0];
opt=odeset('Events',@stoptime);
[tout Cout]=ode45(@C6H6Pyro,[0 1000],C0,opt);
plot(tout,Cout)
tend=tout(end) %����ʱ��ڵ�����һ����Ϊ��ֹʱ��
CBin=CB0
CBout=Cout(end,1)
%------------------------------------
function dC=C6H6Pyro(t,C)
k1=7e5;
k2=4e5;
K1=0.31;
K2=0.48;
r1=k1*(C(1)^2-C(2)*C(4)/K1);
r2=k2*(C(1)*C(2)-C(3)*C(4)/K2);
dC=zeros(4,1);
dC(1)=-2*r1-r2;
dC(2)=r1-r2;
dC(3)=r2;
dC(4)=r1+r2;
%------------------------------------
function [value Termin Direct]=stoptime(t,C)
%�¼�����
global CB0
value=(CB0-C(1))/CB0-0.5; %�¼�������ֵ
Termin=1; %�¼�����ֵΪ0ʱ��ֹ���
Direct=0;
