clear all;
%figure('NumberTitle', 'off', 'Name', 'Sigmoid����');
x=0:0.02:1;
y=-1 * log(x);
z=-1 * log(1-x);
plot(x,y);hold on;plot(x,z,'--')
%xlabel('X��');ylabel('Y��');%�������ʾ�����ǩ
grid on;%��ʾ������
axis on;%��ʾ������
axis([0,1,0,4]);%x,y�ķ�Χ����
title('�����غ���');
