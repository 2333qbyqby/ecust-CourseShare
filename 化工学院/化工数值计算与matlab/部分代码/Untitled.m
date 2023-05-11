% ����������ɢ����
x = linspace(0,2*pi,21);
y = sin(x);

% ָ���󵼵�0,2,4,6
xx = 0:0.1:2*pi;
dx = 0:2:6;

% ����ɢ���ݲ���polyfit����������ϣ���ͨ��polyder�󵼺�����
% Ȼ��ͨ��polyval���㵼��ֵ
pp1 = polyfit(x,y,3);
ppv1 = polyval(pp1,xx);
dp1 = polyder(pp1);
dpv1 = polyval(dp1,dx);

% ����ɢ���ݲ���csaps�������в�ֵ����ͨ��fner�󵼺�����
% Ȼ��ͨ��fnval���㵼��ֵ
pp2 = csaps(x,y);
ppv2 = fnval(pp2,xx);
dp2 = fnder(pp2);
dpv2 = fnval(dp2,dx);

% ���Ч����ͼ�Ա�
plot(x,y,'ok',xx,ppv1,'b:',xx,ppv2,'r:')
legend('ԭʼ����','����ʽ���','������ֵ')

% ΢�ּ������Ա�
figure
plot(dx,dpv1,'b*',dx,dpv2,'ro')
legend('����ʽ�����','������ֵ��')
