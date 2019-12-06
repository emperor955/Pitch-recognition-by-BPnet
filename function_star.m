clear all;
%figure('NumberTitle', 'off', 'Name', 'Sigmoid函数');
x=0:0.02:1;
y=-1 * log(x);
z=-1 * log(1-x);
plot(x,y);hold on;plot(x,z,'--')
%xlabel('X轴');ylabel('Y轴');%坐标轴表示对象标签
grid on;%显示网格线
axis on;%显示坐标轴
axis([0,1,0,4]);%x,y的范围限制
title('交叉熵函数');
