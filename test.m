%���ڶ˵�����з�
clear;
%��֡she
[y,fs] = audioread('D:\workplace\bishe\¼��\H1.m4a');%��ȡ��Ƶ
subplot 211,plot(y);title('��Ƶԭͼ');

y=double(y);
longx=length(y);

%��ͨ�˲�����60hz-2400hz��
n=50;
wn=[2*60/fs,2*2400/fs];
window=chebwin(n+1,30);
b=fir1(n,wn,window);
x=filter(b,1,y);
x = x/max(abs(x));
duandian = zeros(length(x),1);

%Ԥ����
%x=double(x);
%x=filter([1 -0.9375], 1, x);
%subplot 312,plot(x);title('��ƵԤ������ʾ��ͼ');

win = 500;%45.5msΪһ֡��֡��Ϊ500
inc = 200;%֡��
f = enframe(x,win,inc);
[fn,len]=size(f);
amp =sum((abs(enframe(x,win,inc))).^2,2);
for i = 40:length(amp)-40
    if amp(i)-amp(i-39)>30
        duandian(i*inc,1)=1;
        i = i+20;
        
    end
end


subplot 311,plot(x);
subplot 312,plot(amp);
subplot 313,plot(x);hold on ;plot(duandian);

