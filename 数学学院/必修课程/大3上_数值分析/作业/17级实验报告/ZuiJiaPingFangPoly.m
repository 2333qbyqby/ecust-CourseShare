function ZuiJiaPingFangPoly(f, lb, up)
%f��ʾ����ʽ����
syms x;
rou=1;
n=4;%����������
%��������
fai=cell(n,1);
fai{1}=1;
fai{2}=x;
A=zeros(n);%��������ߵľ���
b=sym(zeros(1,n)');%�������ұ�������
for i=1:n
    b(i)=int(rou*f*fai{i},x,lb,up);
    for j=1:n
        A(i,j)=int(rou*fai{i}*fai{j},x,lb,up);
    end
end
disp("��������ߵľ���")
disp(A)
disp("�������ұ�������")
disp(b)%����������д,��������ͼ����ʾȫ�����,����b2��37/12,����ֻ����ʾ37/1
disp("����ʽϵ��,�ֱ���1��x��ϵ��")
disp(A^(-1)*b)%�ڶ��ʵĽ�,�ֱ�����������ǰ�����ϵ��
disp("�����Ľ��")
simplify(A^(-1)*b)
fprintf('��ʾС��\n')
vpa(A^(-1)*b)
end
